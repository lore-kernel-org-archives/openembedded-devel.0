Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48516.1795411836575242446
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lR0sU1Er;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso1323235c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411836; x=1796016636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXDBZUnfCWcbNBb75v3qAFBygWQQL9njabsQwcXz6IE=;
        b=lR0sU1ErDsu92PmPgRTO5qkYl9lPy7CMB2Ae93pzfK9tn5fGkE8WETTHZHrriH/BwH
         DgxgAkG393nM5MquF0+q5RtugsoWC2NbLlTikvCbGYk1to5hHGop4mEsNYMd1fFGc906
         FRDq6TTFf2517PFou3cIdG/NTdL12c2I9hDhabFuhDDMkf7Hh0EjhTtVgeNN3RKxz7KX
         0RY+//AB4B8ypdmIbM7idASusYnIOXTmTXddsNToyE6aD4RgGTK9EtotS+XsSbbh8Wkn
         RrgPnV7yfimIgRGmBf5IspFurn8ocs1C4EqwOjJkDZcbB+Du9cEulPkqIIIuASFCAvCs
         95Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411836; x=1796016636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXDBZUnfCWcbNBb75v3qAFBygWQQL9njabsQwcXz6IE=;
        b=XX8Fzofv05eHx/KvmB1gy2PLYf5VTz+A/zlb3TGUL9dQ+6XIuWOzw7Xbft5QQXB+3W
         nL0r057R2cIyGGHD68IdNpRBSUOGZKm8wAyNsK/VvfG+fCu9FZ187xi/RxNq5KZ/ABDv
         9pCydxUjhGR/tLY9XI4Ei7gqZFsvUQ+R40JBSjs5teOjlGOIBEw28WswTo4JZ0OkEPZW
         6120DBfFrXgR7ABQ3O9PzjE2CMj1CnfHLDLDsmrSfcC4hEMFay655qypSRe9OKSh4Rya
         ylcCL67nX0xz0jgUQh8cgs+mWfIw6CJ1coKxv8PL3XRQoQ7v2u0e6JuLpbV+azuc2fgq
         rIGg==
X-Gm-Message-State: APuU4Z9yuVk26MP8AyOXNEQ0ce8XSrPxM/beoSwanJaOcw0n6QzO2lWq
	RvI2Q9l/iqhbFQreaXwYlbTow64HwK+w8r8NIPQQKSqw+pdXv4STFBGZIAKQst1tw80=
X-Gm-Gg: AZFdTZdzRnfAUZlZ3QQoiBOj4sh+ARgSGbIXbyT+irpITdJNzlulIHdmcNjg6LGmOQQ
	rGqJrbF8X1f1BQfV0TvzxmvUebwL+sXsGyPKmm/A65DDDPYyRPKXk031PYVFYIyGrGdkd/8y31D
	XkDWkd4S6Ghq/pjePCXbBokhJfD6OikIHi07ux1uOifr7xb4eT2OmVhoO5JsfzmlV546exZ4mgS
	GZ9mtBWkh73zUYrc7V38gdDEe1siNofIiwi4KinB6FVWbdviOwB2jLy3Ox3LN62YM5TBU29Jz7u
	1m7YL1Bufy1k1E6JKwOSgtBTezIOBIF3yOr1OntFl7rcSM8fGfCoGCQVu/TSqPgIGwY5oB/M3bv
	KKJnrIV2IvyEEamTpWO1Ed6shuwLAEsSQRnp0tnTUMASjdpJRdfboqAoKfLuHV/vmLRLafbiFE/
	v2ZKDf368MP3TrKX0dOUcukSh6RRenFDfKKxDY+I3FGNhqTyHBkNF5/9k/sxJVDWJ8qT9pMO34a
	gXMoDXdBKc+5lAAmJ16RBzGBksKA9tR8WBZi1cuiY4Xz6JdX3MqRU8s3XjLgE3eYk8HdkXntJ3/
	dm88QzRrqjniDE9ktGySJu6/GUsckqsP57Jx2mYU8fNleXvfxIuTWogTYERpTg6V342IaLN57qG
	o74hIKbHj84MRlXHeeqjE5pUWYahH1rn+Ktd+1KZmA23cCnzDEXfmdNhewZZMVo6PPGF/+EQZDC
	QcrUjgiVfCzXbhi61utFcTQG/j7hAf1XLcB+/NsUoqRF1x3w9AlUe25aYLMs9RbEMtWBYL0xSEO
	PQzWyziD1AdKMGVKv97jF2kHiosgLYKxmSF0t0WHRkcSToNiHvXHFtsuWx5ryhUa7j+bXlBG4pN
	OckX9YQAKmgxk3h6oWUrKpYsSg==
X-Received: by 2002:a05:693c:80c2:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3856eb492ccmr11720004eec.16.1795411835814;
        Sun, 22 Nov 2026 21:30:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/42] bpftool-native: upgrade 7.3.4 -> 7.3.5
Date: Sun, 22 Nov 2026 21:28:48 -0800
Message-ID: <20261123052953.3658549-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132819
Content-Type: text/plain; charset="utf-8"

Linux 7.3.5 stable update. It brings no changes to the bpftool or libbpf
sources, so bpftool is the same as in 7.3.4.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{bpftool-native_7.3.4.bb => bpftool-native_7.3.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/bpftool/{bpftool-native_7.3.4.bb => bpftool-native_7.3.5.bb} (92%)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.5.bb
similarity index 92%
rename from meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb
rename to meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.5.bb
index 148afdf3dc..db07e217a0 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.5.bb
@@ -10,7 +10,7 @@ DEPENDS = "binutils-native elfutils-native"
 inherit native bash-completion
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${@d.getVar('PV').split('.')[0]}.x/linux-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b11b6df8295e8e991ff040b71aaa4994a8b55caa23b6b092907f195b5840fd1f"
+SRC_URI[sha256sum] = "8f293f83d54f0b7b9be56863ebc5e4ea79d73e530b4ae55c572be97ef39f0990"
 
 S = "${UNPACKDIR}/linux-${PV}"
 
