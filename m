Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.10583.1593562076128993931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GlqUc61o;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id l6so7106536pjq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kVaSl1nRfAGBGK82PkKdysfANj3wC3pEbH/U0lCMLkw=;
        b=GlqUc61og4Ik+SqfC3kUPw+4TC9tAIGPy/OFwGt0RouuMe2Ff2YSSFjbvTgLoeQAWp
         W2y6pZt5Uvxu1fvcSEoDuQ+v8ZjMGUxtQhvsSfi5TSH/QoCrrxd2n/8rgbusYG+rICd8
         pA941FJo2J6DHB9s1HCUoAa3NmPeIvtRUtCFAJ+kvLVGhOoRDYgGsXZAsHbOtChJw9L/
         3odnQRfM0af7dXAWHC6ePwd6BvwjAn20eKkzvrduicgJ19dyRlWke5JyyqtrzvSnq7nZ
         3YzJmWairPah7cO6nj5mQL49ayYZzPTveNjVXP6iwYLzqqOqRpxbj5aP+e+4quhL2TuY
         4j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVaSl1nRfAGBGK82PkKdysfANj3wC3pEbH/U0lCMLkw=;
        b=pvBfhOBD8I0dGZN4PO9JyPGEYhyH/lfSKvqa9OmrqquwF2hM81POtWLSYpwXGP2z9a
         /KWs6hv7SJ/+wKaaooUnE174iwgOTNM8WumT2vKPP0f1VniHQnkszefYredC7R9TZR4O
         MkF9m7hV0Gon3d2qqUGy4CQn9LffQ5Ht9ll/pchmzXq8UjegdswhVuHzJKDLTzNA1I3y
         3KAO5xuWvC2JVBr+SrcmLHy7ipGZKvudW0nWLkE6bDCRKu7h2Gf4850BlbqhkZ44gNzD
         eLyPQb2XQVLwvo2L3jh746M96fC1lfqRpj2tzfrl70rLcJc+YRrZqcLuZsxMb+m389n/
         I41g==
X-Gm-Message-State: AOAM533chium0lJggnkWOAfUbvzIoo2EUGTp4H7hmgLGOdp2ReM3ngAr
	qINDoTKvTJYiN/dNCh/s8B515v83a20=
X-Google-Smtp-Source: ABdhPJy1DtXu99dCUDs1sSzIEjvIdfYbgt+stUhF3JAHfzy+w/aEFTd9FkqjbwJnAafiNo37XRmj1Q==
X-Received: by 2002:a17:90b:4c8b:: with SMTP id my11mr25176107pjb.153.1593562075514;
        Tue, 30 Jun 2020 17:07:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 30/32] tcpreplay: upgrade 4.3.2 -> 4.3.3
Date: Tue, 30 Jun 2020 17:07:15 -0700
Message-Id: <68cbdf369f486147350300d57d46013fcf77bbc6.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

>>From [1]

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 822963c6cba8edde6d91fc56e2f0ae9e7a730551)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpreplay/{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.2.bb => tcpreplay_4.3.3.bb} (75%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
similarity index 75%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
index a808c2728f..39be950ad4 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dfa0d1b3dfd2cd316291a7a20563b649"
-SRC_URI[sha256sum] = "4f479bd9196cafde70c58ab072ca4959ecc5278555cf1aa7cf42f7f210daa951"
+SRC_URI[md5sum] = "53b52bf64f0b6b9443428e657b37bc6b"
+SRC_URI[sha256sum] = "ed2402caa9434ff5c74b2e7b31178c73e7c7c5c4ea1e1d0e2e39a7dc46958fde"
 
 DEPENDS = "libpcap"
 
-- 
2.17.1

