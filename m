Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 040727887B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:10:10 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f140so10270623wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q6df3ei45Co3KlkNaO4dtugmSbOFuvTkvsPdFVG8KKc=;
	b=MyO5Ac3cAPQw2NpxznCFO0HHQ4y5QRq6z5XcyTiE1lTcqamj0x/c0On2D4CaCIF9mW
	VN5k1HRMq3i2sTQcowexxYNjjtf6Jxqc2umksPheeE6GFfQ25LUIsV/hJUV5BZLPKNqD
	SvRHnHq1+2BMnjfzJ5s0mkC69WGD/FfHkFcXQa+KJya/b1IntmvPZHyNaHNpY9CTew+K
	rFZp6no/r1b6L57pphPNYkWkzUKYzwAMluPHLSN5HCojoUb8rFvqqwV8+z2GSOLTYr4E
	THq5ze1i8oT4hxlhAiSWfSxPRJfA/esbw6w5uqgY+W2HiT1jP20Bi/ZsbAmdX83caLWa
	ApHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q6df3ei45Co3KlkNaO4dtugmSbOFuvTkvsPdFVG8KKc=;
	b=S8/MmwwJFeKmI5MKL3LPNnYDcpofHMrNY1FtEPECX72H3iRPFAdAx188dpeRfUfNYk
	kRhNvxk2CCR0uMWKn656RivIFz5ttOMq1IazCIaEfe4UrypgAMxqKWtOaCRSvC2eLyWj
	ROcu0oZp6Y4KtkwzgNInz85SDC8o0yRhzMEXVVVcgmFPVktqbKt3XUcIwj9U+d6G76Bd
	RnuHgYo2es4VMl9GVJVa1Sp9WWkd/Y8mAsYH5vL92kZmZc+v6KjAmnen1Hr1Crlbr9Qb
	8IaLuAh5iSA0vHGCi5OXR29ilW5duuVCYkbo1zBNTcurIMTJiBY5FytAvvRNxvfoFlTe
	6zLA==
X-Gm-Message-State: AKGB3mJvNOSO77QAcqjZDRKnxGoSWXroqQ+nZCtlQpvbHjR5wrE5fj9/
	zpp6/xMbn7rxvrsyzVckRhtgAQ==
X-Google-Smtp-Source: ACJfBouls6sjB3w8AVjRCNgAbO/uRvn2aeO88fHq0TVbuqTPhEpO0jQSZMo7PPT5mt70nMlldA8Trg==
X-Received: by 10.28.94.75 with SMTP id s72mr1740787wmb.112.1513246210904;
	Thu, 14 Dec 2017 02:10:10 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.10.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:10:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:27 +0100
Message-Id: <20171214100929.11094-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] plymouth: do not install systemd units manually
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are installed properly by plymouth itself. With buildhistory no change
in packed files could be detected.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 6163cff..e331779 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -39,9 +39,6 @@ LOGO ??= "${datadir}/plymouth/bizcom.png"
 inherit autotools pkgconfig systemd
 
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${B}/systemd-units/*.service ${D}${systemd_unitdir}/system
-    install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
     # Remove /var/run from package as plymouth will populate it on startup
     rm -fr "${D}${localstatedir}/run"
 
-- 
2.9.5


