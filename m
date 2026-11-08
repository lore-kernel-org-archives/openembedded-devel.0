Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15076.1794153707109519760
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RDnNiH7R;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so434523c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153706; x=1794758506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzpY4jpxsbOXB0n3WFtkm86CIVYphAlGCowPTuk7Soo=;
        b=RDnNiH7RhImOaa/tadUyEhcVz4RYiW5ozVAs+z7XGNROEVb3FeK3zukoFjuKrCAJEK
         mAJ7/CzjgX5XlY5y2wM9yl387teTGHjq/+q80PyBaXOngP7jt4i0Pgjlg+KevCHHi6xo
         WRbwfTeBOnec3Hn7nt+mFyVZPFG4RkAGl2fCstgv9MoLHyBmsChf7vO/GGRv+Z+bcV08
         QkSvAqvXuFcIkuca8mrXW0IEUltBei0pRVw5wHgtdQuDP9+glU95uJMOvll16hiULMwg
         M4aKJtI1tx4dbtTDh/Zx0hiBu1loGN5EbELKHXf+WlHfrC9mKft2fp8sdRDRUF8BdKJ3
         9Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153706; x=1794758506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzpY4jpxsbOXB0n3WFtkm86CIVYphAlGCowPTuk7Soo=;
        b=ZAChSVqfXBOExevJtwQVUe/ufXYhEBcp4mOWZYmpb6EjxwXhI0nf9TEs1zsYYvOiKX
         tTGJN/9CJg4/pt3j3ixpYZagHTrqOHdvCUUfxH7X3q+c/CEVQo9OSYw72BXJ9d1R78Zh
         /23CGuTxNHydoERRouSxDdVP1d7bqwWBHgKoJGqsNqREy4b7DwLF8awsJHHqCpL/EKDv
         1nMOXXdVd/xs8evBlDFrYSx8VtxfzFlumg95xjxs3fp5FYVonoBkBJqTNrA0AgCKwqz/
         w8GT+ldG/Gjs6FUcEmvk+/12hO2srEWrcjzesCQ2r+UdON6sZ5buLob/alJEcSYI2fzo
         Qe3A==
X-Gm-Message-State: APuU4Z9PZN2uT+xQMXi9M+rBuD8eaAVpBGoSrABEESCthbROMhUKhIYx
	qMAMP8sfXZom2ie6XmH/DYI0l00AosnSP4QmSs/OzKOW5RdUwPq5KbF3T5ukgwhYr3M=
X-Gm-Gg: AYBFou1X1VG6AYmfzWEJvbCRev9eGtxxhg7Rw50Wg6cRYUQPR23aWLJiojBDakXlPmZ
	SKlm2iwudlRK8HF5drh0cPwL93R2pGHH2rtwev1Wt+hy4lqWTo79hyN60rArgd20K5L5feQI2zp
	zG+bjjV5miWwuwuHZPmjs5fhlJPmCVH9l0Apvb5vr6u+jxWDJf5VJda4FjwlNilq2yicaREg+i8
	LJsn8NH/sS9bQ//olnt7sKokM8SB6v1aAP11T1RueVvcz6WdFjJ3SjK7xlAxWA3l51tXEFzEBYk
	oJOjsE9ehChdrioufM3YScoyBKqjDpCSfeahGn/4Glq4AprhTtZ2x5awGWtN/g3E2vRvE4UmBef
	iCu5mZCkZgZpI0N/HEi7LCvEREnRxX6YeJwHCbjxH5x4JInGHFEZ8tJooWcPn3O25rI8wN6IlQv
	8us5t+BGvdO9mXY3csmx/rBrxTAIM/T5r+XJhERb/tyiUX6L4hL2wsHOvlC/IefaWx2MVvxrFf0
	eqVY6iTzH5kpulgDEpy/jrlG3FKjY7GTv5jhS/06LfTJ59N9NTSEyG6/xQLBiV16aoRicnPK4YC
	/LowatVCUAVlH+o555BFYfFVvPsZsblYJMkHv7PcXUJ9q0X7ozHCc/Pp4C3qc3hTNREqF7lLnW0
	OXsnuLS3MP4MBQPUi5BR8sf4pnNgzrIJKz1fQmjk6mGFWVvk9hgdLoAsAzomJN1I5mPxogBUf4d
	TwcySoLbiA7dA20QIB2DMOAIXaJwC2sOdvF339gUhGS5naA7CldYpemxMHeXJK+xs4kuJDpBa2D
	tz3sqlA4TGxFZqM96m5HSThbDImYrYQkT5FtWdiQ8Vahe5iLhAE715MxUHepAaXRlcvZF36WQ4S
	8A85l4Mj2aJ0Kdla+bQeSCScSW0=
X-Received: by 2002:a05:701a:ca09:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1b39fe2f4f3mr3037825c88.4.1794153706125;
        Sun, 08 Nov 2026 08:01:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm6191699c88.9.2026.11.08.08.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:01:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/2] waf-samba: Link with --undefined-version
Date: Sun,  8 Nov 2026 08:01:42 -0800
Message-ID: <20261108160143.1662655-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 16:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132010
Content-Type: text/plain; charset="utf-8"

wafsamba generates version scripts that name symbols which may not
exist in the library: _end, __bss_start and _edata are always listed as
local, and the per-version nodes carry symbols from older ABI signature
files that were later removed (e.g. tdb_do_delete). GNU ld ignores
these, but lld rejects them by default:

  ld.lld: error: version script assignment of 'local' to symbol '_end'
  failed: symbol not defined

meta-clang used to add -Wl,--undefined-version for libtalloc, libtdb,
libtevent, libldb and samba. Since the scripts are generated by design
this way, do it once in the class for all its users; binutils accepts
the option too. FreeBSD ports do the same for talloc and tdb.

Tested: libtalloc, libtdb, libtevent, libldb ptest images pass on
qemux86-64 with clang/lld; samba builds.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/classes/waf-samba.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index fcec1bea16..d6c03c45a7 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -24,6 +24,10 @@ CONFIGUREOPTS = " --prefix=${prefix} \
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""

+# wafsamba version scripts name symbols that may not exist (_end, __bss_start,
+# _edata, and symbols from older ABI versions); lld rejects those by default
+LDFLAGS += "-Wl,--undefined-version"
+
 def get_waf_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE')
     if pm:
