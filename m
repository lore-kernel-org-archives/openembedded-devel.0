Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9686FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:29 +0000 (UTC)
Received: by pff63 with SMTP id 63so12866606pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/0StPschfp3GLA4wzMp7ZbxvIvyD9fVy87aGxGDtvIA=;
	b=siDx15KqqmplSjQ+Pxo0sRWbOelGUd4WXtIrhOwyAa6aKilo1wBpxLWvfjSamfHf6r
	DKgA+xGUesxJHsWHP4HsG9NM01/1kyTYHz0sYrIoSqnsQcsGPqcdxF6ldwwfvx4ng2Mf
	ZyWGEYgMTNTlh92fpUOE8a5+dlxb3nQHiygB08WW2fSmqN8JKsrA/zyzEo0fEhciPxOa
	9PhydQMaG2TUZdvKpEZ/tA3sbwEDXpzav7BAWLvwy62d05aqnIJKs32VkQB8wewua26n
	ZTo25nfPcc4hFHPr68EnPY5/SFFJ24in7A4uPK6gCbtwVFgrNE047uFBDhfNYMSkIR+t
	VgUw==
X-Received: by 10.98.17.211 with SMTP id 80mr27741069pfr.57.1450107270935;
	Mon, 14 Dec 2015 07:34:30 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	xi8sm43740079pab.9.2015.12.14.07.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 2CC32FCC842; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:04 -0800
Message-Id: <1e5e3dcae2b01b36046a5876c0153ef623bef932.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 11/14] ufw: improve RRECOMMENDS
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:31 -0000

From: Roy Li <rongqing.li@windriver.com>

ufw needs lots of netfilter module to run

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index 66e917e..19cfe46 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -30,6 +30,14 @@ RDEPENDS_${PN} = " \
 
 RRECOMMENDS_${PN} = " \
                      kernel-module-ipv6 \
+                     kernel-module-nf-conntrack-ipv6 \
+                     kernel-module-nf-log-common \
+                     kernel-module-nf-log-ipv4 \
+                     kernel-module-nf-log-ipv6 \
+                     kernel-module-nf-addrtype \
+                     kernel-module-nf-limit \
+                     kernel-module-nf-log \
+                     kernel-module-nf-recent \
 "
 
 # Certain items are explicitly put under /lib, not base_libdir when installed.
-- 
1.9.1


