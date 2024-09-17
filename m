Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0061ECAC58D
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 15:54:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.24251.1726588446518540903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 08:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DpRqGs+6;
 spf=pass (domain: linaro.org, ip: 209.85.221.47, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-378f600e090so1432219f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726588444; x=1727193244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llKbWR0F7PirPe4usVnFCuIrrnFI5PsuiGaX7VTo5dQ=;
        b=DpRqGs+6q0N/AMWVYsdIQkFOsAN4pB1kg28KBFQKLr9/yp8JCYyHa8/ISEM+1yYzpZ
         ef3ypWfqeJOUpNF91c9YkJQPJfQcAmQdaO4XxGND9i/ZyKctCLxEk68Nb+xfFyrcnuoH
         pZgUJDsWQzZ/TI0TY/IjgY6Jn64CIMuMMH3e4/I0XOOTPxvDw8JAxfJAGI9vBarEx7Fh
         zcNJtjPc6RBKMSHsvj+jBY9iclBchpBrHfAneYWoW3cTB3XvskAVZz9x1k0WZHU15kbb
         GNKQaaPLdyhPtk6dSBcdDbDmbgJRwwoSBO9YsDyumwMeg6Ds3zkFa1bUuxIXaqcp5V3F
         fV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726588444; x=1727193244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llKbWR0F7PirPe4usVnFCuIrrnFI5PsuiGaX7VTo5dQ=;
        b=iPttiS3WWVCOmmypDbLFl6x3yPO6q4eowoT8daFipUtTWedd0t9f6vw/q4UDoQwOVf
         7Wf/a76aPs0uxzy85SjT5AFaq3Mha73O3I2IjTKODmxGT8/7vaK4zUP1MnnNk9LsliI9
         0kQ6xUS8RVXPjtueS7Q4bor9sFaN3kVGyhyrOU0f5jZ/obflv2RRSJbehLrhJCM2L/lI
         vpPBhDmnrJRiF5nyLdA4mE5L9xcPNV85BaJ7F9xqnkhDr95na3+SDbpm1lDXYShnHxrH
         Wb4b8xlsfeqDhbKny0s4CupwDEPaKcPm1+ASNooDOyOsfmGvBVoTDXL5Vd/Zj7QDLHgJ
         7uKw==
X-Gm-Message-State: AOJu0YzxTyQII36CYiCGJ0b6xhhWj4X6q5GKEOjzQ4XL5XP9QYskMK/X
	vx/TwaGIjSV6X49VY1lAwVLplleGYnYhtBRl+y/xLdTynDnzCrvudU8us/9OTAVAR16C/xz9LK/
	vLuY=
X-Google-Smtp-Source: AGHT+IHoB4SrlukmJHW7MgWGN9TlkNoI0dB6lczJGyiu2H+/GNdXcIMzjklwCnz4E+Tp4UrcHbtGyw==
X-Received: by 2002:adf:a456:0:b0:374:d259:647f with SMTP id ffacd0b85a97d-378c2d0529cmr11473307f8f.34.1726588444490;
        Tue, 17 Sep 2024 08:54:04 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71ed099sm9981329f8f.5.2024.09.17.08.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:54:03 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: steve@sakoman.com,
	Fathi Boudra <fathi.boudra@linaro.org>
Subject: [oe][scarthgap][PATCH 2/2] python3-django: upgrade 5.0.4 -> 5.0.9
Date: Tue, 17 Sep 2024 17:53:56 +0200
Message-ID: <20240917155356.203981-2-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240917155356.203981-1-fathi.boudra@linaro.org>
References: <20240917155356.203981-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 15:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112345

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
 .../python/{python3-django_5.0.4.bb => python3-django_5.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.4.bb => python3-django_5.0.9.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.4.bb b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.9.bb
index 3139ed468..60e9c592b 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "4bd01a8c830bb77a8a3b0e7d8b25b887e536ad17a81ba2dce5476135c73312bd"
+SRC_URI[sha256sum] = "6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.45.2


