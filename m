Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10358.1795753061979564546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QdcwflLc;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4168037c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753061; x=1796357861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO/xfKjtyjpIi+TOnlMQZXAKgSiCTNzd81RWJdZxETw=;
        b=QdcwflLc827ZU6GZ8iN6foSIXXhZk8twv1sq2+FYgzwHctQKRUuGeowxgnoFqbbG/Q
         zc+cnb86xZ3e6ELVGgHqPlu7hfe23KHRdAEQGpsFqHNqbR/LLswloeJF02cWdTAwwjKq
         9eB5Sli9bc37rEzhm2flA0DFhPrP2OB8KpomVuNMAqW3hdzQtUfKK595r226qrWO821i
         PFKt0F+90jwlNtY85DfVXW2+Tc7AtevMtsb30sT/eyfAx11JiPrVbDWItDhOWgiaKVrm
         5GSvp7k2/WmLQ1Eh6dF2RnpEZAnX/+2ic6xG0LWxft6Z2J5e/f7QSJoR4lVxZQb+IeIt
         Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753061; x=1796357861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO/xfKjtyjpIi+TOnlMQZXAKgSiCTNzd81RWJdZxETw=;
        b=1rZqdQUmcSL+9bLARtWlTlqfgv+mAGvJCkvmpp79D37BuC3yqOPcv9OyE3w23/pT0b
         2Cra0PQnbIS6RpN5HVsWf54hsnVuot/zrLDzLDGqAB5Fkla8JySEWRc39xd+OGpkpg+0
         y9jqheCTfgD6PtVCEz1P9C4z/OLjE12q8GVPtpNbKdRUI/+HVNQKY0446AwxH+/jFNfy
         7Jt8F4VAcJNVtQ1jzbRw3KM4VPZgx4OTNERPkU/Mz50gC2SsUtEO5e4R2DBxq4TP/V+r
         3xFqinnopsh2E+1K+gPeOkSbp7dZyRoB0xzBeiRboFP9O3yqipYmOuxrPim2zTwuMj7t
         c8Vg==
X-Gm-Message-State: APuU4Z8WAW9cxrr/dRDBl1r1Dds3qCpKoivw9hDrSGuL91D8k5B+VnM7
	dDRTVBv/MCkP40kaeqCePaqa+muFOP01bgnaJVMlzdcEsWt2ErwN8/325/mPzSz6
X-Gm-Gg: AZFdTZdX+l/niuaMOv49UmCWB5KLpmLeeIO4Ioh63+KPhEzZ01S/wbilKoestg5DFJc
	4F6btYerz2yAt3BMev3c+AKoEIVvw8C6P3qApgGmYDI/+op6L1nW5QAo7v3gftebBAKyArX7e6E
	f0/O7cGPGn2pZBIwA0dKtzWH++uz6OdWAY64UcCEc4L80Anj3mickSLNr4Dm3/G//bPiLhY7hVG
	qQUfWkmXaAD9zi/zd4hXSFNsc/3exOKbzzbmfb2oqOXhQnY2y2nwvYQMWXDYU84JX7xbZZAXXHb
	J9TPJrBWd4NDtQWcLa2XnE5AfG+PFEgzwnWJBnn0D4E8OVaiQZSDnWlvwHX1UQ0sgabK/44AWtp
	QJnrVStCXhDH72QL5st8ntl9AOszA4+91OcAieHi+3KJ2lP/pCzIr31Gm/6/YY1vPHoRi1lvhZ2
	4pg46yyipuoj8i/dTKu5jAFO5METpMQJeW1p9B7CHsstIglgndC0527+MwBac9p2o35GoMuw947
	cY0LFzIh0dxRDz40mbdD5NLE0z+A8TJl3vSnSIo/mzm3evCfvNF8H5k+EwivCitiyFSRhBirrYs
	qWCBEsPNXRgs5uRlKVZPZS4CT+AIyBTTt6Qpuw4lhhdy7jfkosRqBRTomF+lHXKneT6Y3F7yUDp
	SZUx8unJJMk5Yl+g2nnbv64T0TyJsDqfDO85IysrzVplhXNWEyRG3hq2qKoCjwMJALTCp/0ZlDa
	p5X01HixH7CDeMUTaDBa65QpyC7o+N2LJ9OtHtF4dZds25qSIibvEZxzeQr1VYAMdCuX4hJ1KTB
	Qukb8ogHH2shecz/qGaXgBdyj+106zQRIMuMrWASepBGndBkx2GFDYwSExOLWKtj3yYino5zhcq
	rMMw
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr21469760c88.5.1795753061243;
        Thu, 26 Nov 2026 20:17:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 21/35] tsocks: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:01 -0800
Message-ID: <20261127041715.1776485-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133273
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the SourceForge files page, whose latest-download link names
the newest tarball (the folders use names like "1.8 beta 5").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index af0823829d..f8b0632a07 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -16,6 +16,9 @@ SRC_URI = "http://downloads.sourceforge.net/tsocks/tsocks-${PV}.tar.gz \
 SRC_URI[md5sum] = "51caefd77e5d440d0bbd6443db4fc0f8"
 SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863f5b347"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tsocks/files/"
+UPSTREAM_CHECK_REGEX = "tsocks-(?P<pver>\d+(\.\d+)+(beta\d+)?)\.tar\.gz"
+
 inherit autotools-brokensep
 
 LIBS:append:libc-musl = " -lssp_nonshared"
