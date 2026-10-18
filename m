Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57DACCF2D5
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9884.1792302978322111358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FkjDuVzp;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so3147704eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302978; x=1792907778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olR67H1yWDkuNUuMywC5joEqvdnWzPWOczx6zMc9hLk=;
        b=FkjDuVzp/4Be5Y+USmHv5XWpFg2LsOTMga45OvdG8I3Izmu8JQV59kx3Xz5Om47ebs
         xHw8cg2nhixezYkJgDIWoKw6fhSszNH/ZjTcRaidcXyVHtaQMGn08VzKOy/zWX4wN2uE
         QDqsPou4RUfamrKC45ieZdQIKVnDlDXrkxy6qcMcoejPS0TC0SHPFIuXyPQ65COR3V3K
         YxgmE7N52JsSw4n53/S69F0jGetIRDhOqWpIi5yIf4SOKE774x789t+73ydw7PeZOveZ
         74aDhNWvcH/Mjzngbwc8ReTqDn+Y6xQNSQPZ64W4u7hK7NwQG9IGD16yg0KhEB5X3fq0
         Setw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302978; x=1792907778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=olR67H1yWDkuNUuMywC5joEqvdnWzPWOczx6zMc9hLk=;
        b=p8EisZ1rwPYcOENtMPRwsSDBlaOHUVXf0GZqCBDqRxQsMUj9h6yIUpyyfabxoIebPD
         OXfOVphv0oDuja6AATvSo4/l906qOJFyUToLCGWLddYOejyAbokZ3UNuIyDHxiTmFpSs
         SNvJYHlzLM6N0iXZV1Pq/gCnbdMUzKuDQTscWji4D+puyhr2lhrG8D54ZHEMKBfGmjpb
         Qg0FaNWsOh44tp19gq+RJBx309tPSSpSLq6AnF2Y5j27gxZgeWRwWZ2PnfQJg92nqn0q
         BEi0vioUXxXI2kZvpES9jTngVgObo10tLXj89mP6xkqepJH14XBjt29lpqIFAqDQc+el
         VjsA==
X-Gm-Message-State: AFq9FYI59LVtpXDQeANUYD6qSQKfeYt2rZLkdIGXq1iPdltCFUnWNtVQ
	T6Uet1SAdmglrb/H8VxnPUWPi/hwgnWAg35/ecUKLYVg0oiFnIvyEDLfAJe4fqPPDA8=
X-Gm-Gg: AYBFou0snHjrTrUWjBI3045C80/te1UgKn7qSskuAv16KOekJw/Y0SCOb1bbuSVZSLF
	W8Jcms8ZA2azqa7EXP//3jPv10ZLCamGcfwj7EAZg5DAHWdut+3pAIIyt7SC3oHu/kF+rqmqPVJ
	h3dZTDE0fDaH/lFP4L2OULnLIzYqr9Fk1rWnrMIqk1PqiBQxp3TNBd2XrWUvx0Ciamk7AUNnFNP
	XS2hPRW5krZo6zgk1nnb9vEV12p4xAz02qMlPipanRxaeQugrnK7OoEeko7hMfAzcizneZYAZMp
	eoYZI1gSmUimylvRbTFthBovnR2zzVo1OP4xf9b5Mx8znncl2FvGckeeU+gFytrptMovDjFrtmB
	gUSPwSLvnazRhdF0AW+GhzW4mqZOQhI8hacpJKpul40Pmr+4qA0VgbCaRKgdKbp+ZJ+xV92vip7
	xwUlrjI9Plc1fiUohVix4AKax35FVcJ6QAFwVhj17fZvQUfbUnxjox9FuYqD6yu/fFezrF01OCB
	tPJV2oLuz53Js7VSRZXCmOVxpTqVGQ8F5UqY/gEsZy1Ig9jroIycEz6not9L+Jpy7GGPedfjBo6
	2LSKepg+U/sWksVYdAfy5dHhclgDMePOoVTCrYCRRR6DaNvjVDPJdcQT3vuE6L3M78r+jkFIG9C
	P2vJpcDm0L0CBd5kdDiOjrNDojOL/FJShgirAlG40hXafk6t+8hK5JAg9LEnW4BHvk6pcPs5sTs
	uK8SnxC36K6213IrHEWt2eWnyJ5QxpWKflCsiwmL20I5I9qw==
X-Received: by 2002:a05:701b:260c:b0:159:125a:f863 with SMTP id a92af1059eb24-18512c38357mr5816701c88.10.1792302977542;
        Sat, 17 Oct 2026 22:56:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 06/11] samba: Enable build on riscv32
Date: Sat, 17 Oct 2026 22:55:33 -0700
Message-ID: <20261018055605.179605-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131088

Drop the COMPATIBLE_HOST restriction for riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.11.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index e498b30bcb..17d7d186aa 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -62,8 +62,6 @@ DEPENDS:append:libc-musl = " libtirpc"
 CFLAGS:append:libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS:append:libc-musl = " -ltirpc"
 
-COMPATIBLE_HOST:riscv32 = "null"
-
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 

