Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1884.1795113364662336743
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wpu64MLz;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so119250b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113364; x=1795718164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBybS4H5uh9XpJMpzR5bImzcMTC9P0x62Tq/0DyGb5g=;
        b=wpu64MLzZhVb3+QCmxmVcYd+uGZrulDajDEV/O1WyH+MHGl8/hpoIGcQe+42uikHJV
         XZoFKeAPeWksxcbIW71JrQnLRopCQArzwNZKK9bGY7FbsImaYjgXumb5SjcYdFL4+gK9
         8qdrrFBjZ0rWhQwNbJ8dgQRoCNUo2W305CbAsFQkdMehFrvUR0xtvHXeZ5NavvkgcePP
         C5SOiLb5xLcpOMYq78WpSW4T4J/q733nkItgMdUD/Dak05bnPlsNI+VbtVpospnf4a5v
         LAzNw7tTcfIWtuK1Wu7HVc1p4j40qWtF1mlLfWsyy9XZzr4koidxHDccPl8TOAd7p7kn
         nldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113364; x=1795718164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBybS4H5uh9XpJMpzR5bImzcMTC9P0x62Tq/0DyGb5g=;
        b=M+qNxLmafJFcRhKgRw2Qeo+o7y7X8hYftlB+Oataq6dOTnsQX5oaTlqik6vKXo/QRc
         loh5yjANjp4xDwEFV39t77hQVq4PUBShkriLJu2QG8Lu3jS3N5YuoG58+uCsqczsD78h
         fXkj2nut7amReo7p41R+vtu08lvNCT/1o0bDEY67lioVus7XJqf9pZnz4zXdYQGd6k3/
         iCDnkPRKEIe6bKxsOlXwQnY5cam/LN2WFhYLCgc9hzfyaBJynItOo/dsmN9nvlmx7oZk
         AyBA2rqA/+eUQNFWDhRGRYGoyUeshB0TKoX5YEkiAb+q6u2CEY3jYn+2TcUyjgjybqzS
         y63g==
X-Gm-Message-State: APuU4Z8xXcUxnJqXRdXhpai+jHSW54OQT/wzDh29VzQJPSyt6qxgR7GG
	SxEoTBpDs5MbalMBZG7aWtZv6PIobqvMY6YDEUBAc9wdv/qJC7qY+Xdtk9kOSg==
X-Gm-Gg: AYBFou0rapTRrN0/h9+ISBlbzHssigoVeYx7RrX48PBPHIicAGBPLD0iIO6UKvF199H
	yGYEjLk5ghqi07WvAc1kFuQwqRfJvTqtd3DxKDIhmSczpP1ra639Ry2C8OE9nMCyxHln+WVjgsQ
	BgXJBt0QHs61DMzpy3BkMVyAJzXIPJsw58MykLYdCLpHz3xFw3mdPGRPp5gle78oDPvh5Qll0+6
	6USHuogLqgAEqthIdhXWI4jX1cyjLjjuE+P7UfWCJl3tbOVDBF08nwwmeYZYW6Y0EjWD9a4zwng
	P9fIaJrBZLxiRVEcQYCdKnX4wLsHCSHZ7XcbpC5JSz+e7Sy30VmT6dCYk6Exsrz+0RNCwAeRm8O
	O7CsuUlrPruSpNx7bd7MBquzOE8eTxlj2N2cYc7iH+kylIz0vmzjEexkIIpBZrkju2HgDZ7FRLn
	dewwiZNOlik0ter1kwsYLsYwSk0Ng2tT46Gw0/OwURlDnpsamUUCAkE+cTPXkyF6deEDOGSe6C6
	Ac9wEgusFGq9ZEkbxCUTp2JbV1/PuAVxEScwzD4GtpIILOYNabmBjLko5iJu3A/ZR6WsjuSgoP1
	IO/Pu/QwVBz7b7wO18k1ENZ04tC15po/i9xuOPKMz57heXhTwcmR9vHfaLR4xQ==
X-Received: by 2002:a05:6300:670e:b0:400:7003:55c7 with SMTP id adf61e73a8af0-4014bc549a7mr460369637.29.1795113363971;
        Thu, 19 Nov 2026 10:36:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 04/64] proftpd: upgrade 1.3.9d -> 1.3.9e
Date: Fri, 20 Nov 2026 07:32:32 +1300
Message-ID: <69f561efbe074c956dcb51cfaedd4cfbbd2a9d5e.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132694
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/proftpd/proftpd/blob/v1.3.9e/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 412e5ad57594e15e1e2b679e71983c77ea453a16)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
index 5c194ebb23..1fe9908f0c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "f59f248e26bdfa514443e42bf72a145641df635d"
+SRCREV = "fc3f908a0d07fa3b17fbe1e3054b7520806bc75a"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
