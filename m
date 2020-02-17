Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6F061611A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:42:58 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id gv17so6531348pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SZiKoOzLrFM7p4zWlauxllOJ0PCKSHNiEVRJGi+su5Y=;
	b=dC2YapoFJca66qSrNz8vLTM06WApHZ00FguQo74g8lzM0E6MnzPPiJ7lvuzKLEzp7w
	0gI2kaVcT7UMfZiL+oMPigII7uunD+ETXy7egI8SpM2kL5hJwYhSe2SosnBCplF7Ngxz
	vrk7pMt2Bcw3wm2I/CRkQo+rjSszdlkm1kirapRA1zWba6zHZVg7UFEQoDWONvWKsu7l
	StOcCPbH2QNLB18V4Bf6P3THuswTs8Q7yjVpxhne1S6YqkJHCRpcrpfKfYWrOaq+Z05S
	GyBmTOB4GMWwrxBSll98bH5HaDo78D31iwHQTD0S4TLTi3bdXPt413lMCTFxWPM6BayQ
	n2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SZiKoOzLrFM7p4zWlauxllOJ0PCKSHNiEVRJGi+su5Y=;
	b=ayoGTNKWRNuSo5eKiHX0v6GvG8YzuK/PBNFsCmPivkJE3NvFn81nJtpyTSl7LeAtue
	RczuNBAeNbg8WlzYzG+vu3W2vr39J7Q8ZUUMI6HUNSk7Ls8LzYYhXzYZycqJo+lMXRFR
	z1AV9EaXubpMpmxNnG9AOrkJd3mVvnrRzG1j0eQflTXra2VQt2oH04b8ouK0Ycawd2he
	dnFYHMq2e/nEcDquHthotAsmPZm/o7LkWnMsXEhBOjtI8x7m3aCzueJKiokjaTaRb7ZD
	sOiCVLeBsZV6o3vEWTvQnzl/KGWHZ2jySdwPwYOWeurOMeZzDzjBOB2NrlmsAiuLKVsI
	p1qw==
X-Gm-Message-State: APjAAAXG1TaJtkB+9GxtCYpn0/AnINk6M6uBbUPpbdbWMRjRyEIwexsq
	lyJGp3hDLSOYnPi0SICMC8FUsYSMuVo=
X-Google-Smtp-Source: APXvYqyP8ZH7bFJdwurcrQ74J7gIG5cmeKOhCpWdQ9slESqg0poMyt6/nGoESC09Ps9AvhJaM2zRzQ==
X-Received: by 2002:a17:90b:3d0:: with SMTP id
	go16mr17611971pjb.75.1581907379078; 
	Sun, 16 Feb 2020 18:42:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.42.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:42:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:42:59 -0800
Message-Id: <20200217024304.1131392-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/7] libsigrok: inherit mime
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
X-List-Received-Date: Mon, 17 Feb 2020 02:42:58 -0000
Content-Transfer-Encoding: 8bit

Fixes
libsigrok-0.5.2: package contains mime types but does not inhert mime: libsigrok path '/work/aarch64-yoe-linux/libsigrok/0.5.2-r0/packages-split/libsigrok/usr/share/mime/packages/vnd.sigrok.session.xml' [mime]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 35e59d6d7d..e8c36a81d7 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[hidapi] = "--with-libhidapi,--without-libhidapi,hidapi"
 
 PACKAGECONFIG ??= "serialport ftdi usb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig mime
 
 SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
 
-- 
2.25.0


