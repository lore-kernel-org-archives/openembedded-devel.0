Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD42CD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 08:53:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6171.1780044793746300450
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 01:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s00eHfKc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso92576125e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780044792; x=1780649592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD630vuudJX85BxradVmRK4aNt+oPr955UYmdkBMWmk=;
        b=s00eHfKc+Dg4I5yqm0lGb31c1WPZFbmsY3/WkYRiJVEewoKe/8gBt2T49cTfaOGh4E
         +n3irS41cF5RqCPfwlCQvCfEq2FxdJQS0mHiY1F+kogwCIyIKhcyGn4vdxNw5QupcwWC
         8Ks4rd3S8im7r9tvWGqGJ4xCmtygRyR8h1O6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044792; x=1780649592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VD630vuudJX85BxradVmRK4aNt+oPr955UYmdkBMWmk=;
        b=hhYW87+JQg5xCQ9FSs6sICWwu9pGR/+lhQepxSeZnAM2WB5+LjJLGQkWoPngfL6W31
         SmOCIzYyYninnBF0aScI37pggP/wyxvPOh7iTjVObEEQW0OJqgF1cJJObGsh1UYrog6P
         ypFDPUi+YLFklczkVGGYsEfJH05vCZBai+jKaxTCkOm6zpWikemhL474RUgyCCvvY9pk
         4gu4lEBEGlGpmqWl59QZd8ycfylJim8D9p7uSzVqFhpaqzulra0vMGD370RkFVNAQ1Gt
         UZH6vaUR8PLIR6QM4E++W9PYkyMqQzu8KX3mFwlFTFLbTh3Q7+OvBZFd7moFIwjjAEmc
         U+tQ==
X-Gm-Message-State: AOJu0YxxH71uTAqz5qYCnwQyqPI1Ao/zaOfnURd1MCHnEXDO0kU4dsLg
	PRbYgU0H8x0EjrxPF6ZvB2M2svp/61bzzM9ccoavUSkB4IbP5jRwnSQ15mUDRjcOf14oI/krhDc
	28JAKyqs=
X-Gm-Gg: Acq92OF4e35mnjMLuxdIrtYE0KAMHZha35O77hpMIAK8nJ+RclJle/wfgvD/VIVeELz
	UEzWd1cY7D6TrhtEqWs/WHgYgVCAA58TWY5qJ3/qNsCOMjX2UXV71nMsZQRc486iUtDTh9OGfeJ
	iNsP+0AdvjLUSSi7nVxR1H7QQqmnEyUboxO16c3IYjVz0zTQkuT0NN8L8oJD0dEjmFlfQ+jzzDr
	+9zYcy0n/v253XQd7dNGSP/Hp8r8zS45Vb9OTcJG8bJXxHqn99KtB8ZYJVeLqDicK7oVilDtYND
	H3WErI2iR16jaaYPocVZ9YCn7VcuVLSH0wGdEyTMJTvnyyU02JQrDwEiwcJT/zT39Iv9CGtlmzB
	00X+3cQ9AmVSVTxHy2duL+kVSesIw74ZnxAWi7zjFFJ6/NEa0iRwrTEFQdTWjI4+aSstmyeIM+5
	BBriXNF7VKCZS6zv2rB/16IZCp37b3KaGiIIPbiRATzfc2
X-Received: by 2002:a05:600c:468a:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-4909c8558c2mr32935155e9.2.1780044791826;
        Fri, 29 May 2026 01:53:11 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f3612sm24657815e9.12.2026.05.29.01.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:53:11 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH v3] radvd: upgrade 2.20 -> 2.21
Date: Fri, 29 May 2026 09:53:09 +0100
Message-ID: <20260529085309.3596033-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CADySD0FfPTgtq69dE4VpCQomg9=ws+EoX07h+rhFmffuyGS+5g@mail.gmail.com>
References: <CADySD0FfPTgtq69dE4VpCQomg9=ws+EoX07h+rhFmffuyGS+5g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 08:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127284

From: Filipe Pires <filipe.pires@konsulko.com>

The litech.org distribution URL is no longer available for this release,
so switch to fetching directly from the upstream git repository. This
also fixes the src-uri-bad QA warning for using GitHub archive URLs.

radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).
---
 .../radvd/{radvd_2.20.bb => radvd_2.21.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb => radvd_2.21.bb} (93%)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
similarity index 93%
rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
index d02433c5ec..7f4cb41431 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
@@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \
 advertisements hosts can automatically configure their \
 addresses and some other parameters. They also can \
 choose a default router based on these advertisements."
-HOMEPAGE = "http://www.litech.org/radvd/"
+HOMEPAGE = "https://github.com/radvd-project/radvd"
 SECTION = "net"
 DEPENDS = "flex-native bison-native libdaemon libbsd"
 
@@ -14,14 +14,16 @@ DEPENDS = "flex-native bison-native libdaemon libbsd"
 LICENSE = "radvd"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
-SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+SRCREV = "a8500f4035b52028c90b0a938dfe8cd65e38fb50"
+SRC_URI = "git://github.com/radvd-project/radvd.git;branch=master;tag=v${PV};protocol=https \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
            "
-SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
+
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/radvd-project/radvd/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


