Return-Path: <mhei@heimpold.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CF0C7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:05:47 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
 by mx.groups.io with SMTP id smtpd.web11.39045.1686499540272726267
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@heimpold.de header.s=strato-dkim-0002 header.b=j/uWoTnM;
 spf=pass (domain: heimpold.de, ip: 81.169.146.161, mailfrom: mhei@heimpold.de)
ARC-Seal: i=1; a=rsa-sha256; t=1686499538; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Qgiktt2Xlf8tDnK3gQ9Ta2v1DbfnqsnuARPZZJF1bOURHdWMNbxVXpAOCC8MOvScQy
    GKdUrafAqKQK58UPZoiNxrwbjlJypWCW4KAEa2Lm4jKmOooh4a2SZQaEXMwE18CG0U3l
    gCHuUruMPZE8zy93y8z06TomuY1QC29+XTkC4F8LSy1bIQsxH7no1xegttcRylbbZNDA
    +p+PAevuJiG7gFub3qanVMLq8L0tuSABhoGnREAV6umw/oHd8RTmkLjGalZF5j2migmT
    JqNKnUWRUo56OxV8F/z3wwFrpHy5fWoYOmMs+gGg8/exn3rNzroOTu8KpUhsiDTvXkwb
    v1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686499538;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=o2j/dEBuiDgcwgZlDVx5jiRsdyhUv0dnjqw0h1amRcA=;
    b=Gcbh5Y+qzx8S7Q7rbhVdSJyg1BKvoOcl10vly/b4gZWw1DJ7YUGj0/v7byDRXsY0za
    Mqgw++zqrVi+52sYkb1t6N4Gj0aChTZ1uo/f9mU1umaCNOppvGkMOaqJUF9LbdDWcglV
    Xkv6vJNIQUfvv2joI1M2u2Lh1DLmgKMeN95FnRX8ZLQMFEsYXQPa34SZHk+K4uxdIkf9
    v9AlihOeuicmdcNIDc2uhpKyVFGoqq+JYnmZ8Sx1X52IAzuumArFNPEN63OOrseMOZuj
    R85MSrLY4PHwLfCdFctqtZMSG9jNN4vciSUaCOJAabR3Nir7t6IVSnBkq/ETV48njOnQ
    mZNQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686499538;
    s=strato-dkim-0002; d=heimpold.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=o2j/dEBuiDgcwgZlDVx5jiRsdyhUv0dnjqw0h1amRcA=;
    b=j/uWoTnMsvIgYkXQArNUIUTySoYZr3LA02Yn7h1Kf/WLJOZues6UCVsTs2h/waS1jp
    td7aYA2iQcog6QYgOq36Re3ZWnD/CvN7Vcnr1gO+PkbGqUGAu2M+4W9ldqZkbdm9Ifzs
    LzZDS5bfUMAe7xVVjKg6gXuycpYw5RYaLJVLbe3iyBjnxClhAuHmibNaobGT5Nzo+iJX
    HCdjwvykmb3nL/n1rte4y+cS/sSL4pkFSYjSCw8kkL/td7IM9IBZXbrIf+ECK9+tXanZ
    Whk6yHvunV8prikw5ufIDR6Kvc1oT2IL5aX7uRvXTOlh5LxW5tKZLpvCMACo8uqApKhy
    pGPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686499538;
    s=strato-dkim-0003; d=heimpold.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=o2j/dEBuiDgcwgZlDVx5jiRsdyhUv0dnjqw0h1amRcA=;
    b=l4/PHFn2aiZGbRkOQrCayi/hXxQIZkjCPrWWT6pTO3t/g93Uz4fRxzWRLaYKkE2LYc
    fsf8zbOudCQtLwatRPDQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EW8QnKjhhg/vO4pzqdNytq77N6ZKUSN7PfdWTGQORRBv+ASfYPl1MvFM4X2OOwFN3T05JIGwqYe9QOQetOwFcbxJA=="
Received: from tonne.mhei.heimpold.itr
    by smtp.strato.de (RZmta 49.5.3 AUTH)
    with ESMTPSA id Debb7az5BG5bdTU
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 11 Jun 2023 18:05:37 +0200 (CEST)
Received: from kerker.mhei.heimpold.itr (kerker.mhei.heimpold.itr [192.168.8.1])
	by tonne.mhei.heimpold.itr (Postfix) with ESMTP id 6508C1527B3;
	Sun, 11 Jun 2023 18:07:55 +0200 (CEST)
From: Michael Heimpold <mhei@heimpold.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Heimpold <mhei@heimpold.de>
Subject: [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
Date: Sun, 11 Jun 2023 18:05:29 +0200
Message-Id: <20230611160530.392975-1-mhei@heimpold.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 16:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103205

If my git skills don't trick me, forcing ARM mode for PHP
dates back to year 2015 with commit e836f8f93.

I wondered whether the compile problem still persists and just
tested that it compiles fine for qemuarm nowaydays.

I also tested the binaries on a physical device, a
NXP iMX6ULL based one, and did not notice any problems
so far.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
---
 meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-devtools/php/php_8.2.6.bb
index dad955452..404ff393b 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
@@ -284,12 +284,3 @@ do_install:append:class-native() {
     create_wrapper ${D}${bindir}/php \
         PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
 }
-
-# Fails to build with thumb-1 (qemuarm)
-# | {standard input}: Assembler messages:
-# | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
-# | {standard input}:3720: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
-# | {standard input}:3796: Error: selected processor does not support Thumb mode `smull r0,r2,r3,r3'
-# | {standard input}:3797: Error: unshifted register required -- `sub r2,r2,r0,asr#31'
-# | make: *** [ext/standard/math.lo] Error 1
-ARM_INSTRUCTION_SET = "arm"
-- 
2.34.1


