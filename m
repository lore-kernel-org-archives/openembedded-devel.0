Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 26BF87E3E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:55:13 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x10so5557470pgi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TNrLcQLLceNIBbNjwCHurE8nHt4FSHNNir4X5GwBF4k=;
	b=GCg+vZjtzBuDeg4JQMCnWlk822CEpWkUDoNXPFSNRHZM7UwHD3Ecg9jZU4sWhPPkai
	W8bUdsdWy0YmLJI2NfUtzcVYAKc4Zr1abBlhDe73m8B8CigAmQn/YQBBLdBEn//8j9aF
	UBDuMkZMSNjOSi8rdoC9Xa/vKCLYvNAeaszJRoJgdElpjXIkDkJAdT1dV8GVvTxC5F7Y
	uTAAtjDh0V4uhYvKzsoFP4/B+A3RpmpMTCa7ceoGlqhgXsfNCoVyh2F/1uKeL5S2EGwD
	a16GQZqvJXiSCvk9YjScjuRLA3v3+qjQPVHzdnBUjHPXpBJG+igby1H0KHgfFelBgESo
	iEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TNrLcQLLceNIBbNjwCHurE8nHt4FSHNNir4X5GwBF4k=;
	b=kVdqsfFyB/9QIPB8u9u5DdKPozFHJj97XIKaOzsbMJq59lEw0MWc2tzNVuWld6WPCc
	KQLTJVNJZi3nu327pIHU8ltj79nKkvE5Dsc27VCb7SodwBP+1460L73uUc1h2i+sj/IV
	1gNVe0dYE8gDtcasWbaTLtWBfrWFfAE3aTkHCQeFKNxnGKtPFzfhVKJS6jpVbBadBZB5
	r1JB6gwJD3rzg084yNkE06jb8CisVGmfyijV3SgtfmElAs5K7hU7L4se2/i5zLeUYP4/
	u69xwHV/hbQXNi7ETVD6wi5JsAXBw0D4+mdglRno+2dSeYxf/bTZnVoP8gI1D4kMBKOm
	QSuQ==
X-Gm-Message-State: APjAAAXuCrRS/6VNCtiNxBR/Wwnn2cI8cMlcNjTQt7zHoaeQVk3qRQPi
	5HvqNiZIascAN75jAhwj7GbkvANd4KA=
X-Google-Smtp-Source: APXvYqznj4INGO8Xq9V6I4o4FxlsWnybec0zj35I/IBZ/coBGMp0MdyY1iK1inVU6wKFmbSO3ih/rg==
X-Received: by 2002:a62:754a:: with SMTP id q71mr23750596pfc.70.1570294514011; 
	Sat, 05 Oct 2019 09:55:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c64sm10648338pfc.19.2019.10.05.09.55.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 09:55:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Oct 2019 09:54:58 -0700
Message-Id: <20191005165459.1363427-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191005165459.1363427-1-raj.khem@gmail.com>
References: <20191005165459.1363427-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] fio: Depend on coreutils-native for fmt utility
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
X-List-Received-Date: Sat, 05 Oct 2019 16:55:14 -0000
Content-Transfer-Encoding: 8bit

It needs fmt during build, fixes
/bin/sh: fmt: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.16.bb b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
index 092b2bead0..0db4a2e878 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.16.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
@@ -10,7 +10,7 @@ SECTION = "console/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libaio zlib"
+DEPENDS = "libaio zlib coreutils-native"
 RDEPENDS_${PN} = "python bash"
 
 PACKAGECONFIG_NUMA = "numa"
-- 
2.23.0


