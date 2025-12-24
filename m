Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51ACE74AE1
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116514.1766562579389527649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NmMx4p0e;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso4696856b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562579; x=1767167379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7et1Aksk0iudhrrGVg2qTrzupBbTieJznCGdw23jnA=;
        b=NmMx4p0e7/WIebQ62kz1BJqJUDt/sx0G/yII4+mnUN2nse3bntow/sq0fLHN76YAuG
         Xka/aYgo7ZIDVdAxAmMXpZhDTCNNRCiFvQ/v6rV2jDVBsR7s5EGN6CIDDWRO93SVfnAh
         Hmu3n/hhqtvrRy5WnIyMvLKuex2Os9sUqM13/vgh7Gjvv/26BC6Lgn1qZmc0U2/vHayW
         XPEpw97xg86UQCn99+R0lFu+R/aOCw63dOA1EMOMivQooePFAkHFh4OJv4pX9JEGBt9F
         UYlJ0iNisWVnncVuQVcEng//OfLLRe/3ZF3vwYmN1jeWhvHP6eT+U3yBIK+hMMI3O6Kl
         5+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562579; x=1767167379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7et1Aksk0iudhrrGVg2qTrzupBbTieJznCGdw23jnA=;
        b=Zx6dUYHhzmGGX7xs4vxK+AgL/BoU7VhQ18ryufBAhLFQcBdEx9yf89B91mnQfzHXVs
         bx561/mfSoSzqFc18cYU5wpLwyErDOEXJRuONf4QwlYFrMbBQH1l0Tmg7HCGNoq8sHLW
         sNxWcDE43uQ1K8g7RRlvKtyUdHLw5YIGJjAnr9l6bpKz6NJI3/FNX5fMissZD6BMshUw
         UBEttsNsjR9rd7E63i1K3yJB1WaC9Jv7Lx1KbbOfaqk9nnQmHQBEW8fnHlAc6UF1T5Ds
         4QL4Utl0juitns2zjLavvAUmlcnwbP3YnR9vBT7cI6G70SfHiXrY53JmLL0inLiH+AVn
         fJdQ==
X-Gm-Message-State: AOJu0YwENdKWZtBa1TyN8h3x5/ui55zz4PVfM8NNe0qgvD91SkQ/f10U
	01PgxytHOGV08Vpe22hRSnCdlHNmAaNFN8yJHMol/luASda5m0KHaMJ9D0uYSQ==
X-Gm-Gg: AY/fxX4E341UnkwvuMDsJYhB53/kXDHKG68npkfEf4heuHzMUItdgDb8/J/neWlFORK
	Sm2NfABN3/7/2F4n8WgI6cQxv+/SBD+TAnsctONWx5Ldc7Vyn3liqx7Pthesb3wmWwIN9NRVUkW
	UG2TAmRITIY20TDuQ8FPO596aUJdbijkPbctFnjaXCFmOuU+RJlhVOFTRYIA8/vjqmHHTnlktad
	gbDTTrBcUpWMCal3bTNItpl2m+3M/PnLCi/sM8csipvcgMBuecVhvzFdmhNpj+B3fRY6PI0/pvp
	pPWusg+JFgRgWF0DXO5PRBH9jB1NKnpho0PcjQYVaZsZep868NgFbC2c41o/v4SpwMziiOeD/h0
	N5O9YBpbrx0Qds9zwn4GbhkKqFyjDQKMka2073ykhdMVKXvPvLLf3ATYP3m8VPwj0cSiz4L4oKk
	Djj8r0xlcy9qcpyBuzyF712hdZ
X-Google-Smtp-Source: AGHT+IGqOxg/1fhPINj3rTelWZOjfU7teUmMdVIAeWcS3S6xWPIyOK/ledcRhzuLTeHYrLGH3Wu5fQ==
X-Received: by 2002:a05:6a20:939e:b0:366:14b2:310 with SMTP id adf61e73a8af0-376aa0eda7fmr14977823637.67.1766562578443;
        Tue, 23 Dec 2025 23:49:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/6] dovecot: upgrade 2.3.21 -> 2.3.21.1
Date: Wed, 24 Dec 2025 13:19:27 +0530
Message-ID: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122845

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
- CVE-2024-23184: A large number of address headers in email resulted
  in excessive CPU usage.
- CVE-2024-23185: Abnormally large email headers are now truncated or
  discarded, with a limit of 10MB on a single header and 50MB for all
  the headers of all the parts of an email.
- oauth2: Dovecot would send client_id and client_secret as POST parameters
  to introspection server. These need to be optionally in Basic auth
  instead as required by OIDC specification.
- oauth2: JWT key type check was too strict.
- oauth2: JWT token audience was not validated against client_id as
  required by OIDC specification.
- oauth2: XOAUTH2 and OAUTHBEARER mechanisms were not giving out
  protocol specific error message on all errors. This broke OIDC discovery.
- oauth2: JWT aud validation was not performed if aud was missing
  from token, but was configured on Dovecot.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dovecot/{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb} (97%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
similarity index 97%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
index c626f26457..48e1e8a832 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
            "
-SRC_URI[sha256sum] = "05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d"
+SRC_URI[sha256sum] = "2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

