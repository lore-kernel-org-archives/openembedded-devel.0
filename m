Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5FB3733B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:22 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id k14so11712404wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uvpfAr6sBJZ4SXTBrlMhODuMVzEXyVTNA2z9KVakCes=;
	b=EaM2ZnlQjWbDUEGrRWRtvPBZoEq3iNbQ67Bwk6A3XcM4pWdrbjtBnoGlnNdE8d2WH1
	I97ud2ZeHQR1Y7St/CULFiexoJDW8neBHy0F3CRwpwgKalVth15hpC70HMQnfKGbn2g8
	jf+BePocA7WIXCaWOfdAzRMPhQLxAS+pvsHyob9xOqlQA+UUQCxnkrUEBXNdhNry1evH
	DgalXsUrX0IMCEgN+naT/DXr8eGBXW9wFgXGiAsL/8lPnQlnRtV01mKHYj7SgBYMOgfA
	1x9i8A/e1Vju+J7enrAXHhbL+EyYOvjJy4YFqmY1MBNSIyoflg4I604RtVXEjjd+JYjd
	WaHw==
X-Received: by 10.194.173.138 with SMTP id bk10mr14738177wjc.112.1423810943688;
	Thu, 12 Feb 2015 23:02:23 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:47 +0100
Message-Id: <1423810919-9857-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 07/19] packagegroup-xfce-extended: add xfce4-kbdleds-plugin
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index af8977d..3df7440 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -42,6 +42,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
+    xfce4-kbdleds-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
1.9.3


