Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA22EC5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27822.1786651827433673215
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gLLXr4yv;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbeea240819so147848a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651827; x=1787256627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvJlcaVXGc/G8riPDmGLIsksTjWqSwnXSBmQxP0BhyE=;
        b=gLLXr4yvR5IOajZpIftWHRRINTGVN7HMDI6XtbVU+BL0HlYlgqhFeNFfEsmCdXvZxe
         P8C/cpDRsVfJNxTq5xSZ4L0DGdPnrMNLQPH0WtLegitq+UdAk39o4lxeYDVzxdUEEzDt
         swYJ7jk9OzAb0gOiCMCxi9jdkHpRPdJtL3BGZSfBYwvkd98JKDtY4QZ2s7ExpDHjke15
         +6wP8BPEsA9bDKkhCD5RdKzgiqVU94KlZKzFxslq/jNS6kW8UtZY0rJ+1DkH3kz2MOMN
         TZqYDj0MsJVMI1eiYsRXAPdH56B8SSNAyDWxZpiMvicUT72JQwexONuqk0878FrT419V
         DOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651827; x=1787256627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvJlcaVXGc/G8riPDmGLIsksTjWqSwnXSBmQxP0BhyE=;
        b=bE+siLoLKGSfnIBmVJCV/k8/aUgIW20khn8Lt2SJrp8CZ9SbxVPrGDPSog9UbcfHlU
         Dhd7t2z/E03eT+PTeuTtD+ocPg2PD8AD/+ltg3INoHBwvWkiiDTKjWSPCmB2EEXDgjdb
         7ZypwvqeavvgrEfXm+s0SeWjO79YxyOBF9geHDSVKJMdBnrrh8qm7KT8Bkajq1fPJB9I
         lS3yul5XASTMUibqzFtjso0BpduxpPsctZDpAfS3TuQNciAXo2xXz1iLPhFK+WSTMWzx
         J38H78LQHMeoZgB6nY5T81mwWosvM+daiowqYfC/mHfH16rh42W9KHlJJtuMz6PHjNzt
         0r+A==
X-Gm-Message-State: AOJu0YxfqRzUcaMTsERpEgIbldNPfSra8XDma4JMQVyf/2JqlbdPX61h
	EkI9SK/3LSZXi04gqQ+fdHrDt2aDj/oKqH2bm67aD/EwmAo77d3/CRADBijhM1WG
X-Gm-Gg: AR+sD13LI37UhEhQSRL1PTdnyN8YEcuuYngbVRKMFEpD1v7EkcNFGeUJhItlDieahZj
	hgCYiQ3LGKjw2wKk4pIzLA3lc8eMl1laoGmkI+kQANZuBrvSp3zhKPkFe7ho2OsuvLPDn367TiO
	N8oV5wIEWsZxEFU9hWKEp7JLUXg7J9kgO39Ef1MEvIzuCKI8gQvgMlu+pndt9puFAk0+WS6xr/A
	Bx/KdAy/a1pkR0Xy+Vg1Akx7x36VOGZNCPHShzTNV8SpC+UjjHm6FEy2aMODuxOXDtShWZFrM3G
	eopPuoUK+xGJOnAHgyoUZOJRHVPYCM1RL9RfOey2LEY06RePSQP8To/PkPUyv+1IKmHQ2vaNcrb
	AmDDW+TioofI8LVb7h1lYoq4NzORw5xKpB3BzYy8KupYQIenJWE5zD9GI2rbamgpQz6aPkBVAQt
	NuJuVNSUa4/vx3HSZftaVsus+QL74qXtURhasCbVwIWxK4lV5pmOPzS6DP1H5LBdv51fP4NUjLh
	cBZ1oZoaUAKye1/uUpoBWkh/YlgOnd42oZeiuhz48TWusfmMo6dOTT8p3XItt85X8BpTp3gdphG
	LSfm7cbi1xJzKJtLgwkOpxgZ79lHd+0oZdpwc9mh9kamx3FIucXljuN/Ag8MGhqCqShpwcrP7fG
	Tj4+FD0EDsjq0EZPPuGN7Y1FEOhhAJiMdpd/Scick4u9nw3FNltk=
X-Received: by 2002:a05:6a20:7343:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3cc71cc65camr322213637.22.1786651826759;
        Thu, 13 Aug 2026 13:10:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 60/80] python3-pytest-sugar: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:14 -0700
Message-ID: <20260813200834.1302829-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129004

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pytest-sugar_1.1.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
index 86de98675e..22eb3d52ff 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "73b8b65163ebf10f9f671efab9eed3d56f20d2ca68bda83fa64740a92c
 
 inherit pypi python_poetry_core ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[dev] = ",,,python3-black python3-flake8 python3-pre-commit"
 

