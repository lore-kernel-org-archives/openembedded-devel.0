Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D70266D755
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 06:14:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1P6EcGt006229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 22:14:38 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 24 Feb 2014 22:14:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Feb 2014 14:14:30 +0800
Message-ID: <69f299d4f94277fcebacb27c0820b30d27dca4c1.1393308745.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393308745.git.hongxu.jia@windriver.com>
References: <cover.1393308745.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] traceroute: rename alternatives name
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2014 06:14:43 -0000
Content-Type: text/plain

Rename traceroute's alternatives name from 'traceroute6' to 'traceroute'.

The 'traceroute6' is equivalent to 'traceroute -6' which means traceroute
in IPv6, and traceroute also supports IPv4. So traceroute6 is part of
traceroute and they are not equivalent.

The Ubuntu 13.04 treated them as two different alternatives name also.
...
$ ls -al /usr/bin/traceroute*
lrwxrwxrwx 1 root root    28 Feb 25 13:31 /usr/bin/traceroute -> /etc/alternatives/traceroute
lrwxrwxrwx 1 root root    29 Oct 22  2012 /usr/bin/traceroute6 -> /etc/alternatives/traceroute6
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
index e6718db..83ac5a7 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -39,5 +39,5 @@ do_install() {
 
 }
 
-ALTERNATIVE_${PN} = "traceroute6"
-ALTERNATIVE_LINK_NAME[traceroute6] = "${bindir}/traceroute"
+ALTERNATIVE_${PN} = "traceroute"
+ALTERNATIVE_LINK_NAME[traceroute] = "${bindir}/traceroute"
-- 
1.8.1.2


