Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35689.1793158467492530862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 20:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xRsaHyHX;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso591645eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158467; x=1793763267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQdcdf/HQ/W5UGFRXQxV3Ma6rI1jKsaSEVljyPXMxmw=;
        b=xRsaHyHXTSG98ucsn+9KCd0tcyO7yZQ+qime4LGu+Mobm5vemG0SJlFwDyX48WvE24
         gPMiQV2/dGsmS3hi02qZL2ihiM4ykXsUQ3O/c6QQzD0Q9H88ObLECDB4+WyzdVLeV00M
         jdXHXrQcMa5gcH7JcsABjm38uDTjpu2edAaYmuUg6EsFVXfSUxnVSQfKWlEmHHLJWueQ
         IbF4Cv5UOXctnkLChuTSry97pPbkTVLDdm1dm4OmRuol/8R94Ub42nNONaeVQz9D1vUE
         zJ7D71b6FcckuV1bEMEEfve8B/9oy1mcdo7w54xz8WDulwBts618srOq7NLuXwUp8IwU
         yMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158467; x=1793763267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQdcdf/HQ/W5UGFRXQxV3Ma6rI1jKsaSEVljyPXMxmw=;
        b=LulsCHdlqNfKObJPGzDzr+9PkHAp9HPD8qUgDE1ixV6+Y7FneOP2Hop1pwXijHrLE7
         hNEU0WMGYNSjtVwscODEHycwNmfTV4UEh6NaxaIH8aeSU5pbiFS2eFObzni/7Fh480Nq
         XJ2EZzpB75BOY5uDsqjcIFnHPz9PsRi1wGtumEkT9mI1PlvLjDnPR6sgvIpR9GxQ2mj9
         NDipDc+rSi31fyoY5PEH3oPjhZxosYW7n0EHgi5f+C9a/NX5TJBA6FNvuj9yH99JI/zW
         hpOoY6dRFcKkqnVUnAuQw97ev58rD82n9BSPY4lufpKSdosYBmA6tTByLgiWsh+PSOv8
         6kfA==
X-Gm-Message-State: AFq9FYKZ7upY6BBGz2+4HcjLr++qcmBCWam2BadPf8Rz1C71L63LScVN
	IE+pf+0jkDB7IDA8C4me/NtCqabq/tFEP+Bp2+QKd1PNMZWtw07m25/9V5z+W+9MJ4E=
X-Gm-Gg: AYBFou0bjDIDVhXPyPMD10neBuU52vzsz6Vqz4w2Y6O3wVlIKdzrP5zP8D48gpYF43M
	ZfjYbIE/mByex/AqTcaEYHeqVZZzkM/emkEV4Dyn1nNzOuuiaB9E/dV4i/2uZ6+uSPFAhPmgsej
	BTT0JXAqUophSk0nkQZBqOy57328FIJwq1l5r34uohZqQIHOVoYQeWRD4aFyAPD5uWOhFb62mLv
	2ZC6/yWowUYiKBI/lJiq9WVULrnvsrt0dza5FiM3KqDsG0HKmt5dvSsOZDpvKBIdUYG/v8t5s0n
	7nOCD9IiI0033xohqNdi3h8MxzdImsjMyvCBDHFq4XPqNMWWqF8mCdELUcI8pTjJzssYg+QEOyS
	Nd8zGQoZyCTeT8TAou7JyAnUbJG0Bx6qIGnYZ2Z5jYcV/sQ+USV2EY5abOdEQ6s6lraFhmZEvJz
	1HOSk8fNpqPKPo8+ZQS9fYKM4xa6YejmTYtrko0hKaCOeJ2JS9BryXZyS24JQcLCKVfOiOW/3VJ
	xh43CrPdD8p+3TsjxrmFIOKcz9ceh0t7sV8ciyQIRTweNVXDntc7PKAFBfe/o0xwgDCTHwl6Mqy
	cGVMMCOpe3RZ4WzFSWFdUOHH7Jp4OUDuWKSSnrWVrCqq9hXarCK5L0vZd59RUkgrrENF0U9HrjG
	uRUSXMyTsetfC0PDr1I8kiGt0NE0Df/1L+A3JYadDTncaFSCclVUFS5jrQIwPcm6YD11knRGqx+
	0lePd5mI9buyhMPEeXPAgQWvsdeRNrNS2QQAXM3/VsDfBS2VHRZo9WRV51v78PEP/s9/wRaCJNV
	xAsEE9NFRs5A+3C3f7olFiC/Y+QakQfrcmwRqBdZlDWVPXba2Oy0P7uyNoXifeztp/ss8gIJd1J
	umQC
X-Received: by 2002:a05:693c:8803:20b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a2010a1bdmr1969793eec.25.1793158466643;
        Tue, 27 Oct 2026 20:34:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ebcesm1846450eec.16.2026.10.27.20.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:34:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] mariadb: Remove the pre-generated bison output from the source tree
Date: Tue, 27 Oct 2026 20:34:23 -0700
Message-ID: <20261028033423.2884120-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 03:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131551
Content-Type: text/plain; charset="utf-8"

The release tarball ships sql/yy_{mariadb,oracle}.{cc,hh} generated on
MariaDB's build host. The parser is regenerated in ${B} with
bison-native, but sql/*.cc include "yy_mariadb.hh", which resolves to the
stale copy next to them in ${S}. Its #line directives carry
/home/buildbot/tarball-docker/... into the debug info and libmariadbd.a,
which the buildpaths QA check reports since it matches the /home/build
HOME of the yoe build container:

  QA Issue: File /usr/lib/libmariadbd.a in package
  libmysqlclient-staticdev contains a reference to the build host HOME
  directory. [buildpaths]

It also silently mixes a header from one bison run with a parser from
another. Delete the shipped files before configuring so that only the
build's own bison output is used.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 390f9853bc..434d176774 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -113,6 +113,14 @@ do_compile:prepend:class-target () {
     sed -i -e "s:CMAKE_SYSROOT:CMAKE_SYSROOT_PLACE_HOLDER:g" ${S}/libmariadb/mariadb_config/mariadb_config.c.in
 }

+do_configure:prepend() {
+    # The parser is regenerated in ${B} with bison-native, but sql/*.cc
+    # would still #include the stale headers next to them in ${S}, whose
+    # #line directives carry /home/buildbot/... paths into the debug info.
+    rm -f ${S}/sql/yy_mariadb.cc ${S}/sql/yy_mariadb.hh \
+          ${S}/sql/yy_oracle.cc ${S}/sql/yy_oracle.hh
+}
+
 do_configure:append() {
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
