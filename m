Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F3EC44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14764.1782634374009702463
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jgJVHU4l;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so833172eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634373; x=1783239173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGrjTnIyVIBaaQf91niovDIjLltrh7xY51l9+ETq3qg=;
        b=jgJVHU4lPdxpKZO8dnaiBUhWqYr9OXSXh4IkoSY54ygDoqBQTjO8bZxL8hfK/pxPWq
         yLbP+CSDNSjfcrSfJLVYpUpJiaI1ADgTks9ciXSz1fAdPslEJ9iBdril0XXv9NAqDd3p
         vaHYn1z3gGU7HcL9PrERqjs1rxU1sI/4G8RQLLJYa1/vOmUs+AruPMOE2ETm7pikmbd/
         fvLtZ/9svQWlySAsL5NiUOLIhVBN3f03HmP8p61sGrPgUfdKGYZ2jmRa8ssFTy07JNtm
         Oy45O7qPwrmLtNqSRNupOUvAuk9B+beLKm9rRmNrdP0mWhLXSFr+50omYTzKb6PDrauY
         l3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634373; x=1783239173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGrjTnIyVIBaaQf91niovDIjLltrh7xY51l9+ETq3qg=;
        b=kKbSpiFVWczj0AtOv81gwT3cCRCjpWfGtOVorwhurSL65LcJLeXwEv4Q/qwS1QXun9
         lMdADM4st/zx+yd8oOALYdTAzsawYrZ4AX1yY+ibuNb0beQH3fXeEX7HwPfIP19Mr7Pe
         IeAu7fcTj7yVgw+tTOFq6eoiYiVNo9YMwmyBj+nKfZIi03DvpmQx1E0Mq+jp0Vz1rdlJ
         v8IzVEojL4/K2mvaZCJ5C9UAUJEya7JGzSYNtsASfGqq8B3SdO+YjIqSKqLggFPdLVta
         CpvYIb6kU0V1ha7R6mbzX0we1ravd8CR4wPJ5JlubYJyCc09vNYaYOmn1zC1If1JteEN
         5hgw==
X-Gm-Message-State: AOJu0YyQZq5LjwjEwTGXmppJZbD8VUTXly3pU8eu2TNMoObNXZsRxTMz
	uJYBvFAeW7iyAvH9zZxmobk9uiuTP8ktZTgFc01kQzRTWYzor/COeUgF6KB/RWZJoELyzw==
X-Gm-Gg: AfdE7cmSuyvmzsPCSmS5Uem9iQzto9ZfXCFgnEKqQCp16lXMyXAIvxilCecJrUh6FGH
	faRrLjRoyQy0L6yHHxrEoalqVsnuMWof4Junq+awXFF2jkjHLs65AxCHud5ctmWZtpIgN61glF1
	nCteeI7q3tvOxbGc2TMxeft3WvGS+wnsvclAd9l1WfmYwsfWLFKIqdi9Es5NYIVlLxaJEKbzZcV
	rcc2LBjcoYDLNVnJQOIE0hYXsdFLLD4Ir789Ak3hClWUaZVR3VtKxeELDmIcOOOBSmNTs5TA4Y+
	aL4X9+hMaJoIEcu6SN74dsYX8Pr7iIaSiCQMS3MeQ94Tgm77ivOzso3YbrNQa7nyVnDGxsRLJYz
	cZ3o8IauKcfHkK3p5R0y8mmvk60BpxydOgOp/T1F+GPn03uTcl2VrMFKHnNlkmxb3MOrEwfVkdI
	F4jin46bpDBbXB/mIilvB6uWlhR90W7lELLPoK/pP3btwKE+0IBMrCW5pdU53cIauToQaZP5Unt
	ZY93jKlOmf8P5YCkIj3RI9Nc0PcHs3ObrcFawrUL/XuPfmFh4rQbGalEV4OipGfDDPUHeJ4n/hJ
	T9+HA0DZp/5LgCwC4CGTFHp1qbcE2Q3W0iTs/5a/
X-Received: by 2002:a05:7300:7b83:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30c8511c2f7mr14010813eec.35.1782634373356;
        Sun, 28 Jun 2026 01:12:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 096/128] libextutils-parsexs-perl: upgrade 3.35 -> 3.63
Date: Sun, 28 Jun 2026 01:10:47 -0700
Message-ID: <20260628081122.178348-96-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127906

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-parsexs-perl_3.35.bb => libextutils-parsexs-perl_3.63.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-parsexs-perl_3.35.bb => libextutils-parsexs-perl_3.63.bb} (89%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
similarity index 89%
rename from meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
index f5b87ff896..73531a82e1 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
@@ -13,8 +13,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee0c05b86a474ae2b6"
 
 SRCNAME = "ExtUtils-ParseXS"
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e8644b5f9a57cc4ee1c"
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d19a3f29288f0950ef8f1838db99270284ba475758246f0e5ab1113a9d9a7548"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 

