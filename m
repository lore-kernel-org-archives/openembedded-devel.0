Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F9AC531D3
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 21:31:07 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25208.1771536660938500721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 13:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJsgCRjn;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: geoffhp@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6798f3b7163so889480eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 13:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771536660; x=1772141460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkMzRcq5VP2cDzLr9AhEqLEbhLA5VQk/LhXXNWqR904=;
        b=gJsgCRjnjQRtdg8cp2CjLYyVM3Suar9MpWBQptdjvR8eGKCu7Yq63+NQf+ezysNGNK
         mm5eFpw8J2HvG75uf4pOuqoyaAVyvIMVWXNlZV6pqNS/6N1mhMi6ZLTJMBfjO8EPha6e
         x18KQCpYXUd93SJRUxEgcm1qdycy68PfCubRzOLqXlaoafn/dsr9WVtdXLPglk5fAz+5
         +Fbd6G57QPIYk59umhiNo7Cz3ECmDRZjUn1ykOMT+H0qT50SqPFfIW9ER0vg5zDq6i5n
         CWqopoMGOiUEfYAkkGYLTOzeQ/NO1QUVwnSAV0MLRmyejTeqi5C5g+KXoJN+FDKh6yEN
         y28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536660; x=1772141460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkMzRcq5VP2cDzLr9AhEqLEbhLA5VQk/LhXXNWqR904=;
        b=QjDQrlP89XRU9dqGqZoabK9rZUCNOfgo8eULB3gtg/FiEZhkY/kbr3v5J/2CvbSQgl
         /fFpbgiUbQ94x/1BxoST7C1ymXPl6r2wOp0UTvc8WDXWGx0i442aK1yk8f+o0mqHHLJ0
         kedMFjm/7QQUNaQeui3WzYImDuD8kpv2DNYOLkLZe6lzBp5M/qRnW6E5vflD+iU27DIa
         ls0ab2wy9O9fihIbYFT6zo96taBUYrW7Qz9bqO8EYcXcFiARWqzrn6s7yarBGmvjSUl/
         AT1LI5afnDCzXX4qlXs0mSx+P+Z2sdyNxUY0tQtxiap6RR1g6qHanNve8o2YDcH+WKBR
         cgnQ==
X-Gm-Message-State: AOJu0Yzo2X3PfaJicvnYIO37f+rvMb6ogeDxzwOPTc8I6+kAx882LjGm
	7ad4+VBCxVMzam3AVnGR1qHzrnDiwHHwTSnD9OS2Qmr/Fv1QysGReDKqdt6feQ==
X-Gm-Gg: AZuq6aInFiPjvg4V31/bszUAwcvf4ueh1Dbl60iwlMol3uO3ToP2rRiimomK9Ptau7N
	N+wN9l52SuvSUWEGvf+NYkzMxVPQV1qCmGz7qDDXxIIujpM2oXSbFDfME8h5+a3KXlDCecyTjup
	YrnnryerK+vQd0JhUkrfsPtNgGjobq7RZ9NaAL7guvM3MPbKbpj1SxoOhaJPddsHKXXU0jcWseG
	oC7t6WWCwhGeKFtzxphz9/AFSr7bg4LxWsHTafVM37KxXO+8jgtrtnYnDUNMpemZ10akgUDNwmJ
	Hkk+HhJdvCFxWvT1hLdkLpI7bzb4WMzamkI3zDaDErhPZpXaBqZv2z3NTJOIGqjtT5c+61JhxOD
	SMB6PJnp0SXdPIoe3b6a5EoLYEKiIZtBMHnKQ1zajwNDG7eL+af8A01CkLZ9lfjDRmfW8rNpohx
	MhoHijdwf0RNJAjqV6pw5V5Xb7qqg7Qe7hNWcef9cGetfMRpRY/8U0nbsNF3GVcRP1RM6/JbvYY
	pnd3w==
X-Received: by 2002:a05:6820:f036:b0:679:97d5:dd25 with SMTP id 006d021491bc7-679a7444f11mr3840419eaf.56.1771536659962;
        Thu, 19 Feb 2026 13:30:59 -0800 (PST)
Received: from faraday.ACTDEV.local ([207.154.79.109])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-678b13aec01sm10962182eaf.8.2026.02.19.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:30:59 -0800 (PST)
From: Geoff Parker <geoffhp@gmail.com>
X-Google-Original-From: Geoff Parker <geoffrey.parker@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: geoffhp@gmail.com,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-matplotlib: Fix TMPDIR in debug binaries, [buildaths] errors
Date: Thu, 19 Feb 2026 13:30:55 -0800
Message-Id: <20260219213055.368528-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 21:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124517

Fix errors like:

    ERROR: python3-matplotlib-3.10.8-r0 do_package_qa: QA Issue: File
           /usr/lib/python3.14/site-packages/matplotlib/backends/.debug/
           _backend_agg.cpython-314-arm-linux-gnueabihf.so
           in package python3-matplotlib-dbg contains reference to TMPDIR
           [buildpaths]

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 .../recipes-devtools/python/python3-matplotlib_3.10.8.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
index ce8c7a276a..8489b91402 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
@@ -47,6 +47,8 @@ RDEPENDS:${PN} = "\
     python3-packaging \
 "
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 CVE_PRODUCT = "matplotlib"
 
 BBCLASSEXTEND = "native"
-- 
2.39.5


