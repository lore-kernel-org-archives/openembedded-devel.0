Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9E005770F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:20 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so255236wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=NqalWzBHCnZGbpcGfL0eZwa0GmabfLgWAr68JvUtH1k=;
	b=zAyec6BcwocmVrfN7IFN9Kqzug5hDOpD6HW5kR7AqiSvZXGJViT5bIPbPOFoMWy0Nn
	nAdQcDIr4VPhFMKCq6QgTQVCscWrJbG253OSi/U+sNb+QPbIUR2Cwtf00M4114gGIhsw
	pUJwd8C8pYiz6o0lcgv3n8AaYBbKXLuL8Kq/uuh7oc1zBBr2I8vNgK89e3xRMG4oga3i
	a0A1pH4N5fFGutDhP/ivW0TxqHJY0Ki9o6wnTaYm0tlwITBus3yD9mE4fKTIGN+AftT+
	Ky5c8PKtOZezS0G4BJrroynhF1qyBmfRyRlQvsAlBPf/vyN2b0LHfemAviE+X0uc6R7F
	wBLg==
X-Received: by 10.28.91.11 with SMTP id p11mr6163914wmb.60.1446680660742;
	Wed, 04 Nov 2015 15:44:20 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:45 +0100
Message-Id: <1446680640-31722-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 03/18] packagegroup-xfce-extended: xfce-polkit
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 04934eb..ccd6f45 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -50,6 +50,8 @@ RRECOMMENDS_${PN} = " \
     xfce4-hotcorner-plugin \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     \
+    xfce-polkit \
+    \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
     \
-- 
2.1.0


