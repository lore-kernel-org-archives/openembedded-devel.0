Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.1268.1591500293877951916
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXFOk35L;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w20so7104028pga.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EGaH7MRELE3XUTKFO00wsrTo7u0DBXpWEvMJ5a0m7Gw=;
        b=eXFOk35LZ0gaEscPtmm9xCsP5GFWVrrcCNK2OYuI1CP6kfMKRRzs7h3DdYl+BI4UfW
         8Jwo/JRGcVw6Brr3hyjHY0FJXCR1cjeUKeV+XODvNwXeoRYx0Ek9WgDiVD2oJSoHEftb
         FwwxbpSXawLGdK0LIwdHJHDfnNFB7qRDUpIIdAgsV+VNZ3KVXrldwVKVn6wVWjOjRgwe
         Z8ACIQ1V8daxqPmQt1lpaDEVtqud0ceGOAc0gnUx6JSiB0V4WKwcwpWocgdISVKAKutl
         mvOJfuoatNZeFNiZyxPbEYZwFrXa/kf9T+AFHarbe+ASfPj2MA61CLRCNZg/0J9KRFmb
         Jm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EGaH7MRELE3XUTKFO00wsrTo7u0DBXpWEvMJ5a0m7Gw=;
        b=W3Mx2kPzwq6hgqOmh8tNe1+0WfVbBOp6pwrWmkf9zraGHg2y9ZUPb4MGpuBIcnwg/T
         Kc9LXhtlcA8t88ZZfZXluw22OQn+8cg4Vr4a6IgQ8vNNwtUCIoAY/wa8mkZPiYE60qrC
         Hqt4Upd4GF3XDEGk/cLfDvLfKrJ+bQImeNsVsqPJynJGsA413BebHfWIhfccsP2QgCyM
         3pk3sTQkl0C+ab8uD/frR70AQ/hBZ6ElettuANY/QcMArTeLpyhKOSWs/oUR9BCogBcF
         gtb8s2l7e2LT0BLY69EPCi36iDrpibRW9KvOcfhAs+VN+oAdCD9XyKvQXf1kzEudjtDp
         JMlQ==
X-Gm-Message-State: AOAM533nM96r3Cw7W/MJ0XFDCdr9Hkmiexyzafj+D/MS6HxAWtTVRGm7
	XkZQ5kF6AqC+bFvsY3w4fq1czwjs
X-Google-Smtp-Source: ABdhPJzn2sZ/Z4yTigXGqgC+/3/WIzgMDfxZpFmSUuYT/WtcSnrl6YEsOn+TLNkW3sSrdSBIuIP7PQ==
X-Received: by 2002:a63:480d:: with SMTP id v13mr2661160pga.286.1591500293235;
        Sat, 06 Jun 2020 20:24:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/26] mosquitto: upgrade 1.6.9 -> 1.6.10
Date: Sat,  6 Jun 2020 20:24:21 -0700
Message-Id: <749350cc0c1ca29aabd8e2d019ac62b416cf3c8b.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa615a8e6093759fd580217be79dc037d9c0d79c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
index de43aae736..31b5f678df 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://install-protocol.patch \
 "
 
-SRC_URI[md5sum] = "52f5078ec18aaf623b14dfb121fd534b"
-SRC_URI[sha256sum] = "412979b2db0a0020bd02fa64f0a0de9e7000b84462586e32b67f29bb1f6c1685"
+SRC_URI[md5sum] = "960f963b81b7f93982d7511cd28082e5"
+SRC_URI[sha256sum] = "92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.17.1

