Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 136E376947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:12 +0000 (UTC)
Received: by wijp15 with SMTP id p15so165107148wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=FKtOoz5e+N3VJpszakoECfzAoEGNLARh8A78ITCUM6Y=;
	b=U44gqSLKh4iVMwvGkPsy2YAFdGRZu9Rc188J1Ov7v5w97RzbldZeQJj3EIWoYdTRtM
	r/R8wYhywn+LZY/e72Mive7z0MOZTJOc6FLGNhUBha8mljJbo4r1fNM2qo22+HGrk+fe
	hx+Iv2QuVOEQB1tskv4/M5HfhhBIrmuyQLNjYpmEBJH17WtWM4fGhr4cmwA+I3H7Z1aK
	fp/PzJHjSfvTGf39RBrioh6mLIWm5wYMaKagnjUn+tgIb/x4xFECNge6YSkISc4+0SwH
	z9Dso8IS8FWRU7EI82yxAtLWx8UbpNe53Is3u8vi1gOM7s/PpYEfQFLnkv67qFYVJQKO
	ndSg==
X-Received: by 10.194.85.130 with SMTP id h2mr57208886wjz.2.1439279892923;
	Tue, 11 Aug 2015 00:58:12 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:25 +0200
Message-Id: <1439279859-1815-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/17] packagegroup-xfce-extended: add xfce4-pulseaudio-plugin
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

optional on distros supporting pulseaudio

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index c19a46a..fc8ac8d 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -46,6 +46,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-kbdleds-plugin \
     xfce4-smartbookmark-plugin \
     xfce4-hotcorner-plugin \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
2.1.0


