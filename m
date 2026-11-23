Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48015.1795411820729573524
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VGKWhzvm;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380c28f9e35so3961915eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411820; x=1796016620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nva74fM2kQVSHCaroZWq+yuBL7TzOuWjD54DMffyLGU=;
        b=VGKWhzvmwUuElHTr2Se58z8HJ1gr5spKfTCo2h9w7gDsmPdG09n7fr9Qe4yzB39ECw
         9fJNV5yzp+2qR4ORzzQt1x9Caho8NpgaLXxhCqZiTcNb4mdasWzgAH5WbMZ4/0yJbFsO
         TgWXx4GVA9qjfGdSS9SdjOVmUr0khkkW2sO2qh8o3Aql9R49+kmGjZa/PwETboa0YkDV
         GTughRsH+swsqjjk8fvcxpfU46SwGYD38pxF2MGTQyp9cZCwkTl+FDLZ3NV5YS6jkfYB
         2RtOxsqIQ5l25udmf/HJA13ifA/JDJpWZ4dabvJYAzqqYEJZypczFD+sGwmiVPTq5Q2L
         QZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411820; x=1796016620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nva74fM2kQVSHCaroZWq+yuBL7TzOuWjD54DMffyLGU=;
        b=eRRcMrQnnGNtsHt7SbDiUosoOMrLaqXKweyvnVd1+Z7p+nOqJcptG6Mgt7WiJTRdon
         mOLwblKMpS7dyDznf5f3MTsh9vm66DKXb5KvGBUpe+s3oubkawfV5MCy3MiuyUklaE/S
         hu04tcIllYCDpqCkMTVY8TFPGyeTbEYylTD7mpRGzGvlT52TS9g/Cu067Sx8AmYGMfk2
         JbP5jK3HnT526JDGra9BFMSs0lB1KGALcPwfIOHqgoDT8Ez+WxKLjcyr40VMF8NSJG14
         lImtZk7D8iEkn7ifSd2++ikA2/+hBcXzJbRWQoe4FZ+kgirnw6DPvyBaTA6nsU01QZTY
         OtnQ==
X-Gm-Message-State: APuU4Z8877XuYOgjCEA6cJ32/Z2csb3uG5GJJWE26OPJkDu2AZJpoSbN
	L4GoY+Pn2h3PHpCWHRloKJJ8ulAHKudx3uuxeWq7KMJntJCKZrgOLvpn7JqQ9UTeItE=
X-Gm-Gg: AZFdTZdXZf6BTXBhquRITA+14x2Ijw5UUJ1dKDREmpjXuUG8SYlVD3fgo16r5pBG3E2
	mCLfgeEwmIIz2CLuDFrguHA56ElrSYwEcVJU/sv4mXfmQ1Kmm1+Xl9mTLENQdzxeaiLJLTgi1nw
	t6ItgPzZyiH7wL1yOQnK4Owqs7AB+3MPg6JWnd/D5MI1fNzAuVSv2pUCyV7UNavDptADNA6srkc
	xgkfzSwo1F1BTMAk4B3Lt6W44VWO1d0rDygp5pddV98KsreTeTB2KYadAjRMbTUcGMHdBmM9Wae
	5jDk8wFIF8RhgTQiSGv9IQnu7+CE+fT/u+LF0f8NG4qqjFqQ5YgLHIzjBBA77h9muiY/5y3W9Nu
	o+uhW/f/eioN3DR8NDZsCPCJ7pJKH4PDiV2AvbKECDJgqux2x3zpQ+elblMts33TIPL26ekgu2v
	Vclj53b5bEFOYtTD8J7Xxp7kkVxq1l4XxBAQH4N8OhpqH/DidLpxE0Lmgpneokx3GoMWbrPOSR8
	fRrfXHfULfLPsJUIvuo3eLzu1hfBAexhaBrCXX7mj0NNGc2qqIkzq4qzDP6/6tSfEz8MqPrM89e
	s/SLxwC2mU1vdsptNeVgBYt+HQfYIHA8FwvoEai9PqGi2iFuD3EQdfbbSiv1P6uZX/ixOTL+PEw
	W6/zjp5+5fSClipN43QzurGfsHZ+3gm6MRkFeknTMGrSyR/TmRp9QjFFowUt+yRGVv/ByKklwhI
	LHqyDQ29YT3bw2kH7sLiQHi7k3BgB2b23666E6c2qzbhF6FbXNZgkt2jSjp6t3siJEiOrZu1K2R
	c4QEnURnFGU3PWrMpO/8WcxS7CZAUPtexNVAeJBPQ9cf+87R29UBcLvxgbiTraX0hFKPBSTYxNZ
	ql8W
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr11619884eec.6.1795411819898;
        Sun, 22 Nov 2026 21:30:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/9] atftp: upgrade 0.8.1 -> 0.8.2
Date: Sun, 22 Nov 2026 21:28:35 -0800
Message-ID: <20261123052953.3658549-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132806
Content-Type: text/plain; charset="utf-8"

atftpd gains an --interface option to bind to a given interface, and
a crash of the daemon when building the OACK for a single RRQ/WRQ is
fixed. Also fixes a configure issue with
-Wincompatible-pointer-types when cross compiling.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-daemons/atftp/{atftp_0.8.1.bb => atftp_0.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/atftp/{atftp_0.8.1.bb => atftp_0.8.2.bb} (97%)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.2.bb
similarity index 97%
rename from meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.8.2.bb
index be40302a3b..b2b0a790a4 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.2.bb
@@ -11,7 +11,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRCREV = "7238b7b6753157d0c4ad739df3d87a958f78d70b"
+SRCREV = "63256e403abb7909df3d6bf7b54f52a8b21c0a94"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \
            file://atftpd.init \
