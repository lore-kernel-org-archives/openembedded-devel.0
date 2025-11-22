Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC526CFC53D
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:22:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8927.1763817738867477709
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mto00UV6;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735b89501fso328784166b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817737; x=1764422537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0A5yeNFVP8uOme1+yEShHoaIUlhj4Y1R3fEZuZORI4=;
        b=mto00UV6WkQVxMecoaes3U/J2v2KoIA/vzPsUkkXipVSW9DKH/2UfG2/tJVOpcLINR
         ucwn6mYuNBfuuCS+MYbm1Q586+DMQ3MDct9KRxeidkwdcKZqe0ePTG0EPdtXfJ/P7F9A
         02WETek3EAjpE3xoobEN39t+eqr0/+BuduS/LR4Q6hcvRtTTwso6wl4AvAS/0RyLTzqH
         QPRscMcXQLre2/THxo4S1A0NW4N+GSOGtBtAzzUxtrYxiyOuquR5xp2u3PoVimrdDpAl
         OIea3aBc5pPHcXTeU7JmVsSepS0eci7KvnueRTIDUpRutuDZfDkMA2lDKyfTY3lTk2xX
         hMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817737; x=1764422537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0A5yeNFVP8uOme1+yEShHoaIUlhj4Y1R3fEZuZORI4=;
        b=v+e+9QpePOrGaJcTyrJN5hBFArfY2B2X5+DuC5q+g57oCRn2JZC2ac1fdSe5R8aawT
         tUUUcdoZoIel+/rvsitIlAJHkFdMBB3U7LckEcmZumdj+L5cWZ7RvhCBC87Fpl1rx8wP
         Gyj0C0nPINFajj8Lvq73MZg8/DvfFwVHd/dq3s1elVPuFxgQWhdJewvVr6gLBnlGclFI
         f6B5yr1P/IhpClT86rp8FQ90x9p3MyqfifdkZJmMzKLv5GVU9ExEJjbjGacaMCPm3RmL
         dPuV8JVJWZCclZRf8b4WSFwAYxQdaUULAKANJDTDDZOGXV+oG+ZR6MtFNgLu9gAkPqf2
         hEUQ==
X-Gm-Message-State: AOJu0Yw2nFTC9wjbJMbv9Gr+zFtdvqutF4PNr2DoubTjFkbBijgIlgkf
	7ot+JJHO2lZDnz16to51stg/n/rO3VqpqKvN/S+Ks4KrcB4epygcN0MYq4DLeQ==
X-Gm-Gg: ASbGncso1lj6BES0FqPLDv/kAzhefwiJlqHkc6K9lDnuV+jjrCPpt13FGPBrU0cFBfZ
	H6Iq87wHJGnIZoGOLvlgtJf/LdjHkjrLdWp9NuKWSykYEkA6U6LonIwWE5BBG7OUgWmkr50GxGf
	HMqO5Aw3GVHVFpa4jfgtqP5bzMPviDtaKXEr8yX8nYpX062Bje10tO0UBwM6FRXR//2oLzLhKEc
	i8Ew1sy/Qhb5aFQAQ1X1LX139j2uOXMdjcGDTX4iYQTNe0KS+O8N7giexTj6bID+lbg0I1xu1T2
	uM8Yba6OsRdqO0bhfIAVxeEUFCE+zjstZUlSkZ8ktYFWHYs/I+ia3fMeahj5HqH1wsVLWkBvgYA
	xt1cBoIgMLyLjE8HZxc1AIQ8cnJ/Q7rYXD1ysi+uPDJ/lraJMgdujsVSXbdQ0knMnhKPy0gEqba
	cntjzGcRFcgQR9qauEZf9W2KQN6e+lT0xHA2nIzCZKCg069qbApS7jAMNxhwyO0bqjaB+xngEci
	+h1lE0hwY0oZbgI1bUbcpz+
X-Google-Smtp-Source: AGHT+IFgDWCqlafVOqY2VgAe4v3owlFfPsRoIX0+NZtUkRJYSuuI4iTIRVtjhai6KqngTtKwTrlo7A==
X-Received: by 2002:a17:906:dc89:b0:b73:6b85:1a9a with SMTP id a640c23a62f3a-b7671591ebemr623976966b.21.1763817736613;
        Sat, 22 Nov 2025 05:22:16 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43a6sm705844666b.32.2025.11.22.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 05:22:15 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 5/5] ptest-packagelists-meta-python.inc: sort packages alphabetically
Date: Sat, 22 Nov 2025 14:22:00 +0100
Message-ID: <20251122132159.1774324-6-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
References: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121977

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index d2794d5df1..2a254ec470 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -8,8 +8,8 @@
 # ptests which take less than ~30s each
 PTESTS_FAST_META_PYTHON = "\
     python3-a2wsgi \
-    python3-appdirs \
     python3-ansicolors \
+    python3-appdirs \
     python3-asgiref \
     python3-aspectlib \
     python3-betamax \
@@ -18,11 +18,11 @@ PTESTS_FAST_META_PYTHON = "\
     python3-breathe \
     python3-cachetools \
     python3-cbor2 \
-    python3-configobj \
     python3-click \
+    python3-configobj \
     python3-dasbus \
-    python3-dominate \
     python3-dnspython \
+    python3-dominate \
     python3-evdev \
     python3-execnet \
     python3-fastjsonschema \
@@ -62,16 +62,15 @@ PTESTS_FAST_META_PYTHON = "\
     python3-precise-runner \
     python3-prettytable \
     python3-propcache \
-    python3-pyais \
-    python3-pydantic \
-    python3-pydantic-core \
-    python3-pylint \
-    python3-python-dotenv \
-    python3-python-multipart \
     python3-ptyprocess \
     python3-py-cpuinfo \
+    python3-pyais \
     python3-pyasn1-modules \
     python3-pyasyncore \
+    python3-pydantic \
+    python3-pydantic-core \
+    python3-pydbus \
+    python3-pylint \
     python3-pyroute2 \
     python3-pyserial \
     python3-pytest-httpx \
@@ -79,9 +78,10 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pytest-picked \
     python3-pytest-retry \
     python3-pytest-sugar \
+    python3-python-dotenv \
+    python3-python-multipart \
     python3-pytoml \
     python3-pyyaml-include \
-    python3-pydbus \
     python3-pyzmq \
     python3-pyzstd \
     python3-rapidjson \
@@ -104,9 +104,9 @@ PTESTS_FAST_META_PYTHON = "\
     python3-typeguard \
     python3-typing-inspection \
     python3-tzdata \
+    python3-u-msgpack-python \
     python3-uinput \
     python3-ujson \
-    python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
     python3-validators \
-- 
2.43.0


