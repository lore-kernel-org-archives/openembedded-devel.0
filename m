Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDA8ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 09:36:22 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.49036.1725874575591563797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 02:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XA3IJv8h;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d7a9200947so1106180a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725874574; x=1726479374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6rUHeJUmpSNJlM4he8OMpDhGRoi1d23URk/nsE0w/Q=;
        b=XA3IJv8hVlvT9ZeVtHRfPxB1kVdJBKBYYuxo2xMiXtuXoH29UqAMJhd5EUMdiSxyAu
         Kfx6at+z/KFjFawNvm2yVW2A06GZegibslrgp3NMTshIeYqWo5vKmeH+2bfeT/U/aluQ
         HBuvlt/nQE3HcMeg4NPw14/jy4TDqfVnhjTwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874574; x=1726479374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6rUHeJUmpSNJlM4he8OMpDhGRoi1d23URk/nsE0w/Q=;
        b=pqyXkSuYrrUxUm8eHn/TNtQiZdMVRGrFqHpC0tOSJ29WFfTwVjingkW6Qrwm5B8Cwk
         EAsjZM1FEd+HBFxI2wPGi2lUnl+9Hc/Fm1dOhIKV3fnYPyXHUVTMDwTHzOSuIdMrtotC
         iTr6d5N8Gf2o32VQ1qYgb9WW+vAyacvOh13/AsOfnNNhPt1Fz/VWYqZMdQRn9aUS0Yi/
         M7i9+AFEyAwIGYUMm2SrjSo9IpYOP++ACmBw1JpEqeJyLeiFbzEKilSyU/QbJZ9XKGCA
         ZJN1c6+NSoMotRoOboNYHlOj4JcJsMspfIkfMdGLviT2vHardgWdas6sG881zE4o7rYs
         6FXQ==
X-Gm-Message-State: AOJu0YxftnhEGVd0u1y4OdSUbBcF0yfzujpT3hW+zWRJZ8jkzSftNOA0
	ua0CeM9V6/Eph/8OcMGb1dUGrY27w5Psmq46zmjheoLV9MHImEKsasTLecpqO/vyIyiZUYu02nQ
	1xJk=
X-Google-Smtp-Source: AGHT+IH+VEbqJboIIUN5bk66OB9oYCIvmG5Gs23qj/8eSZKpTmWpZvtqt5iIgUZJ429RX7qUvZr7lA==
X-Received: by 2002:a05:6a20:2d14:b0:1c6:ba9c:5d7b with SMTP id adf61e73a8af0-1cf1d0f98b5mr8952221637.23.1725874574314;
        Mon, 09 Sep 2024 02:36:14 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882e:b9ce:88d4:7210:1e5:80e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e34094sm30448735ad.100.2024.09.09.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:36:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][master][PATCH] wireshark: upgrade 4.2.6 -> 4.2.7
Date: Mon,  9 Sep 2024 15:06:03 +0530
Message-Id: <20240909093603.2216935-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 09:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112176

From: Vijay Anusuri <vanusuri@mvista.com>

Bug Fixes

The following vulnerability has been fixed:

    wnpa-sec-2024-11 NTLMSSP dissector crash. Issue 19943. CVE-2024-8250.

The following bugs have been fixed:

    Fuzz job issue: fuzz-2024-01-31-7745.pcap. Issue 19627.

    OSS-Fuzz 70534: wireshark:fuzzshark_ip_proto-udp: Stack-overflow in dissect_cbor_main_type. Issue 19935.

    SOME/IP Protocol heuristic dissector fails to parse. Issue 19670.

    6loWPAN: Page Number Field Incorrect Registration. Issue 19934.

    PacketBB incorrectly reports "Malformed Packet" Issue 19972.

Release Notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.7.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.6.bb => wireshark_4.2.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.6.bb => wireshark_4.2.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 246264040..b80710683 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "5ec6028df29068d889c98489bf194a884b00831106fea1e921fea3c65f2003f5"
+SRC_URI[sha256sum] = "2c5de08e19081bd666a2ce3f052c023274d06acaabc5d667a3c3051a9c618f86"
 
 PE = "1"
 
-- 
2.25.1


