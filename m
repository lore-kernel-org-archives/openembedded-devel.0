Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.2491.1622088621346794584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 21:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TRqNmClD;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso1624191pjb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 21:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rms+pT+bwV6BPrtSplRtly+ycTIbmGq/gW/m3EtomME=;
        b=TRqNmClD37+cjzwt+Fjj2xgwooQqyyR70KXqqIedkocRNIekrPWco8pLX+1quGMM0t
         6H5t7wHoUBdpea+HkbuAVSsnYXTrw7jidjHlXsdnV6Ojq2u9H4vOak+5wSaZEGpP3mb/
         AIAeQwHIS9Dv6hY/NbsvkqSzIQFvQR6iu2BxDBBF+KCJWuNmLV/Kg3gkFNOB8bz/a9LJ
         oKO0XRVQut6r5Mp4qNZfROQTPTDtCYuocpn4YkidJxOoBfGk1VPhyahgcpufBorZy+5F
         I/0DtfXoSk9o8rc0tgjvp6cW8UzoZqcdmJ9x0Oll5JtJNeyfQHAuwUDliuNiFUvLYTsj
         enMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rms+pT+bwV6BPrtSplRtly+ycTIbmGq/gW/m3EtomME=;
        b=DUAlCItr5YRW9d/wfuTq0we2lXHM8fQ3k2hfyY1OoldMU4DUyhJdBNO0sjp4hsOz4E
         OtGa00MyYJkqi8cAnpRmQ82oKRGuXYjSLye9TI+sCCbNKz730jUUulQHOfemtBOPku6g
         merfy10Qj5CbUlU6PD+836aeYZT9Vk3cuO4onLP2Ygrdv7ITnrMt8BnJttC78IQsVZgt
         lqpciaKOdNbBE+QxHl/liNKcqtAfsYrjgWSuGpMSPkBAzDM/QkYVkKoztYaHU7JpHx1E
         1R468HiQqoh23+LK0Zs260npAM2UistHG5OUGpo9GeccVkmUt9KrFBrurc/0g8QxRZM4
         QaIg==
X-Gm-Message-State: AOAM5310dF87EH45+AR2ODgTeYdkClABbWVnGgRJzhJ2puxCFsfg2mT+
	k5WiayHcWmIf50LgrZWyh/w9OmJqFdLnRw==
X-Google-Smtp-Source: ABdhPJy/A1xrQuS7PI0HohoxArCSKJLbRDez+zMNIeW6LZ5SXLzrULuQVbee48oRZam7Bft76TxWNw==
X-Received: by 2002:a17:902:d687:b029:fd:df44:4572 with SMTP id v7-20020a170902d687b02900fddf444572mr1450055ply.60.1622088620423;
        Wed, 26 May 2021 21:10:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id jz7sm649139pjb.32.2021.05.26.21.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 21:10:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] wireshark: Add zstd via packageconfig
Date: Wed, 26 May 2021 21:10:17 -0700
Message-Id: <20210527041017.1300051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its disabled by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
index f440328027..3100e4c2c0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
@@ -44,6 +44,7 @@ PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
 PACKAGECONFIG[libssh] = ",,libssh2"
 PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
+PACKAGECONFIG[zstd] = "-DENABLE_STTD=ON,-DENABLE_ZSTD=OFF, zstd"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
-- 
2.31.1

