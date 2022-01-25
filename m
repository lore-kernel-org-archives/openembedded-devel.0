Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1A8C43219
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:09:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.167.1643130590913796036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3sZEYZD;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id p37so20361944pfh.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7+csvPAWxWK03B5gyRHpqKLBFhGuN4Y6a9spbwNeVHs=;
        b=X3sZEYZDPhBpSzVlAr+MtmUcPPpsKyJsAXnbCGG/qJaDsvvfGmYXOUsT3TqyFDc7GT
         r0oqxF9jbFCiiVeFlg1+AEmlzJN4kZay/P5sn6IOQF8Qnher0hgJXvfUAe+stOUxagup
         4S15vZDX6e2Wxbc+VSL2bigVdIcuYv63YNhvkoqHEVvHKumZNS4AdmdjSsvMetBE14r4
         C8bojk3/OBxniOTMR4zwEDLPtZaHfn5nGykPzi4RM0W7FOrbqrCYRJWaH2PC5tBLSmwI
         /8C7HBR6U5oHWH4WGu+VL4nm6CDQ4t1pkwVpl9qtrmYjHmRdnAYVku8xUm0Z5Sg9iSpg
         U57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7+csvPAWxWK03B5gyRHpqKLBFhGuN4Y6a9spbwNeVHs=;
        b=S3FAAtBBjTnjyc+BNh3Q4DxFqmCEogPX0WGex4Ymck6nroUlOhSYABcRA7s+gRlCo9
         HjVRxnkXUM6Vpb5+eL0BFsy3qVtfkW5f+C/MIAc1pGD8peJ3YmAyif2l8DPjj8GX9Ncm
         Elbf3vl3mv/pXWpDmP5GEezfRBTNXwW288nxVbugLNLQV08HH+r1QhHU0O2y3tnYvZeI
         kmRJCA0sOhPczK68UZHX6tTjroTz6OzTLFHVC2jfQLEclQbz63J9FO5a94+BJgZwvKjm
         8SRCb3qx6gUh7O8DmDnjiVQnnqfC6WTn7zsYvEheMgWCu69o6oLtNj4gLoz6UQXh13iP
         6CrA==
X-Gm-Message-State: AOAM533yNQuiwXSEFMhojn8iKLfYid7594L+RNDfdTTVhl9rNwAWNjCj
	PskU6vFmav5SamGJ1lwHYNZ7XKnNUVNT0w==
X-Google-Smtp-Source: 
 ABdhPJzWJxkEWofWvjY5w+QyIRSf3gj+54qlQq3R/D8SSPrw2aAq3IuJyHp6eppACIvd0L8iIQ2fMA==
X-Received: by 2002:a05:6a00:2442:b0:4c5:75b4:d53e with SMTP id
 d2-20020a056a00244200b004c575b4d53emr18940434pfj.49.1643130590191;
        Tue, 25 Jan 2022 09:09:50 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d69:3d63:6b0c:a11b])
        by smtp.gmail.com with ESMTPSA id
 c7sm19010371pfo.131.2022.01.25.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:09:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Update to 3.2.18
Date: Tue, 25 Jan 2022 09:09:48 -0800
Message-Id: <20220125170948.10637-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:09:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95076

From: Armin Kuster <akuster@mvista.com>

Source: wireshark.org
MR: 114425, 114409, 114441, 114269, 114417, 114311, 114449
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 8663cdebb2f10ee84817e5199fa3be0acb715af9
Description:

This is a bugfix only update.

Addresses these CVES:
wnpa-sec-2021-07 Bluetooth DHT dissector crash. Issue 17651. CVE-2021-39929.
wnpa-sec-2021-09 Bluetooth SDP dissector crash. Issue 17635. CVE-2021-39925.
wnpa-sec-2021-10 Bluetooth DHT dissector large loop. Issue 17677. CVE-2021-39924.
wnpa-sec-2021-11 PNRP dissector large loop. Issue 17684.  CVE-2021-39920, CVE-2021-39923.
wnpa-sec-2021-12 C12.22 dissector crash. Issue 17636. CVE-2021-39922.
wnpa-sec-2021-13 IEEE 802.11 dissector crash. Issue 17704. CVE-2021-39928.
wnpa-sec-2021-14 Modbus dissector crash. Issue 17703. CVE-2021-39921.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_3.2.15.bb => wireshark_3.2.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.15.bb => wireshark_3.2.18.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 36e84d0ccd..9c234cf3f6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "32f6cfd67b00903a1bfca02ecc4ccf72db6b70d4fda33e4a099fefb03e849bdb"
+SRC_URI[sha256sum] = "bbe75d909b052fcd67a850f149f0d5b1e2531026fc2413946b48570293306887"
 
 PE = "1"
 
-- 
2.25.1


