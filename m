Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48051.1795411887431291276
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SMcnkr1r;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so8134539eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411887; x=1796016687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zetthH7WutzhOliJz62GyHMicJNrWQzRbCYVk+z2S00=;
        b=SMcnkr1rZJpChUiFoukGahXFIikwtw8BOx4mVF2lT0FdAKSVA2eJJuRRZzHbNTcbG4
         QO8Bi3qhAanEdODP6X5Qp4sMxuFfdaKY7xGJJqgDV7elhKcFPtP+DE65WFgvlD03/kGq
         toX9oBIbL6qexeFOrcW9vOIu2+TV6ZCmgQntBXPhwIA6MgqBMW1gEBLjJQmcrw8Z6JXE
         T7ZXrsL9DMeWS4r3ILK3EZxdVNWjXHpetwA36I8rKB7KJKKn//QfUipTXFJDpt6e4S3k
         ubXx+YoA+NuJgt/cSK3d2A879UlHlrdbsPj9M8x4AjTJ7auYDH1mRM4GAI5WxrISfebE
         YZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411887; x=1796016687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zetthH7WutzhOliJz62GyHMicJNrWQzRbCYVk+z2S00=;
        b=NkxwCgk58ZzPKn2Gq4fckZNvBekgoKwrzNOfisjGmGePposXIe5rrAOC1zTZ9VWFwr
         Bnn2hjcf7BXO2+ZwmZWCWTl7/v8BWuSy5vq6FWo5h7adrrWsiISkjIR3Jw74L8RVulfC
         FtqaH5xETGuN+wCxGGCKVy1dh6N8O014LOIE5dUjoW7gI7AQ3jAyhxVbd1QsGGTKNqj+
         NCT4IpAcn0CJg3xCKC/aFa/44whPI6oTbJC5gaWksyCF/Vxr8FEsil/HTszrgxu/lvjc
         aZK9hdjevRZ6XRxQ7LRjLW02O8u0VI+Lod+fLBNbEkN4iNke2EwAuJv4655EGOu/7gOH
         WRLg==
X-Gm-Message-State: APuU4Z/MNWDuq+8eukPabvDpo6pethe3r7xIn8y9ESSst9JjnbSY6Sw6
	RqIO4MXjNEAcbLYUlrmiF0pEeUIOBoXGD12CSUNx0AozeoLIe9E8JLh4SU3fez1L/8k=
X-Gm-Gg: AZFdTZf97J0oTqQqa8Wcc2AbiXX2tArNzP7YeKqspghJvKHzqLTT3cysCyAz4Ddm8Im
	Fa90aqgZ+JfD0OF92A2caG1RIbHJ+XL2M2FF5/8X2BmMrhRkaNf0CMCKBJ9uiz//5PcTebL9jgA
	x14VjelbvYSmdUGeWfAoYpNYla1OsCOVyoVknMMkjYS4/jp1jcYE6OOnLW4pwcSvn7VR+xIs/4T
	8gBWDTCnb3ApCwVjTxtqUTd1MOgXXgx2fuf4z+NQgyZ+8fvTP017lwwu5bTXKESOPm1GHuEReHZ
	SQFf1v/y5TuYyHF6kLIjCsPELq7vNeo97e7g0yd8Pz7W8ZTslyP0Vvwn7WhCdLBRlEmMIMIHNUe
	avL1if+MY8jKfgYdEnzALbCgYxDJiBX12tWBgRTrR1wgNvt0b6dQkX5VFPgfI+gsiwy/mIdDjZa
	LKwhQC4xJICgXLTjNPY0GB3QGqNAx5fKZPdZJDSxQK+ysdwr5D2d2glhKja/SDx4Kev6EbBcxpz
	RKYgzc89pZAPWjEzQ2dBZqB9/epAIL8ywksSgVTJCTq5scR5gSAAgQYHvT68bJNcnXyrTE6DVPK
	moo5BOof7eqT8gd1X2UuCvUr0Y8MZZ+GaKLk3Kx958G3ssAYQmo2nY/KDnbveri/OcyFGXpSM3S
	1gT2HfNd8VzCVmA0lR8C0WGuA2LFxz93mYNCkvmOHCDA1ihhE75E7CeQkUl4Lvn+3iHtZyMz3Zm
	oRHxEBLPMzYw/OpObBcxbluv+mR1JgCPKZ83DsbvYtLrKwFPlNGux7y6rrKPi5iZgEI33OgGIEX
	vwXnuB4AcDGTOiEmMLsjhD6m2MDuPAo6s0h+FOMO5leY6RuI6MW8ZraP3rdNHIKdTa9CM8dWNLG
	cACwpA==
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr5599912eec.25.1795411886673;
        Sun, 22 Nov 2026 21:31:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 00/16] Recipe upgrades
Date: Sun, 22 Nov 2026 21:29:30 -0800
Message-ID: <20261123052953.3658549-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132861
Content-Type: text/plain; charset="utf-8"

Python recipe upgrades. python3-pydantic and python3-pydantic-core are upgraded
together, as pydantic pins the exact pydantic-core version.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (16):
  python3-coverage: upgrade 7.17.3 -> 7.17.4
  python3-decorator: upgrade 5.3.1 -> 5.3.2
  python3-faker: upgrade 40.54.0 -> 40.63.0
  python3-google-auth: upgrade 2.62.2 -> 2.63.1
  python3-grpcio: upgrade 1.85.1 -> 1.85.3
  python3-pydantic-core: upgrade 2.50.4 -> 2.50.5
  python3-pydantic: upgrade 2.14.3 -> 2.14.4
  python3-pymongo: upgrade 4.20.0 -> 4.20.1
  python3-ruff: upgrade 0.17.5 -> 0.17.6
  python3-soupsieve: upgrade 4.1.2 -> 4.1.3
  python3-typeguard: upgrade 4.6.0 -> 4.6.1
  python3-types-python-dateutil: upgrade 2.9.0.20261104 ->
    2.9.0.20261116
  python3-watchdog: upgrade 7.1.0 -> 7.1.1
  python3-xlsxwriter: upgrade 3.3.1 -> 3.3.3
  python3-cachecontrol: upgrade 0.14.4 -> 0.15.0
  python3-pybind11-json: upgrade 0.2.15 -> 0.3.0

 ...oml-Relax-the-uv_build-version-bound.patch | 23 -------
 ...14.4.bb => python3-cachecontrol_0.15.0.bb} |  3 +-
 ...e_7.17.3.bb => python3-coverage_7.17.4.bb} |  2 +-
 ...or_5.3.1.bb => python3-decorator_5.3.2.bb} |  2 +-
 ...er_40.54.0.bb => python3-faker_40.63.0.bb} |  2 +-
 ....62.2.bb => python3-google-auth_2.63.1.bb} |  2 +-
 ...cio_1.85.1.bb => python3-grpcio_1.85.3.bb} |  2 +-
 ...d4df929bc9d0882298fc1f85ecf589456ff6.patch | 59 ------------------
 ...2.15.bb => python3-pybind11-json_0.3.0.bb} |  3 +-
 .../python/python3-pydantic-core-crates.inc   |  4 +-
 ...0.4.bb => python3-pydantic-core_2.50.5.bb} |  2 +-
 ...c_2.14.3.bb => python3-pydantic_2.14.4.bb} |  2 +-
 ...go_4.20.0.bb => python3-pymongo_4.20.1.bb} |  2 +-
 .../python/python3-ruff-crates.inc            | 62 +++++++------------
 ...-ruff_0.17.5.bb => python3-ruff_0.17.6.bb} |  2 +-
 ...ve_4.1.2.bb => python3-soupsieve_4.1.3.bb} |  2 +-
 ...rd_4.6.0.bb => python3-typeguard_4.6.1.bb} |  2 +-
 ...3-types-python-dateutil_2.9.0.20261116.bb} |  2 +-
 ...dog_7.1.0.bb => python3-watchdog_7.1.1.bb} |  2 +-
 ...r_3.3.1.bb => python3-xlsxwriter_3.3.3.bb} |  2 +-
 20 files changed, 40 insertions(+), 142 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.4.bb => python3-cachecontrol_0.15.0.bb} (76%)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.3.bb => python3-coverage_7.17.4.bb} (84%)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.3.1.bb => python3-decorator_5.3.2.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-faker_40.54.0.bb => python3-faker_40.63.0.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.62.2.bb => python3-google-auth_2.63.1.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.85.1.bb => python3-grpcio_1.85.3.bb} (95%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.15.bb => python3-pybind11-json_0.3.0.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.50.4.bb => python3-pydantic-core_2.50.5.bb} (95%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.14.3.bb => python3-pydantic_2.14.4.bb} (98%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.20.0.bb => python3-pymongo_4.20.1.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.5.bb => python3-ruff_0.17.6.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.1.2.bb => python3-soupsieve_4.1.3.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.6.0.bb => python3-typeguard_4.6.1.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20261104.bb => python3-types-python-dateutil_2.9.0.20261116.bb} (74%)
 rename meta-python/recipes-devtools/python/{python3-watchdog_7.1.0.bb => python3-watchdog_7.1.1.bb} (76%)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.3.1.bb => python3-xlsxwriter_3.3.3.bb} (82%)

