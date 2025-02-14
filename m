Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BF4C021A7
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 16:18:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.24848.1739549900003599989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 08:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a0kyA5mk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f24fc466aso1562956f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739549898; x=1740154698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uT188DMGi1iVMza5mnZjVn+sWqIPAJSiTeefF2qyDo0=;
        b=a0kyA5mk6QxLEFVzWaJk2OZDzDm2R6dNtnnXBnN+zqKC62CW1qUzKj4fVN9kcmy2Ij
         TQDtNmufuWiYv/1LtE/Utyb5V+F+stpZatkv6HHO2/EnaaHyEuHg/EnfZbp/aFjT+nD9
         fdMskmqPBIKz7bDGGgM1XHt9C6+XQLigzokcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739549898; x=1740154698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uT188DMGi1iVMza5mnZjVn+sWqIPAJSiTeefF2qyDo0=;
        b=IruVub2pWuKHFgW8KyPhKX4dX/8JKVrNoDL+0FkSQnAct7SyzG+Fbe07kCqowowb0N
         /4Fnzt/pAKxGLjSSlKPMCSa7+gsCWyu9U7ZFyA6A/KYktosRTPEobAB228nkO5L8EE4V
         VnrppikbU7g02gMTxgD0eDXYpWw5HTN7p+rVbiCelJlrEO9V6kswJl0Dn1m5Rzzw0mCl
         cuGObpVnNYbLFHr1Jghlg/qF75y9AcSF9zJCXo5F2DPTbkj4nfedgy7gE5SjRDIukx+j
         pKounr5mqC+3odtO0a/07cTPOnQ6wooDpZA8ixI8ctmUtg5cCbgoI5s8SbGgYkcXfOyb
         Bb4g==
X-Gm-Message-State: AOJu0Yz2ZnZ6ldQd3PkY6550JSma53oBqo22v0Gbey3CvfinNoTC6cCH
	tXvQQ48BLR7pZ5Yqyu3ev0ONG+/LW81KbxcnTEvtSOy0o6YqHi5EJNycx7wIOTvjugsXcaS1bmv
	R
X-Gm-Gg: ASbGncuMsWyAmcOMQZA5jQ9ocjYG/UeTQxD3QVpjTPcIOc3NbWYS7kmSqEzARgpsEvS
	+qsEhgLX1vgGWzkCboTRP+eUihOQrVmSa/6i1lawxAWvsuMvarGwgchZedmw8WYs/koGX+PzGY/
	SShqHyUbJjmU0bWcCP9mUYZiubExjDS+ACXYoQE7047z3Xzo35Hrb1LTvTBZvTuxx2yYap3zKiS
	ugl1HUKsuATAwkAUxTyCB5OcIQEzetukO9WwmQGM4QAsPnDv3x2+0WRPzqsibaxyeugXFqeX95q
	DAx9cGexjoBsHN+nieZYvFk9zPNlBA==
X-Google-Smtp-Source: AGHT+IGEJmEd+qKJdN/dlr2XyARSgGR7UFQgxR8U2rABXv4hPqUqC2beXaOxHgXLxFEAyIF4ObSwag==
X-Received: by 2002:a5d:6dd0:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-38dea28e862mr11511438f8f.25.1739549898013;
        Fri, 14 Feb 2025 08:18:18 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fb6sm4915287f8f.44.2025.02.14.08.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:18:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-trio: Upgrade 0.28.0 -> 0.29.0
Date: Fri, 14 Feb 2025 18:18:13 +0200
Message-Id: <20250214161815.3120205-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 16:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115486

Upgrade to release 0.29.0:

- Add trio.lowlevel.in_trio_run() and trio.lowlevel.in_trio_task()
  and document the semantics (and differences) thereof. See the
  documentation.
- If trio.testing.RaisesGroup does not get the expected exceptions
  it now raises an AssertionError with a helpful message, instead
  of letting the raised exception/group fall through. The raised
  exception is available in the __context__ of the AssertionError
  and can be seen in the traceback.
- Clear Trio's cache of worker threads upon os.fork.
- Stop using ctypes to mutate tracebacks for
  strict_exception_groups=False's exception collapsing.
- Fixed spelling error in Windows error code enum for
  ERROR_INVALID_PARAMETER.
- Publicly re-export __version__ for type checking purposes.
- The typing of trio.abc.HostnameResolver.getaddrinfo() has been
  corrected to match that of the stdlib socket.getaddrinfo, which
  was updated in mypy 1.15 (via a typeshed update) to include the
  possibility of tuple[int, bytes] for the sockaddr field of the
  result. This happens in situations where Python was compiled with
  --disable-ipv6.
- Additionally, the static typing of trio.to_thread.run_sync(),
  trio.from_thread.run() and trio.from_thread.run_sync() has been
  improved and should reflect the underlying function being run.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-trio_0.28.0.bb => python3-trio_0.29.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.28.0.bb => python3-trio_0.29.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.28.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.29.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.28.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.29.0.bb
index 04458b766c..35fd05a199 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.29.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "4e547896fe9e8a5658e54e4c7c5fa1db748cbbbaa7c965e7d40505b928c73c05"
+SRC_URI[sha256sum] = "ea0d3967159fc130acb6939a0be0e558e364fee26b5deeecc893a6b08c361bdf"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


