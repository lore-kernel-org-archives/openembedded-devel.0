Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id A70857F47B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 15:19:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x127so1829013pfb.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xNGDRYkSJ5RYidk4hMDHdHlYG2ZhmfiYHpXHa11PkYo=;
	b=NmjPZ8f4IUwTK6LESLnCOMa64KezmST7iRs6GG0X4skzxPu9cPCTByA88PyscLOFyD
	lKEMLS4r/ZWQ6lYKIdGt97fYwYf670sBWQ+7VY4DMAc1MGRSOqk6Xb58rGeiToIl5B9D
	2p8k7sObuATLV3Qg7BonL5K0SSOUpX/3KeuP3fk/DpCrofoKTlMl06yRIOx5jRvV+tyA
	F3ym29Ku7IVORdy8/ceV8h7lbJ1Kff/FGYhsZu/RxaORMJ1TFgf16Jq0HpRRPECDfABo
	B7x3e7WmdkklT0YPCdsU+Sl9xpKOR0a3e3aBn2K3WJm3jSsnAKmpIjdIgAC9oJiM41h9
	8RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xNGDRYkSJ5RYidk4hMDHdHlYG2ZhmfiYHpXHa11PkYo=;
	b=JY0sEa/6FNZ1+BqqOLKH+G1j3E0OgxfyxjQK4SIarxNYwThnADmMesut8qoTjuSi5E
	1MP8RBoMjuZYhROmS6UsWTtqqwb5Ene6Ul1oYvR+hSVusPoKKjFYeV2q4IDTE37nU3hJ
	4RSijugHoPGFlQvjxTyJdMmllge5zzp1iRbAX5VZrqAAW/LfuuceM4r1we/0VF2r9cak
	NLl4L7Cx0bDKqU+pc6yb3bb8MsoSGupT4yNNy8YsYJdt+yErE7NwqTAkUfjbUZUYhadr
	Otu1kX6w+Q43vHy0Kh0I3Vf2Ul3NIkcMkslWrXyR8t/ywJSFyUoSoq9ohCMIS5iV+XSa
	2O2A==
X-Gm-Message-State: APjAAAWp2zC3c4ffthLziXXGBwy2+Um2R8RzL6LhsVQau5hnqRoDQB7+
	gaJRRHLADaq44Mm2qh5RswaVxPyhoM4=
X-Google-Smtp-Source: APXvYqwV8TzRWYYfHBr8rtiRwX2Epk3MskVYBx0PgKxBLHX0jO0MJCV2nrmTWazojXud978pcZazXA==
X-Received: by 2002:a63:8dc2:: with SMTP id z185mr4928097pgd.228.1570634381204;
	Wed, 09 Oct 2019 08:19:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	s202sm4390289pfs.24.2019.10.09.08.19.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 08:19:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2019 08:19:26 -0700
Message-Id: <20191009151926.1733788-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nvme-cli: Use install-spec target
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
X-List-Received-Date: Wed, 09 Oct 2019 15:19:41 -0000
Content-Transfer-Encoding: 8bit

install target build install-hostparams as well, which tries to run nvme
tool during build, we defer that to runtime post_install anyway so we
can ignore building it during install task

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
index 256d83f039..fa47c9e7bc 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 inherit bash-completion systemd
 
 do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix} \
+    oe_runmake install-spec DESTDIR=${D} PREFIX=${prefix} \
         UDEVDIR=${nonarch_base_libdir}/udev SYSTEMDDIR=${systemd_unitdir}
 }
 
-- 
2.23.0


