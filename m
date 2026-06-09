Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8530CD98C3
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:27 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81025.1781014878825821392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IdW9JQu9;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304cf518c9dso6855214eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014878; x=1781619678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg/8295uE1SIBy8WTachHMqyjP8jDyuPuczAx405kEk=;
        b=IdW9JQu9lQUSe8BEzcWkpNnMsn5WeMKxH0dRYf+Bc2DBMNL+a5XQj75NfCCAy7f68l
         ObegElOXr1C8jtFq9+o+P11rg7U9DgDhYiLmoNNLUheuMdf2CWIlj77VCgdiZclSGIjh
         +zfRCok/CpXWCl8zDzzfKs0TrMSiloelr2gKBWejuFnKa8Plilolbp5bEqXTyjvYKl8S
         uK6hLj1nnf2j/0OMZNeG4tO9m4x90b8O8GD9XIXxQI8rdu7uH2WnbLewDRDG5CM+6xXI
         QF5GhpVHIDfaFU8OVO2Tp+8a1VvKItnCuCY/yycPNEfDwFS/kjyPyPKqYxbrEqsEaylv
         Z6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014878; x=1781619678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg/8295uE1SIBy8WTachHMqyjP8jDyuPuczAx405kEk=;
        b=m0xCFPFWENI8xaFj1Qzze8CRVmyKI5UVYvIqFz7zfhHxVIKW0A9SIE8IQzlzm0fxZm
         Yp2Gy3RQCbSMaqTBooRe9XUJZlz4814+MNArYu37LISn+fchKCaesUTpvR+BvKkd/s6Z
         2EIoPgi1uRf+erLxsYgZrZ7TtqC4BijE4tl5WRhf4tdWM6pqp9RIuuvY1Gc4eSiIDNOl
         8TXKeqDZlvFrEs+PeJoVInLhPIitwZG6mFkOhovI2GyqrzGFknILVFbC9r1uN8xcMGsJ
         d2VUg2BkCVDc5SQuvQS7jetrcH6zWewtLKJ+H6RuTlXYg4vs9p669nlGQjfuwApDfM4W
         OVEw==
X-Gm-Message-State: AOJu0YzL9RaAHN4impwcDNFuRPadDs0gQuLhQjAh0rbLUC7aoqmPW/C5
	TsZITH8sgG71MPnO+ZCKfv0VkVaXtgueXjvGgNFpUUDEAqyXXb//tDT34I99wbc3rnKbgA==
X-Gm-Gg: Acq92OHtSn0Jc14mhIgiSmueWSSzfaO5hHC+hHUdzlzFSY6m06F31Z7QVEKSAxHwXLs
	qMCvS08Xo26rPcsyrtN/KEJPgo+R0MIrO8sabA9rZ0K7teAfVeXNLlfnYU/NrFfv+lsmVJCWEKZ
	WIiOq7dWpHFemdFUG9jYj4lOY2Pnm+YFG7+sqOcPPEO/BNprrhSPsX+ONPpfXHizQRGoAwPXola
	T0NQdNxugmk6+NJVdoLHcRSC6ol0LQ5sDd7nlXMHvuTVQu20ArfUaMusHwlS3MVq5I9ebbCj5Tn
	cyPkljNlD9iCX9LmC9xljlbVEXUbLzJxoL4PU0Tzlehh8ANikzhuwwGmYLP9oNVWUVItq9nQeiA
	tWijoi9rY5HayWn1ndlh58ylgVsL55z6dHFTfFwtjkXDcK48XpBaa2uUs74AuIGfhASg5aA2ZFt
	Z/potLF3mg4pkSRTNTbaJcJC99/YYcC1GtqCRWhYnkX4klvu2i0xcZMD85dLTD1isJ6fUvf9QpS
	VfN91O60aR/qsQC7cKnPaZGbZQI6gHRyGEsWkvqtRY7GZdW99jTvxQmopPLrg14IvkRK4XdIMJX
	YlMTV9qindA/O+JRO8+XLXf7bjJw83u/WlyrMsAUdZOhvi35Iu0=
X-Received: by 2002:a05:7301:5f14:b0:304:4f23:542d with SMTP id 5a478bee46e88-3077aef8be4mr12964672eec.11.1781014878114;
        Tue, 09 Jun 2026 07:21:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 10/11] libmodule-pluggable-perl: upgrade 5.2 -> 6.3
Date: Tue,  9 Jun 2026 07:21:04 -0700
Message-ID: <20260609142105.1439225-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127497

The README license block (LIC_FILES_CHKSUM beginline/endline) is
unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...le-pluggable-perl_5.2.bb => libmodule-pluggable-perl_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-pluggable-perl_5.2.bb => libmodule-pluggable-perl_6.3.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
index 108c965968..a9bebb4e21 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda

 SRCNAME = "Module-Pluggable"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
+SRC_URI[sha256sum] = "58512bb9c654746d0937770b98b559b30872d85ac24073485e5830890dd1b2a0"


 UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"

