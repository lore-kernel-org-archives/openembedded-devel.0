Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9A55376E2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:27:00 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so7564352wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=saYW3SiPrhhihNu3ewH0AW1k7Ki5Cld2udzvVVvq9vc=;
	b=uQl8yZnkbzOP0D4Oqd4N3C/HEQkY4tZ1mKyijvB+9TpxXSjDPkjJWtn2qrbnHcchYO
	ZWQQIYnN1+qlm7BWyv/IyV0xSWk6BPAh2jUSeKsmqSc4WjrJVUyXjJ7KV5ud2MP/gvcq
	Bkk4u9vC1aBF9lXhSvCLX8Bl6eRSGAQuWzuSaAfnH0T2/3gYFUw6QHFmarIZaEWm0sEg
	yHgAT74JXCR4L0fYzenLPDRmH1j28AXOvc+YJHX2VVP414GylRzIP8Y4mRn53Izb7T8T
	hbObW3inMnFHTAwBN1zoi+8Ry33edOKRe5ck0/cPrGYCjbJP+y/CEtOV84Q2cHAPv16I
	j2Ug==
X-Received: by 10.194.184.207 with SMTP id ew15mr7466812wjc.99.1446722820510; 
	Thu, 05 Nov 2015 03:27:00 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id m7sm3173089wma.16.2015.11.05.03.26.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Nov 2015 03:26:58 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 12:26:54 +0100
Message-Id: <1446722814-21435-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH] VLC: make gnome-vfs configurable
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
X-List-Received-Date: Thu, 05 Nov 2015 11:27:03 -0000

---
XXX: to be cherry-picked together with <1446652999-24545-3-git-send-email-funman@videolan.org>

 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index bf08405..ce6e52d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -60,6 +60,7 @@ PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
+PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnome-vfs, gnome-vfs"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


