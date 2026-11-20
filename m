Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1806.1795162110009834575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uqic5iCC;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1091145c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162109; x=1795766909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIVosKNH+41/fUOudRs8C/n2MGuHFh0ULfLKd45fZpg=;
        b=uqic5iCC4h1cf8Dx+GTn+TzsK9p+rY1h6+3LHnDhDGiw10QCrwD2t3+4DBS5VeYX1+
         s5CANtF3kF095Q5Xp4U9AVZ0TX4Ng/yifLUCmvk8MJ9eUWWgC7CpdWCf/5G2C0wxBNY9
         QgZmtuSur7eHXar7XBZebUZWBuNTOYSeHG9UwafjCG3Ci5Mmqi3aLSsjcVhii7+CMuA8
         L/gUfEP91jcYpnAoLq2eA22J9w8UIjHPOOsH3PEliJzqy31avvlOZ7kZde/ceYZgk0pr
         eAQHdZ5stAw8Sieae09LsC1uhhUKuWhLJZ4Bw5OY4G+KQ38Gl65Dn39LdzPWFRtXQKCG
         8wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162109; x=1795766909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIVosKNH+41/fUOudRs8C/n2MGuHFh0ULfLKd45fZpg=;
        b=s+XKQrCj17YJ1izd/S/b9XDyHfmXgse99exCbfDjeHc9EauSblpskbUu/7/zyxzo+X
         iCeVO9MaOLFDM9VM86BvErK15j2e3qWwel3sEu5I7wJNhzjuSCVIOyKN6AXzfi25hGVG
         XebZI0zGuR7+WYhuYZPWxWbrAqz+k87aOaE+FxHzSy78LRlx51O9jvQ6EYalMj8pMf25
         /tIRh0LdFouQJuOfU3mNYV7EvkjZZerqoA2UqIDElUx1xo3UcQ8aCvATxBDRxxYdgtmf
         cMop5mKHlc/JVyiTY6ttFx6seGgFiBD/oxxqNQvqHSDYPI5dMC6yh6DAizhG0hqWQ2WR
         egUw==
X-Gm-Message-State: APuU4Z95ckeRVzHfj4z2SOrYJVznRccZwtLVsED1YI2PidIFUF0rpQ/C
	A7ltcKnX+hPgUQ0sm/X58XqBqiLXqEhfFkTm14Uhalifr/C5YP6wgMvIZaQo54F0
X-Gm-Gg: AZFdTZeFNAVWUvcMLdVFGAI401TIBpO3RtG4V61wsB4KiLyh0GZvCrwSUHYl2VMX4Q9
	1/jbRyqkaWO5IucjSH7b1AKLa5nZGEuFIym8JMF6ECZi06YuR6OK+FpJiMgAx8SCUd7hSK+jla6
	uEhh7/S33V3jbEDmw33+Pr873Pt5bRWORN7YX7yzJpTENXNjhH2daU5e+3oa7u8o1njMoK95itU
	xajxRQ9jU4Jko+vQ1ndOU5N9SsEob8DIB94/VuRfIsqq4aMTNa7qij+s97lT0uOf2oEFOmnf5Oz
	tdPUKg3GXVq63q2lRtTUjFYFBIH7EdqBqJc78d29jH7SioAWhOBfagTwUc+qpgAkluzwYhLrp8F
	QW99KWthNrXtQP7kyN70EhAqnhjUV1v9eOXPGZvkyZMdvpxlqf0Ob+9ZH6bkydzITdytlAl8ob5
	wzdZ+Oc15IpWEkpQuI6dRq93/kUIdtkVoOSO8LdsFU3RVZWoQc4PBJkcuv5gfkAYob192axeoTF
	ZvbOXny8JAF7KrxbR870svSsnh9QOK58ntzMYMsLxt8Ss4blpl4Maljz53hwMQIkJaUtm8BbOCk
	xQbFq07Ua6dZoHIsjJobiRG6cEJgyRJfYQSwE46akH3mwsJnuQVRK392cSeXkXfjjGMLyC4yDxT
	i93+CX06oBX9NMOfPDUFOegeGHBa+oHoEYIJnZLlO9L1/xh/Z6hrPNcLY3ZDpeKY7MLN+bRDUxr
	ZOcR2OQXF8Ym2wIpwwGYidAPdmqv3lm17KbijXCrQcJ2KPuI+zYznWnv+V43kOiHYIHYU0P5ibS
	0LyGNZ5Cdu5W/YE/cWWHMLyH93wFlTIJbsvU3C6KTbZvB1nX+MX3XaN54fcX8Xd4uE/yf9lZgy8
	OUov
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr2529692eec.39.1795162109109;
        Fri, 20 Nov 2026 00:08:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm5947954eec.14.2026.11.20.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:08:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] uutils-coreutils: Find libstdbuf.so in cargo's new build-dir layout
Date: Fri, 20 Nov 2026 00:08:21 -0800
Message-ID: <20261120080821.1085842-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
References: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132769
Content-Type: text/plain; charset="utf-8"

Since cargo 1.100 the new build-dir layout is always used and deps/ is
no longer created. The libstdbuf cdylib from the uu_stdbuf_libstdbuf
crate is now in build/uu_stdbuf_libstdbuf/<hash>/out/.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
index c647b7764b..167fc2652f 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
@@ -88,5 +88,5 @@ do_compile:prepend() {

 do_install:append() {
     mkdir -p ${D}${libdir}/coreutils
-    cp ${B}/target/${CARGO_TARGET_SUBDIR}/deps/libstdbuf.so ${D}${libdir}/coreutils/libstdbuf.so
+    install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/build/uu_stdbuf_libstdbuf/*/out/libstdbuf.so ${D}${libdir}/coreutils/libstdbuf.so
 }
