Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD1D372001
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so15996746wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qD4SJecmbQMEA1So0+elj03pdQfIDJy5CecTSNs1O2k=;
	b=F9V6q6RFXpDOAhoF8QbThkKVTH88xj8diUWlB/coMgQR4LSOSQ/bOVr/ffwJ/Ub3/N
	woxIPxWejOYijNITT6gUpoN2CDxeySEf7jvS5bzSu/W0hgBEmUSnx+IkDcj/h3WQS34n
	nMSR1+eAUx7a0XwUG9KRRXrOyaXtSMyL5s88AStzsyNG+s4ZY0S8r8TlDc8LcHWd/opM
	MX/ITS/SdoaRJNbYKzyUrBAPwRBJgzchGlmE/xYg7ekgzdi3bCLpS0j6HnWS3h1kaow0
	ZcuErZTcl1rvAk5gAsaGNu+k7ml74kZ8mX29MmHYV2skqGQqvFfFwvdTQRIx4xn+EGL0
	gujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qD4SJecmbQMEA1So0+elj03pdQfIDJy5CecTSNs1O2k=;
	b=eP0VrwhFzpqLaXDCEh5b3yCgVpHhLF/zzL+65FqH8t+F5DaoQ3ATFPtmp130dmhGOH
	JNs0gNe3v6EJlI8JKAyHFk6nYNKdQeHT4+GrQnyb1R6nXY7o7rW0lb1itQq5mkknecHV
	Lm5kZyC0Wp9OZ2njfVPMes8hGVOD5BEtpH3BIhUlI4O+tb7i1ER+824McKuPYV4kpzt2
	cbtPh658qAz0aGoXdWpIdrX8mOOSW5kq6ADHPEhiMr9ISH6XUg1Hc25NMWK7/1m7Y3Dw
	HtAic2ungEh6iD6wdQYRTwVz3rXdAD3QAo4YlVgs7SYXA6J6YqaMQgdAs0SFY5FG4uzn
	k60A==
X-Gm-Message-State: AMke39l6PH1HZ+LwCDINv/1BbJVbDJArJMd60ycSZDujenQssdfAbxFgAyJabaHl4Bl/jA==
X-Received: by 10.28.67.134 with SMTP id q128mr33961543wma.34.1486933352862;
	Sun, 12 Feb 2017 13:02:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:10 +0100
Message-Id: <20170212210216.867-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] poppler: add qttools-native to qt5 dependency to fix build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Feb 2017 21:02:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
index 4aa2dba..f683a3a 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
 PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
 PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
-PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase"
+PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase qttools-native"
 PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
 PACKAGECONFIG[nss] = "--enable-libnss,--disable-libnss,nss"
 
-- 
2.9.3


