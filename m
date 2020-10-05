Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.26880.1601867968180341618
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rqnm1fXx;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id g29so5097267pgl.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ltZ9iyOB/oBXP/X6Tv+g5pZ7sEr2cdFQPBOFzP68bSM=;
        b=Rqnm1fXxUMZ7yDCPH5+Pj/B5nAfUQ6a3PuLyODFwnWZ6XD82hAjZYEOA7lb9Vqgm3L
         QUW7MpzqSah6SDwnWm/HKnmvxsQspQps/NUQqyEHT54Jfvt7STJDo7j0AanBOY4JEO2o
         BP27lIgq8zhZYETyBf0fwG22DdD7mNzA/P7yx+A+kwqqvWbTK5J1G7ZaAvWATy2OAnyI
         DDaw4faB7HBOT88YquGnqAMLeNdaF5+8iVFAYrZ6H9IkNTSZRO7ocwCxzurqwoKEmBIT
         qZDZMnvHOLnye1mDK9L8y8H/f9a+uZBUuffsO70F1xpJVelWw+A1XRcYa6Vi9YJL8ioy
         Xbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ltZ9iyOB/oBXP/X6Tv+g5pZ7sEr2cdFQPBOFzP68bSM=;
        b=o5ZC+/aIXPEKO0cZcXCR5E7Ovga/c2kPFIQEJwhMyjzo3HgQbTWmQQBiG4icJBCM2L
         lzRjIvKIXw9uc7iYvkCADVZMtTXwqDGB3eIph49wvKMSBmhFNGJi1NsGd3FjI7sc5v0e
         wOZU4ySq8y0MFIvVHGjs4uYzhMPMKNGXb47IlXFkoUtbrm7nRtQIKp5cD7XC5whw3pNs
         ddWFF4zhhsZXkNBSnfLD5EO0mpMIarGRm7cJw594cL5dOM6w9nNnV7qOBIFU0Wph9oC9
         lqlcZHcdmH4UviO3lF/ggRkkpvoJIXRzWTtlwD2QRo3513iD8uwPCq1GxNh5onBiifMg
         AxPg==
X-Gm-Message-State: AOAM531qNvhJjqdkN65/Is0aMtSxzFpQ6mz2OkDRG1HMPvzEV9NiCl6j
	mWfF6pGry6G9yTMkgkunPxXgcnkZ43U=
X-Google-Smtp-Source: ABdhPJwt1HnvIR3HLLHMfzH9cNLc4BC3EsQHnMqjhaa9PtXvSUf14b4oupXWrM0b6o2EqzfOjUcIdw==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr12141527pgh.201.1601867967553;
        Sun, 04 Oct 2020 20:19:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 6/9] smartmontools: Remove obsolete setting regarding the Standard Output
Date: Sun,  4 Oct 2020 20:19:16 -0700
Message-Id: <bfb9fa89bb54000b62b098aa4b0a76e4864b4e45.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

The Standard output type "syslog" is obsolete, causing a warning since systemd
version 246 [1].

Please consider using "journal" or "journal+console"

[1] https://github.com/systemd/systemd/blob/master/NEWS#L202

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f9f8904623e5ca3ecea74e983f8d766a785097d4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/smartmontools/files/smartd.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/smartmontools/files/smartd.service b/meta-oe/recipes-extended/smartmontools/files/smartd.service
index f3db946c81..e90a7c4def 100644
--- a/meta-oe/recipes-extended/smartmontools/files/smartd.service
+++ b/meta-oe/recipes-extended/smartmontools/files/smartd.service
@@ -6,7 +6,6 @@ After=syslog.target
 EnvironmentFile=-@SYSCONFDIR@/smartmontools
 ExecStart=@SBINDIR@/smartd -n $smart_opts
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
-StandardOutput=syslog
 
 [Install]
 WantedBy=multi-user.target
-- 
2.17.1

