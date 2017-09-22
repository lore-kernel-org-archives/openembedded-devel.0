Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A672F71ABB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m30so4484209pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0JbsZXgm6ke8SFoDqpgR1kzm6IU7N/tp0gm5OXHPqBg=;
	b=psjMM3+FqiRmOFxy/3/OkQKI6UDR2VlONMlnGIivPP80WgIhDjHTdqB4aBjbW0zodU
	AiKI9XeqUDxrJ0CVWVK8CHDpbAfsd9XwMyvHfzzPihxdlTealXhMU8sc2j8UF0Vkz4PY
	16zpZAi8vqlKS4FXYg94XbowH6wLRaZPHY0uIA2157DgQIBZBjt2Hqf8KF+j+jJ0xCPX
	ckwMKw9ZlFRHyGiR2jgxo0FspS83dyDWP1h60dtk/6icJsXV9liCVyYXCL7EpTV1yds7
	NVd3uoxZSB2ZvcA2Udz5DuG2vK/Lk/ynALRdyo61gJy32HpaQguIYd4dbVqlpqGNMaCB
	s26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0JbsZXgm6ke8SFoDqpgR1kzm6IU7N/tp0gm5OXHPqBg=;
	b=kY4vULLYqxBZDfQP5RlUk8Az8k0AJfpMCiuxBkJeAMPQd9BdxiP1G4XKu663y8qzxy
	friE1hXgup6SAag+QeAnk6BkPx8yiL37WMJYF9COfVlpmzOYKqmDs6/FQV559A9gma0y
	ljCLEl77m5OpL/gAeHjX03WmTRj+rDiy0mt9lOjPL4NghberVJmumqirU14RWeY+Hw5p
	9Cb+ME8/xlBr01IDYkVfprISnkU0LMFSyWFXvJnLWgDUzAk2QuY3YaanqgVLTicdIdcV
	xf9kFuyQGvefZ5hEvGWhTDdsC4zdLlngDQpihDCAruviFKJznxq+C2r81mRfxpipocwM
	0t6w==
X-Gm-Message-State: AHPjjUhcTYt9eHRSCauB6Srs12T6qhx2CunhseXuoSTENWpGJEOsJHJs
	ottUjWYW1jzZ10QC3oOlCqeCXQ==
X-Google-Smtp-Source: AOwi7QAsRxO1IGJ9RYCAQ0cv38Ae3IDgUfFQFUKmnRTufaoLJ+zFNc4K0zhkZkfFVUEOOYn6Q1aq6w==
X-Received: by 10.99.160.65 with SMTP id u1mr7850464pgn.227.1506050605564;
	Thu, 21 Sep 2017 20:23:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:10 -0700
Message-Id: <20170922032316.18616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/7] yp-tools: Ignore cpp warnings as errors
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:24 -0000

-Wno-error=\#Warnings is too clang'ish, gcc doesnt like it
use an option that common for both compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/nis/yp-tools_4.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
index a3f0a7698..9ac973812 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
@@ -33,7 +33,7 @@ CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
 EXTRA_OECONF = " \
                 --disable-rpath --disable-domainname \
                "
-CFLAGS_append_libc-musl = " -Wno-error=\#warnings"
+CFLAGS_append_libc-musl = " -Wno-error=cpp"
 
 FILES_${PN} += " ${libdir}/yp-nis/*.so.*.* ${libdir}/yp-nis/pkgconfig/"
 FILES_${PN}-dbg += " ${libdir}/yp-nis/.debug"
-- 
2.14.1


