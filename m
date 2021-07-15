Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.954.1626368451787336986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m9nqG4IB;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id my10so4475554pjb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AA5oFdd0uuCdEvZsJ9OR+Vc5F2YdxYGSKKFjlYohoOM=;
        b=m9nqG4IBRtnUgGbeShikit9tf2jfbEnk4sxekyQ9LZmla4ZxZxgAmFFWG1OSoJoEvH
         1W0+roNQ97mDM2kdNu+Ew8BZBzajMvf9RDOroYne98SUKqlAhoDoMOqtM54uyENnN15t
         HoYGcwCzPvrLQkqAIJBwu/qdoBTdsSfMV3jQXnWmR7ksSp9pH3KNOysmcfLAwjbqcZsd
         4fvDlDPlfe6wB9khfv5X8L1mdTE0hif+CJV59CELtje/VWJBiyjvrzfy03o5eIU9L9bn
         Y5NVIP3+XnP3FVDnrGGxA8BBq6anJrx/koAe91Y67+exgq6PwOYTUVzz5XEbnMjJgsql
         SAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AA5oFdd0uuCdEvZsJ9OR+Vc5F2YdxYGSKKFjlYohoOM=;
        b=DH7GDKZS8cxKM9M+b9ZoHOgqjdCByYdLI0X8Cm9JHe7vZB3Db2vzgRbdN593WwcCNP
         O5JqK4G69bUCbInxxYgiz0ybfnED/w+yZ1MG1dAXOQqUTMQorF33FtthcLQ/J+n34f2m
         bMlEsxmhQ4/WHywIHITLRU92eeJMFqu3NIYYNdPSWx9mGT2BzfzTDns+pTtAlGV39RVm
         YjGaokd6KZf/gR8Q41NykOWkptbrfV3ZO5VN4k9wSHOCXdXxTI9aDX1aYx22Du6xtBY6
         rjDe1Abk9Px0H/yO+l2DF0H6Q7DMt2dYfGozoLV4G/gFcarHHN3ezhqqGtVMAgV9oOoQ
         Mt5A==
X-Gm-Message-State: AOAM530UPV6QKlgm0ARLi+q83lgMylYEiEBINo4l/3kMkuQybywwxGTm
	Co24aH7poEzgygbuxEnhFLkya3A2ZyI=
X-Google-Smtp-Source: ABdhPJz88UVwPWFR0FEht2YK9yOUVv7L30qrTxDkB5nESHfllRaLl3kTyttxT6NB+xo7f5IK/HDZ3w==
X-Received: by 2002:a17:90a:74c8:: with SMTP id p8mr11044393pjl.70.1626368451092;
        Thu, 15 Jul 2021 10:00:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 5/7] ntp: fix ntpdate to wait for subprocesses
Date: Thu, 15 Jul 2021 10:00:40 -0700
Message-Id: <f52ce99b468eff95b6e36caf41fb50808a26f8d5.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Zaharia <Adrian.Zaharia@windriver.com>

When using systemd, ntpdate-sync script will start in background
triggering the start of ntpd without actually exiting.
This results in an bind error in ntpd startup.

Add wait at the end of ntpdate script to ensure that when the ntpdate.service
is marked as finished the oneshot script ntpdate-sync finished and unbind the
ntp port

Fixes #386

Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 73d5cd5e8d9d8a922b6a8a9d90adf0470a99314e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp/ntpdate | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntpdate b/meta-networking/recipes-support/ntp/ntp/ntpdate
index 17b64d1335..be3bacfcd1 100755
--- a/meta-networking/recipes-support/ntp/ntp/ntpdate
+++ b/meta-networking/recipes-support/ntp/ntp/ntpdate
@@ -52,3 +52,8 @@ if [ -x /usr/bin/lockfile-create ] ; then
 fi
 
 ) &
+
+# wait for all subprocesses to finish
+# this is required when using systemd service as ntpd will start before ntpdate finishes
+# and results in a bind error (port 123)
+wait
-- 
2.25.1

