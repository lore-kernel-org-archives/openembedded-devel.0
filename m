Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10377.1795753118048585193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bLIwm4m2;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38644aedba1so11343082eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753117; x=1796357917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3HRkI1MNMlllHuQVUrcgNsjawyOKeCHPLmA7vFKB2A=;
        b=bLIwm4m2kPxvLz6WFQOEieDiZ1F5H9LF2J3ufwj9wb/Ot9nQ/04YkQiuvmJgGmQ8ib
         +D8TUS238+fuhLS1fmiH61mcxisg5mUBxMpsguk1x6zx1mXfRMwdJPbA2fn7nXtifYhM
         m5WyITi+7o2sv3LYYBayxLeqdvxhKMXlY0V4x05nGJOxWUoo1G1JtPWYsdWR/nAdUSyQ
         UH5IvxoqAS3+i2q636tpdyHVWxAB6HPwvz/O0BIvLGtTGFFWopiS9n+j1G7hRmYMeC3W
         zBbjAjlUE6ORt3dXdhvoJM3m/BnwjY5SWuHrn5EJMb6wBlDLaSnY51grF4RIf6R+seEs
         +/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753117; x=1796357917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3HRkI1MNMlllHuQVUrcgNsjawyOKeCHPLmA7vFKB2A=;
        b=gjcy4XWss4d7CfjOXm+fpPhH7+1Wg5F2RJYoMf6shvRn6GIAI0NvSDSbpaISPvXF/M
         5kLZ4md80h+XwXWL8kYFAsuMhKHDxCFXGIfrqRFv0BjU3AU1U0hSbIUFI56ceZHwow70
         ICY6fFaZPkgrR+N/dI9b9qb55ONepKshgzPtL12hrbxN8B3g9Te1N6zeWtmNG9UTnohD
         ARDDieNRnuLFk/IG6pe741GPWTSh5Cj2cNzyiQbCisLlHcuBOvkNbxJ1qhAe5AVjBTDO
         8nTLoWBDPxlRlr9NSjnOck8Lkqt7kxuyjalCXISMfgnNIbKt7egbUHDFP6V7Lwb+iHqe
         Zu9w==
X-Gm-Message-State: APuU4Z/G0fyOIXsP8VJgGgIsX5NOll16+E5b3BzlQhaKqy585IQM7W3F
	DFMvYx0jjAvS18y+7sXlly9f3NOp3BFKDvXjxi/liWweOPQxITSG/t8wRuIosApI
X-Gm-Gg: AZFdTZduscnS4us1ABNEHwwZiw2PApwRhENMduuCsXirsP9dFpj0dupVviqzeq728ec
	BQXgyBl6r3P5g0YQpizAVj6UeYLOo+2Vr0VqU5hhIQdXmOrd6GbR7W7xpz2QqoIyQAd76qXL5Wk
	rlMR2rdsxYnrmeJgTwFPvPrtrJj1KCUwea1AwleRRBeXDCKCgOe8Ru7Gwk5T+mve0bs1eXdE7my
	bqQy6ztJGduZj0J3eUJvttMvdThrHsEnPSpEJHLrhbNRzyINx9py45CnPRdi26mBrHAUvNrnwme
	AXarQoyRj7NK99Wks4F+Esv7hqW5TP2scbDhVlNl3xYCmju+FE3p/M/YCV/zyvN3r2CFbAyPXVR
	QlTMImPSqIN/w2buV5FJYdRUUFcFU4gJYVuBbFRdCh3qiH7KYKxKFjPqL3gL+hGutKdXND1Qy5z
	I71K4NU6djicPvGGsCEfdIBPGjS1Dot82PwQMg0cWsOYoGpnPwEQkYYeiFn1iu2kKWJmtYNVN04
	rN4YYk5xSUsXco2ce0XfwNVLGPPabgJHwVnOV/TiZza3SyvVhJ4yemctENswnauYizdHUZ33WoK
	FytoPXgbxTke/HWljTy78P/kocZ17R79TVPAUGWSPNdZMDLbdmsivi1hpuOEU/byQxYMdYLNrN7
	AHwLrrBkZLdrALv/YQ0Cv392jeWEYBMofRZfsXkvZggaOyc70iTtAqCVl2eD85UPKKlGu3loXMQ
	pywWaPDWL6rrwdzY+x+ojduiiOrv2VM/Sg0giItna8plvivmxoUhYxk2xk3WApql69I5x/3cH1F
	8GuV6q5FmgNgl7FCVefq0s4OrPIkJFANpXJeNoPC+OY3aSYrga00mylDdPdry/xRQvdsvmumAuZ
	MFlXH/JdJ3Phqirtk/u/HrIMVA==
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr24640975eec.19.1795753117282;
        Thu, 26 Nov 2026 20:18:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 07/15] mosquitto: upgrade 2.1.2 -> 2.1.4
Date: Thu, 26 Nov 2026 20:18:19 -0800
Message-ID: <20261127041827.1778052-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133295
Content-Type: text/plain; charset="utf-8"

- 2.1.3 security: fix websocket frame handling in the builtin
  implementation (out of bounds access, potential remote code
  execution); fix authentication bypass when password hash functions
  fail with OpenSSL 4.0 FIPS; fix dynsec plugin crash after role
  deletion; fix mosquitto_ctrl crashes against a malicious broker
- 2.1.3: fix delayed wills being suppressed, max-packet-size handling
  for incoming/outgoing packets, missing SONAME, reject PROXY v2
  connections with duplicate or non-UTF-8 SSL_CN entries; default
  sha512-pbkdf2 iterations raised to 20000
- 2.1.4: fix legacy sha512 password hashes rejected since 2.1.3

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX for the tarball listing.
License files are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mosquitto/{mosquitto_2.1.2.bb => mosquitto_2.1.4.bb}     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.1.2.bb => mosquitto_2.1.4.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.4.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.4.bb
index a00452a64e..c534a2415f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.4.bb
@@ -18,7 +18,10 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[sha256sum] = "fd905380691ac65ea5a93779e8214941829e3d6e038d5edff9eac5fd74cbed02"
+SRC_URI[sha256sum] = "ca30b26ccd3041c0e11fc407fe4f2e62bc445e8d8dea94a083cc60c09bd5ea30"
+
+UPSTREAM_CHECK_URI = "https://mosquitto.org/files/source/"
+UPSTREAM_CHECK_REGEX = "mosquitto-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
