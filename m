Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8086.1795739728535599047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dInbv/JA;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so17396898c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739728; x=1796344528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqcsLWqwGeWZEbe8hATpk7gxEM7k9TAot9+8zScASr4=;
        b=dInbv/JA/IUDriXobERkV77CAEMzstS05OBH6bR1h6/qjPjhLIcwscDorQEU4gr2am
         S9XlPq1BIR3pAGjW9E4nnBVSj59xM79xa0GuuWDeLoi1syJU6weAG6NmPxFJipm7eZ02
         VLs6AOAEWqI6jAF5Vu8q1+5N3cJkzthVp5ucTF8rqXJJrfq0uQ7FNW0OZdVGDmgcD8SK
         PE5HCus0YaN3//1HqLXOM/zFRhEih3ah0BMWxiVJQGNisECXEJUZMX/PJXBF7IEnrVno
         n+kG66yIDN+hqMR+LA3HzfA7TrUTW2Mlo3zYx9fVoRz1b4GBAZ5YcdkoWXLh8WGHr4nw
         xOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739728; x=1796344528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqcsLWqwGeWZEbe8hATpk7gxEM7k9TAot9+8zScASr4=;
        b=D0BEMfvlEiIJCOu/rpoI/z/7eE0UUkqixhgP1GsTt6Hkyj7zhXgNGlaSclNDlCkOkX
         i2UCqcHuAVSLanTQwBv0Dhm7/w4FE1fPz/7pBpK6eb6Js4mJvhUdpiSYwx7+cuz2Lekl
         WHeEj7CpeiZ+vQDq+LIedf0Q5bTHLOkix7cnVPrOyOM6OwLAZPqJq/jd9b014EXd5rJ+
         V6LkGRWUlSXUzoH8R52WqWBH6/euv8dmiuz0/DbArmUORUAS3vAB97H7HV/J2cwa7YXI
         ZkqJuFsGL9oQy3OQTM7ClqCptHpHGsi8Tww8qCvF7rOhzzfl1Xm//obc8k5Eg7KKCDMx
         iVGQ==
X-Gm-Message-State: APuU4Z9BWaqs/N0YxoxIJyS142Vbyu3x6wt8Hh4wGxsJV5HVpVhMH7CS
	NpY/qK3emdKi0vhNnNRzK5mAx13HvmE0vVtdl7NGASqVTgG8RoQWrixBh8P9vjWW
X-Gm-Gg: AZFdTZdNPynyYdIk73wbqPKgz5GZrE9LmXB/l9/JWBYzkK7Zq8ZBpn0PSI6LB0YApRF
	y05niZBgnGwkh5uXO3qns47Y9FxYfdUB2X7UPe1bcwTUTcmWn9UjhQIsipJe5D68I668QYvmyer
	Q2idTJquZhMH68r3ep/ZiC5SHospifV7x+iuVjYbbIK3W4pnMVCU7NmjigLXWF1AIbrnsI9KJOp
	BOTMO8Z0RZ4S8vBbQi3cyh0R2oE7gZ2T2/UV/nRnbuu2leLjut4YUp2P25P/by42+gzARJitpwC
	czIIGRBQRCko9ec3MK6YYaBqNW9Av1QWNPV71C5Xgv2bD4Fdi6XHRR5se9AXmAjvh520Nj2R/o7
	rUvcy4lpHKrM92t7L2aKgFV8TlpJ8MjwcU7cnJjKFbTLZo6Tk2gsPM6v5hEeY0FnwGADKMZSoPX
	YDBBc5XG5Se6t7po3DwQSFu+RgK46Z48moeCkmxO+lKWy/X56nDCJw/3ZyDeE2/ZFzOaeQ7RKyL
	ApCmbcEUNM8Ljc4fzcum9Q2qQJ7CX9Xf/H+QLz7n7n+AXnrtCET0arR/GwNHxuEH0aHEqBod6pT
	3i9//mOAb+VeDt9pTay1CQQg2jRA6DzydGhHgprtF406UC8XrrLMILUte44wG3VV3SKkw0Isctz
	GK6hu/sQ0Qe1xCkPG7m9k3lE+xGqlKgjnNHdj23okFNnbTbmUnLnd7xtVDEpOqm/JSRoyWvGYuM
	s4vA/6L/SVvx3wVL8ezPcB5Wgg71io0xCsrrzTv+F66D8flNW6O+XsELe5l47zTgr1vxgwxtGzq
	TKobraNi5kCGBR9yInoM4urgeIFmN8ixPj4me3xXcZuzzzZ/InB/scCUsphvMLDBB6n6JhWzkaz
	TUQQQw==
X-Received: by 2002:a05:693c:8083:b0:376:6530:248f with SMTP id 5a478bee46e88-38570a3717dmr26748765eec.24.1795739727878;
        Thu, 26 Nov 2026 16:35:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 55/69] pty-forward-native: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:11 -0800
Message-ID: <20261127003425.2166632-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133155
Content-Type: text/plain; charset="utf-8"

cornucopia has no tags for this tool and the default tag regex matched
digits in unrelated component tags. Track new commits on the master
branch instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 1d7e29ecc5..430b690084 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -6,6 +6,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV = "1.1+git"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https;branch=master"
+UPSTREAM_CHECK_COMMITS = "1"
 S = "${UNPACKDIR}/${BP}/tools/serial_forward"
 
 inherit autotools native
