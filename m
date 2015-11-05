Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D44B675D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:15:28 +0000 (UTC)
Received: by wimw2 with SMTP id w2so7808945wim.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=VqAQJM5n2Am2/5BHqEgTCGPrEffzTGE4e3fDlndkLAk=;
	b=HDKsxeUwWBEvOZreIdLEb/cQZyZyHk7Bg75ckJPf71VzC2rsdY1+zfTDDIZYWaFzGo
	Bj0MmuouNC+H4Gr9zWk/V+9ZoKbEXktRAkthJLQTCWbVfEPWBLkRnSn936BVS7a+6fTr
	TDGCnuThU2DoKevTomqgQBV/h4cOcGpMnqzb2vX/FpICl+w0kyMsKl+sC5GE+YWUKynX
	Dq0uFyH0LWFrN2CBrQV2gRBVvxTcIELV/nG3v5HcJ32NvCGtUP4yzfYDrmmz9qMaGekL
	cfeSkbllv0/nlsIq4RzQZcu/beMO3npLedIwxBpI8CdYrPbt2SQgNy34u2JGVcaKokh6
	BAvg==
X-Received: by 10.194.171.69 with SMTP id as5mr7675851wjc.137.1446722128638;
	Thu, 05 Nov 2015 03:15:28 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	r65sm33572803wmb.20.2015.11.05.03.15.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Nov 2015 03:15:27 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 12:15:20 +0100
Message-Id: <1446722120-6291-2-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446722120-6291-1-git-send-email-funman@videolan.org>
References: <1446722120-6291-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 2/2] VLC: add an optional dependency on libdvbpsi
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
X-List-Received-Date: Thu, 05 Nov 2015 11:15:29 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index dddbb5b..bf08405 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -59,6 +59,7 @@ PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


