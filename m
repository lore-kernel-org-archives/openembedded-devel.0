Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.707.1794955426986310440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MMPNHy71;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so152222f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955425; x=1795560225; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqGZCJS3ikiVuMJtsyr4npvqbpny3ZEL5e7cOqsO3vw=;
        b=MMPNHy71CC4ZbuvWIMX3zxreqyYR3DeI9ddnXZ+nY2kLz4exRTBH9L2h38NVBNOk/3
         hj9Fdog1kKoK35dbsa0vVgSok14wcb3FWgomMWRKDem2/ufjrNOSYJYE8T1yvOCFwm7+
         BEvyBFTDCbcu8VtAr36/HC0Z/hdhRlcLPM3JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955425; x=1795560225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqGZCJS3ikiVuMJtsyr4npvqbpny3ZEL5e7cOqsO3vw=;
        b=EJP42d/TA6H9tWaxrYMxHcxDiW8fKP2YyBNicUTeCioHYXlFXg7z5C/4ctmrDNK+OK
         FOoZTBdfqbNWxi6oI/ch8JkmMLvcn+8kgxjp40G9Bz0Dsvdw3ln7qfVSspNNYN7OhHjV
         DratUr3nfx76/vVmrMywTlFTFyYUT0JaGoscwLdIWgkU012PH5RaHZXz5PFD2nwMlzL+
         p1n2Pbx6U74waiSMIgy2vawt6CtQTGC6W1YNtJvho8CVH/RdaH9G4u72nb4HlF46nrIS
         Ht40Le1sADR3wESBD/Ab3MWv5cTFS7lLDNPmBPvtFJMM6WTUEmE6d9DhevfJyjyI/K8M
         JClA==
X-Gm-Message-State: APuU4Z8q4q7x/VF7vJv10nmmY+KoP1xwP2UhdiKbt+nvMFhqmr8RlUUS
	bgXB2txq9ysNdrHuL8FHK+P3TnKJog97tPT6+ByK7Ydr7Av0v/u08MoKQHF1Pgu2AWV+g6YEQPM
	+XFmt
X-Gm-Gg: AYBFou0rWLkcgzVo9BJ3qtmsVkwMqr99g4iuxG3/K0XvXuu7VbDDIU22mardoph8YYg
	GzMbIX/2iwWT+SldHZuruIGvgO6rWy/g1YLBT21Aduf29m6j2VRNbrDE8j2UWYxuEqDxuIHz08r
	7yX01SpSoLBitFz0sKvhp/l8+Glh8ygmoYY5pZddaBWOE7yzVQBO63q0vgCf3USGDncJ7sW3W/n
	cQpilgHUWCPX/jX7kuvMowwjzNJfHxTP/+NOoNbWIQgXMpl1myucGjSTFIYn8HqRK3zZDP146lc
	aFV9sv7zmoJIK8MVALNUT6RzAMI3vSU4hZYJVNPN2aXatBB1eye44ussC7gwOTLksap+ni5NF4G
	7b1o7pGMpvsEndlHFy/z9XQDBN2J7uRUjZloUUIsUP1L2f3pIzHs7T5ofmvtVuSNfmOyAUkWZNh
	AK+eaAZs1C6INUEXmIAHT7Rfsk2j/xKQjAS4ZdL8//97os52fpn66OltQhZAOTeMRVGHCgE9AdT
	IKV2F3arhMBi94n57i+pD9Zz06q3iizJw+hE9zKpvQxawnh0pvteQETF2wMfQZkLGmDr/w4Pc0J
	vrxYHjBJqiUyvnl06sdZO5Oo/rEDl5xNPOmLJ4solIW1zNE/I9hsy0DuSGaZPIPH0SrqpwdM4Kl
	3y5Yl/XbxhUMo+e/A59sNEUr+kDgFEQ1c4U6OjIz4ibsg4B9Tm6U9iw==
X-Received: by 2002:a05:600c:800f:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb7da4ec63mr12284705e9.31.1794955425238;
        Tue, 17 Nov 2026 14:43:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 07/11] python3-psycopg: Upgrade 3.3.8 -> 3.3.9
Date: Wed, 18 Nov 2026 00:43:33 +0200
Message-ID: <20261117224337.4181772-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132597
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.3.9:

- Use the C implementation of the wait functions on Windows too. It
  was disabled because of an excessive CPU usage, fixed in Psycopg
  3.2.11.
- Fix binary dumping of Int4Range and other typed ranges and
  multiranges.
- Fix dumping of Decimal 0 with large exponent.
- Close the connection if the query cancellation following a Ctrl-C
  or a task cancellation is interrupted again, instead of leaving
  it stuck in ACTIVE state.
- Limit the memory used by COPY FROM if the server consumes data
  slower than it is produced. Add a flush_threshold parameter to
  LibpqWriter to tune it.
- Don't wait on the event loop when the socket is already writable,
  which made pipeline mode, executemany() and write() on async
connections several times slower than on sync ones.
- Fix client-side quoting of negative zero floats and decimals,
  which could produce a -- SQL comment (ticket #1480).
- Raise DataError instead of ValueError registering a composite
  whose name or attributes are not valid namedtuple names, for
  instance Python keywords.
- Speed up the C implementation of the sync wait function, in
  particular when the connection doesn’t need to wait, for instance
  at every write().
- Dont replace the exception raised in a COPY block, for instance
  an interruption, with an error terminating the operation.
- Fix QueuedLibpqWriter hanging forever, instead of raising the
  error, if sending data to the server fails while its queue is
  full.
- Performance improvements to lists dumping.
- 2.5x faster UUID loading in the C implementation.
- Reduce the size of the binary packages by about 15 to 40%,
  depending on the platform.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-psycopg_3.3.8.bb => python3-psycopg_3.3.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.8.bb => python3-psycopg_3.3.9.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.9.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.9.bb
index 40374466c3..5f3875251f 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.9.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "86c135a9a6f5e98404975c5787e620bf436a7807e088baebd1b20fa48d3b4b4f"
+SRC_URI[sha256sum] = "87c1d85c3e0e88e811d3c0b3808f947bd967c6faf34af6cd86fd021f77793d6c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

