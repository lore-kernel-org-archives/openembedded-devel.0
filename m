Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEE-0005wz-BJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:54 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so5408688eaa.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Yu8RESvRrxZTh0Itv7JnPVUSsGXodQaCaB6Gs5e5cA4=;
	b=md4ASpDd+gkj304w8G89lA4kCn2MNbDDPgYocGABCoDcWCngPTk+vDj7/5s0UXyVTF
	wmFxqPPTFkhX+8KujhDa5s8SC0itHpBWBe8S/qGrYQpIbcBMJA1WcFgL79hIoonyW5as
	2SOidF8j/t4Qn1pyJaMaGcc7nd9/l9+GdTLy6RGY/8NhLO5sm034CvnGUAAXFdwD+byC
	EBqCUdlQlWWBEaHTkU6I3fSFiht2j/t9r6P4o5UvZrUgDpDgRFcstkJMcoKcM9nAL0/e
	JP2qCPEf9dRiNLUnSlnEt7gr1QaEV/K/QoB0v6D5TpkzDIB8wQTGN1Qlsc7oyVWHq9Ng
	mnCQ==
X-Received: by 10.14.207.6 with SMTP id m6mr111647367eeo.10.1356974266644;
	Mon, 31 Dec 2012 09:17:46 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:20 +0100
Message-Id: <1356974245-3497-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 05/10] packagegroup-xfce-base: xfce-terminal -> xfce4-terminal
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-base.bb        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index e42ea3c..3d8b062 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -33,7 +33,7 @@ RDEPENDS_${PN} = " \
     xfce4-settings \
     \
     xfce4-notifyd \
-    xfce-terminal \
+    xfce4-terminal \
     thunar \
     thunar-volman \
 "
-- 
1.7.4.4



