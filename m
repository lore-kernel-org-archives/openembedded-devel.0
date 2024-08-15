Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2680C5320D
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.116212.1723697130751225233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltCJhyuv;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5d5b1e33fa8so345770eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697130; x=1724301930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sixEQj2tNTvQcGs9bJDpii0NMthUt6E5ZGzEVDXnTSs=;
        b=ltCJhyuv+/By0FQW0NaFsDmXFyrTDOwSdp+Or6KaJY4nzt2UjuZtOW6MXopCX+kAyc
         GhddTM6kR/TLEMMRLz2lU0SWoenMx4bCxUZHaBVp4Y0fQ2+3Ny7187UUKECtGWFrWHhC
         7h+VOhMt+IE0TNspuo9WbLcSoEmPQck+0jUJKIHfIKFVG1i9ckw533EpXDypoV4HKBy7
         LbdJdEicmhITb4CCJFeMZn7pC7B4ezTjNqE9uoOpbFhtY/Uh5nv9E0gpJ5h6VHug00ag
         fNdPf/Ad8ifkCql91nWVfMFvmItT7RrrKos4jiuzLYwTpixF3bTNlfk2zAztnqRiIGdM
         dXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697130; x=1724301930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sixEQj2tNTvQcGs9bJDpii0NMthUt6E5ZGzEVDXnTSs=;
        b=YHVIgjmEhr8jfa4lwJAWIK6FqzpXB9YxyOmfKGx3XwTKEap5se9ZBVhIgcXlpQDU1Y
         QWwUUP6aEPG7TpY3l3P/yy6DIBxrgnKpcwwpgJJ6MSgqGeTSsHPByA7kdvhRRmyovE8B
         Ko1nHbUvHs8IvXtDk5oZHKhZJO9nElpLp1Y6smwStqUXpZRxp9xWp3lqlXkq+jBM2HGY
         rLSj7Luh3YueRWnlaRd3euxJ5u41O7ZJKnZXSxp7xJAwZ/IBtMRXjSyt9I1356Gvlif+
         6txTHE039VfqboaQu6ijW13MnOIcO/KVMRH1kwaeqxgGcrZwG0LBfOo8RVXy55M3Vtek
         2emw==
X-Gm-Message-State: AOJu0YxtHB9r3zv7IYhWVbPZCVh1iWgZr24aWWpCpfDOzbOTL0ZeI8k2
	LFsJiHGZwC1OerdbfTYKmYkr+GoppxU9ZYcs7z8au/SE1MuL1T5GiZOjDQ==
X-Google-Smtp-Source: AGHT+IFvQvZfNlvgf0MCVdl9QOXvV4aydWxjFgp7jHyWz/pOpdM6Y5mjfFNWGGoyLgwghPK2M2kMdw==
X-Received: by 2002:a05:6820:1c8d:b0:5d6:c77:fb85 with SMTP id 006d021491bc7-5da7c47f6dbmr6456265eaf.0.1723697129825;
        Wed, 14 Aug 2024 21:45:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/9] transmission: Upgrade to 4.0.6 release
Date: Wed, 14 Aug 2024 21:45:16 -0700
Message-ID: <20240815044523.1030831-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111810

Use external libpsl, this also avoids hardcoded buildpaths which
gets into binaries due to inplace vendored libpsl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{transmission_4.0.5.bb => transmission_4.0.6.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.0.5.bb => transmission_4.0.6.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index b9ed3d925d..7b68cb0613 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://transmissionbt.com/"
 LICENSE = "MIT & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ba8199e739948e198310093de27175fa"
 
-DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
+DEPENDS = "curl libevent libpsl gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
@@ -12,8 +12,8 @@ SRC_URI = " \
 	file://transmission-daemon \
 "
 
-# Transmission release 4.0.5
-SRCREV = "a6fe2a64aa7eca089f96006cf082a12f0cde937f"
+# Transmission release 4.0.6
+SRCREV = "38c164933e9f77c110b48fe745861c3b98e3d83e"
 
 S = "${WORKDIR}/git"
 

