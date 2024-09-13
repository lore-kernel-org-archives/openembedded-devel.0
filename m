Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87783FA3737
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 09:23:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.69444.1726219389556481951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 02:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mD7pf2yW;
 spf=pass (domain: linaro.org, ip: 209.85.128.51, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so15387065e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726219388; x=1726824188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nko5nGz0Iva967SKiD36xlrKgaZjqAawNSGX73dsKgI=;
        b=mD7pf2yWjBp4uCZqKulUkuWv5o4OUkdsAPJGGJSNo5IkjyfLwKdP9i24Cx3mhZmaMW
         8zj4ssatRc1tLTOTb8gJIiV2avWi8dtRC0RDhsYo95rni5ttiItFu54jV9WcwWCpKLXz
         VjyusdKHTV4AqLeUFkDIvD/JmauruOym5QlCzsuyjLLRjf64tmTUTXaClXiDcrDik2wW
         lm1tOOsQnD49EPjvsYUCJgOm/ymi4XFrqiQyRLOPnkKlMaE/BpWtlEQ3dte2njjI/XAV
         o3t5RQZ8Qq6I0xZliP4b0kwIIEKRJpvN4HxHK8qkD7xWKPzEPoSnqBIhuGNJthR55e8h
         p9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726219388; x=1726824188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nko5nGz0Iva967SKiD36xlrKgaZjqAawNSGX73dsKgI=;
        b=TlWfDinOrYydNGnBcXJFuYViyMq5nMdifPm/L4K6sAO0UI5O9aco2gPtwP6xRIhT7C
         21RKDq2H6j0cSdliQ6pYNbyrISVDzbXTEG48fXUx2SqvhxFKyz0eWtCq6vas7m28Hc1f
         lpsOKoEq2OdMaG3cu+Z/jvw6PC7twJy4kr6IOXC6CcDRGWnnsD7UnhVVrWqw3XmBL/8m
         Bj9tHwsw/LVm9e2COai3pBHqGNPq318kh0WmChXsZeNZbDUFIhsVT9A3ZMU+brXdM4zx
         Guciaw95YBAQdfPs6FZARz+fDz4BKJ4jGxxHwOmE1P6qTHYgB/57GIn0qvD0j+nw254S
         xycg==
X-Gm-Message-State: AOJu0Yxg0xsiSEByJ/D15PWdEjSjm0VQS6rD5U09OAU9Xq1HGAd0vnZp
	OrjF/YvIQTxhAmzhoxK+FW+r3zrqeQVRCY+dPGpw9+bGX5LQLBdiIZi99j6ZbgtDdLi/s+M+aYc
	M2ZI=
X-Google-Smtp-Source: AGHT+IHTOq5ae8Dcr4ya2uXpzj9nFMlNiziv/4UNY8bnGd612g+qaQHTZ0MTibajLxeUO18s/kNiKA==
X-Received: by 2002:a05:600c:4f51:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-42cdb487cfemr43368295e9.0.1726219387477;
        Fri, 13 Sep 2024 02:23:07 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05a67fsm17773365e9.2.2024.09.13.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 02:23:06 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [oe][meta-python][PATCH] python3-django: upgrade 5.0.6 -> 5.0.9
Date: Fri, 13 Sep 2024 11:23:04 +0200
Message-ID: <20240913092304.1760666-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 09:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112272

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

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../python/{python3-django_5.0.6.bb => python3-django_5.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.6.bb => python3-django_5.0.9.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.0.6.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.9.bb
index 513032876..b3fb301ed 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
+SRC_URI[sha256sum] = "6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.45.2


