Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83545C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14766.1782634376747383878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X8tKGaWU;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so251188eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634376; x=1783239176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW85775eu+XrKEuC4AIq21y58hpn2eMQX4v4t176pAw=;
        b=X8tKGaWUJqoHyNiH/5l0OvKkTqRvmGzsFKJLZeCjjvSKYYLWkQBy0P1qMNRKZohZ0p
         UobkpdHpVF9SNQkwvYj9TPxsyS13QQQIIxMSFLLv3dFokyMZuwh7DfJImu9WrFHLBjal
         vV7qaeJRoIM0J6uAEXwE3AwhnALvnY14HyQjA9VuWhQS5jz+nemck1JDb+6NC60K8ZFy
         /BrpmLiFM/87+L1xUkgXSCzr44tUWZ/MG8ad0rEF82vahqzTxQBLl3ffgBPCJQXazVdX
         MyaQtaWjNgcNJQFdF0fH1gNmpwmeJGSmXckCAGQommblE98zMQBr5hIViFnS2I2f3i6v
         cLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634376; x=1783239176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VW85775eu+XrKEuC4AIq21y58hpn2eMQX4v4t176pAw=;
        b=OpvIq/ghEhUvuUQho23SNKMnrOIr4EtBxeu79x6j1G1HZohv4EWbKtPE90LVJSMIga
         egOYxH9GfjrSEECaGJf4PBoJvMkIRES6U2LAGV4D8sgbRqw+4P9eGWTyuqYhzK5empmh
         iHxl33Oeu3CLDnMpyGu9WWWF/8PthNi5bIwJiM6EoJgr62ukPVypccqZC0JPsw1NJAuN
         7pze0ypac643f65YzWsnI3rceSvyoM8srpDyOEXV8EETFPN/isTdzyQln09ucvyf9jdy
         U/EqCJdFiel+tG9jlxzN548y74lMWq/7JbMEPZzfWWTcVFjawxwtA+1HRNQrt+upQ8v4
         VwUg==
X-Gm-Message-State: AOJu0YynRJ80+ueBLRySXiulOyhaUsdW0APvwNOHr+t9uQuQ3MLomvCK
	5qTAaCiQPFg8Ho8WCyHHQsUonaZoFlhHs/wOaJ9S24zbpExqVOleZqmYPTTIy6xrY56KHQ==
X-Gm-Gg: AfdE7cnRSFVXuu8EehfvM7TtYp1PdVBwxEvOsZPK0wqu1S/WBaVqnlMPEkQtB5jwAk4
	eV2V9jX0uE1D7vlXWUJ01g78sqzhYFeTJVjlWJejkbBL4noiXjOBF9qAKTUb3YkEXZzUKMQHnNU
	Zeh/VYFUYXTn7O9T6H4uOC/CxV9whL02dc+ZpZ/yiRTyYlknEXxDB3UiB2zXaTIBZhpNf6oVtwN
	bWtWQZkI8Qd1cYbhqXu4jMDp859pj/xrkYMb5wqJbu6CTIr3GlN4s6swH1/mPrumBkelLqZnk7M
	n2mS3MfRova7RG1mGbW/1yk7WaWWt0glgAPhwbSa3doxy6wQW/mJU36eX9/bxl+fwNxOSzpDj9k
	GpjrWwI5BRYEGiC/gEQLjo0ihR0URLQ/K90bz+R9i407I49s9eqyPD61Jg/2Gwj2kemEypPpfJ3
	UnjL4K2pRXn5gVaYMTrM2dSDtIs40b3iC3tKivUDlkpi9ms8lKkqsKSxGQmvY2fYbi+Wy1Gct+6
	k/MvMZD02aR/buw10Q2PjEq0tQ6Pzys2ZEzeXd316mhnm8JE6NERp+R9SSPSG8P4oAk+HKiERdO
	e+Uv5TVZPiBpkAbKMTc2Bs3e4bYrJRGjdWA4QQSB
X-Received: by 2002:a05:7300:578f:b0:30c:7dcb:c8fb with SMTP id 5a478bee46e88-30c84d51fc8mr13066026eec.11.1782634375918;
        Sun, 28 Jun 2026 01:12:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 099/128] libisofs: upgrade 1.5.6 -> 1.5.8.pl02
Date: Sun, 28 Jun 2026 01:10:50 -0700
Message-ID: <20260628081122.178348-99-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127909

fix S for the .pl02 patchlevel tarball

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../burnia/{libisofs_1.5.6.bb => libisofs_1.5.8.pl02.bb}    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libisofs_1.5.6.bb => libisofs_1.5.8.pl02.bb} (62%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
similarity index 62%
rename from meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
rename to meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
index 0add3777f4..28ae0766e8 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=1c1e5a960562d65f6449bb1d21e1dffc"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "0152d66a9d340b659fe9c880eb9190f3570fb477ac07cf52e8bcd134a1d30d70"
+SRC_URI[sha256sum] = "10bd584d8f00d8091e814902b9f0a3e209f16e938f510fc23ba05f3fa469db5a"
+
+# The patchlevel (.pl02) tarball unpacks into a directory without the
+# patchlevel suffix.
+S = "${UNPACKDIR}/libisofs-${@d.getVar('PV').split('.pl')[0]}"
 
 DEPENDS = "acl zlib"
 

