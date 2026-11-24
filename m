Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20200.1795534516833965705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 07:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oTaq8lfy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3854242f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795534515; x=1796139315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBiay8LBAl74992wZBSmbx7kQueo+WJQTLtenRjUXuw=;
        b=oTaq8lfyWYaEwRBnzvSHDjzjAa5T/tqoW6eqry70JqZkUsIrjKFi6i8kHegF49AkJn
         Gpr7KyjYQZ9uLNAQSrG5qtZG8FPy+5fhDzeVrou8SMbhXMLOjizRh/UE89whuPOkFzqM
         3OerfIWETuZKa/2p/BbSXzPRcpo0MhX4gJj3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534515; x=1796139315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBiay8LBAl74992wZBSmbx7kQueo+WJQTLtenRjUXuw=;
        b=WUVRexf7Am9U8PEkWWhxNzK2cyyGpmiSuFe+GxNnl8/l3n8l5Vf97qQV+FK1wQXecq
         Qk/rijnduAjFGfqiKA5VZrNR4eEVzjfM+XBJeepqBRLlTm2HY4DM0sZhvMT7emHdjLhV
         1DkBCw95DEkyk3NZ0TBQQOzjIPvko+pOOfjLyzN4u6xkSj2xZuFEWM4vU5U3vB7e2pj0
         1ATzZZ8c4UNZxaZs+4qakhyaWPu2XHU1vGS86S0wbBnoW32dHEVUjZfyDw0BACNkIRqd
         KWkp8LXpbeZ/RUAo2sXbYhr12mKlUe2Hh672nlQ2h7p6wPExQCSlH+X8GUN5nJMjtfVL
         ND0A==
X-Gm-Message-State: APuU4Z8fmlE9FqQGDs7+tStBTKe03GOW5HVeUxmstwKpfm3Ex3oOVS1c
	wYV7O7NMmEuYGXWnP1Ctbqs0QksxsTlJ1qrXCDsd9Q6u3epdN01xb4bOdyw2cSX0iLY6vH8Mhp+
	L7peP
X-Gm-Gg: AZFdTZeg3o6en2gs1wOlIz2NIkjjLihWnxGZzvyT5awtHltfSL1mfvAPJSQDHl4H+ZI
	R4yPHPgfTavcaW9G6czppt2ZtD7XVVUE+29i7CLhWYlVZ7BQt2AxAzV0Ft8Yu7m3uL5jvFKVnvv
	uAGoGz0nqm91juUEdUYYdhUpax0vzR9rw8BZUEzQFcqd4Fmj/fAEDVvxXoOLXrQwNkSadzlvyEj
	QE3ykikqzMwbz3dOF2YIj3pJw9b+LdKYQYWlRejdHMZWxhG3ubPqE57iIgqv0p4/JO5fCX/Jw9p
	S3LqQj7+l6d5f4JTBH51U/BA8tzxAozxxPjI2Gn/W1y3xnODgoWB+uezibkgNbenK8v29KKgzca
	Vsk06SfsJEN6cEH/NuXn6/And6diOx1OjDXDViiOAYbjRzjfR58QbA9x4A4rt8Wbtp4gBIwp5mD
	3gxGB4ljpEvsX3mGw2q/RusHgyMsijikQxZkfDrYIxyZomE5Sdei7irORwR1xvBXocL9YK6/op0
	t5uIJI7x5K/6G8Lx0EQeXztNiT3V6eCp+w6obT/1b0vcRFKzuIWzcqWhKxITeQxpWnBTrurGgMZ
	Q6gzREiFSk7d/CzjpdZeCgsAbh7ZWuHFV/s0tt00cdRi1ltrz2mS6VeKkoGgdjqNjWi6fAqgV3N
	Bil4KbFUMp0HdQH7UGyzHKQLgHC0oVaZ11/9gHCcYHfw6y+kr53Q7WFo/GsOCigDlYvR1us5tv7
	8=
X-Received: by 2002:a05:6000:4b1c:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-4abb0c5d67bmr30336786f8f.14.1795534515077;
        Tue, 24 Nov 2026 07:35:15 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm29472884f8f.16.2026.11.24.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:35:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-regex: Upgrade 2026.11.19 -> 2026.11.23
Date: Tue, 24 Nov 2026 17:35:10 +0200
Message-ID: <20261124153510.1696027-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124153510.1696027-1-leon.anavi@konsulko.com>
References: <20261124153510.1696027-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 15:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132949
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.11.23:

- SEGV in Match.fuzzy_changes with BESTMATCH+POSIX:
  restore_best_match didn't restore total_errors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-regex_2026.11.19.bb => python3-regex_2026.11.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.19.bb => python3-regex_2026.11.23.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb
index 264b95aebe..b6ef7c0da0 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2826a006b68acfd3ed5074433caafe21d7f9d026eb82cb856724a4a893a70915"
+SRC_URI[sha256sum] = "f933202c64dca184b783e1c97922170bb167146faa120476a310e90d0701a915"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3

