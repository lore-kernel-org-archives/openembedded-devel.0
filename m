Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.10243.1629865834488097502
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mGXV9q6d;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so3844395pjx.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=me2sAjf1FreKWlLkQRR8LIcXZYGcfLaFYbhSWKSmDL8=;
        b=mGXV9q6dDBb85OgiRV7rq+J0HuxEye3T7F9gMB5SdonBl4pgzZUEBw3AY0Ss1JeLsS
         Yy3HwcWbJ0meF6Fu3lKv1ChtWMGhPqgXiySGywe/TsyqueTlkUWPQ79ak234xYo6kKa8
         ANq4aHb4uYl7S/tl1WWfprHDrN9pBeyfyXv+250vcCoYhuUDC33WSvo95pH41jXjGllc
         wvXn8nFFKBroTvomaV7wc7myzfJS9gtyz1ztTvZbjLjC4ptpFL46ud6MbPWnuUYkjLIS
         xUFsoQODkMmL+HtBsPANxP3a3FoiR9j/sqt48qCKgyszcxTEtlF8T/tledS926fFTmHH
         m+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=me2sAjf1FreKWlLkQRR8LIcXZYGcfLaFYbhSWKSmDL8=;
        b=CawMXck14VVPog2lOg1tVPpc+/Y00pc7VofupcbsUUWExO38OBvDaR/QfzA8DI0BiK
         IxOXX3aEG0T3Pu6QWXGP6QciIkhA9N/AMATtMtfkjIqHxi6jtKXf9bn1sQ9LjJkoWq+l
         blSEQgLqN5jy/zz113pIKhZ9me4O+2sMjGTzezJIBSbY3h05YDcckv8TgiBoZsVJgQ5a
         fOhscxkOwHRXXqK84idJ9XpAGQirDAAsKAWeNLg/cnfQ8ABTDUYyIYiJNmpNz8d2Pi/Y
         BsDJz2Xy1B8SfwncXPQFTyy/xLSWbLeKujL48OCdB+zM9WSw1VV1hYns5ux61OwFuB8w
         W6FA==
X-Gm-Message-State: AOAM5339x8xc6LQ3PShjnOFB+dGOMCU/y3+8IEaB7jj/6NfhA0jePlz+
	f2IJ99AIWbdLc66wHR8KRVH4uKGiZj4=
X-Google-Smtp-Source: ABdhPJxBubICdGpKF7VIMcxzYpHT3eld4FcZ2mABNOlgKTgIerobYKjvIvHgNAiYIN+AAydT+bfVHw==
X-Received: by 2002:a17:902:ed84:b0:137:cb1b:89cb with SMTP id e4-20020a170902ed8400b00137cb1b89cbmr787522plj.56.1629865833971;
        Tue, 24 Aug 2021 21:30:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9989:489c:6f9c:8144])
        by smtp.gmail.com with ESMTPSA id b190sm23864007pgc.91.2021.08.24.21.30.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 21:30:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH 2/2] tcpdump: Exclude CVE-2020-8036 from check
Date: Tue, 24 Aug 2021 21:30:30 -0700
Message-Id: <20210825043030.33513-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825043030.33513-1-akuster808@gmail.com>
References: <20210825043030.33513-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This issue was introduce in 4.9 by 246ca110 Autosar SOME/IP protocol support which is after
4.9.3

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 8f7bd59f18..2ea493863a 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -50,3 +50,8 @@ do_install_append() {
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
 }
+
+#https://nvd.nist.gov/vuln/detail/CVE-2020-8036
+#Introduce in 4.9 by 246ca110 Autosar SOME/IP protocol support
+#which does not exist in 4.9.3
+CVE_CHECK_WHITELIST += "CVE-2020-8036"
-- 
2.25.1

