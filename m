Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60D0D3E1BE
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.30081.1729278808838598383
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIwuzIgi;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e3b7b3e9acso23148607b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278808; x=1729883608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOLl9MMuQMGGi+j3Kb9eLE87+yaN0fcDtt0eSsxoCwI=;
        b=KIwuzIgiEHDZxmd7J1ZvVpUm+1a+ZVclTtUR5X/AxcvUv8rKnO6k1mdJaUrleh35Vn
         fdkoUPjlo7i1ZtmKAU1hqhIaopzS8um6ZKMfHedNA9PPS0PzNWE9b1rCLeUKZ5GWX8vn
         CyB1vooa5P2KpXaAjrSlu5t54OdpSr8C8H8jE2zoRQgwsjO4xboyhSzFTHPni8WaGCtu
         Jj9mjEvsfQfz0rvzamRgury2WfhUzOU576K+Ni62Sy2ydBjIsMKDBEDz54CjYk84NNHQ
         HiQQcgwpCdvzurvX2XzOe3jOjrGAuhRSWFAfuRtw1yAQtoTOKHt1d+eZ+inDatt+f6At
         oPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278808; x=1729883608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOLl9MMuQMGGi+j3Kb9eLE87+yaN0fcDtt0eSsxoCwI=;
        b=K4W0sBl3/P2TYYQqu35qxt9psieDbL5YuELqOYEIn0mOcXud6xsWNBq+xlHVoxiSXW
         tOnwpyy85J+ivpZjilIZZQ/3Svdf3Ee4TtshcpxglUVzP55CF1JX1gn4AnqgjuOXOiNd
         25zNEozcjX3qExHsmMMujEiAxSrNUILmVQIUOFFIrHDpM0m7ZYP4d0SdQ7TusSOaDFTN
         Tn+nXVY3j2REhbep9w8kxQaPg1hZtWqh1f8iHP+VHFbZfbhNWShjD9jrQ93LuSKx2Ere
         FGMFgMPRr+jY04Xlp0+ap4DYgIGL6upEBVKFVfbK/WgRVzWCInSu36BgageS0+85qjOM
         4lXg==
X-Gm-Message-State: AOJu0YxdsM2OILUmZtDo4WcYVVc4/f+EE1CbYWXFllkPUyET9KcNviD0
	VXYvp4o17tVL00aZxiTJcjxt3SgQMVjKIVKEaaT50vIWyr/+RCZu8Qz1LQ==
X-Google-Smtp-Source: AGHT+IEIotLCqBQP2a3Gt6rL8V8c4yGVD6Yfi8P4ENGkOaNmSd2tAb6gaLewclVuyKm+fkl9gSgLsw==
X-Received: by 2002:a05:690c:fcd:b0:6dd:d1f0:d433 with SMTP id 00721157ae682-6e5bfc3b6bamr40262997b3.7.1729278807505;
        Fri, 18 Oct 2024 12:13:27 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:27 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 26/68] python3-gpsd-py3: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:13 -0400
Message-ID: <20241018191101.25184-27-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113013

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
index 50c1ebd15..e3da33a23 100644
--- a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "This is a library for polling gpsd in Python3"
 HOMEPAGE = "https://github.com/MartijnBraam/gpsd-py3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e39f1dab19af50254"
-SRC_URI[md5sum] = "041ce56e8879e2104b4d54c8119cd529"
 SRC_URI[sha256sum] = "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192"
 
 PYPI_PACKAGE = "gpsd-py3"
-- 
2.43.0


