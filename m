Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F4E10A62E4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49229.1774534347185885606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qJ+SJIZP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so11804285e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534345; x=1775139145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=qJ+SJIZPNnrdFTXcptaq/3a8PkdUxv6Fq4zZ5McX3P41/sfZzyAl/pcRBILwH/w6Pv
         n96Lik+XlFvL0bKw5SXh7kLKdepGlrjfiBEm2eh1H1PNMyZX6/skhfbku1TVDSMRRRDK
         kf7q8zZVEa1LoGCtjIlfwJlFjy7IiH4V4a7EoPM7rV+05ZErWiRPtmeTkOcg3L7XT9P+
         1mCI3ZbnFsuB5WTssVD9q/ZF4QFU9lL6QHsgFo9Lmm85kPMoxDD3JDQyWGXjIO98FsMB
         EAJ4jkCnta6G8gkbE1LweRHkzy3CKcZfQwdiZwGvNfn4/dXmYRI2CstATwq6f8cgoE61
         VfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534345; x=1775139145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=kUcep4HlQoR9GIAT1zcsWmsCRItENk+UiMDruTNOeDlEALdS8g14JDTdrN9m8P+VH7
         mHFjsLUEVe3C7h1FviMfPdh2hOYnZKEn1A/nrKOC/E1Gc5Wro3/4LKiLedhBmYOQiV6f
         xqwPJYrUupqv0zMXIpB5hccvdc8y1zA5ceO9N41xXbcLbInEJUZ4ZC8MRw2euh2ngLqg
         KaK9W5VAI7zjo1aSofZ5XvuKinDtV3BmZecmSXDpmZRn6GSRPkSy/Rbrtsa9vmQyRpHb
         aijcwk89fCVFU1ifos6gUAWknmDA+Lnt0U68KEgN4DQIyrHYFjuQn/OmhgMyfTsiEpiP
         5HlQ==
X-Gm-Message-State: AOJu0YyCopvce6EjGM8iKnEFp6Kp1aa1zS5olEsAaNmLyqaNVYbSZKxs
	O69FheWbq5Su7aN7ZQx2Mwmho45xQe0d4cxiIuLonw+APT9JasxPsVQw2my/Bw==
X-Gm-Gg: ATEYQzylWcrXNkgRirPeDVX/mVyYA3i1Y/XxyaFBo8cZuTT/zt67rpsfPN/ThZcX37v
	Acf6W9nqLra79FrtNE2NaEuGWYI8yUPOxFAq9gUkE8jLC4WJzSyReBqgMM1WrF3Fy/lWLSbEkRx
	l7eZ9uU1WYkGRb3emDDOghKXIHXS9ZlelE8fhI7XUyNDHAxxB94DLFAe32QHg5wvCq1kq5nyNXl
	++lgHc56HOIab+Ywou8pBJHtViV+fFdfHP3Bb0JWM00+wWM1cIrEvniXxiHulEBjuGdJY6boi1P
	KkJTlu62vIgjS2Hpg4CAXxaRyYAVL9U7qQt9G4L9WlRaTq0OnadvmCGDiKu2Ke891T5pe524MWz
	wvCv1lJZJjbSUUweABpb5ygbLgMupkmOqWz2EZhgsnoaVyUk8LqYrmPYP5pvCtGrGQA8oy70f32
	1M4L2yCd7AxWt91A==
X-Received: by 2002:a05:6000:60f:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43b8896cf00mr11914360f8f.2.1774534345257;
        Thu, 26 Mar 2026 07:12:25 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 09/12] lttng-tools: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:12:09 +0100
Message-ID: <20260326141213.2081121-10-zboszor@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125731

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..ef80c53e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -35,7 +35,7 @@ INSANE_SKIP:${PN}-ptest += "dev-deps"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-- 
2.53.0


