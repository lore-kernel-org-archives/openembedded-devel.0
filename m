Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WV-0004vx-Vj
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:50 +0200
Received: by mail-ea0-f170.google.com with SMTP id a15so429526eae.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PEnStep6R/T5KqYFeu2pnqYj31W4s/dU8mKxBXwFxXU=;
	b=GI2y+GwZhnqTrjvujsIBg2udOldByntUeP97xMJh0FQoQC3E6G9vjj1vH9z+0E26M2
	V3MNAzoiBh7Le4JC7XSl3Ld89jvI/Uhp5+Zv/ORbra7D+Xi0GjUWR+b9BudZ1x4/ZzWM
	/6QtZVr+RCAD/Qy6KtlVXWe2DXqIuQauEt/K6fz/ErYZK/cVEHsmY6IpcHDnOxmDd/JF
	yK1AIhCgCJ2LZhivtsgLcT4E5A6Q0aTpEua8v3jdbkNVNbXkEfLpwHXpFkhmfD49zxtT
	+cBNlOaq+e6kXV3NVDRJxrLd+QS8FVFZOET5f+xs14adkKAuguK2kPoQn0CJZuouxKME
	PDpg==
X-Received: by 10.14.3.70 with SMTP id 46mr53787554eeg.2.1364940037857;
	Tue, 02 Apr 2013 15:00:37 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.36
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:19 +0200
Message-Id: <1364940019-23226-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V3 5/5] packagegroup-xfce-extended: add xfce4-closebutton-plugin
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index a771bc4..7ee65f6 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -41,6 +41,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-battery-plugin \
     xfce4-mount-plugin \
     xfce4-brightness-plugin \
+    xfce4-closebutton-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



