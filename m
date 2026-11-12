Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4584.1794448344540126346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 17:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N0dc8hBL;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7401074eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 17:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448344; x=1795053144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8JMSZUSOj/Q66p9c4LgTQP9H8/I9tBId9cLGX7xlmw=;
        b=N0dc8hBLPsrh2rqne8wIfdcF+LUMUXjopyFdzHhTX5Lq0yODvt6aMFSYRThWdhNoci
         Q5Ges5kplPZSQI6bg9QVLpqpkNuM381vZZ8xyvYtqCOX61SNNaQlrPILHOecCfkI6SkI
         QmQFogxc3NhVSWtFPLulSkG1lCn8RHl//UYzLL40OwFB2SBcIg5Dr+RzQMtrben5KFC1
         Dvf3TraUnLXxEBpVPSSpvJ35luJlEFIs6WnA3kUAX3moX1h6NGgR8ohxBpn0ejti/0Ue
         bEcaqz2WFf8pjy37nfOs93ajE1GSx6WUO+DmtYpKtMOd2veiu4AGoX5mAkF+zhA0hgzW
         JUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448344; x=1795053144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8JMSZUSOj/Q66p9c4LgTQP9H8/I9tBId9cLGX7xlmw=;
        b=u4VW2X1lHMNYB+q1Wt1vgNElUXByW70NByxv9BvdgrN4eVgKrBhCR1TSc4jzTK/JEz
         XRgwNSMjA3e0UtKdOF9xbXHokQeSCXyCIZFH2Ibt03Z+8tDHlCKMOcEJDAsTzwvmsXmK
         vMNECeFRmU/IUE7Fh47zwN+jEJdxN4gOHjebXvynZej/gMhDPgVaFKUMyWssL83ftLJB
         egTpJrSTigYH4RM/FLhiMoa4Nuim6vibc/CTap/wfWwS4oDqnBO2FObIpOHjeyrjYAT7
         6Fue28Zn8wIbIvM3L09HzVtUwAV3z4wYNafWciNd5fLjn5zzl1F5/zd5Np3TIInN1z44
         Zl/g==
X-Gm-Message-State: APuU4Z/9pp+bjejfKITO2LILd54gguXeWtuRqYPLJw1h3x9/i54GIDR4
	iW4Bd0lNaapYKpYZMZspi7ZUDNTUKAHj2WHee+mcrmF8pVdtF+aU7tPymSaO4ZOUVsA=
X-Gm-Gg: AYBFou1Hh3gTDkKFeWVjMad2eR/VGxXyzsNEtxzC9clrzt20Cq/mbZBDPHEfdUQ2yE4
	LfNkoG1Y2stUDFWf4OACa7fHg2jX+AwFowJgfwLY+N5PYY3t19ca22HmuGyirwpddnHUy80bqF9
	erFyjsqEHcA+xREqmC4qBJhS4qS9d/CdtbQYqmjX1dACke2WizRcza8FUiHFKja3fULbp/8ufnv
	dxiPVmymXvysu1Of0UanM2nw0/MuHUCt68QeSiNk0a9+tLsqTa0r3WofN9A+GdpeMDOajaTbOyh
	3QqILad8brFymHm83yZbWXn5qE8O/9t0UI8c4m2caAxou0bWOucv+QMpgTMVgO+/TEssn0MjUtK
	7saaFMnpVC8W3g5+p802bF5LfVTfnvdDmadOxfAhOtw6I61SeVj9xvmsA+FR9dbY6VsJVijjzZ3
	Vh942gP3yF/aRKLLGOsdX8y9DKgf+BcoGLaUF7d3MrhjWTPGKYRTMFhn9GPr5B+8fxDV449nCVe
	lLLZpTX1pUpcgCv+YSyXMB3qcj3hfDtvgA7jr4r1uuoZj3xCnN0NHTBNcaNbt42s3heaMSv2KaA
	X+TJx/Ca1eEE0mBCf1F7+sswoBxHatRYc2V1Ubuy0f7mYQb1iPZJx1XwioIAY1OALNMmSHilPmv
	+oUNoR24FWzK6EdngCf3d59qifVHFEFaaB6JomC3sniXsWXNG2JKTpO4LEdsolv3OVJ5rc05PBQ
	+a0GFVeVhhx06J3SOh2Ney96wBl9nS/ECH0Tzb3jJmcecAImP7zHCXSQm3l3Ofp5e8Ze/509zRo
	V6VHVkM3HK55tqQ7iDl3S/7lWjs51Xx1660cK36C5FBI7htuKy/28jF8fMBX320Qh5jgu+e2tSB
	L+WF
X-Received: by 2002:a05:7301:d802:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-37686d3324cmr4347544eec.31.1794448343660;
        Wed, 11 Nov 2026 17:52:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm23582170eec.26.2026.11.11.17.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:52:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] pgpool2: Do not embed recipe sysroot libdir in pgpool_setup
Date: Wed, 11 Nov 2026 17:52:19 -0800
Message-ID: <20261112015219.3610805-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132146
Content-Type: text/plain; charset="utf-8"

configure takes PGSQL_LIB_DIR from pg_config, which points into the
recipe sysroot. The pgpool_setup script uses it as its default
LD_LIBRARY_PATH, triggering the buildpaths QA error:

File /usr/bin/pgpool_setup in package pgpool2 contains reference to TMPDIR [buildpaths]

Override PGSQL_LIB_DIR with ${libdir} at make time. The link flags use
the configure-substituted @PGSQL_LIB_DIR@, so linking against libpq in
the sysroot is unaffected; only the generated scripts pick up the
override.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
index d5f1f75d4e..4fb9a18db7 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
@@ -35,6 +35,10 @@ PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresq
 EXTRA_OECONF += "--disable-static \
 	         --disable-rpath \
 	        "
+
+# Use the target libdir in pgpool_setup instead of the recipe sysroot one
+EXTRA_OEMAKE += "PGSQL_LIB_DIR=${libdir}"
+
 FILES:${PN} += "${datadir}/pgpool-II/ "

 do_configure:append() {
