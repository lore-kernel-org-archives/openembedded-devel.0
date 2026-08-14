Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0B1C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24539.1786747639062810801
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W3g5pMFW;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1414137a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747638; x=1787352438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AliPHCjrJCFeMce5YWfeD7dRctKFrUXzTjxMXA+DCUk=;
        b=W3g5pMFWlCq6cprWFay4qCOloQSzuE8j6FPZBB5W6yzNouJPDO53IQXd9b80ELWu4e
         3hn91CEDyvtyGxwJAB3DrPynYYmEX6JTFSDzr5ycZCtIOshIiXrnQn4PTDvZ7f9HFgaY
         9czEhb44Z8KlqQ3SrOsazQBoIkr4/8ciPe1U6i0TR8quDBmHG/zAeITdJFD7r6IDXQN+
         BR9V7dNWfgt2CX3hNbDppxFuLvVIyTZz+QVhWHAiaLp9rJG/TWZF/RzB15w4qBM8+Ngt
         AVqYUbwwDK8PNM2YR1wYTh1DeM7NIZMXVg2stZfnqWC9gGMTejb2NfRCM2gl9NPKjKuE
         6r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747638; x=1787352438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AliPHCjrJCFeMce5YWfeD7dRctKFrUXzTjxMXA+DCUk=;
        b=gx60WXpcCNJeWoGBrtPQKRWhBWTCSMGxCmJI/n3Th0eyTmv/Stjy9DWkm2zUl740kr
         bgX7m2mqlFQHSSyo219/MSjrsyUnaHrxsNoviOssCpWlmRWXzqEMStNejeWb7km3q/Yz
         S8Fu1xR/o+MFzBxHXCc2m4Uv/pKRYuFo95Bee+tLJpz6nQCoCwpXRIrX+2Cv+ibuptP2
         ykqyL8MasU/lX59H5pfiwPCyxfj1bUojACddG289r04G27HWFGPo3kgQcGl5WnEcsHxP
         lXHOSMaW+oIX4IoYtLVTuOhCHRqzNZbJkl64Xxs1WD8NmxVlYCP+S3nmGTw0whl/j6hd
         GPaA==
X-Gm-Message-State: AOJu0YwuRuo8VmdUOp5eYBBMQHk8yp6n3znkQv6idHsD9fte+YVhrlBo
	/cGLiX0n/r+sCLxMDpBj6isQHN0PJpr/LsBFcefTMPU4qogRzT/DE40KAPHZoKh/
X-Gm-Gg: AR+sD1380kFfkY/NfzeVkcsuiqWK/bj5JXKw7V83nAjy8wN3QH3zVYCZ6sxlLx3wG6F
	9a65sIGcfW7bBvj//5S1eWK7VEoYzyxDj2y4xFAppqETBFZvWd33aQiTg2RaY5NCgIhenNVA/em
	X2/QnZQbNVJUM7nJ/KN3//RxLHB2w+wkIp4C1481dYg5EHIDtXV1Fphh0q5NC1Vc+H+B8Kc+Pdz
	uVkWsCIDNFS8qC7QHFMeH/TUuBlFOCcOCRDe8OzALHG+bXC36dbdvv/tXBdgKrOgFvupeSbn/M6
	RTIy/oA+I1+nn2b94vbT4lHcX8fPLKOC9fB5BPTHLmQMeCxww4PAn7rOoOetSjFYbjF2V/7IJUs
	yDbtMLDT6JWq6+5V19zoIVV9SEJzqsgKap9NWUdVZ3iKaEBWkDUz2aXTeEPXVygWElruqLxuQWb
	9lx9J9ZnqqM83G+lXX6KFsBW/kj6d8xFZ7plXSG3KNP0CxW9Frn6s032lY9rGU+UygD1nTP9x5v
	4dzHymxKuw8D0CmdH7BcZrAMTl7fUCXB0hLPUIg/jbQmywJ/ujUcHD/PMjxgdYicQjSOQfKfTvh
	KSDGKKtfM6Qp/IbAaYwyhUk9fE2zvhaghvMfhetdMD1S8fJkz9/yS+wYqb24iA0fcLy9EaLcOVw
	7NRvFpyj3ib2uN2Iz8VgvTAKrmXD0Hy5NVrjf7jDWFZtqOPEHVezJv2Mo
X-Received: by 2002:a17:90a:da8d:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-3933b8cb3d4mr10183589a91.17.1786747638322;
        Fri, 14 Aug 2026 15:47:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 083/109] python3-wxgtk4: Drop the --baselib option from WX_CONFIG
Date: Fri, 14 Aug 2026 15:45:09 -0700
Message-ID: <20260814224539.1523174-83-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129147

wx-config gained --baselib from 0005-wx-config-fix-libdir-for-multilib.patch
in the wxwidgets recipe. The 3.2.11 upgrade dropped that patch, since
upstream reworked the install paths to derive from CMAKE_INSTALL_LIBDIR
and no longer needs it. wx-config therefore no longer accepts the option
and the build fails:

|   *** Error: Unrecognised option: '--baselib=lib'
|   Use wx-config --help for information on command line options.

Nothing else needs it: wxwidgets' do_compile:append already rewrites
libdir in wx-config to an absolute ${STAGING_LIBDIR}, so the lib
component never comes from the prefix here.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
index 9a8952df32..e1d8ed06e1 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -30,7 +30,10 @@ INSANE_SKIP += "pep517-backend"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR} --baselib=${baselib}'"
+# --baselib came from an out-of-tree wx-config patch that wxwidgets dropped in
+# 3.2.11; wx-config now rejects it. It is not needed either, as the wxwidgets
+# recipe rewrites libdir in wx-config to an absolute ${STAGING_LIBDIR}.
+export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR}'"
 
 RDEPENDS:${PN} = "\
     python3-difflib \

