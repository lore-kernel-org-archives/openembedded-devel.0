Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B25C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:58:50 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.25755.1683615523643154176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 23:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OjCxKuwo;
 spf=pass (domain: linaro.org, ip: 209.85.214.180, mailfrom: jun.nie@linaro.org)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1aafa41116fso37594105ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 23:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615523; x=1686207523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUrJQsvglHxBYXp9PPbXh39ALxVdfgM8NB9bD2ph/O0=;
        b=OjCxKuwo76JdjukEvc/fQpcTToODNG5N57Q0NDwpFbFEyN20XFsYi8Ex2gfINVBfoH
         3ycTnw6gv8BPrF44lfdMHj+ub76K7KfiL5266Upp+Fe9tsqPomG7+3IeGyZw27JlDFNr
         NXsYy5XMG2b6fP9NsjPlS8GDRzQHIH3ODdSvqLYgQ0TbbEXYY3MJV4mFNw7sqJQYgLL2
         r/c8m8Oi0vBVOTouU95Ez/zbydDXB/i91b7Km6d8V5xrCNMZT+tJtcp/Qpmu8Fn6GPFM
         5XMsWTWPhtAlik+tjqpToVlHgYimF1ub+iB8szgcTaxqtBy7c2JAp1plmBwf5hQv+wLL
         p9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615523; x=1686207523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUrJQsvglHxBYXp9PPbXh39ALxVdfgM8NB9bD2ph/O0=;
        b=dBdxesXk5r9ug3WFNvFyowmmknnTlRsMOas8mrI2UB2uu3rv6yDPd7obj/szT9XNy0
         Fsccw/dmScPbKyRGRXjMUOcUSIWBH6CFkMARlaQtOn/kycO6eR+WTvN5i2x3bU1L9ZfL
         7qmAbBbgwNaE2oojlRdbbi+lqbx1s81G20reeunuziHl+w3sj0hpeAKkwN4nnadbTDJe
         mQ8DnTX5HenBuF5b8MB52xMaoY4kHjEuTnSr7bMvLbVOpLqawuXh+8ImQUVW49R3QIw8
         lmCqEXe7doeUxAFuqh9hzhpv9RpYxH6pNV7G06Ot+B1MJh4YEe7HmNFO5C8fNNsQxyhK
         E0Yg==
X-Gm-Message-State: AC+VfDwe3sXTaiQNlqfeRGN9EQlodGZCdNMvSeAamaS7GhTvZv1n5XGv
	QX8i1hhcVTQl/KGWC9TOnVOVWQ==
X-Google-Smtp-Source: ACHHUZ5g2SP2pSCW1KtbNCQVaRAjp5+EDeNMV5Uoz1eIYujnXIO78FUxDBA70bauGaoC+6pf5vcwVg==
X-Received: by 2002:a17:903:2308:b0:1a9:7622:e308 with SMTP id d8-20020a170903230800b001a97622e308mr17405712plh.20.1683615523060;
        Mon, 08 May 2023 23:58:43 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm700038plr.190.2023.05.08.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:58:42 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe 1/3] libcbor: Add initial support
Date: Tue,  9 May 2023 14:59:38 +0800
Message-Id: <20230509065940.1584276-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509065940.1584276-1-jun.nie@linaro.org>
References: <20230509065940.1584276-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 06:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102465

To handle the general-purpose schema-less binary data format

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 meta-oe/recipes-extended/libcbor/libcbor_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_git.bb

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_git.bb b/meta-oe/recipes-extended/libcbor/libcbor_git.bb
new file mode 100755
index 0000000000..53ba230533
--- /dev/null
+++ b/meta-oe/recipes-extended/libcbor/libcbor_git.bb
@@ -0,0 +1,13 @@
+SUMMARY = "library for CBOR"
+DESCRIPTION = " C library for parsing and generating CBOR, the general-purpose schema-less binary data format."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
+
+SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
+SRCREV = "efa6c0886bae46bdaef9b679f61f4b9d8bc296ae"
+
+S = "${WORKDIR}/git"
+PV = "git${SRCPV}"
+
+inherit cmake
-- 
2.34.1


