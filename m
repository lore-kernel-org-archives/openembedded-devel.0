Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE78ECAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:39:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.10664.1758191978414430633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 03:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ClhN4Uoh;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b04770a25f2so126017466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758191977; x=1758796777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWT7OVsyRfbowCDGwsqVlMnHOn/M78x+0VssB+GStwM=;
        b=ClhN4Uoh7cwk7UGoLueLBHhoYVt2YXT98Jiiz/n6XkQoimDXZZwfxfVFNVRQm6/yFv
         jXFmWrcRZI7yD3VI1XIKmcNHmBiGkRaO0iuWTk3CnUeHF/OjTB11EO9b//iAmruoOOU6
         DeJGn0vFxUs6asirxgCpjWwYlvZMblaE0EvbKefeVnrDKBASnBz75KG0/iJQkZ+W/Ly7
         9lJbXho+3rDKY8GD5c48v9w6kQUfdP4dUDrTQL58SZjR5PTdZ/tLEQIVv8B0vd3UnXGo
         tVM+sEWq3xLWtu761Kit2luIkWjEeyBiRGwGdYKhmV3dtVwmPjt5/6gXs8wuGZ2O562b
         Hsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191977; x=1758796777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWT7OVsyRfbowCDGwsqVlMnHOn/M78x+0VssB+GStwM=;
        b=t5o6q3c/VENm3RQNtSVSi2bfxoJm/rptU8jTup0Gpb4Z33aRN8qqcP20rmc5KVjBYQ
         HDSvzi4Kpbz9/vRzYdPnL41r5b9FJVuU/ILl9cJzObTplPh39+Jpfps0ekYO9FPKGsLW
         uwP1na/dkQ+UaJ0GpcBdGnhkKb+1xVVWjcGw4M0pue5owAF4NihCNNMe0pRKZbemgEde
         6dYrSQb1bv6zXoIpARocp8tldco+dgQgBhaPx1yNIIcnSpwjqsq4TmXgVu7R0WAUDRTD
         1wf6CV8uCARC4HqkHujFI2XDSvB/viZZGjMdn9vfr0/qeYoQHU7Aq3Ab9S7JJElKfGo2
         WrMw==
X-Gm-Message-State: AOJu0YxsXmZjWwwPJ3W3wJIb9SRiznOuVm7rsl+Hg9GyNfsfJJU85MiR
	AK0GAxZnUtZmc4Y9vDXoJXwNEpHFxMOxWUmwI1B4MANBHWMfgV8NAq8RC1C9nQ==
X-Gm-Gg: ASbGncsRcA93mjQj+SKU+KLF4QIknM8CqxqlBlv0ZGeOb/pI1fJT5qU2MCNnPQjBjdK
	QqFTXrOjgesao/csasNMTp7iaRqJZdVGSGZj4KmIa41pO44gi5iiTbW4w9mAhjQ7MJaFTyW1HpM
	dMmPIr0rMTUwP+1u93mYdxb+6j36MuwN37BZ0rBdnRW9xvuf50Xo3CQbXzBfLG6Ms4/048BuGNq
	SnvqnJzCKGvRHvyzNr7NZxyfIgmpcE8nlF3+4rcPG6B20WJoPyF2hj42T1reOlQnDjIJgz6KaLL
	Ey47nwsOj/uB+u1EEH7b+jjfF0egpGxgK48fNgrAESLgLy4+JDZwsl1+P4fuwdFrOSYOsswux3o
	akrHOK1rCdy51tZLojUzomRcsmL24x+8zaK6lzBU=
X-Google-Smtp-Source: AGHT+IF6YKH1yr1VL3LVm8VOPP6ZCPV+ELS88eNOuQfNilQHFF0jf9gH6zRrHV4Baz+AFeDP/F6hQw==
X-Received: by 2002:a17:907:94d1:b0:b07:88aa:255b with SMTP id a640c23a62f3a-b1bb4337559mr620199366b.11.1758191976554;
        Thu, 18 Sep 2025 03:39:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272064esm164716666b.105.2025.09.18.03.39.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 03:39:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pm-qa: update git fetch protocol
Date: Thu, 18 Sep 2025 12:39:35 +0200
Message-ID: <20250918103935.175911-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 10:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119553

Apparently the git repo in the SRC_URI stopped supporting git
protocol. Switch to https to be able to fetch the source successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index d7e9618985..1574bf0ce9 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -11,7 +11,7 @@ BRANCH ?= "master"
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
 SRC_URI = " \
-    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
+    git://git.linaro.org/power/pm-qa.git;protocol=https;branch=${BRANCH} \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
 "
 

