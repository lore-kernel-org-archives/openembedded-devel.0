Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8E9774CB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 02:38:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w852cAdD027638
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Sep 2018 19:38:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Sep 2018 19:38:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 10:38:09 +0800
Message-ID: <1536115089-449241-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openl2tp: fix ipv6 address compare problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 02:38:10 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Ipv6 address type is "u_int8_t  s6_addr[16]", so
compare use memcmp. htonl is for ipv4, and return uint32_t.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../openl2tp/openl2tp/0002-user-ipv6-structures.patch              | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
index 3f8bcaa..bd9bcb8 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
@@ -4,6 +4,9 @@ Date: Tue, 28 Mar 2017 18:09:58 -0700
 Subject: [PATCH 2/2] user ipv6 structures
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update for ipv6 address compare
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  l2tp_api.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
@@ -18,8 +21,8 @@ index 9d6f60a..f0946fd 100644
  	if ((!l2tp_opt_remote_rpc) &&
 -	    ((xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_LOOPBACK)) &&
 -	     (xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_ANY)))) {
-+	    ((xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_LOOPBACK)) &&
-+	     (xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_ANY)))) {
++	    ((memcmp(&xprt->xp_raddr.sin6_addr, &in6addr_loopback, sizeof(struct in6_addr)) != 0) &&
++	     (memcmp(&xprt->xp_raddr.sin6_addr, &in6addr_any, sizeof(struct in6_addr)) != 0))) {
 +		char straddr[INET6_ADDRSTRLEN];
 +		inet_ntop(AF_INET6, &xprt->xp_raddr.sin6_addr, straddr, sizeof(straddr));
  		if (l2tp_opt_trace_flags & L2TP_DEBUG_API) {
-- 
2.7.4


