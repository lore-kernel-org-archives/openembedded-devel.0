Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73DEFA3735
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 09:20:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.69485.1726219231350356458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 02:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sV3I9iQN;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c1963cb6so1318090f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726219229; x=1726824029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5K/U0GeTUZ36MnLciKPgjC+4Tspjcsu+PTpZ9YUUedE=;
        b=sV3I9iQNjxuNuA1P3VDHrVrDfew5bNo+WSLOF1xfapUvDkFlxU/q70r+ZSlJuFtCFy
         4kKwr4Yw6RpDM00u/AdKlaHgJPI8cF/MVopSJvARixfnfKHZNEs6DZZGp3H+T5adqyJS
         UPmkocVwhhC8oi58RXVq6CD+uk5HtZ/WewkJc9U5Hg9KfYCHl4JVWK4ncTaOvubnredZ
         U+QZe6qoUttcoJfqrGZuE/IZdHGik4fhLT02DIvLrZY+gdCFPMS+lSIQO6EJ5NYTZf36
         Di3MSSpAj7VhTlumJ66/7UjwEy7J8fJkQL46svnR5v4zp6mjbKCEH1IaEUgC7gGwbWOz
         avUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726219229; x=1726824029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K/U0GeTUZ36MnLciKPgjC+4Tspjcsu+PTpZ9YUUedE=;
        b=gGhiVbYGv62bFxMWayibXZkge9Q5T0hqZIK02/Ros2wtHJtS5U5wL4NbHnVY096EK4
         vfwmw2rGthBvxoIjesnDjqmAZQqEC8YXNz20utwaUPqEqYm8fmXoCFbcJ9FE5WWdiKcq
         BEd70+Tu1qjeas08KQ+zcBOsJh2x7EcqhrDYkDJuM5DH55irJ5NICMAKTY7FHkySbLWw
         YLkpy8OL1tr9u0wPEpM0S1gAPY/TEQq9+YJ+5xcj9utxEALOoC/SEcy9cdSppAr4B0nj
         E2xsNW1GqXv3fxC5EGAwXDcptAWzbILKmNIAhwamAFFVdZVvo5MBGqEbOb4MUkuwzmXM
         R21w==
X-Gm-Message-State: AOJu0YzPtgO8QoxUBlboxjsJpudgrdGNjMV+YWTNGTIRbplTvVGwKc1o
	Y1zoPfcpLqCGpJv7C0/DfdrdAtb+GqH/dGwnmiCd72R3MkvWFFLLUw1N9pl/XxokFuZ9vLUhSYM
	Mro0=
X-Google-Smtp-Source: AGHT+IE40TFJM9rdBRbi28qmlnDZUDH0bOQ4RAngaG8ao4G3R0RL4OdOANJmakJV07ZybSjZCsTbHQ==
X-Received: by 2002:adf:8bd3:0:b0:374:c1c5:859e with SMTP id ffacd0b85a97d-378c2d5b2d7mr3034009f8f.42.1726219228902;
        Fri, 13 Sep 2024 02:20:28 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895665632sm16197129f8f.37.2024.09.13.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 02:20:28 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][PATCH] python3-django: upgrade 4.2.11 -> 4.2.16
Date: Fri, 13 Sep 2024 11:20:14 +0200
Message-ID: <20240913092014.1730695-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 09:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112271

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


