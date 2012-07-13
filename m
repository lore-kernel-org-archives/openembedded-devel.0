Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSn-00085z-De
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:01 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247708bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jhaG8H+FnyEf2JjftgybyJp9GsOghieSu95r9HTn6OY=;
	b=fjkbqGBtxvPUUq31JGdyfb8IhBfA8luDRRkfonkRMwZwPmfovoTp2Q+GdSWPHLg/hJ
	d3ddzmD5OapE4JlVJvInb+jciJgLX29N8zYsjQZEX2S8hvpydfll1p7r8CqauArJf8J+
	YvmysBb1QsofKOeK0Vyopnc8qiPS4DjY+K+7v85X/tPCjfMBwu2orpgB3UzG9nyRjZHR
	v7A4PanP13/x1OygdAfGoxFyyrs5Q/EfCWknGDh5ndjoQ6JRHt1p4qPf90++ILAf6yvp
	7fSEbSLHyYjWua64I3xEj81FWEnvMt0tdzj6qBUEkN526tbageGlRN+d0oWLc2IcjFOS
	oaBA==
Received: by 10.204.148.78 with SMTP id o14mr149087bkv.38.1342168309592;
	Fri, 13 Jul 2012 01:31:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:36 +0200
Message-Id: <1342168240-7760-29-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 28/32] dropbear: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/dropbear/dropbear/dropbear.socket |    0
 .../dropbear/dropbear/dropbear@.service            |    0
 .../dropbear/dropbear/dropbearkey.service          |    0
 .../dropbear/dropbear_2012.55.bbappend             |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbearkey.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear_2012.55.bbappend (81%)

diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
similarity index 81%
rename from meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index fc5d047..15546e1 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -1,9 +1,9 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://dropbearkey.service \
             file://dropbear@.service \
-- 
1.7.6.5



