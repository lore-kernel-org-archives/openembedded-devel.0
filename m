Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.4835.1592688034144475198
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 14:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OrsSYdae;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id k11so14067655ejr.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jun 2020 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=60tZOATMM6ovnfSVQk4zTkrk4iyy8auUbO+F5ikqJCM=;
        b=OrsSYdaeTHR2yedOjFUyRb+OjC9FIGvWN6fnZ20qHXUbXP/5+ymCWmmPOXBUQo3uEl
         oBLqtmOQP31OSYL1RBLNlIFxbAfSEf3Q7zfedbAKefdh2J7NrqScvn3WrVedkBlz8A7I
         OWXz/NCQ+Mv8SnZpmjHp4vwYWECWUdI3KMGwXzRIXTCfuSo1YM2yuu0FjBal+mdtcM0Q
         5ruw+hI/w+R4uMEMR/4rUn/RLBE7GFaj0fYrqooWtvjWIxrDatel2C7AOn+FH6yB6iB6
         ImGdwjx6Gi6zDC7FTgNXRa/aE5LuyjKeNTWV7TL8kcw7a9oZHHuvcgTyWmHcTABNHpJA
         lfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60tZOATMM6ovnfSVQk4zTkrk4iyy8auUbO+F5ikqJCM=;
        b=s+j/RDbDBhQrEfkTrdsIdWqueRB/OPGY4KJjj5PFBKuA32ykRdszGOmWGon03vgTVL
         fEujcBbglPTT96O/rwra05SIT5mulCdEsplUQ1efR7uFi188H7rJqrHKyUcJWIVUuv4Z
         7HddOrS9JQeOeL8ONIXb/+lZ1orYdq5XdFDZ2GFgx/xgkjV9x3LkxpQ+mFjQ2TsDtjMf
         EILgAtQ1RFFL1XJ3UOGETXjkjPSw3V5OTImAJiTGkzgpH9krQVq5A4/VW0HJcvTK+m6/
         L9vH9nHeII2agQfKHVbipTN80i3UAQiGY+AB8YzJfAvgLUT0ZPpT04ZmrEuArdDpDNrv
         HXDA==
X-Gm-Message-State: AOAM532gsOcARNMrUHUBfvYuarNhkyQwrdVB4WxOyITXIEbFm0ZMjtcD
	d9cBPPDuvPc3M7lnyGC+5njZcGe5efn0PA==
X-Google-Smtp-Source: ABdhPJwHh3FXqlZs7JXQgdddNK/aJv78XE212BtPZJ8azzBslC1CRMWHYpgLfEdIkJHUnf3qOFrzpA==
X-Received: by 2002:a17:906:6897:: with SMTP id n23mr9638799ejr.437.1592688032376;
        Sat, 20 Jun 2020 14:20:32 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id f10sm2928010edx.5.2020.06.20.14.20.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 14:20:31 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] tcpreplay: upgrade 4.3.2 -> 4.3.3
Date: Sat, 20 Jun 2020 23:20:21 +0200
Message-Id: <20200620212022.82066-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200620212022.82066-1-schnitzeltony@gmail.com>
References: <20200620212022.82066-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]

* Increase cache buffers size to accomodate VLAN edits (#594)
* Correct L2 header length to correct IP header offset (#583)
* Fix warnings from gcc version 10 (#580)
* Heap Buffer Overflow in randomize_iparp (#579)
* Use after free in get_ipv6_next (#578)
* Heap Buffer Overflow in git_ipv6_next (#576)
* Call pcap_freecode() on pcap_compile() (#572)
* Increase max snaplen to 262144 (#571)
* Fix divide by zero in fuzzing (#570)
* Unique IP repeats at very high iteration counts (#566)
* Fails to compile on FreeBSD amd64 13.0 (#558)
* Heap Buffer Overflow in do_checksum (#556) (#577)
* Attempt to correct corrupt pcap files, if possible (#557)
* Fix GCC v10 warnings (#555)
* Remove some duplicated SOURCES entries (#551)
* Expand /dev/bpfX hard limit to fix macOS Mojave (#550)
* Implement --loopdelay-ms when using --loop=0 (#546)
* Heap overflow packet2tree and get_l2len (#530)

[1] https://github.com/appneta/tcpreplay/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tcpreplay/{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb} (78%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
similarity index 78%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
index cc6cd1e07..3346daddb 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dfa0d1b3dfd2cd316291a7a20563b649"
-SRC_URI[sha256sum] = "4f479bd9196cafde70c58ab072ca4959ecc5278555cf1aa7cf42f7f210daa951"
+SRC_URI[md5sum] = "53b52bf64f0b6b9443428e657b37bc6b"
+SRC_URI[sha256sum] = "ed2402caa9434ff5c74b2e7b31178c73e7c7c5c4ea1e1d0e2e39a7dc46958fde"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.26.2

