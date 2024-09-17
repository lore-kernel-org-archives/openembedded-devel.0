Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED4CAC58C
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 15:54:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.24250.1726588445398462992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 08:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ljjxhzgc;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso50085805e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726588443; x=1727193243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aY1UTHnErk4lmiiPqCRbyDTSffcWAoVU/we4Z3pmd08=;
        b=ljjxhzgczdBjuWCQYAUBsrm/Ntt3WFQMDx8WpeoaiX/JkdmxlWjAZ05AsEfK5ykhTr
         ym0Z57JBsyWv7b+SCF6ZK9mcv6KKyFZyjXL27ZbI3kPjHcHlIv5OzIpKYzCph2WWm1M7
         ZWXj9jZfEf78tNWRgRzdlY9cCfQuH9uMGqR2wK73yaQ+ZW3CYwIv/3uLLM3XSFGPWuHr
         5S3tOPFPpsvyZaYEQGcFBS1PMQARkXmZ0Gff/FBqHtA+IvTCHpSrjDqOkgKbz6G2Vw86
         vDv60DA8PofXE0CT3byapcd+62NX2ttoq10+KV/XitcqaCTbSKULcPXKpVxDBEWKiqBi
         DEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726588443; x=1727193243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aY1UTHnErk4lmiiPqCRbyDTSffcWAoVU/we4Z3pmd08=;
        b=DWaye8fAJ+y73j1r6cpGrUPqb8ByztuCw5eeSOzJs6h8+aT9pIT2yRBoWmbBTnrym7
         oKaqF/mHtRRBTCmYMhGn0arU2l3i9sTgEoESusDGEMUu8SpYFKLWu7xTawlWa5dv3U3l
         TeSnetcOmTtbQ9uWtpRES6i4Y5j6RkqPm+uwEoJLh34I/UWfXcSmBoEHzLG4ydVzUdZy
         CmbfWAFgVh0Lwr6dLxxuAk6vugHvuKLgQNqXjc4aZSm46HiU73kvDJOKs0yEk1Ay8NRk
         4CKYJp1FnT6+xFfp/dyYfDzjdQ3XjigzYlLrfYexycOt1AzLtS3TTwK470AXNIpkU0L/
         Y01g==
X-Gm-Message-State: AOJu0YxxuKCa7tR7hyEagWOEmJKvBSWVlxjufys7k5ia+V+C5DQ90yWG
	fWWxRMbdO+uf3kJ/s+FETt2+XY3ArvmkTiW/AqfmEOXsuMLSUn3dhrQMFh8FB+f8bKnOSJN+SSo
	CpKA=
X-Google-Smtp-Source: AGHT+IEGXiBFrjW6QQ5EKVxHJknYXBsHzagZ/XrqACLb1jPNktj7JVSSqFnQEwhRWCszSkmEAGsP1g==
X-Received: by 2002:a05:600c:45cc:b0:42c:bfd6:9d4d with SMTP id 5b1f17b1804b1-42cdb4e6aafmr140981165e9.2.1726588443323;
        Tue, 17 Sep 2024 08:54:03 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71ed099sm9981329f8f.5.2024.09.17.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:54:02 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: steve@sakoman.com,
	Fathi Boudra <fathi.boudra@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][scarthgap][PATCH 1/2] python3-django: upgrade 4.2.11 -> 4.2.16
Date: Tue, 17 Sep 2024 17:53:55 +0200
Message-ID: <20240917155356.203981-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 15:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112344

CVE-2024-45230: Potential denial-of-service vulnerability in
django.utils.html.urlize()
urlize and urlizetrunc were subject to a potential denial-of-service attack
via very large inputs with a specific sequence of characters.

CVE-2024-45231: Potential user email enumeration via response status on
password reset
Due to unhandled email sending failures, the
django.contrib.auth.forms.PasswordResetForm class allowed remote attackers to
enumerate user emails by issuing password reset requests and observing the
outcomes.
To mitigate this risk, exceptions occurring during password reset email
sending are now handled and logged using the django.contrib.auth logger.

CVE-2024-41989: Memory exhaustion in django.utils.numberformat.floatformat()
The floatformat template filter is subject to significant memory consumption
when given a string representation of a number in scientific notation with
a large exponent.

CVE-2024-41990: Potential denial-of-service in django.utils.html.urlize()
The urlize() and urlizetrunc() template filters are subject to a potential
denial-of-service attack via very large inputs with a specific sequence of
characters.

CVE-2024-41991: Potential denial-of-service vulnerability in
django.utils.html.urlize() and AdminURLFieldWidget
The urlize and urlizetrunc template filters, and the AdminURLFieldWidget widget,
are subject to a potential denial-of-service attack via certain inputs with
a very large number of Unicode characters.

CVE-2024-42005: Potential SQL injection in QuerySet.values() and values_list()
QuerySet.values() and values_list() methods on models with a JSONField are
subject to SQL injection in column aliases via a crafted JSON object key as
a passed *arg.

CVE-2024-38875: Potential denial-of-service in django.utils.html.urlize()
urlize() and urlizetrunc() were subject to a potential denial-of-service
attack via certain inputs with a very large number of brackets.

CVE-2024-39329: Username enumeration through timing difference for users with
unusable passwords
The django.contrib.auth.backends.ModelBackend.authenticate() method allowed
remote attackers to enumerate users via a timing attack involving login
requests for users with unusable passwords.

CVE-2024-39330: Potential directory-traversal in
django.core.files.storage.Storage.save()
Derived classes of the django.core.files.storage.Storage base class which
override generate_filename() without replicating the file path validations
existing in the parent class, allowed for potential directory-traversal via
certain inputs when calling save().
Built-in Storage sub-classes were not affected by this vulnerability.

CVE-2024-39614: Potential denial-of-service in
django.utils.translation.get_supported_language_variant()
get_supported_language_variant() was subject to a potential denial-of-service
attack when used with very long strings containing specific characters.
To mitigate this vulnerability, the language code provided to
get_supported_language_variant() is now parsed up to a maximum length of
500 characters.

Fixed a crash in Django 4.2 when validating email max line lengths with content
decoded using the surrogateescape error handling scheme (#35361)

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-django_4.2.11.bb => python3-django_4.2.16.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.11.bb => python3-django_4.2.16.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.11.bb b/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-django_4.2.11.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.16.bb
index 0642b7e7c..9254e8b00 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "6e6ff3db2d8dd0c986b4eec8554c8e4f919b5c1ff62a5b4390c17aff2ed6e5c4"
+SRC_URI[sha256sum] = "6f1616c2786c408ce86ab7e10f792b8f15742f7b7b7460243929cb371e7f1dad"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.11" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.16" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.45.2


