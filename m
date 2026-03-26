Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BD210A62E4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48358.1774534354626126105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mh5EpWpy;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439bcec8613so716046f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534353; x=1775139153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=Mh5EpWpy6pdtAvYLHOe6JGCLcCFwqfn1N8Z5tzieJmmUrkMIl8RHE2MqU8b80D3MLU
         pdoS0J0ch8/aGedKym3PGTN9Dtl8WgFDtJYsMbp1QRytX6gLQkrYLAE0+c8Qxr0OyWmF
         EX3H8IjY8pS/EQB9GiiOr4Hlx4TGb7eTKdrovMbdkzvkuKU9pMhbQVGC7kzjZdA73PZJ
         jcgzTR7+TXG8hNn/3s0vgiqP2lSzYObENEb9zD60xk53T8w3v3uS1+5DGkAgtQNdEV7d
         0kjSNdsPbkFYwUeqC1tirZ/CCbzmGhIBV0wvHyWEfFIGQUtqUgUMYjeg6Dl741gXUwVg
         JSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534353; x=1775139153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=BCFJVKMhpgJVCY8PgWDs88847vgkowXGYSLmKHcPO7P8PKH2gt8BahdQI0QKuDjOCk
         I2cAhrKME9s6sNJCGmzM4JJMDH+N5rFEwfg/rnMqov2w0o+EvvnBv9SgrJYfB8hKKWw+
         An2wC/b9H7gsfrYGnc8fMyxzMp5hOYto3+8eWKVjGWUKhczgsrixuathVHesMBqImmNv
         vcgcPqalO5DRX0FLoD/qMd++27xQbPQMZnJc03kR0Lby+2F7tvKVF8N0PhwjzvQAafHw
         cYehBnJoWeKfxx7/TcN5WHi8u/QU9qUBdtaOS13KSv32zo8N2J/To7nxAqWitF54E+la
         RX6Q==
X-Gm-Message-State: AOJu0YzmgGqhhzD74BWoSkG+KfGqr9iSKH/1cw5pXoqzDnEpW2Qclrad
	cwZJmkMbO9esdOHc2KduT1i42KgxfotRsKJgzPCOGlQoEuOF72hS8+LRuY70zQ==
X-Gm-Gg: ATEYQzzSl/Ip0NfgRjfuMC+jbUOvfzvelZXQa6bu4TWt9jj2OfaIqJIVLltOy/MPfwP
	YOHE5RJjB0rsZQmnE9WJ585rdXpIKxP24sGC6Oko8kW9MyKQxJ8ZY9T0fg5esTLVPP++ZiFY/av
	D63rJ6KDz9smE5uoTVYnuOIJmB0OS66HYEZOxfQdlHcOBTHPG+ytC9PMKguVxSWfEKuSZUHjJpO
	SYAXxDj8hK9XnQJbJ5uVaFdHpmjPpacWEHRa/UNnAnGm3CenRRQJRGRq0im3+b2QrIUnRY1X9JO
	C9i39l+Gxzhy8rcNlTmR8eiJRB/bRXuAc7ANVrJkl2Bs1jfHLPBO3avZjteHrHqar2sYdHtW+ou
	3/sWfi4GsujJi3AL4a0SrsgazuechHjbpSYM3AJuHYyewKylyOgwY2JEW9YPa5ny2HMQWNaFwY2
	dJgl92y0fsQKCuEQ==
X-Received: by 2002:a05:6000:2f86:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b88a0509emr12457661f8f.31.1774534346719;
        Thu, 26 Mar 2026 07:12:26 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 10/12] lttng-ust: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:12:10 +0100
Message-ID: <20260326141213.2081121-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125734

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..5c1c74b7a8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 
 inherit autotools lib_package manpages python3native pkgconfig
-- 
2.53.0


