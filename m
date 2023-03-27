Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACCCC7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:50:19 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.33859.1679921409722911198
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kAsNy35S;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id eh3so35609797edb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Maem12SQQR/FTGJsf2kfTUqQiEhSU2JnxkKLY2UgTt4=;
        b=kAsNy35SzYaaJpBoLQwBrAGyQfkP4/vTW0xvUe34YNTOSRYsQ9kTUtKcu/f7xGEmh3
         hfOAdie4tJBQLiKZfyex4pvnozT9H2QGCzruDQFIWttuAMfEFvs7sStiIlE1trHroTCy
         k9Y/hW3gqNvefGuhwGBspKJEHHrInlVRe6sVb04CRXKhA+6r36tITk/2eRuUC9W5rkOo
         9MuMWCNAHXvvwHrG1tOebh/INnWU8tqeZj0PHdPzHnr1b+b6M2q175sX4cCz6K0RKxUh
         ZVI4rotZcUSOUYRv9dCKuLMEZpkQGqmatLJba1DW1u5hfln2a7z4UvwfTj5w5cTKZ7fD
         I+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Maem12SQQR/FTGJsf2kfTUqQiEhSU2JnxkKLY2UgTt4=;
        b=TiRL6b18QQjIC/jDJ5gYmM2PWuYfuNp2ZaqJaytU1V+keGu3Ky2b670dmq0uNkPE4j
         Hmi2CxrCbNjh3+tQG7B3rjfLZOxvjlfUXYrtdYTKqYUA9BCdGtN3YfT5XH/cnWurYky8
         uLoH4enyIDmkpY/38uYbHZ6NJQOR+822C6ZP8l5vWPR+WjLVa8au6RNEgqlzwxLVU/Uj
         HJTQnEGDSSu7FhtJjJxFWWGb03Xk9OQ+4ojVM053iDAtvO7tT4OxR6xFsy6yNPJsqGyD
         JfasaqKx/wcXSbGpEJwhF+c/zgLj+OxY0QuwgbQISWJnPYnT3wHj1t2Da0Njq7KHJACo
         1LjA==
X-Gm-Message-State: AO0yUKWwwp6ayhVSRxQ/hi7MJf7V5T/x6tGpchQ8a1seZC5IdrWOOesK
	TvSM78de0v/olyUvT2TRZKt4kLIz7LI=
X-Google-Smtp-Source: AK7set/xC8M+yBmfXokVaeLeW88cdtxCzshPB+6QR5Evz8Tnrc/xRqEJTMqTI3aklmc8dRUXtxhcog==
X-Received: by 2002:a05:6402:1c0e:b0:4a3:43c1:8431 with SMTP id ck14-20020a0564021c0e00b004a343c18431mr19398434edb.5.1679921407883;
        Mon, 27 Mar 2023 05:50:07 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z21-20020a50cd15000000b004acbda55f6bsm14657722edi.27.2023.03.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:50:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-ipython: Add missing dependency
Date: Mon, 27 Mar 2023 14:50:02 +0200
Message-Id: <20230327125002.90472-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327125002.90472-1-zboszor@gmail.com>
References: <20230327125002.90472-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101782

This fixes the error:

Python 3.11.2 (main, Feb  7 2023, 13:52:42) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import IPython
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.11/site-packages/IPython/__init__.py", line 52, in <module>
    from .core.application import Application
  File "/usr/lib/python3.11/site-packages/IPython/core/application.py", line 26, in <module>
    from IPython.core import release, crashhandler
  File "/usr/lib/python3.11/site-packages/IPython/core/crashhandler.py", line 27, in <module>
    from IPython.core import ultratb
  File "/usr/lib/python3.11/site-packages/IPython/core/ultratb.py", line 101, in <module>
    import stack_data
ModuleNotFoundError: No module named 'stack_data'

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
index 4d21afd6f..875e89abe 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
@@ -23,6 +23,7 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-sqlite3 \
+    ${PYTHON_PN}-stack-data \
 "
 
 inherit setuptools3 pypi
-- 
2.39.2


