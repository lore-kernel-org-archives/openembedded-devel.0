Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8897.1792580523086905235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mz760Vor;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so564371a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580521; x=1793185321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOYWTB3zjC84K4RuwaWSFxrzsgwsoUwK6q42FPeHYLI=;
        b=mz760VorJcWkuQvI7V5XQNfrhbP/a/+9Yh8c3PI/TGUKWY9WN1TrmJUxsJ4tkRrsQi
         +EFFg0/PDr3cpkqJyqT9Yp0Y2S8lOnsuM4hgsSfsL/sjxf8Ex8Fb4NMXtaTPbWGuyD/3
         kJ6QXjlLg7UeZ7K8IW/8hGEhS79cmL1CtNS7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580521; x=1793185321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOYWTB3zjC84K4RuwaWSFxrzsgwsoUwK6q42FPeHYLI=;
        b=REgYRVvk/hZiTfvGUUluFFOOIOEKcrs4QDu3TTgzd6+B+faFUpt8ZkmUTFBp9+knWh
         wjMUEDvSDA9Lq0Q7qAuAq1vRG0PsxPNYO7qdocweRV5kBy7cVFx8VLLzB2pxwcU9nB5Q
         Bz3q2KoB5u+tr5J8hC4iL3igUjTNF0g23XhjMxxY1fpqUZlLPv9U+mucpHpikNJvLeVM
         O3SWCMBhI9EUtBRa3M/fPxWKDvgcJkbTiyL+IxIK6xEcaPuoIdbhCDhCKfclicCz/Ra3
         Co2AwvqpfD9861FlhdmUUDN68jriID12t+eCH1RRCYYQlUY6a1+Qg0adR10apC7eR9K4
         kEZA==
X-Gm-Message-State: AFq9FYJ3oQD6oZXfy7RGxxM9+deyKi9+hAAkyVaVAC9CcoezJZ1UBmtz
	b831fxtBUB9787Rb3QctEpBrSQm0k5nPq+69bNbI1TovWc9qIiv2GSWEhrZC+VeEIwHcKFJDrLC
	R5Gtz
X-Gm-Gg: AYBFou2OQJ9FtJA3rcdmFK2B1BymTFWdrKvMb/hX20KP+9SSTrtXP8rBjuZMWZPDM6+
	8DY2fFTmcC5ouBSYag6FgV24BrPaJDW4QZMevM2z3jJpxN618ZX7qc/7W1Z2SL0QgOJNyzFJdRs
	msDmwdqXw88sv01iKRD0JUQKRtXYEQ/MWNWRDUXtdlOgIcpkVFAlPUsHqeqRSDqEOq44E3cLtBy
	pToiSHASY/1Nl4LZdt8+jaR7GNp/612Vzh9/K9ERSeVZTvC5IgYLLGRrWmyNm74ZRxyZJmLH5Qc
	h+O1Dq3O11qWMkeXNVS6IxXQfAAc9D7EibORZQqT1cz19aR2/nR/OJi0Ilyh/3V7bAZ/F9xI2Nf
	mX9k81L53vk/GI8xDqerUa/+BG8jrU2Lqr8aS8vSS/JTIV138l0utiZ+3787H6CnNJrFF4Nt7W2
	r4rjph03owdhZmmuDA5LCWhxTFqrPU/kxdZHgvYnILbcEIxB2ppMbZuNsdMVx33+rRmSjrBUK17
	VyLXwqZT6JqvZPsBgSC3Fd8Hw67j90nheWID4azCPXsOr8WKE10bTCsypRMp1zDZUlI84g4D8kc
	387o9cPQagtAwnqDHIxgmwwAzMaN+CEefASLLKxWl7ykWJrBAQA8JxbwRgAv4ZfXFkJqz9DpzLa
	9HLDs
X-Received: by 2002:a05:6402:2499:b0:6b1:df89:7e1e with SMTP id 4fb4d7f45d1cf-6b408db0fc1mr1128806a12.1.1792580520296;
        Wed, 21 Oct 2026 04:02:00 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 32/36] python3-objgraph: Upgrade 3.6.2 -> 3.7.0
Date: Wed, 21 Oct 2026 14:00:56 +0300
Message-ID: <20261021110103.1943456-32-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131291
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.7.0:

- Add support for Python 3.14 and 3.15.
- Drop support for Python 3.7, 3.8, and 3.9.
- Fix get_leaking_objects with an objects argument to not ignore
  references from other sources.  Closes #82.
- Fix get_leaking_objects([]) causing an UnboundLocalError.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-objgraph_3.6.2.bb => python3-objgraph_3.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-objgraph_3.6.2.bb => python3-objgraph_3.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb b/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
index 045978a9c2..9ddfe97f53 100644
--- a/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e48a556235f55ad7d4234475657f68a7"
 
 SRC_URI:append = " file://run-ptest"
-SRC_URI[sha256sum] = "00b9f2f40f7422e3c7f45a61c4dafdaf81f03ff0649d6eaec866f01030e51ad8"
+SRC_URI[sha256sum] = "b6ef4b244217410509b257970413b01a979d54df48d2d4055b6941e8679ddbbb"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3

