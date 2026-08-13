Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EA7C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:40 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27830.1786651840385588533
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ClthIDDS;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso250583a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651840; x=1787256640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvO7KlPPGM+Wwfwn8vJDgwDua2qor2iZYVu0loCWstQ=;
        b=ClthIDDS0xEsXXUq3XBaYCKnPrPlVMOX+j2JOJA3Q1JtMicUlsWTRCUIAwjxtYiywt
         a8uWoTQe7ofwxEmnqpfXME57q1uCQ//AsBYUft6fF9WYzpqvLkl4bRj0TcjkgMemqk6/
         vZQUOOZmU3Kk8olAGyCRLDwCrXAyVCuvlYN6tEC0cxtRIHKXjlKM8hUmpexN0HeO2IYz
         XOGv9kAVQrmJtFFK3eAAldAcKOYxyAN8vXJ4kQsRkoX2WcTs1vIvlGVnafcyxilO6HTc
         nggomJaj2KD/BJaYcx2iTSCHb/QM5mnd5lqN7tUJ1fMsBsj1vzknevxrcV+5PwA2jDTC
         kfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651840; x=1787256640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvO7KlPPGM+Wwfwn8vJDgwDua2qor2iZYVu0loCWstQ=;
        b=R9AWL01fnT5RWN0jB6idgmi4RtGiJOfiS0kv8C/9hnQemuRKCo1WotKJLse4qZLc8M
         WA/GSuNGFeSlwfVGIUAfSawjG/e46wPNbi7rU7KnNLyyNXhjQtWS1qn21S3lT5nyhVed
         Wu2RYira690aL7qVYWpAfiFjLVhQKtTDLndkNYKR+TRmfqa7jqFmiIb6EA9de+SPzmv0
         tq2OjUSV44gntDPibBZ+ktkR8QgC2KuDzVNZ/OSZnQ+u/AftNxcIkDJSZHw1KTrjPzdB
         Ffe3MGO5lf8COE/Q39iYF2Mwb5XcppqAEt68Mugq4MwGXPPi/h7vuWd2JNWurNN1TFt3
         mWmQ==
X-Gm-Message-State: AOJu0Yy0cJPWRjtIsQ8FS9D02b5Se1mSSWUrxCcqVANgOKJl/n6UoX+u
	2df0xHtbv8//sqNGiUGrhywLnY40eqdlyaztMrD7ChLhXeKlUJyOF6NbPSM8kLUe
X-Gm-Gg: AR+sD13UDUzMR6B0weQLyuSk69/jKmOzvuVioo55m2xCei0rD/lor2P+BlImZj337kI
	Gb9xaFmGIJzEE57qCNQqeeLx4qyytN4HzfHoWWkmifpaW+fLiu9xZafRf3bxxr1rWFdwdFCUSwa
	aGuWfCEehkp8Ra6I0ZNlnTJkJAN6aasQDu2/LcO+z3HDAkmDBdyuFs4fwjq4O/8sOOZTSk3ptT1
	AWTWDm7ehzLaRqBLq+xOdu/mv19fr0RYygZiYbHr2vnYVs6SpBlU2iJIO2TScbT6hXC83Sre4C/
	sd76g+Oj/UmgtGeVwkXYSDOu2pQoCJeqi9mfKI4UoDN2UWUN+6v7mHgHDU71th8NZDc8WzNzvwZ
	mFY6LP+kHPQ4KAA9sywy8We+QzFZvDScnl96TPria4LFxhoaxcqIUTaKsdH1PR3Oa1EB4sa2Za1
	/TiAXUjhmCqDh0oW4eF3Pw+JGpjO0hk9U1bKXpfS2VzmWmEiV2bcN2iD2FH0hd2gEzAdmDfkoyq
	eky39xfU5Djs/gYdg+qd5VibF2GLd3h3JLxiysxKWMf3wBbkLqiUlUnu00sPN5HFeBKwcenHPS6
	Kn2yrwSKYF1PCo9gbmmdc3hOAr7Co7+1USZW+HOD31ms5YFb3GEn+dexZBYMSbz0uDRe0O43WEv
	MGtAYfh+1qPdfo8lpG1YJ3/x7qqoPOtIn+B2K6h04y+qhUw==
X-Received: by 2002:a17:90b:3904:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3933b785b36mr510789a91.4.1786651839619;
        Thu, 13 Aug 2026 13:10:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 68/80] python3-stack-data: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:22 -0700
Message-ID: <20260813200834.1302829-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129012

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
 meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
index 9bf895e386..8adba7e8a4 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
@@ -9,6 +9,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9"
 
 RDEPENDS:${PN} = " \

