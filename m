Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8190.1795739676856927068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H8RDz6XG;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so11211806c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739676; x=1796344476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rKGwcROMfJyMUdSua0o/xlk4X7f11TcDlGbZjqVtys=;
        b=H8RDz6XGPpVA9c66q1aJiUsoWftR42hmI3CDURqAThqJIMOGNaw69aNJOLUIiEnblE
         LfTLLY/FfRd4kTTWsEJLxlNHQ+vkhKzOlmVXFLrN0Bm/VbYUYbGjM3WeWnjIHiYfSRp1
         Jk4ng6EIvKUDR0H+3M4ri/qyMrrJP1pHTT2BKkYM8i790TltwqeJvHQBl/ROUwSo/rnP
         TaF5XCCL021UPtjW6wyHMDwDkk8GplN4cmO4/240bTsvoF/L/jwDPqLzk1V238XOS0+g
         ImUgdQQCTI6PSI/OIqmbTlHpRnMhC68RGFD5l1cNitIxFVdwiPGGbHVQ+Ta2ZH7p8B0B
         UTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739676; x=1796344476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rKGwcROMfJyMUdSua0o/xlk4X7f11TcDlGbZjqVtys=;
        b=Ljm6mXEzYdBCKJgkJ/0rfLpZOWttyH+zqPsHZ2JX0oa+oMKIMfl1RctX/plMlQ2wP4
         aZC+3eC5xWau01clGHebHv+O31LfKVyIwWiQetjMcGJXa9O445uiPE+KWez4YRa3EwEO
         bcfqTOCLIbKhJG8iZmvGI+s9jxaQqN2M5pl9vde/6jHsoKo/dE3DSp3Q8r7cud0t8x9w
         VjFwCwreTPs0Tkv2BXfH5/jmyNLE+p60GdIzvXarxn6icu6CuMc3QFQNJ/RGP8GU+gAC
         t2o8W5BnUaKbzpcbrFspQG8/pGvGsI1Swh4DOtAFS0CfYQ9yQ2NkMFwVdGpavE+dHUnr
         c9lA==
X-Gm-Message-State: APuU4Z+Egz2pHxS2ojHFKQfI6KfFEpFQ+iIhbzJGvPLCcKlwxiAoseMF
	C89m20GEDg64AVewxRpL39xD2m3z+I3oxfp0ObuOmDAw7zoSdd9lm3Q/bFaMGj4E
X-Gm-Gg: AZFdTZdI5xa3w/RpHKtmQ21gsdxlCmYp64V8SNKkX2zUsHQlCdgJk7YHj7ruQyku67u
	f3/TxDj7hwpE02UDTYoBhON2tETmqdmFptiam/hAJbFnHhqX9iM6EtQTExWOIO0CQphT5RuVmqL
	BB3JxFcn+TvBB49kYodtxrVl1V7/5ueS4h9ikRVcOvLgWdqbCGyoO2xhA1Br3jHUXzgtN3zNKA1
	NonLDTgofo40RZDdF85ARbuBYT3ZSEo8V4NEscIuxd/CYbuv8rCehd+gvDDQssC7u6FyvlB4OHa
	p0GnzS/9KImvHKugdaMv5iPhJKT53yBEGbWi/NMq5/vvX8hURM0/5BehXyGqJazFBLlgPliQQ4b
	mBobuwEclFzXo1E9OpBEqa88rcRivyzpsZOnClDoDsizlaTsb+ZZqtIOl/wNhm18KVS3zeFWEg4
	4OhCU1B1WPetjr4RBrDWHX6nDENmSiJXhWqQJAVHlo7Yh8B+vX03XExJKMh3MIBwlLACMd3Xu3R
	TEYAZcU5PfKfzT7r7US6Y/ETaHqRE4Ny+9LcWd64VHeoeJt7h0INuI9/RM4dVc0D2HNtfRj+mwt
	gTtvaxIrxfVwgjzztscyAUmhMwUGSOW3/hh3dLlBx1b71yVB9dzwVJnowmOGoC/kvoRAHPvBakl
	VQY9VWHqCIiIbIjCLP04qPcu405PWBegxaOY4PhBA7uLLfOnvWBbjKTZ4gm2CwQmviLiS66Rtaf
	avtjpEk1z75CydLho8E3uegyL/A5z9YaK2uZbSfrMRxpy1+lFkHd52804xxnLvpZz42NNcakCW8
	ePQdsWA76Slv1dBjuL1a8BJUmffT/XeoL+b1VPVsbeNqjvAUZXJh77HWnMOR13v68ykP+oZWg1J
	xGTc
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr22265409eec.28.1795739676046;
        Thu, 26 Nov 2026 16:34:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/69] irssi: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:21 -0800
Message-ID: <20261127003425.2166632-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133105
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
index 95dba3a409..78af4faec0 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.4.5.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 SRC_URI[sha256sum] = "72a951cb0ad622785a8962801f005a3a412736c7e7e3ce152f176287c52fe062"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools pkgconfig
 
