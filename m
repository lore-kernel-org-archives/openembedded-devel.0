Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 82E227FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:45:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id g4so4269757pjs.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P8eXD4Qb9Wy33lxFZmDkufCqB6Xd9VKtYr2H2TcxYmQ=;
	b=NU0ryUoOplJrAYIKc53Otdvcb2ZKemxhMUfH9WiTJ4RL5AJMioDA7/ijsDIntVOdGH
	uoGwIf2eoSincp1evQ4+UFjlym0rY9wOsZFVb2N1ODpUh2PoVfaS9rBD25+AQVh8X11G
	Ue5H7MqujvMlx5nKD+tr2csZXi1T8JbIaWkDyzpd0YCayFxGmLabWPBS7oteZe/1V3q3
	XiJQLYMZYdgcplFI4buWbE4WuSaduIL+y+oVqqyhw4DScyfatTozIBNAHbdcpheir0sq
	bFE+nVpRv4DUY0FxVY/nRtbkn4jHyRb44TWTjJ4GfiSZiT/mRy2ewGQ31QMEj9uo5l+/
	gcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P8eXD4Qb9Wy33lxFZmDkufCqB6Xd9VKtYr2H2TcxYmQ=;
	b=qSvTTf1W5kUlhuMlgLg7JNry0izSpYgQRp8Vw9efgtXQdP1M0J4T/qjIKLPr0dVg/C
	sENdA2bh2s/Zm8OxpqmIYG/CzF76h8Oiva+79vPYtxKib2Fx6SxE4UbERKOBCpG0RChG
	UXAyeOg2c9sJwUSg4WBsECmmWqF7YL6E4t7P9qk165EHRRd3vgvhgz7DXH8l7iVb0i1v
	XKy3OQyTYwTyN4hsTD1lK10thz0wZN6f5PLx41lCGijdjLaD+esDAVecrrO2sa656nVs
	7PBjIY3Yf+ptUdr0be2xVWlbWQuPF0cKoPiyFPw//XEzaIcn/dLdjmkSX++AADzlmoA6
	ejaQ==
X-Gm-Message-State: APjAAAVvUCU7joe50+W90hq5s7N2Xw+P2xe8rVY4J12OT6yJ3Px5Q34g
	4s/pHIEPz55PI/YYzKj+VLtg5gOZ5dI=
X-Google-Smtp-Source: APXvYqwR5ytmhsKnVn5uzgbfqFV20X+2c1XTIq9iEJ4+DY8Y5zydQ3ShrBkto+mSFyRU/ZaKbtDHsw==
X-Received: by 2002:a17:90a:c301:: with SMTP id
	g1mr22865874pjt.67.1575762339963; 
	Sat, 07 Dec 2019 15:45:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	h6sm19601553pgq.61.2019.12.07.15.45.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 15:45:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 15:45:27 -0800
Message-Id: <20191207234529.1222139-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207234529.1222139-1-raj.khem@gmail.com>
References: <20191207234529.1222139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] sigrok-cli: Update to 0.7.1
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
X-List-Received-Date: Sat, 07 Dec 2019 23:45:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sigrok/{sigrok-cli_0.7.0.bb => sigrok-cli_0.7.1.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/sigrok/{sigrok-cli_0.7.0.bb => sigrok-cli_0.7.1.bb} (76%)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
similarity index 76%
rename from meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
rename to meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
index d31bcd282f..521d91204e 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
@@ -13,6 +13,5 @@ PACKAGECONFIG ??= "decode"
 inherit autotools pkgconfig
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "77cb745e2fa239c7bd1ea81e2d67ede9"
-SRC_URI[sha256sum] = "5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c"
+SRC_URI[md5sum] = "3f45ce664bad529d8b3f78a61b017d75"
+SRC_URI[sha256sum] = "f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797"
-- 
2.24.0


