Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAFCCFD2F5
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:55:29 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7054.1728636919461521050
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m0bPuO/q;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c920611a86so2339638a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728636918; x=1729241718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl6594XtkGlkdB3PY6zeTNNhxKX1QdgsT5ZS36bVDe0=;
        b=m0bPuO/qCRVhCttij66mL+38pkLnn4rqzotQrQ0CuowwTvForZH8nsIiIeFGF4bf+D
         ujglDCFrv8ewMlPBMEniHZrOA2oBlE0bQ9k23//Vbd814AVby0GFu2YvmUyRg49S4EQE
         AO2W8Dtl9/b9gTwY3EU0zksjRubTrt/s+i2hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636918; x=1729241718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl6594XtkGlkdB3PY6zeTNNhxKX1QdgsT5ZS36bVDe0=;
        b=VfG1wh2VxeNs+hlqVW/9WDhuw+jOL/eRHXPg6i1Z6eE38PkUBey7yn6aqPvZVkTGPA
         /UJbhV0VgynuH7yUKfFmJOTMtXPD9rWqmKnVuwR2ZHbUAIRxO6YVmRHx7TjB3LDNf4zF
         J9gzPYZ8vakeLx0/6iyChBE7ApNT4lVp83T41u+MYsy3lVlskuQswK8AqsbHJpAhyC+q
         EZzzzSDeFdyYvT2pGZliKHbLRRJI1Gjs4boltZvIt7qrzBteUGsZMlL86fVQa3NPMgqW
         ultxhDAxe1F5eRk854iMa1szLc0Gsm/Ju7etPsl0GsAYlWDNFn/VogEas/gN0Z89s4zN
         uAlg==
X-Gm-Message-State: AOJu0YzdWnjTDMO7ixS4rIbWRYNUACJUE7Le9n8HwT5vmQjSaJn3MpAG
	6VBP2xwR2jQjrqvLMALI2MicWgANCco9KsC8pUpgaY4ZLaGWOug+P18KRh0EHF67uT+YE5t5puX
	Y
X-Google-Smtp-Source: AGHT+IHrSrpbRulFkwkv1ZntFbKpGzUDecJ/8474luaAbfOTXmW3EPAYH22wXzfxoRau+Y8GNQiv0Q==
X-Received: by 2002:a05:6402:4308:b0:5c5:c4b1:883c with SMTP id 4fb4d7f45d1cf-5c948c809c9mr1099274a12.4.1728636916913;
        Fri, 11 Oct 2024 01:55:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm1713866a12.47.2024.10.11.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 01:55:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-dnspython: Upgrade 2.6.1 -> 2.7.0
Date: Fri, 11 Oct 2024 11:55:06 +0300
Message-Id: <20241011085507.3722721-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011085507.3722721-1-leon.anavi@konsulko.com>
References: <20241011085507.3722721-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112793

Upgrade to release 2.7.0:

- dns.query.https() and dns.asyncquery.https() now support HTTP/3
  and the http_version parameter may be used to specify which
  version to use.
- If the cryptography module is installed, then dnspython will now
  create deterministic ECDSA signatures by default. Cryptography,
  if installed, must be at least version 43. Thanks to Jakob
  Schlyter for adding the feature.
- The RESINFO and WALLET RdataTypes are now supported.
- The COOKIE and Report-Channel EDNS0 options are now supported.
- All supported RdataTypes can now be imported at a single time
  rather than lazily on first use by calling
  dns.rdata.load_all_types().
- The SVCB and HTTPS records now support the ohttp parameter.
- xfr() and inbound_xfr() now share a common implementation.
- Tokens are now supported for QUIC and HTTP/3.
- dns.message.from_wire() now saves the input wire format in the
  Message's "wire" attribute. Likewise,
  dns.message.Message.to_wire() now records the generated wire
  format in that attribute.
- The dns.message.Message object now has a get_options() helper to
  retrieve EDNS0 options of a specified type, and an
  extended_errors() helper to retrieve the list of EDE options in a
  message (if any).
- dns.message.make_response() now has a copy mode which controls
  how sections are copied. By default, a copy mode appropriate for
  the opcode is used. This is currently
  dns.message.CopyMode.QUESTION for all opcodes.
- If an IP address is used as the hostname in a URL, the https
  query code now passes the sni_hostname to httpx as this is
  required to get httpx to validate the certificate and check for
  an IP subject alternative name.
- The minimum supported aioquic version is now 1.0.0.
- The minimum supported Python version is now 3.9.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dnspython_2.6.1.bb => python3-dnspython_2.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.6.1.bb => python3-dnspython_2.7.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
index 13e31afe7..e9ca31c3a 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc"
+SRC_URI[sha256sum] = "ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1"
 
 inherit pypi python_hatchling ptest
 
-- 
2.39.5


