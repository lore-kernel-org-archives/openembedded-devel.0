Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9776F6F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:19 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so4159965wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sfngSdXm5UdHD6HS/jfzUWC8g3EFSbtrJ13FYKfjElk=;
	b=QNqq8IA3E87qAcE0kEb24p6a8dnChIeFWnmjE1jNOERfcUqIY7VWQoK/1W6m9jb7bj
	87lC4qtYjraj2xq9GL6Z0UrhLb/WNlSlzEi3z+BKMho/3bMt2v/l82d21o1u6myrKLzN
	97jRZ91UmI5NIAlru/9esDD719k2bCkSh42VUfXbBARRGCgpl/Lyb6AZiQSmsHfqqXFa
	ICo5LoHwQikyP5KXSZmVOV8r/LK636EDkF95ML9bSWtRlooXAaA5cYvnGL+H+K9I42sj
	Lks6djyd62SoesVSUiLdBjRDbxxyaS0SdNk+P166eFqw9QS/bAGFN37r7WKFXl7fGVye
	ibSw==
X-Received: by 10.194.187.50 with SMTP id fp18mr5008363wjc.89.1396372460404;
	Tue, 01 Apr 2014 10:14:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm41869158eeg.8.2014.04.01.10.14.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:19 +0200
Message-Id: <1396372434-10710-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/46] sound-theme-freedesktop: add glib-2.0 and intltool-native dependency
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 9c4f9c0..ebcfd12 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "http://freedesktop.org/wiki/Specifications/sound-theme-spec"
 LICENSE = "GPLv2+ CC-BY-3.0 CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
 
+# glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
+# intltool for intltool.m4 which provides IT_PROG_INTLTOOL
+DEPENDS = "glib-2.0 intltool-native"
+
 inherit autotools gettext
 
 DEPENDS += "glib-2.0-native intltool-native"
-- 
1.9.1


