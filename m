Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACFEEC1438
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 12:46:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17502.1772541961716279721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 04:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AdSAkV6Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so66730045e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772541960; x=1773146760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7d88WHscKOjlgCcMzXh+vPUL7BwBhwtZr4VodUDmsWI=;
        b=AdSAkV6Z1s/ZtkfQ4LwzPs1Dl5KTo8B09S9PaldQ40j4zFtXj78rQKFYuqL9Wx1GQG
         pKg8oyQHqy6Lj7AfwpzlT0cah8XtntGC0OEv7bgX4pWbKB/IfxBDhJGWEUwcRDzU5p1W
         ZG49oQ8jvHYKYRpPzXkVwncXWLqrSgVscsvtTSHkbomtmt6D1jA5cVzeUbqR/61ZrmCq
         GhCjl/2uWMdHNCqh2HUnOUJn5Z8b5yQ4AAa2U3qF967Gh+HnQ5BRzBTCGhp5Axrl1iBF
         yT5cNCBRIuWG6QsTT9DJrYqVq6b8DbktdksDGF8zVQ0qEDb5imRwxQz2QQUQ92ygoxkX
         i7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772541960; x=1773146760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7d88WHscKOjlgCcMzXh+vPUL7BwBhwtZr4VodUDmsWI=;
        b=Z1anpbRD8p76Gi7ApYpKn3XJdmy174GrA4aKgOxGsljE9ev/DwJwyaFf90urZq6YPa
         ALCM1b+/PUPADHrClfsnkZ0BZu2jb7qHanUlVp5zJ7QUNuha5feLNAeS4M40mKf7OMgy
         wr2nzB3hKQFEOriZ4woE/q7Km2T8nGVZX/IB8dEePBnT1eAZij+mRg1wXDjyv54rtU/a
         9CSETBzOcV3yWzYTDkCw5iymdS6/tknQlu/w9NtvAzhZ8zN3cIQegjufmthK3ln0xTfQ
         gelECuhrUcIZcBo56dPKqDdBwQKJ6muim2dCEtgtVOXyzq90VQo4/sSvpJm8fwv+WsBE
         J1zg==
X-Gm-Message-State: AOJu0Yz4axqui5Qgj3zEfaZ9xS1mOZk9sjRkd4lOQzmPP4x5nw842YRp
	CLAYXJ3OuDZYxHvKrty8lD5UC8SEw/fl6xnyWjBlZhZwIE/oTV7qfLhE4qY9Nw==
X-Gm-Gg: ATEYQzwW95OVZFzc1R+Qu8ooQR5t531z0sPCd2fLIfH1294beHYqAsD5KrvOoQJs1Wt
	gaz0r/0cbOsqSjUNWDuFWGGY2Qd1O91vDIYK3wfQtJWdHRKBCIq+AfcZnvnDnK7AHg5tdYQOOMY
	U3H5N4ezLRmb1ZZps/8DaS7Yfs5HlEz4ZMlYPHGR3sFEzk8B4d62xhsX5U23QKMegAXkqlYl+XK
	aoDYxsQ3CO0o0qvdbsopQLKNidDIT7f5GC6sHOkI1LF1L8QXP4YgqgOGQAlHbaKe3Pg/eAYhDIX
	zeOGqHiJ/7VnKO5cDV/jV5XE2SH1MPhuTustjnsUB2+APgjQIgRWghU3XiOAIDWOIIgKW7TccR1
	/F6FDJ7Jr2WjnoElWAAfXfWF9K0owRwHOh+gh6rkRhhvLr50ZVVhFdmdiC+e9mwpO+aJXSnX2Bl
	Sku6YEWaszpIwUGbu+rpsKzv2rCoWukxA=
X-Received: by 2002:a05:600c:c4a6:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-483c9bc0344mr264150645e9.12.1772541959781;
        Tue, 03 Mar 2026 04:45:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm514257805e9.9.2026.03.03.04.45.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:45:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] opem-vm-tools: ignore multiple CVEs
Date: Tue,  3 Mar 2026 13:45:58 +0100
Message-ID: <20260303124558.1994637-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 12:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124831

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-4199
https://nvd.nist.gov/vuln/detail/CVE-2014-4200
https://nvd.nist.gov/vuln/detail/CVE-2022-22943
https://nvd.nist.gov/vuln/detail/CVE-2022-22977
https://nvd.nist.gov/vuln/detail/CVE-2022-31693
https://nvd.nist.gov/vuln/detail/CVE-2023-34057

The fixes for the first two vulnerabilities are already present in the
used version.

As identified by Redhat:
CVE-2014-4199: it has been fixed since version 9.10.2[1]
CVE-2014-4200: it has been fixed since version 9.4.6[2]

CVE-2022-22943, CVE-2022-22977 and CVE-2022-31693 affect only Windows.

CVE-2023-34059 affects only Windows and MacOS.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-4199
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-4200
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../open-vm-tools/open-vm-tools_11.3.5.bb              | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 0e671b6557..3d3b2887bc 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -126,3 +126,13 @@ python() {
     if 'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
+
+# fixed since 9.10.2
+CVE_CHECK_IGNORE = "CVE-2014-4199"
+
+# fixed since 9.4.6
+CVE_CHECK_IGNORE += "CVE-2014-4200"
+
+# Windows-only vulnerability
+CVE_CHECK_IGNORE += "CVE-2022-22943 CVE-2022-22977 CVE-2022-31693 CVE-2023-34057"
+

