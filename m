Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10376.1795753116974792391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HsVJXFXq;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so3951204eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753116; x=1796357916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyqlSr0ZTQ+urL4PhhY9cyPLtJZHI7C7XaQ8RPafQoc=;
        b=HsVJXFXqpiaDFc24O2MK85XF1tBYT8AoE4ggrr0WuSDcAe+w1LgZUdUkJ38ApslnQL
         G2viUA4mjHDsEnV+qmmazlphkhU4A79xcsobyYTs64wZ0PpsVNJRa2rOUQelzkOgbCcm
         LK9GXUObf2SMUWW5QNjed5xSzDUd7+ZRIJuhp+uKU7M2SYgCmgtYBWjUFHMfcTvCydxv
         3fN4wGjxwx/hRGklUjBC6uuywBblS46rfOIgfNiYnxBDd7CJb69Xo4HRP+gnfIKFCJOu
         aUosmcXqX+BbvvkeUeP8hKuD6aNLU29VA1E1yU39uwifyJ0LGN5WHrBsisFuA2cM0uuZ
         hmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753116; x=1796357916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyqlSr0ZTQ+urL4PhhY9cyPLtJZHI7C7XaQ8RPafQoc=;
        b=U8enIvyYsMFDk/2PdvXQlGW1q+KYAcAIEFvXNyV1xFmeb+ZPw37cO+pvX6U0ysGZlc
         3FHRAQHQ4KNHGvWOR7EF+IKNhUxO3DtaUyreUWKhepHnFBERB44/zfnGFMubidjTuqS/
         k5k+tA383ZLQKfLhlFV6mGjFRTbxS1u28hVLzt9Dxk5MKg0Dqfy8wFUdr9/VsSnYEMWP
         oeO/huWiwWuSriUv0KvUj4CRbpnJjiThGos9HmRTbzto7b/LB+ujOFdR4L/YL2HJE82k
         2gVvbu4k35bfWYpN0C7KKxoGWIKZ9WTghsp8YnjmVuMsOIIeWLYxY9f1fQ+MZAKsuu/4
         0rzg==
X-Gm-Message-State: APuU4Z/inp16zhMqCPpv7Y+9vxpvKsts6jbmD3nYtULNtPDxxi7wJs4O
	E3d5jM5813CU5iCFzoufGp638QTpyLo+dASTBhX0pzRjCsCApKC6Q/Y4NjWSbUI2
X-Gm-Gg: AZFdTZcjScjhHc1YNrcRnXcQKPLYOrmG+bGoCAVZ3UeYanA+0z+JukILjOG7NSbVQKX
	IxU4BKmHu4yGRQIRRZ1YhgXDR3JvtO4e9PBkwDk4tMpQ427lRhqhqNIYOJfDX1Qz/S/W4Bkktcv
	IcmbKHDZKkZFjUD+kmQqKlbYb4XXK5IkVTiK0Rz+6l0lLWLHgp4nj1Q7im/BB7R4Z4RRmH/vPGq
	PLNTV1rYnVJgPupzqknX848YrkW0I7ebyV2/nBuX5Q7I0IMywUqeRWnX6TGVMafT07sg79Sn06G
	5TAx+EYMBMMsJdajABkBxrau5WQmWOHkXg1MHH6y+ZhZqvR9BvoJhAcrpHHmFyLRuVnmoxQ82X8
	juVv8/uhUCMGjQIa3qcJY9Oo7oEZ6uCI9UMI05HnFzZxEf3jIt2JekC/uljAPXoeDQovouVQSG9
	CXFgJEE7NYFfcb6jSvn0JLtzNRyUFb5Ba4aDmujsG73NelGgQL0GXxEpof5orLrPSW6pzLms56o
	cZnigcpZPD2WiUU2t/ufqfFwPc1OWBzZMC3RGjwSiEI+JdvTNmkGaWzcYZg76UXlHyFOZIyw+4k
	qCF2pnJDrp7Oeaup7AYrk6XsVHjp1RxtvytbKvc9QGYhEtCzbKfJsaGwfu+D9E4iuBSzZVbQSgL
	wypKY03oTb2YD6Fx16fM+/tdehCrfBhNzOjDF9SnPj3L7gT2sVF1bmrKJhaUk05a4YoLlaXR+5z
	ZQ5Lzud3VMU9YOGewXD3oyMs8+sxYVL5e+qt1LWXD3wW51v+OkZCh0Q8O6Z2duTwixYnOAScwYm
	4Ijjemw5VcHOFD8BZaXdKWjk3dPXUh6ePqxzOl6ig/Wl9bDwRRhEt041yzyCwUMqb4+ourKJSOs
	1t0J
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr19793734eec.25.1795753116306;
        Thu, 26 Nov 2026 20:18:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 06/15] fetchmail: upgrade 6.6.6 -> 6.6.10
Date: Thu, 26 Nov 2026 20:18:18 -0800
Message-ID: <20261127041827.1778052-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133294
Content-Type: text/plain; charset="utf-8"

- 6.6.7: fix stack buffer overrun in NTLM challenge handling
  (CVE-2026-94184); stricter IMAP tagged response and OK/NO/BAD/BYE
  validation; more robust NTLM exchange; rcfile escape sequence fixes
- 6.6.9: fix uninitialized-buffer strtok() on malformed NTLM challenge
  (regression from 6.6.7), fix missing CR in daemon mode warnings
- 6.6.10: fix SMTP address literal normalization that wrongly rewrote
  domains made of letters a-f/x and digits
- New Latvian, Serbian and traditional Chinese translations

The recipe needs no changes beyond the new version and checksum. The
upstream check URI and regex still match the 6.6 branch listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fetchmail/{fetchmail_6.6.6.bb => fetchmail_6.6.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.6.6.bb => fetchmail_6.6.10.bb} (93%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.10.bb
similarity index 93%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.6.10.bb
index 2147e5eec8..f3b4f38b75 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.10.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "da99f8c573c4d9e63f493c7e24447126aea25b53b4c076ec79266874e29b1975"
+SRC_URI[sha256sum] = "f32f1ecfdb99a243b6f7fef5d1b5f5aeac2bb0a45ce0162552d6063db3b48073"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/fetchmail/files/branch_6.6/"
 UPSTREAM_CHECK_REGEX = "fetchmail-(?P<pver>\d+(\.\d+)+)\.tar\.xz"
