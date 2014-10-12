Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2A424718DD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 02:47:40 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id eu11so3899142pac.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8QInR1iXmBsBDVTSQs0xuuLQFw+AZ/0+ERzGG5jiz6c=;
	b=03/uA8EFVznEPPC7ZuGz5onqF9ESi5ihaeAdUN0/y6zeMMyAw3SC+G391YN5QloC/U
	oPXFqGZWzyQiOvTfoK7uf+RnBn8mLVUIe6U9N6rk+oeDsP7evKV+TedimqzNNaqaJBWp
	AHQJXl79BZaT4zG2eiLybo3126naTn/uoHmyBaPvLOkld7RWdK9VAcj6ewz1rOYRs6By
	0KD2DFMO9lmVcqmoqI9pSL6MNR1w0sM47klStsd8lRDoMGUze6q5u/vtRwquztXgVaIN
	Yz1frmo2VVY35elWWwBXeS0x4YRpoekU8YmSaADICMWika7lPGB0JVzgpZsmDyAnSgNG
	caBQ==
X-Received: by 10.68.215.67 with SMTP id og3mr15217229pbc.30.1413082062352;
	Sat, 11 Oct 2014 19:47:42 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id w1sm7319472pdb.52.2014.10.11.19.47.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Oct 2014 19:47:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Oct 2014 19:47:25 -0700
Message-Id: <1413082045-2674-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1413082045-2674-1-git-send-email-TicoTimo@gmail.com>
References: <1413082045-2674-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] vlc: add PACKAGECONFIG for libva
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
X-List-Received-Date: Sun, 12 Oct 2014 02:47:49 -0000

libva is a floating dependency
libva requires libavcodec, so enable or disable both in tandem

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 72a93f5..1b6f02a 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -51,6 +51,7 @@ PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[libva] = "--enable-libva --enable-avcodec,--disable-libva --disable-avcodec,libva libav"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
1.9.3


