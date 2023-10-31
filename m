Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC7AC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 17:36:03 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.2044.1698773762335744721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 10:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=XBewNA4G;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.44, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1ea05b3f228so3749246fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698773761; x=1699378561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=XBewNA4GtuCzUD0UE9Xeo8PNlElDO7QL4oGeGnSFl4WZdXAwyhcWvoxwzLBY4fLtKZ
         NPU6wMtISifhIOTpbj33k2eZKwRHdYa2TRI2okoB2q1jUBnRs42qb4Q39QS2nE3gzzeI
         qcVGjVKg5sDGrAI8citEDbRDRx9MVVj6NUt4TG844SjQKP93vfKpCK7hx6/n76KuGidy
         ZXU+GBMrHo06XwPYsfgLfP/k6OQgt8fnizI4EeFJktK77xZRZWxJvhHV3ueyeVxFD3ah
         nsvaLnnoMmx0YUcWqnfMrOB4UCph2emlrqQfO0eGu7vtlX44Gbg1EXg8WGijVHsAc49d
         +IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698773761; x=1699378561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=iizjy1TstEAu4f9vN0g7i0wHasAvShUCsv8heK37vx08rRUACCags98UIu15oeCjYd
         om8Bt7y5nIbeBuPOvxaMLhgF2dJbdCIHPQKz1o7TgGAPqtyzSY9R/3rln3+pMfa38G4a
         6skxWwlXEsOod/O6DdVUM1rH8FLKWYMI0o5kx85dty7dvZN3Bh0225kWQIhx9hLELvAo
         Up4cvnWqxDG7KV3a8W39Ym+kLqrhOsMrQjlWdZzuQtALcVowy5SrFyySwYclPfpQT06d
         VvMQthwRrd04IiQ+R2SI6qtVYgpjYgB8iyu628BMQHNE7TpxC+1eQd7SR1KmzxCFkz4J
         pcyA==
X-Gm-Message-State: AOJu0YyJJriNon44Q1d042hQab2QcedbCK0Il0TYWDnuDkqDpGHo8KNS
	QTMevy+wLBpSZTeyC6SrYneNTp2hkZPReUCRwnUwEg==
X-Google-Smtp-Source: AGHT+IE6PwKy3u2HDj2V3H6iLCzJd4FZ61IJhEhFuu+otPMJ6YL+rOEef3o7hhxVgLAHWp+CpWAaGg==
X-Received: by 2002:a05:6871:8108:b0:1e9:bba3:4902 with SMTP id sn8-20020a056871810800b001e9bba34902mr15212289oab.37.1698773761362;
        Tue, 31 Oct 2023 10:36:01 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id e26-20020ac8671a000000b00417f330026bsm679984qtp.49.2023.10.31.10.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:36:00 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 2/3] python3-objectpath: Add ObjectPath Python Recipe
Date: Tue, 31 Oct 2023 14:35:53 -0300
Message-Id: <20231031173554.1786139-3-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
References: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 17:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105805

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit includes the python3-objectpath recipe, which introduces the agile
NoSQL query language for semi-structured data. It is licensed under MIT.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-objectpath_0.6.1.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
new file mode 100644
index 000000000..6e82dc13b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The agile NoSQL query language for semi-structured data"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+DEPENDS += "dtc-native"
+
+SRC_URI[sha256sum] = "461263136c79292e42431fbb85cdcaac4c6a256f6b1aa5b3ae9316e4965ad819"
+
+inherit pypi setuptools3
-- 
2.39.2


