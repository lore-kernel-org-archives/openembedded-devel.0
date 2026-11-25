Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37966.1795594144209150506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eIsasfOq;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2525545eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594144; x=1796198944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3emFhzTpgU8NIypLljIs6H9eb+3/HEK8u1UZaSXUhk=;
        b=eIsasfOq/PW18J5o36KOpBIfnhaxBX3p6trfU/T+8QSz5l1SaaG8j05R/qLRmANKg3
         SpU0Ly2Ea4Yk6GHUGH4Mlwcc0G2PerOirjqFj+NtZLUtPC4FCwf/sMdRmFPhjuvmSN/E
         JAr6yJPyAFDBAW7FIFaT3ClE2dBzrVyPRt3zMzwxhoKLXjxdywcTrSLtLlnGRuNtQ95o
         CiTSTQ/Al5UpSB6etdPRQXTrXiXzW2qfG37TNOOe82kHSud5nDdc31m9kL7CrSpOreBm
         adjHObV+XigyjP9+IG9aaVtWHeG8e7DxHMipwnHxamkLckcF0KkBhS/2v0gx8o9Wdqsu
         kQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594144; x=1796198944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3emFhzTpgU8NIypLljIs6H9eb+3/HEK8u1UZaSXUhk=;
        b=x0uF9K4JNMZUcsQf6e+f5Ux0RIfVaKZe5jR3jyxHBxL1HjPoPVKR+7J2Mg5hgm1Txn
         gtnSNzDJz6nvPdFbz6CFFYd0RIOxekx6b7Jakuln9xntfrv3ByISQLcfJh+UUn3CtSKC
         6Ot+ky3l3em7AoR6Gd4iCD9g94pb7uvI+nyplD1M9mL574JlnRUc9PJzEm2d6vRRbmai
         2TE6RWiGPrrMyifY9+glFqFcY0COUTDokc0JHCaYa8qZvn8amGtncMBTTgQ2CDLJnFBv
         JVAcQoo6mXwZHlA23sj7GDPMh0ZYNZQfQxr4GFVDpzQp7YM+eJLI0oCPcijgJDG3eICM
         PW4Q==
X-Gm-Message-State: APuU4Z9Ic0tTvcKUhb6lX+9AULeTO6CYPR11kAHB89oZ+BwukTtLsGof
	yTH51c5wavxc3CaBMXpv+QE8Q/8ZZ5+qUBYpWXarN8OLCb3fMCXHMaZqwNb+9a3h
X-Gm-Gg: AZFdTZcf0GGhiez9Buclcg0TE/BcYNz44vWFaJhUHzoSrj8Ex/vuuXU3sQN3Bn2QRXa
	o7PzdDKWtLJKOQ+ZeJJvgI6O40qFxBfVHtds5f375h46sBfHxOngiXPV7BDszlrkdzU5gs/nESX
	nD6HG7jMDFqepUXi19CKs3gqhm9mpDbv1PZQ+nBVi2Dy42YymSb9zVHjfRqwne9mZOu6r2O4lkx
	eeEYWTl9pIhI+zsH9bGMbSFaT+oshGQ9VjeyjKM+YLMFKDLfDeKC3qZf+cX0atYpWMRGSPA7FV7
	sUIiVJrnCfijY8NRNudfBwCNVCaINXTosoH2+FlfrSN5r91n7e8QrLaXshX33K9ImIIOAh0gy3e
	/Nk4AjVbQXd5CPVPzCyX/J6QFs6fVLSoIc1MVeMCAt1NGzDqJ7wE16BkelRN41S5bbu+aofvZJe
	5v+X6gcopdZr6MJfRHYltJ4ZkQQaV2ki9qaQtSrT4zrCghmj+Vy5HWyA878gX/aFY7yw/DKaf1N
	S2nBHniw8/PlO71bRSYZl9EBP5ed+8hY9n/ZTHendu/rnfEHAQMatFi8aGXAhkLl/4WtLY+SeVj
	BPTujGGfvo0/naGS2puAvFpNHFg0osTdxASlOA7DxZ4C9djL5PBa/rQiMBSrj/8aBI1U01Vi35H
	3M4GcRY2vUblgfotmcnxdB3jMuAQm9/mAXLJn9oXWZTlvYqmeBiG90Gbpfsk8h2yiVT12f/V4sU
	aoMpwfKEQothKmMKS07R0IRExi/FXF0yvSS7goEI+wXU2CzbA49Qt/FkkKcdscpspPlgRQHqSqQ
	37sMWKWQZYpHVa47Q1QKgBEoOAHrSkFH4pn1jM4B/BXzbx3QJoRhAnN43c/ot7LyF0aKA2YcK6n
	c7/Q0VUFItQRlTB87QPe+O5csw==
X-Received: by 2002:a05:693c:69c7:b0:386:b745:ac60 with SMTP id 5a478bee46e88-386b745b019mr6558226eec.18.1795594143550;
        Wed, 25 Nov 2026 00:09:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 10/14] packagegroup-meta-python: Add new python recipes
Date: Wed, 25 Nov 2026 00:07:21 -0800
Message-ID: <20261125080732.2419614-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133068
Content-Type: text/plain; charset="utf-8"

Add the recipes introduced for the bitstring 5, mypy 2 and psutils 3
upgrades: python3-argparse-manpage, python3-ast-serialize,
python3-librt, python3-puremagic, python3-pypdf and python3-tibs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index a59249d605..376f288db3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -31,8 +31,10 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-argcomplete \
     python3-argexec \
     python3-argh \
+    python3-argparse-manpage \
     python3-arpeggio \
     python3-asciitree \
+    python3-ast-serialize \
     python3-aspectlib \
     python3-astor \
     python3-astroid \
@@ -218,6 +220,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-langtable \
     python3-lazy-object-proxy \
     python3-libconf \
+    python3-librt \
     python3-license-expression \
     python3-ldap \
     python3-lockfile \
@@ -297,6 +300,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-protobuf \
     python3-ptyprocess \
     python3-pulsectl \
+    python3-puremagic \
     python3-py-cpuinfo \
     python3-py-ubjson \
     python3-pyalsaaudio \
@@ -333,6 +337,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pynacl \
     python3-pynetlinux \
     python3-pyparted \
+    python3-pypdf \
     python3-pyperclip \
     python3-pyperf \
     python3-pyrad \
@@ -419,6 +424,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-textparser \
     python3-texttable \
     python3-thrift \
+    python3-tibs \
     python3-tinyrecord \
     python3-tornado \
     python3-toolz \
