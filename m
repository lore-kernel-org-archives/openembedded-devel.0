Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.3666.1617934856070454795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gl6ISdpQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso4287523oti.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xBON3QaxvphMYHy/FfSibG1qT2eljnzBqGZVZqL4SEU=;
        b=gl6ISdpQy3g5u/m5xQEr+x176ljsyqlpBrtwsmfI2Ttgs6BNTipQ3pGfvq/W6PkU+w
         3+iyaNHxTg34cEfWs8KvKdSPFV9tz3u8dBrvGKg1WQXQWx780X30Fb4fZF6KwVo/jATg
         b/Z7s6D4vYOnK2V7ZmUKGH7nCG86l/Celruan2PbLkIVImiBHnUCSO8RWP35Oj26zL43
         gmUou/ruqcI14Yj6sRTmuAVx1h9v+4Qr/zCoEnV/q7lpsGZ/HZwiVnBPNw2rhk/3Nj6+
         Q5k1rvmYHiNemaPfmIxEgINhEgVqUmeGEYlcUvEMUWi0zdxAxig1PVCBFj1FQaLWdaQA
         TeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xBON3QaxvphMYHy/FfSibG1qT2eljnzBqGZVZqL4SEU=;
        b=JBjd0EBDYvluw5KCHmASjl3cZKiHfGV5LE38591TZWwYCuAyisiydvuPAq+BC+Jec/
         UfuIkWLEiTnJL4oIoxbmrKiUiD41xC32QMjWeE0SAmn5Ia3gnF2fcEoQ1ZGzscRdqlMo
         Wqoh9Hl/BD2BoiqFxGJXBHx18UkNKbDlhbrbrXf/3VD24CQ7nYBx/1+sfmXMwpT7nPN7
         BCTMhZj8kynpIOHvXKIOheGAvy9JeZ+ydhXuICr8Hy1LLr33NOpMCdvuMUd1RzN8/Vgf
         qgLc80CpTCECrxg637RSKwGEAOAsTTFooilOJ0RlxgrAp9F7gmCd1J45vwQh9rs+A02M
         OSsA==
X-Gm-Message-State: AOAM530vpL+nn98Q6ffLkY/WDM1wLHb9+AjioYA8sJbtDMMi7T35//0p
	K7+gpGbXxO29Z8gSZmZnHhX9Bq8bq0I=
X-Google-Smtp-Source: ABdhPJwv+Crlrocj1t/V6Dt9eBnNOXM8sT3AWKds+gGum9ATCf0tI2MK9EqaO/lSn9NlZmHuno9/Fw==
X-Received: by 2002:a9d:730c:: with SMTP id e12mr10029737otk.230.1617934855130;
        Thu, 08 Apr 2021 19:20:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/36] libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error with usrmerge
Date: Thu,  8 Apr 2021 19:20:14 -0700
Message-Id: <9ea7a4336163697448a9e9f2d8ca670b3428de70.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* with usrmerge ${base_bindir} is /usr/bin/sh and libsmi fails with:
  ERROR: libsmi-0.5.0-r0 do_package_qa: QA Issue: /usr/bin/smistrip contained in package libsmi requires /usr/bin/sh, but no providers found in RDEPENDS_libsmi? [file-rdeps]
  ERROR: libsmi-0.5.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

* this is a bit strange as busybox does install /usr/bin/sh file:
  ./1.33.0-r0.usrmerge/image/usr/bin/sh
  ./1.33.0-r0.default/image/bin/sh

  but also adds /bin/sh to RPROVIDES_${PN} for usrmerge in DISTRO_FEATURES:
  RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
  added in:
  https://git.openembedded.org/openembedded-core/commit/?id=1f6c14939c8daa5e09103789c3ff5031cc888d16

  and 1.33.0-r0.usrmerge/pkgdata/runtime/busybox:FILERPROVIDES_/usr/bin/busybox.nosuid_busybox
  correctly contains /usr/bin/sh

* adding runtime dependency on busybox as /usr/bin/sh provider would silence the QA warning
  but people might not like adding busybox to their image

* using /bin/sh silences the QA warning as well, because /bin/sh is explicitly ignored in file-rdeps insane.bbclass:
  https://git.openembedded.org/openembedded-core/tree/meta/classes/insane.bbclass?id=1f6c14939c8daa5e09103789c3ff5031cc888d16#n907

  if "file-rdeps" not in skip:
    ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 08fad9f3a6d1026eea84906c2ede7a4a2dc93863)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 212b1e797c7..ae76fade738 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "wget"
 
 inherit autotools
 
-EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
+EXTRA_OECONF = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install_append () {
     install -d ${D}${sysconfdir}
-- 
2.17.1

