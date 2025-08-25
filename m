Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E10CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:14:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.38749.1756127666077126137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZehlVQLZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: marc.ferland@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c79f0a5b8bso1627413f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756127664; x=1756732464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0i0t7sg0zGpAhoLoJWjSAuVcg/eftBR1hiP9ieXGfk=;
        b=ZehlVQLZaRlLE37kYbO2JhjBRJHFoAoJjJMtrCvz0Mdvg4gs2J9b1Q8fkZRQl6Xrt5
         9LUrHMaS4t8EavOHJAThsPChnFN2wGrgcx8N2yM8xQjZMd4tIHgDa3BEIC5CIP2SbcQH
         9+JNAKM4qbUslT6sVvkwiYivAYTjT8nX4rN6t9fGTq6Cy6zXY8z+vFc53lbDL9Qr3W5K
         r6iF0M+j7W5PUma9PnqnlGhczqeSpOyYFp1EuggSTYnZeIYQNSBFopC0daAfPasfttfi
         ToWA+Fe1Otvc4VKePif/HzTp3tc6ldaxxc+Q3dbLNhjVxoNviWzslGmqL30z9aGSBeOF
         IcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127664; x=1756732464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0i0t7sg0zGpAhoLoJWjSAuVcg/eftBR1hiP9ieXGfk=;
        b=m7KRfM0BAl7mJ/2DObXX4aBOimTtbNqWhOpEEymHw58UEng/zqoDePoMRC9LIvF+TN
         cGSCxP7S9Bh3MNZHYEuB+vze8TK55WltfvcIlV3A8I7RIMu8fQxRaOSbVj0dgGYZ4QTR
         vw7pwksxBoKhE5FdmJtwscngs2wXJisUQvdlFPwk+9eucWo6vj634HCYNL4tFLPc7eI0
         i7A1ZaszBrfuOYitZdxroWKfLj+wxG2kC0vNhkl77G+rkeAcMz/wBJDTkUv26Y90WSY/
         ymqX9d/guxYTfNVdT9peh4emlDTYY7B5ZnU+3rBLo4NDE6kc3T6auxQXlOYhNvZ8hhE3
         ijLg==
X-Gm-Message-State: AOJu0YwHW6dsUcl4GolqyyJmkBrjM1cgWF2s3UBX6BSeaCk0rydQVUP+
	ibnOyOTDBkZdqszHovHoaiTJ1F5X1yZbUzOvlEshyQ6g1fpi4TnnD8iud1DQFw==
X-Gm-Gg: ASbGncuwkHMO8aXllDWgnNm9PZg+20W/Qv+T9pGjvsWjA1bD0P6j6FzTXNzSFn8a4gE
	MoGTHtr2fNRnIK6kTHnhF6kcaSb6Gy7fl+cMGRh1yBTWkZwbYPYHyXiG3lnwlWBt8Y1Gsvy3Coi
	RXlGiFHxitceXl63+k7i3zf8P/L92ES6QjfkepH81t2ablZIigpe8g84h+6GDBUfXaeKRHTl7B8
	WlBdAZ44zw9G0Cfz2NqtacPLx2pZd2nkIVcAyGtGF6zJe8TcRzlCB8yHIV+1A3feY2CBXWsqLtD
	8IbEDKc3CSCH1qdocF77LENQ78lN4n5IYLF8e4Y2JH829w35KMt6RJTTM0PyRXBt89X9LvFXad6
	DroOhfwRJ2JGQJykIjHIgShZlTSp0ddc8rML1ZHkQVVQMbvxcbcLd7eZuhRlytaiXCL99lt40K6
	MgNRnJxOUgy7YQ3V07DbEBf+qPv4yxt0D6byciI3Gp0j5uBg==
X-Google-Smtp-Source: AGHT+IGAuhg/53T/f5C91gxv1tzH++K5zNtcotS++1vucalMYi/K0Q3z36+5H5xsoMb6IhXppUWqaA==
X-Received: by 2002:a05:6000:2404:b0:3b7:9dc1:74a9 with SMTP id ffacd0b85a97d-3c5dd2d7ea7mr10723918f8f.42.1756127663765;
        Mon, 25 Aug 2025 06:14:23 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c712178161sm11463373f8f.67.2025.08.25.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:14:23 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH] freerdp3: add bindir to SYSROOT_DIRS
Date: Mon, 25 Aug 2025 09:14:18 -0400
Message-Id: <20250825131418.2741396-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 13:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119095

From: Marc Ferland <marc.ferland@sonatest.com>

This is required in order to build krdp (KDE's remote desktop
integration).

The do_configure task for krdp expects both 'winpr-makecert3' and
'winpr-hash3' to be present, failure to do so results in:

| CMake Error at /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRTargets.cmake:98 (message):
|   The imported target "winpr-makecert" references the file
|
|      "/path/to/krdp/6.4.4/recipe-sysroot/usr/bin/winpr-makecert3"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      "/path/to/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRTargets.cmake"
|
|   but not all the files it references.
|
| Call Stack (most recent call first):
|   /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRConfig.cmake:44 (include)
|   /path/to/krdp/6.4.4/recipe-sysroot-native/usr/share/cmake-3.31/Modules/CMakeFindDependencyMacro.cmake:76 (find_package)
|   /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/FreeRDP3/FreeRDPConfig.cmake:2 (find_dependency)
|   CMakeLists.txt:45 (find_package)
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index 284f61c137..7f58820eb7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -60,3 +60,4 @@ do_configure:append() {
 }
 
 FILES:${PN} += "${datadir}"
+SYSROOT_DIRS += "${bindir}"
-- 
2.34.1


