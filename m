Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A28C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:10:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.47442.1739182230806302661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U/iAxU/v;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7c14b880dso147286566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739182229; x=1739787029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz3hFOZa6UF/iIL7NUOJrCIb4b4c08WORQ3kJ7pCC0g=;
        b=U/iAxU/vuAfpW6HEsUF+QlSYHN2DH+Fh5j0QvRu7+GumJLXXTJFo1kmiJDk20plyPl
         /+nBeAIR8l41Tm25qTpMI31Lih64CZUJKPuckw4mbsSFJGy8qOhc4+psqtSjXYF8qYSK
         /XHmMk6GiXK4ri/Ed3TuiQTLcsN9jaOs3CVmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182229; x=1739787029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz3hFOZa6UF/iIL7NUOJrCIb4b4c08WORQ3kJ7pCC0g=;
        b=II2fRAPvJfRQbfHo/N6EGZ3kTOL1jpCpe0wne4u+rXh8F5sVMlHo1QlH07MjlR34A9
         0CNjzIYqIZ5gkdNcMvUZNgOGL/ujAWNJTZzka0M55oeMcwvHyWdv5v1NfOTnr56jRxa9
         26JXBACpYcOpYELCvfJiGjKHsQPuxBRKQcJk5IT5Uv+TCmJiCA4I0O+RxxUglv8KkprK
         7AVaEjeVFKTUEwNvyy5a8EdwFUDeWiio01rO06gHU4EOR3Jpv/kPWV/6fo4KztJt4cHI
         D4dLoDQJCGcnjsn5KPg3KSOeK6HtEdFev6R7kP3vDLezdd5I6ZgafpoQd4s+SMGgQ1e2
         JKUA==
X-Gm-Message-State: AOJu0YwCP/1oJbnvyzmNfw+2ZQgbGDmXLJ2MllvraufQcdCQtReaIwtu
	yQ8tq6oUe/ZReYPOnFl+XrDiPRiZZSzKbZvSoSJ3V7kDJiEXzu0UYQaRQEEt7AVHLdKeUOs1hUp
	Y
X-Gm-Gg: ASbGncuHGBaGbwxtLGPAmT7qqzgN9JexnXfs7bXep5HRmBXWt61tlhSd4Z/ScKUKEGr
	GkQ5nxrbdd06OlyadXNVAHggiW+G0elGSSJk5Fv+gdLSwT59vsY38mos2o14Yy5E7jLRCBVRE9t
	MPn3LPvDCxaxcaZ6GftBt/Uze+LizIofzBEI5Z+GTltHruH2q2/449hOdfvDs/5gaY7yXESe+np
	PR/ikNNJa1Zpd7DXkl5YxQAYTuEhbzc/zaJdj0Q2UuTxbDXTYrKxOVsmf6nd3PLpBNlvYQCIiwc
	drNSo67tWb9zjcPXgmlv76mc2ZUKAA==
X-Google-Smtp-Source: AGHT+IF0gpiHi6faOJY1GiDbV/0KAX2tAZ7WwqNrUjQEtKWChkrD6nWz6uiyFcFZ3YpOmjvfeR4RJQ==
X-Received: by 2002:a17:907:980d:b0:ab6:b9c0:1ea2 with SMTP id a640c23a62f3a-ab789b1f985mr1253187766b.25.1739182228928;
        Mon, 10 Feb 2025 02:10:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm242747066b.140.2025.02.10.02.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:10:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-semver: Upgrade 3.0.2 -> 3.0.4
Date: Mon, 10 Feb 2025 12:10:23 +0200
Message-Id: <20250210101023.1204349-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210101023.1204349-1-leon.anavi@konsulko.com>
References: <20250210101023.1204349-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115398

Upgrade to release 3.0.4:

- Re-enable Trove license identifier
- Fix source dist file

License-Update: Replaced organization placeholder in LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-semver_3.0.2.bb => python3-semver_3.0.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.0.2.bb => python3-semver_3.0.4.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.4.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.0.4.bb
index b329d65e1f..acac3bf3ca 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.4.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python module for Semantic Versioning"
 HOMEPAGE = "https://github.com/python-semver/python-semver"
 BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d9da679db3bdce30a1b4328d5c474f98"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc"
+SRC_URI[sha256sum] = "afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.39.5


