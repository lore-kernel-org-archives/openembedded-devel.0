Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040E2C77B6F
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:11 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.56496.1680474602539675573
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DEENpRtZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so30657453pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X97xLhF+qn+IAMS1TLqk6kcj1O9tfBFP6VRsjycj7Gg=;
        b=DEENpRtZAY3M9OT5mq8SAaRSjyPh74QWSQHMf0mMdb/S5W9VGhslqoQyEv1oKdU3fl
         ymFXdu1ZwHFd0rblNEDmeZqgqu9NCM2NA9Vste3WN61WQPPg+lDfumQc1avGO207fucw
         D29L1qSlzTY81lnZsNXPdzREFjGEDUhmFp+2szKF5Y2+hpg2eFRO2piEa/i/0oAHBcdU
         Ikovb1qYm7w3U5MjX9ulLv/JuRL68mdZ2q1NGFsd4AUQIqCfFOkdfrbn0eRflaSNc1Au
         uiXS8K3k8Ic9ljeDcEjm5uacVdMynY3n9Fm0EzJ4DrvbhBlnx2YdCoYnGCs9pfxl48f2
         bi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X97xLhF+qn+IAMS1TLqk6kcj1O9tfBFP6VRsjycj7Gg=;
        b=BuWKB1XjwJiAo7PM/IPKxa6ABRONW+gx2nXAoLYI5NdAPC9JaNibG6VhP67rrXtmOE
         qEU31pIvcHH7A858K0UUb8vzb1pUaEht7aKHpF6WPuXGLbWmqsjjfY9z3IdlMQPP1iME
         d0ODFOYrZZ5pcXgNMe6wqrvTMspXkrAxA0hgTqlkEE6uQKtZCGBRlhhQP9V1FnvaDrYU
         u1iKBue3CQIlvU2KJMkKMqJn2qnfGE5kkLSLm0ezS6GOJxZjQTu87MgIHjrRrt3AlBcf
         MhYW7xoB2yi3N4TKgpEqL5ZSNTZcDzTRKqfJW/P0mR+4LL34EVWFyGeOt/MDbzY66OnU
         hUrQ==
X-Gm-Message-State: AO0yUKXvUwojG3nwuAzlVnK6X6GrOXoRsoZcDUnKvt3j1cSUuEufaimh
	gDyg4pSOlJqZyeqRfdgHuUQ7tAFraCg=
X-Google-Smtp-Source: AK7set/3gNfQdllhsJT0qDlbz0e7fcYa6W9oOuLYyBcrW1Bvt6WiYJRC4NJTiLR5TGcswc7Okq+evQ==
X-Received: by 2002:a05:6a20:1222:b0:db:a03c:713d with SMTP id v34-20020a056a20122200b000dba03c713dmr26701786pzf.23.1680474601644;
        Sun, 02 Apr 2023 15:30:01 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:01 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 03/11] ptest-packagelists-meta-oe.inc: add ptest recipes
Date: Sun,  2 Apr 2023 15:29:35 -0700
Message-Id: <29fe2ef9bbbaba0ef0424da5aa04d48572de6141.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101881

Similar to ptest-packagelists.inc in oe-core, this list enables
per image ptest (isolated ptests for a given recipe)

* Add recipes to PTEST_FAST_META_OE for ptests which take less than ~30s
* Add recipes to PTEST_SLOW_META_OE for ptests which take longer
* Add recipes to PTEST_PROBLEMS_META_OE for ptests which have failing tests
  or other issues with ptest package

The initial list was taken from:

meta_oe_ptest_recipes=$(bitbake-layers show-recipes --recipes-only \
  --layer meta-oe --inherits ptest --bare | tr '\n' ' ' | \
  pcregrep -o1 '^NOTE:.+===(.+)$')

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../include/ptest-packagelists-meta-oe.inc    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 meta-oe/conf/include/ptest-packagelists-meta-oe.inc

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
new file mode 100644
index 000000000..e8898ce78
--- /dev/null
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -0,0 +1,60 @@
+#
+# Lists of the ptest in meta-oe, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-oe recipes which inherit ptest
+# meta_oe_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-oe --inherits ptest --bare | tr '\n' ' ' | pcregrep -o1 '^NOTE:.+===(.+)$')
+#
+# ptests which take less than ~30s each
+PTESTS_FAST_META_OE = "\
+    cmocka \
+    cunit \
+    duktape \
+    fmt \
+    function2 \
+    fwupd \
+    gcab \
+    jq \
+    leveldb \
+    libcereal \
+    libee \
+    libio-pty-perl \
+    libmanette \
+    libssh \
+    libxml++-5.0 \
+    libxmlb \
+    libyang \
+    lmdb \
+    minicoredumper \
+    neon \
+    nodejs \
+    onig \
+    poco \
+    protobuf \
+    sdbus-c++ \
+    uthash \
+    xmlsec1 \
+    zeromq \
+"
+
+PTESTS_SLOW_META_OE = "\
+    fftw \
+    libusb-compat \
+    rsyslog \
+"
+
+PTESTS_PROBLEMS_META_OE ="\
+    jemalloc \
+    kernel-selftest \
+    keyutils \
+    libdbi-perl \
+    libgpiod \
+    libjcat \
+    libteam \
+    libxml++ \
+    mcelog \
+    oprofile \
+    ostree \
+    psqlodbc \
+    pv \
+"
-- 
2.34.1


