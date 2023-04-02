Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DB1C77B6E
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.56497.1680474605691217793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fCWew9rX;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id dw14so17880907pfb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVvNwtJVkY+MWUAPdA2UgR7zS3BQzEkvHyxHQsGFKQY=;
        b=fCWew9rXtTrTZ1cM0BYAa8HmAFhz6pDB0s1zgohxI0IOdMvpJjk/UhJcFDNmbdLvsQ
         7G3x7Gu9VXmBxCtcV0PBcSLQaUDGaB17Rr80BjZmmM+wc4sTjDmvI4JOC5n93rq2h1rr
         U4NUzlnsCO0Nmi+xfoc+5uUtyJIXe3BKPoyim1G6cVGtY6NA9GAajkHp7l0nCCS/4seY
         RYcnLP5nS98Vbk4FaIkF2YiJn3rXao2jK0RzYrLDWA9tOkqPfRksQOjm43FHyFZsUZ0b
         cCpiwcuQjJ0N4xrQf8SB0PFIJPsdtHA4mNMu0ImUcKg1YCBLX4o1lnsnQksh56aoyXK+
         /tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVvNwtJVkY+MWUAPdA2UgR7zS3BQzEkvHyxHQsGFKQY=;
        b=gFwbDAOPDIzzDDe3SHXoCbYQ+LlsQo4EbgGu23S0dmE7JaK44nRP7tN5r2hCRQyvcs
         /TNhivKcf2XJjGUhQUmWIZSav2hzDuwM28y8glZso0ry67PnIdVHMONzdPLROAB5MNMM
         uFLveM2T77n6NHVcT7VoZVColU92Tdi+fsDVzXy7ug37pOAePW8xlkAVB/MRSih+C42D
         4Ebim7K6HgXRIkXH3eMM68xgL8cRCBNycF710u8ZDmJnIt/y29azxizAYJuvNTpRvNYf
         Uq4vXT/ztYecFWAG/+5+rSbjB/y1eU3ut2PA1joiyarX1zwpHPmCnFfbHD1F/ER5K6Yh
         Rl2A==
X-Gm-Message-State: AAQBX9fZaemV8o4hd0mwadryr5yqCbaQBtwx6W2jXVYWC/d88nM1yU4M
	6Fb7fELyN7RkJEHLdUlbRWH515ND6CU=
X-Google-Smtp-Source: AKy350Y3XiylclTj1QaaaPZbmCQidcwMob9yNDHM13T3NL+3lEZZZnM66EYYlos82iNomgpNPZim/w==
X-Received: by 2002:aa7:9dc5:0:b0:5de:3c49:b06 with SMTP id g5-20020aa79dc5000000b005de3c490b06mr31017816pfq.3.1680474604806;
        Sun, 02 Apr 2023 15:30:04 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/11] ptest-packagelists-meta-python.inc: add ptest recipes
Date: Sun,  2 Apr 2023 15:29:37 -0700
Message-Id: <7b4562adb2d6756acadc64d06c87bbd763fb098c.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101883

Similar to ptest-packagelists.inc in oe-core, this list enables
per image ptest (isolated ptests for a given recipe)

* Add recipes to PTEST_FAST_META_PYTHON for ptests which take less than ~30s
* Add recipes to PTEST_SLOW_META_PYTHON for ptests which take longer
* Add recipes to PTEST_PROBLEMS_META_PYTHON for ptests which have failing tests
  or other issues with ptest package

The initial list was taken from:

meta_python_ptest_recipes=$(bitbake-layers show-recipes --recipes-only \
      --layer meta-python --inherits ptest --bare | tr '\n' ' ' | \
      pcregrep -o1 '^NOTE:.+===(.+)$')

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 meta-python/conf/include/ptest-packagelists-meta-python.inc

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
new file mode 100644
index 000000000..ef5d20bcd
--- /dev/null
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -0,0 +1,82 @@
+#
+# Lists of the ptest in meta-python, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-python recipes which inherit ptest
+# meta_python_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-python --inherits ptest --bare | tr '\n' ' ' | pcregrep -o1 '^NOTE:.+===(.+)$')
+#
+# ptests which take less than ~30s each
+PTESTS_FAST_META_PYTHON = "\
+    python3-ansicolors \
+    python3-asgiref \
+    python3-aspectlib \
+    python3-blinker \
+    python3-cachetools \
+    python3-cbor2 \
+    python3-click \
+    python3-dominate \
+    python3-execnet \
+    python3-geojson \
+    python3-html2text \
+    python3-inflection \
+    python3-intervals \
+    python3-ipy \
+    python3-iso3166 \
+    python3-parse-type \
+    python3-polyline \
+    python3-precise-runner \
+    python3-prettytable \
+    python3-ptyprocess \
+    python3-pyasn1-modules \
+    python3-pyroute2 \
+    python3-pyserial \
+    python3-pytoml \
+    python3-requests-file \
+    python3-requests-toolbelt \
+    python3-semver \
+    python3-serpent \
+    python3-simpleeval \
+    python3-smpplib \
+    python3-soupsieve \
+    python3-sqlparse \
+    python3-u-msgpack-python \
+    python3-unidiff \
+    python3-uritemplate \
+    python3-xmltodict \
+    python3-xxhash \
+"
+
+PTESTS_SLOW_META_PYTHON = "\
+    python3-lz4 \
+"
+
+PTESTS_PROBLEMS_META_PYTHON ="\
+    python3-appdirs \
+    python3-betamax \
+    python3-dnspython \
+    python3-fastjsonschema \
+    python3-gpiod \
+    python3-gunicorn \
+    python3-inotify \
+    python3-jdcal \
+    python3-jsmin \
+    python3-license-expression \
+    python3-msgpack \
+    python3-multidict \
+    python3-ordered-set \
+    python3-parse \
+    python3-pillow \
+    python3-pint \
+    python3-py-cpuinfo \
+    python3-pytest-lazy-fixture \
+    python3-pyzmq \
+    python3-scrypt \
+    python3-service-identity \
+    python3-trustme \
+    python3-typeguard \
+    python3-whoosh \
+    python3-ujson \
+    python3-xlrd \
+    python3-yappi \
+    python3-yarl \
+"
-- 
2.34.1


