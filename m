Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.5399.1618064981280074872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GH1FU5Qf;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id l76so5966167pga.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xBON3QaxvphMYHy/FfSibG1qT2eljnzBqGZVZqL4SEU=;
        b=GH1FU5Qfa4TuU1r/orQKoUTxx9TFnLmoU5aHb8IX76J+PGadJ5aORWwh0ijDu9aulC
         9zRFlV0KIn0bHp/qNtOd9F+29H7ndCmpHN1ZYRNzLvNoKxo8xYGUdE6DkawksW1IW2ns
         8vU9NcwLaA9GXIxDOTscIEdJaTCw0CyVucfS9yjBIikJUxnwYTJwiJnptoaGZ69svmwU
         xfVPrNHdM/BC4M9mYK8tOWJbMRPlCpB/5y0FLO9zBBEyfrHFOSC2yB4T8WuK6UMFfAiQ
         F3s/tEiZObaG1KdYiGjW16iR3aLhwshl4CPz1fR5iIn3gwwxZ8OaiqdZgCg8HaU70dcG
         i67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xBON3QaxvphMYHy/FfSibG1qT2eljnzBqGZVZqL4SEU=;
        b=RLJhTLgso9u/wMLOsPncE70ABU710xm/PYT2cpW5BznV77RBA7KJnEDWW71ppcQs5j
         Kt2WviImxCQsVkhXBeS//ALgryQdviJVHmZm0R5j+d/bnPQl9QqyJl8TfytvweTITP69
         VFPl5MLLUBC62TXtcDB4anMApy6CDZlMEsGa3nrof6PL5fW+JLVlp1r7MeDAeTkljQrb
         k8rifL6ajMVWR6bm09HsklpoVtWBF5+iWyMq/VHM7UevS5bqdXepS3rbxLXriEvJyvcu
         ba3PIy7uIxpznBQqkWUBOE0cyYajFdf0dZc7XEOTM2FGfthj3Pu65Uxcpi012dBLTnbo
         2I+Q==
X-Gm-Message-State: AOAM533y3aRn9M+QIZK5mgt1f8LomvdAQBoj+VgHKySzLpnbVg3ts0nl
	ko2Of3kPGIpTc/L67VOXPZOIWfV6BNI=
X-Google-Smtp-Source: ABdhPJwYwh2h5eljPuKq7WcEvJ/AQYpWOKj0avwQKlCCM09JWSV4sT8bF2keGf+fi2s/dhtogO7Xaw==
X-Received: by 2002:a63:34ca:: with SMTP id b193mr18404195pga.320.1618064980723;
        Sat, 10 Apr 2021 07:29:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id a65sm5120183pfb.116.2021.04.10.07.29.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:29:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 3/6] libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error with usrmerge
Date: Sat, 10 Apr 2021 07:29:31 -0700
Message-Id: <66adbbce87cd725f7dde0f947808c7a390a4bbf8.1618064877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618064877.git.akuster808@gmail.com>
References: <cover.1618064877.git.akuster808@gmail.com>

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

