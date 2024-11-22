Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0EEE65D22
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:11:53 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.17264.1732248710011054731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9KPsEOx;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea339a41f1so14899767b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248709; x=1732853509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z26hQahcQ91zNVF0V0HmVeuvvI5sTLau4mM/OHgMErU=;
        b=G9KPsEOxWXGPt1Y2axxT2R7pSpxb2/5b7iyf+Oitl3mpzpq2JYDhC46vWfFvrVPALl
         jyXFdO+T8Bk+Br4P9u/r1wgtHll7sUXGxBC1eVFy9TvwiuzUEMTbsbru+Xxm7DhsLwkO
         AWOtNlkOmgQEeQt7bul/pC1iS2EeRmER6oCAzjvLj1XV7KXCCs6CZ7Wx4GfmAsBstgiO
         3P/2Y0PLG6P67srVkTu+P7tpR0z2kCDGpVgq182jRfK4hR/R9A+qzrsOpcSbnmIZsaRC
         RPEepsaUxTdJa2IJ8bO7VHnkm/A++Y2lVooEVjhInpXJGO7xgf1RSs67Q7j1jLO4neaD
         8CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248709; x=1732853509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z26hQahcQ91zNVF0V0HmVeuvvI5sTLau4mM/OHgMErU=;
        b=V8DIlU2+EQsl6Qvdw2WKfxK+qd3EITpA2TgjNLReiUBu4nNrlYW5ng6RuRTzFU2fNv
         j9pcnzy1ipolmGsDOXZyMunpJ61OOqqyF6UNjiaaFyuCAMouVaPF1+/tAhc3mH8Qog0H
         z+PzhtNDh4jrQo/dcFPCMbeDw3sGl36Ebk7/CMrAYiiWkkdCtVY0zBx9LoUFM02YdAVD
         XbbOetO1mQiC0rZu9z377SajUsENXbRra3hTYKCAO4xTvvI/4/mEOX09BLcsC3PKYBgJ
         3rC1BBB4/nf3gP14AoL8bQ+Pj3zzr4UUNP9zQTIPCf6CuEDtIuWCSzkS8Vvsz3WtnrC0
         BHdg==
X-Gm-Message-State: AOJu0YzH0A6ZB3M3iAIGSc0cjyEvDGX9UiQFEreqDSS+6jm5OPpy4Ap0
	2dhEWzy8gO/zKT0M5I2yrNYubxkvEdaZJ0nj1zAXnU9cfUHVXdjAbY0vi8Fi
X-Gm-Gg: ASbGncvGpW7hSlpkL6R9Zj7JpJUFONZQ7IcitLQ4uuxCPfqPH5f5PjtrHhgr4xGBzj/
	Pmu+T095Qucove0AFmmnpD+x2WCPiawWGuUNHXdO47x714WaXd+e4s6CofmhK1OpoxhEsjzW4k9
	7TsvlwjzFaxT5sfPKmHJ1229ZTIOBHBPKMYLKL1+hqlDLTK62UdNMGSQDTZDgPsjCKNP4umEVMn
	hRdV20YHR0Cp+oH7mUMfsTkUo4SkKl7cOytnT63rfv1gIn2aLDmHTsH
X-Google-Smtp-Source: AGHT+IEjLnSi9h78x+yKrGTHhDXeZ4us6ojcAhxEQ+NPp27cUjigsoiY6X2CdL18KpRvlAyHTmPKZQ==
X-Received: by 2002:a05:690c:d0e:b0:6ea:1f5b:1f64 with SMTP id 00721157ae682-6eee077a2damr22692197b3.0.1732248708485;
        Thu, 21 Nov 2024 20:11:48 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:11:48 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 4/7] libmozilla-ca-perl: Upgrade 20230821 -> 20231213
Date: Thu, 21 Nov 2024 23:10:41 -0500
Message-ID: <20241122041044.1111236-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113984

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20231213

    Update from Mozilla repository to 2023-12-13
    Added certificates:
        CommScope Public Trust ECC Root-01 sha256: 11437cda7bb45e41365f45b39a38986b0de00def348e0c7bb0873633800bc38b
        CommScope Public Trust ECC Root-02 sha256: 2ffb7f813bbbb3c89ab4e8162d0f16d71509a830cc9d73c262e5140875d1ad4a
        CommScope Public Trust RSA Root-01 sha256: 02bdf96e2a45dd9bf18fc7e1dbdf21a0379ba3c9c2610344cfd8d606fec1ed81
        CommScope Public Trust RSA Root-02 sha256: ffe943d793424b4f7c440c1c3d648d5363f34b82dc87aa7a9f118fc5dee101f1
        TrustAsia Global Root CA G3 sha256: e0d3226aeb1163c2e48ff9be3b50b4c6431be7bb1eacc5c36b5d5ec509039a08
        TrustAsia Global Root CA G4 sha256: be4b56cb5056c0136a526df444508daa36a0b54f42e4ac38f72af470e479654c
    Removed certificates:
        Security Communication Root CA sha256: e75e72ed9f560eec6eb4800073a43fc3ad19195a392282017895974a99026b6c

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20230821.bb => libmozilla-ca-perl_20231213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20230821.bb => libmozilla-ca-perl_20231213.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb
index 27096c060..3a9c04bf0 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "32e1d0045299004045b9c4d16c2daae453a216208873deea2440f71260a7cda1"
+SRC_URI[sha256sum] = "421a12ba7cef443bd368671cee9c9b46a8b55c2ccf7ac76c42f99e23a06115df"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


