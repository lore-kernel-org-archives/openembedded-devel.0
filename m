Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4396.1793586251859998576
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 18:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MS0xkSVz;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so3664375eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 18:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586251; x=1794191051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDtHa1j3ewunRKXyZxm4x8QPLNoip9qE2qEPtrsxZdU=;
        b=MS0xkSVzQJZFai2XUNEw887BcdJWpzKimudPObYo9mAmihtCEDdNP/NbblzuuCQPFd
         MSvHSW8OtvWl3d4jC861P3OyT6f3KqyPQrxiS6SuVnnTjbbW3iPsDjN8jW+gqg402rxE
         kNOtv4aqQdPbmpznv4zo/BptLNBB/pjaJU/9lelOFvaO+WVN8ioKork5NMolARi8/a+a
         5rRAaxQXdMrWGAG4dbbtphE/F+EetLRl2H0hCr81IBhTCMiYN/kJubmMRkKOM/e5yxvN
         AVoNij9ECjzEAkHM3VwzxCONK7Cbs3Bq5b2M69jCAK5aKSZrIyIdEhC6m8/Ypj05EcN8
         hb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586251; x=1794191051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDtHa1j3ewunRKXyZxm4x8QPLNoip9qE2qEPtrsxZdU=;
        b=z1wSj9ckqt2cKsCcnvWi8x6k8xKwPKSZ5fDVK6vVTlv1sXjPbNdsLJJutvJrIlTOSI
         o+CIy4CmMZytgjORqymebuBAXa6R/35PH3SbNmL6ygWa5fB8CbYjoz5nDejLq4KPnWEx
         HlG5df0ml0iqzPMPvXeozbmpI0GhGvh4ohlsjQFYyxmjb6nFPc9WF6Gxrpc9x3upOd3N
         ggnodZ1Ck8U3LV7tY8nfwjlUh2y5D4MYUqma2v5qp0spsoz703aXkw48KcA4tyw/0Yo5
         1kNySV74nZLAXEaquj0RTTd7ke3sLsv1Oq+zzkw2mPLoH+iGngljfpQK3L589MsTBlK0
         u+lA==
X-Gm-Message-State: APuU4Z+hWr2Z3rdmOpMClU9GydBwO2pHFlXH+7dHwqWCD6yiMk5SMcni
	ABTjUBxX5APUzslVW646yl17URjM7myYXsLDI0gRZW+VzWn4n18Nd8VGUquNKMx3RZ8=
X-Gm-Gg: AYBFou3cD36Nm/lHV6lGe93g1I4RH6WGu20cTPjPGJR0jSmprg0zzi4CF/5R9tfjBQ6
	s/AG7uXj24S4yiSaRb8hUUyub7Lt9bKOzvdYG+k1M8r8hJ4/Uz3SLHmxx0zvyb3AkwLH6Ak2/2b
	UISche1f+5pV46DszF6OgtRm5ZvaBFpJ0GfDaGslQx53kR9W8+0hDbhWG+4TMcAsEN76pqinDvI
	XUTzbNtDplxm35JfJY/cgeobHQh+njsIz0BMz+8WjnGWjd2L7pNzsIcceBH26g8oM049ueK4y2U
	gy7Ty4IobpMUztA1J9HUbZJOEqLORY6LLCAi0Cv79t+L8DpwSk48mPLImrwQ7gtPQOj3950zyYX
	JHruPqloYj/MlxKfvnPwxl7r7y/ysfiZcmXU81TIBzsGd0QsdTinMnhVQc3GA74MMsEC2biRyLr
	LIpgXMRY7k+ropqSeZclmwJNSpyCBV+HtAvk3Yydst11MUwWttP5Q1nyouXov8x8WyOVK7oliU5
	Z8TI4dMmsSPTk5uLcF51q4rhMPGGQYJ/VNpfaki+1KjQ8EpLXqHvNWzxuz9Ym+8tr4cISjifKsV
	2c4FiXkxCiQ+9kO6gXj3MMPwPXlLjMgxxhheK3h3exjre7NOKTGhEfsj1/4SQpHbCFZH8bHAvnq
	1erky/8+lJm8tiEkGkeh6RX1wgoPjty2iyJgduIyULJHGXDY4ghqXAwp7/N1hwOEH7K6VR1g0yk
	lxvdtdjRhYSyJ3kr+y4JX0pXpP1MBuf+Wc6OliSruOxTDqNSU0Osug4Ue9WR19ZFggGCHvlgETh
	c7MHwS7Mui76zrpkP3EOP92qdUK1517mM6WXm5G7iMcfiHMfRfR5axP4iXLCOxFv5r/eXFYHF0d
	T/4d
X-Received: by 2002:a05:693c:8959:10b0:36a:1904:60a3 with SMTP id 5a478bee46e88-36a4238ba0cmr12976797eec.15.1793586251081;
        Sun, 01 Nov 2026 18:24:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm34406538eec.3.2026.11.01.18.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:24:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] lcov: Disable the XS extension
Date: Sun,  1 Nov 2026 18:24:07 -0800
Message-ID: <20261102022407.2819164-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 02:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131737
Content-Type: text/plain; charset="utf-8"

lcov 2.6 makes "make install" depend on a new xs_lib target which runs
"perl Makefile.PL" with the host perl. That loads lcovutil.pm, so
do_install fails on hosts without Capture::Tiny:

  Can't locate Capture/Tiny.pm in @INC
  make: *** [Makefile:169: xs_lib] Error 2

The extension can't be cross-built this way, since it would use the host
perl configuration. It is an optional speedup and lcovutil.pm falls back
to pure Perl without it, so set LCOV_NO_XS=1.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/lcov/lcov_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_2.6.bb b/meta-oe/recipes-support/lcov/lcov_2.6.bb
index e23b48328e..3fb48e4501 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.6.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.6.bb
@@ -68,7 +68,7 @@ do_install() {
     # Makefile bakes the runtime --bindir/--libdir ($(PREFIX)/...) into the
     # installed perl modules and manpages, so folding ${D} into PREFIX would
     # embed the build path and trip the buildpaths QA check.
-    oe_runmake install PREFIX=${prefix} DESTDIR=${D} CFG_DIR=${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
+    oe_runmake install PREFIX=${prefix} DESTDIR=${D} CFG_DIR=${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl" LCOV_NO_XS=1

     # The upstream test suite is shipped under ${datadir}/lcov/tests and is
     # not needed at runtime. Its shell scripts pull in unwanted file-rdeps on
