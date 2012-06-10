Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3N-0001fb-Gd
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:09 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=6rUIB80YZWeHzoohHvWdhba5BtSTuwMUCFOaJjydaEA=;
	b=wQa16ueMh59A9cMnLQYSe1wltW+EDFwW9hCJrrW8g0DFI1/p4Qs8PIzOb6vL7r/O8c
	a7pAGzG7S2Qtcg8XrNWeYjPJ4gsPThXR9YQw5p6fTIKO9ScxNOlX3oVZYXdU/iEP7XT4
	CHH02LPKcClkyBNLTXJq3RshQUVPsVyuWQmNIxH88Z3P96AqAzTQdh6UCeuDIHMww/TF
	oasVMvvUHQIm47RXNhxIkgHYZOP1YFczy2sxUj/ApVFCQJ8hXOHnmNmBiB6iQNlMFG1q
	IPejdByBK32ZkIeSbrR/jH+ZoUB11xiYLHLdNWfQfb/Gk2Tdq4cUERuQnoRCgmQuJSUJ
	R3Og==
Received: by 10.216.216.95 with SMTP id f73mr5154819wep.149.1339364499208;
	Sun, 10 Jun 2012 14:41:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:37 +0200
Message-Id: <1339364820-2880-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 04/27] polkit: meta-systemd rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jun 2012 21:52:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 ++--
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 2383c5b..ea82e37 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,6 +1,6 @@
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
-POLKITAUTH ??= "systemd"
+POLKITAUTH ??= "consolekit"
 
 PACKAGECONFIG += "${POLKITAUTH}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
diff --git a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
new file mode 100644
index 0000000..9528b9b
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -0,0 +1,3 @@
+PRINC := "${@int(PRINC) + 1}"
+
+POLKITAUTH = "systemd"
-- 
1.7.4.4



