Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULexV-0007ab-0V
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:27:29 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so330194eei.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PEnStep6R/T5KqYFeu2pnqYj31W4s/dU8mKxBXwFxXU=;
	b=a6EHrsq//LPEiDpFYHGhD9spxeXAGGP/OfmvatkzJP4qGEUJ2E4wWaI0lQFNItIr6t
	EIZLRZQ9YLSjeItewjjEXuKuzCuPnoIw/2Q7tshc4LLITNP+j8ENa9rUK17cw3Bg16gd
	Xq05Bbmc8JO/0QQ638eTnrI6s/9sQAvGeZMNYHdeaVQD13coYga5aSZLiG9ukHR6b7c1
	ZKtGm+UAKCjf1PkKKrLpEhqtKKPXA8E+8cQbq1njsW//yt6ChpVG8t62wLyxGd7JkYUI
	r8a17SC5aWkpwLIsM6Ouvyfp5hGxFbO5L8xw95YpbZUgkjV04YitW5FbxomlA6GNeMRk
	DAZg==
X-Received: by 10.15.36.135 with SMTP id i7mr10549584eev.34.1364584224941;
	Fri, 29 Mar 2013 12:10:24 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id r4sm5769042eeo.12.2013.03.29.12.10.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 12:10:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:10:07 +0100
Message-Id: <1364584207-3047-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 4/4] packagegroup-xfce-extended: add xfce4-closebutton-plugin
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
X-List-Received-Date: Fri, 29 Mar 2013 19:27:29 -0000
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



