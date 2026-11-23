Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48555.1795411904655939086
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UdVhXpVW;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so2375491eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411904; x=1796016704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCpI/YrjR8ZbiIRaMHAJnXmCfGEcTfxI8sG2eIgUBTU=;
        b=UdVhXpVWIT0bf/gLJL8ehWg4Iz/me2Q3c7bOBjfw5aecXODzPAzwKq2jVx2UU4/mZa
         xYTmjd2+Jn9j9uBL+jFBSWacIoyHAeSmAn9jOGg2v3zhmU/wQEWl4cWTr0dv+EobdVlL
         Ah98NUS6g4piauROnF6VcjekGAwPD6njDVmAv6b6PYAMv/mvscoGm7D0HuZpJYz7rzap
         NW3nzYn2OXoIU/YMa+B6BQIIwb8Z+X/wXe0ThytMtrXwHLSt3isL+LVg31j0yL0m9nDF
         Hs4llWrQ41C3L1LdtgxJbiGF81B6zdubaBWtAXBkEP+If3tWIcz7L+O08VC7d1hdre3P
         bRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411904; x=1796016704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCpI/YrjR8ZbiIRaMHAJnXmCfGEcTfxI8sG2eIgUBTU=;
        b=ulVG6XwMc6JdW5Q2ryTUvOu4e+z41NSp1i7e/Z4E0B+pbdL3V9Lh59IYRpQht/s2e0
         76Z/3IKurCkCO/DDNKiVkQJovuST6OM60bpQt547KA4bCAuy4Q+KEQCBoOSqPWoHVLWU
         4uuFS7524wudc0KpWrTtJH+15L78fqleL/IAeZXz+B6XB8jxREkEJXOw5jDOOKuzhDtK
         9HT8vNHj3ZnXNNHAWnmzukK+3o4lp0gocWvkxoxL6qNjIat5zaasgkdEpwvQhNoeiHU1
         iUVMlneoJDfMGGgE6GsIBSlchRis5g0loHJAwtgaBdgsfDM4LY/XsVHptYZ9STub7tkl
         y7xA==
X-Gm-Message-State: APuU4Z8iwJXBdXct2hqbBhw2ZMco8muBy/GAB0dIlQIH4naRejK+N2V3
	HrCQWoKPy/p7HLP1F7v5Dx6OliC6EBhRABJKVRKeEh7PADC+1caE9UE7BcmpSruD7qg=
X-Gm-Gg: AZFdTZdbbjZs9EUVGkgtZq12uhFzzzYbvzLn3wYUEBgmwbRvvises7HM5i9Z6lmkm50
	ymedMIVcX47JrrNe47hngRXlR0r/4+gDv1O6MBt41yKYIsEot2GC9sCvUdIFnqEJuFLHefdAYhK
	eISIUPd6J8mv8GdunCXAg8R+Ohc5IwLw+TMK6DjwMOr4614r2LNw1EU9k2xyBIiSHzLjFRwFCP6
	FJwLWhY8c0Erh4F8mLectJTmQx3CZxbiZ1MgXkmtOHzw0kdAnVmPe5uz5t3kUJIEyynPkFj1Mab
	IUJ/ugDIon4WRrd3ZAYFMGdCmh4uQ6A/uqvkcCrYDLu9Wkluwi7z/wr1GpmOVHDcqjwUaWhuovQ
	qThtPZfp9HdcmC2SWhhuV5sZIEkvzT9juq2fNYPD6RQfWpCuNHts9LBybQngZbqam7t8SzZYFUm
	wzpu4qOFgm1tGtcu/FMUXYNWqUfyWZxV1kNgVarwoR2CrU/nGzjDoI97wcR1X/7z/B1DGNfQu4f
	X2PRgNsoxa4tw2AZyX6NhY9kuE/Ki0j8VE/+jQB83RVs0NCdNABNv+CJ9wt4nF8FuexQcw99js1
	VvfxrSrHfKfIPId4LxdIwEh2h8ACKIjOde1RfQo2wEDtJDSE0LAvocwFV5nRGRnZnF3mdpUYF4d
	i7qo+Dpll6c06TGRYncabDeFakxgr4VE5PTeJkrbDvx5xpDM+BlsRdTCPlNC68+xvMLPbLEeoSy
	5pMyqNe6LClV+D0n1NujzEjxT6DxLNoRcUHRVXEnC1yuElfLzJQ47AXkAPMP0/zHuNZQwixS2Gs
	KQhKBsuHWwOWj6JudfT3LSQLp5E/rb5yZ7wyqwtLAmluzJy/JXWzq6r9frg72cM5uY8dH3NOBRT
	b4EC
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id 5a478bee46e88-38570f27a56mr10898183eec.32.1795411904040;
        Sun, 22 Nov 2026 21:31:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 14/16] python3-xlsxwriter: upgrade 3.3.1 -> 3.3.3
Date: Sun, 22 Nov 2026 21:29:44 -0800
Message-ID: <20261123052953.3658549-88-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132875
Content-Type: text/plain; charset="utf-8"

- Add worksheet pivot tables via add_pivot_table() (3.3.3)
- Fix set_properties() date handling and convert timezone-aware
  datetimes to UTC
- Fix a spurious OverlappingRange after a rejected add_table(),
  merge_range() or autofilter()
- Faster write_formula(); fix names wrongly treated as future
  functions

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-xlsxwriter_3.3.1.bb => python3-xlsxwriter_3.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.3.1.bb => python3-xlsxwriter_3.3.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb
index ce21db265d..e74a08501c 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb
@@ -15,6 +15,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "0867761912cceac76f97ffa76eeda18c623ae9217f601be8512f55b1af4bdb6e"
+SRC_URI[sha256sum] = "ad3743bd5f96019ee75aae19a51e9c26faf03f218670b934dac1159692d0d5e3"
 
 BBCLASSEXTEND = "native nativesdk"
