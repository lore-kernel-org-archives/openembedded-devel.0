Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31188.1793875005557823058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 02:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rzEQhovg;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1150273f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875004; x=1794479804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY3G+gXEIbztuuCf/Wfo857KvheOk5ATNbAD8abwoQ0=;
        b=rzEQhovgKte0lPr9yDt5GslbrxgNzeoeVKujODjKMcGTu8LIUKA7GkflKFQyCsaHxl
         VS2/1TiNxcehL0XIqFkIxoACtUBG2UKuFZMGUb2Tc1Kc9Ihi5HftNEzyIShmBLc7XKfu
         d4outKPCidUwFChCLxT/4tOsKX9WCLr/O5IowfA3TEJ8417P6b1331ryj4IjRchL5it7
         m5jzRnm9QAYZRXf5CBY+W7MlNhgd66kteWnMn3GaRIDnkwg9EE79WVWboSDtHhm/TzeY
         fO9ZfOly0+HRsPpF2/y3RnkTqv/T4GCt7Js25K4RJxEcZEykffKbbn+x7je5ksGJWaBF
         gIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875004; x=1794479804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY3G+gXEIbztuuCf/Wfo857KvheOk5ATNbAD8abwoQ0=;
        b=oOPjHIf9Ko71re665ic4d1pPPk+C8xLyTKvKz/s+QVejXWqC5lKhltG2bEKX84xN6M
         nj2P6NGQIyZoxzYMVTmUZ4PVVWH7zzwb5repBRVWojyrUtNTzGVrEO+bBTw5BypNaEvP
         9ssVxc/0jz35I3VStiYPdWTXVic6glUshsAdzZh4F9CS65veGVGK4KBepNGgSD0LUBcM
         ARnJazA8X0ogk3+MzAv7rw2GvZC6GBuh/ycYFIzg31FPJhQC5s8/ro8ZXOMkWGocMvs7
         Rt/IFW3Nuts3KkPGM0scC5Agw015dhrGzpGS4CIV8E/t8dk5iGcV0z9gI0/L9BWgDf+A
         TwmQ==
X-Gm-Message-State: APuU4Z/KdTC+E4EQ1nTsj1uEHj1PfsCssCF1jbSPGz0Y20b6yECg8gL2
	zWLABnYIVklh6u9wdCIVrSbrBTdmnyH126UX0iZVsyt0AWJ73n5nKwX0EwhjrxJg
X-Gm-Gg: AYBFou2CgW+i9+vEySy8Tqwuy7W22EdILtvtF6IhDn13fnD+7P+6wg3h6iyzzimne1Y
	vE+ngY1AQF6buDw9FNxXXNOCCpbJ+18XgW+GSscdvnGA09JHC9FKFYDeGmTL+A9ax/PwWV2YzBl
	pZfvM2vrtt2iTD91bzduUSuuz7uarqygpJN1B4h4/UjedFwAO/mUjyHnnjLWzsr11wTsgctqaow
	yvvOb47OLv97B+FtLPNPV8Kj3WsJ+o5wdbAipLSo8R0pIQJpuxmjGh8HxV+OWeQXRXY9A6Dy7p8
	egID4oFcuCWhw1TSOyYt8y905t/WRVxgtBhdDkHG+VXR8m2IlP84LNzGvvCA2FWKhW6k5GHy/Qw
	9w2ddkIr0FPtuwYf5sbbO9m3DXBa6v0JLssiwUbgycYCoDmrlatlWkglsBu/HFdwOkggBIdl4xv
	Ikd1Au5+LQh8fp9BUdirBZF/tYh2QnAvB4uWAfFJFS+VCxeOrbFSGzUzuPDb0hqfhQvCIR2KDcS
	+2UrrlbCLj2AE6cs6NHSIlEiJAmRQ5A5D6RIiTSYDoMhbYreWCW9fDBrRYNzZLqF3B1Fedv9tje
	Zuf48HlojRXi9dUACiXOv1agC8YT09lK+X5OpQMS2X+03fDl+dm8NUbMQ+2wBpXWzzFLJKZsR2Y
	e1wtSARLPdw==
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e6e2bcda2mr28055296f8f.3.1793875003454;
        Thu, 05 Nov 2026 02:36:43 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm8919699f8f.37.2026.11.05.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:36:42 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][master-next][PATCH] ctags: set CLEANBROKEN
Date: Thu,  5 Nov 2026 11:36:38 +0100
Message-ID: <20261105103638.745303-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 10:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131900
Content-Type: text/plain; charset="utf-8"

From: Martin Jansa <martin.jansa@gmail.com>

Tries to call sphinx-build during clean in docs directory and fails when
not installed on host nor included in HOSTTOOLS

Fixes do_configure failure when re-executed in existing WORKDIR

...
rm -f ./*.gcov
make[2]: Entering directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0/docs'
/bin/sh: 1: sphinx-build: not found
make[2]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0/docs'
make[2]: *** [Makefile:20: clean] Error 127
make[1]: *** [Makefile:8218: clean-local] Error 2
make[1]: Leaving directory '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.20261011.0'
make: *** [Makefile:7175: clean-recursive] Error 1
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

The issue was introduced in p6.2.20260802.0 version with:
https://github.com/universal-ctags/ctags/commit/05a8061a581f626deada11da5300822bee20e458
which replaced "rm -rf $(BUILDDIR) $(EXTDIR)/__pycache__" in clean with
sphinx-build clean:
@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
index ec80a2fa25..db0718748e 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
@@ -33,3 +33,6 @@ PACKAGECONFIG[yaml] = "--enable-yaml,--disable-yaml,libyaml"
 PACKAGECONFIG[manpages] = ",,python3-docutils-native"
 
 BBCLASSEXTEND = "native"
+
+# calls sphinx-build during clean
+CLEANBROKEN = "1"
