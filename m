Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F593C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 12:31:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.17193.1753014698952957518
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UhMhPdYV;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so2942213e87.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753014696; x=1753619496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYskt0BzYqHJ2Uia+CxTJVoP/zqmWOGD33jh9Y3rnRA=;
        b=UhMhPdYVxnuNx6EBHnql7MWh29najIVHVcAYXwGGfsXX6KhZ6Ms0mpyKreJaOdYYr3
         eQ+gA+a6BLH3o/vxA0TmZY+fZ3TF1w898dLhMGWhAPU+4HuPiApWx2Ko28df8cSub4+G
         kHd/iSmZAG8wJ2xWlaXC3nC8BeCfpGtq9PDGONE6TcQNbxIF+vsDYNe9SMWr8aIoSKcO
         kZl/J9YAfkcGOiLmj3+PkYRdF67ywHksnmwBPcjG/UxJKDKFyb9YgxsAqS096zHOZHVa
         LIJUmlo3Aq6VsiuRSEKhETCBLps0yFiLCBnYKsTvxqRYTe2f2dDfoVKv3LroJ8pPmsLv
         qIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753014696; x=1753619496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYskt0BzYqHJ2Uia+CxTJVoP/zqmWOGD33jh9Y3rnRA=;
        b=hjhjS81it9PZdrlCcVGPbVtUcZW+k0leB6KRMBYkth4K0l8rGHJE7zJnvltRkERQqs
         Eh34iFssI07JNn6b6Dun+ou6O+90BcWDzocY1odpIx21luEMk25H+/BT0dBYbfqRNqXJ
         d8fMeJ3eBHgZyKP+cIH3UTov2BWJHdI3g8phWC6G0QT2CNE5/+MROd5N1OJ/lqTqjhKM
         e4plxz0Bei9HT3rkXZ/uXfTH0OAq9kxx47HG5MgNYuABwm9ZN63WJkEwwCHxGuUl7/FK
         OKEe1MKIGZfgO4rK2KUYE1MhdRBA7RAR5OCOLHy8N0ZEAYOIKaF4QlUb6HFxXqdB3enz
         QFrQ==
X-Gm-Message-State: AOJu0YzxgCNSUH8u+IQphhPT5UCRefszC9BDohU+ZljQpOommrf/r7/X
	CD5R7R1mWYQDvH7OUcIwb/vH94lwIzMDb8VMRvmgVNzSBP0d9UFoVtoiS6j2LQ==
X-Gm-Gg: ASbGncuUtkqhmOnUJ5Jdw1VSdYNHr/938ngzZ+fxkxM5UwCE4pPA05exuhVFXSnwi7x
	WwTa/+RE9ZMCH/Jn78BsOs97ibEQm8E+aEQAAhW/2OeZUIgalx5HOMw5K16mFuXzASUkRFtmr3T
	OBOXSW1c6po7o6vYPN1FeO96tC/htsXlFBjKVsn9HJ88Mr6XM8F58385F/Ct/avHbrh3aUzZ9ID
	os/7r+wTvoE01gb3OFfnJDNfMWZ8K89OLPJ+ubN8IZsaaOXlDM9JSvFJodG1kK1NZjPkQzZGYN7
	07cX7Q8/7OoNJfnpXFiiWYa2Krg3kGg9XkIQ/fr026hAkyfzI6RbghHzOoxERGdl36nEO295pCw
	WW9LQh/R43EoRw1/WOKZ00UdavsGxpcdG+9xBBQ==
X-Google-Smtp-Source: AGHT+IFIgxalb/E4ehrp5IE9fgQRjUK6UnVWxP2WaJK80bl9v+xd4/l+R+fZ2tIxZMH6mEbyD6og1w==
X-Received: by 2002:a05:6512:3093:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-55a233359a1mr4861404e87.23.1753014696049;
        Sun, 20 Jul 2025 05:31:36 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31da25c9sm1103851e87.178.2025.07.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:31:34 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] avro-c++: Fix build for 32-bit targets
Date: Sun, 20 Jul 2025 15:31:27 +0300
Message-ID: <20250720123127.25407-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 12:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118636

Building avro-c++ for 32-bit targets currently fails due to the following warnings being treated as errors:

- `useless-cast` in Symbol.cc
- `conversion` in FileStream.cc

These are promoted to errors because of `-Werror` in the project's build flags.

Fix:

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/parsing/Symbol.cc:91:27:
error: useless cast to type 'int' [-Werror=useless-cast]
91 | adj.push_back(static_cast(it - rs.begin()));
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1plus: all warnings being treated as errors

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:208:41:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t' {aka 'unsigned int'} may change value [-Werror=conversion]
208 | in_->seek(position - byteCount_ - available_);
| ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:209:22:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
{aka 'unsigned int'} may change value [-Werror=conversion]
209 | byteCount_ = position;
| ^~~~~~~~
cc1plus: all warnings being treated as errors

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/avro/avro-c++_1.12.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
index 726a861bc9..9032ff346d 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
@@ -26,4 +26,11 @@ do_configure:prepend() {
         cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
 }
 
+# Temporary workaround for 32-bit build failures due to -Werror:
+# 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
+#
+# A patch has been submitted upstream: https://github.com/apache/avro/pull/3433
+# Once this or an equivalent fix is merged and the recipe upgraded, this can be removed.
+CXXFLAGS:append = " -Wno-error=useless-cast -Wno-error=conversion"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


