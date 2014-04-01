Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8DA6F9F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:01 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so7468649wgg.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=31W3Wzg0ytLP+cQ2N4o2W90/Yc6VenAkV1RzZ9LFETc=;
	b=aN+GBpnTz7CEDD0ohu65bgU+UTrIKP31VCsnmBkr52yxoyM8DG2UYyzxQwDq02B27j
	0tnvhdakAa9SRWetV5Jqc08iSaWYOJ+MDC0vfYCLEDyCSu/WKtCGlLjAAGEsZa6nhxni
	hYeOaGXM9GbT/6fRvak+0+ZBE38nFHRRrCEFGfxArNy8DxzK0L1fUq92ZOEEDfDM1EOM
	CO0As+iOhEq1v6w+4lcby0YJ2H+Z7LR7nKhscFWEbuIu7qL4ERDo0LrPnbxLq01kGX53
	s25w/HjQiPeCisaRx46EGe1ryD39JQeUQYxKPLSEuRPF7eoZaNDbMCopSvzXusxMzsSj
	1CBw==
X-Received: by 10.180.77.200 with SMTP id u8mr20932262wiw.48.1396365722131;
	Tue, 01 Apr 2014 08:22:02 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:40 +0200
Message-Id: <1396365706-14220-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 04/10] libxfce4ui: fix configue by inheriting xfce-git.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 1e141c4..52792f5 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit autotools gettext xfce
+inherit autotools gettext xfce xfce-git
 
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
@@ -21,15 +21,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
-do_src_prepare() {
-       NOCONFIGURE=yes ./autogen.sh
-}
-
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
                    ${datadir}/glade3/catalogs/*.in"
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = "${libdir}/glade3 \
                      ${datadir}/glade3"
-
-addtask do_src_prepare before do_configure after do_patch
-- 
1.8.3.1


