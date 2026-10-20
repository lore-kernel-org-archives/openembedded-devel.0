Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6266.1792499562530431842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C6xXlH6f;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so18808575e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499561; x=1793104361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Dw2QNIv0PHZtWRXa14iEm7ZMKj7drBqeskpskT3Yw4=;
        b=C6xXlH6fbHkVU1WYOAPvkTm4YTfh8zaH48WiWCe7kWeI12Faq+GRbvpQVnG+Jf4oSc
         pG4fe77Zk5iNG6qePIbL6PpkObKnqXFusoM7m/abXxkdNJVRSkHMcSfjmyV6RzxSlOV/
         zTARElvc+flffV8NnVI5aBxR13CBtQ2LwZecs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499561; x=1793104361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Dw2QNIv0PHZtWRXa14iEm7ZMKj7drBqeskpskT3Yw4=;
        b=2OAl+toz6mgvX+qPA7NmXxRJJQYxniLXFE0MGDg/jsBqAvXx32niFWTnX86bi6skhX
         nOlFSUfKQlOLPvSLlsAu6pYbhn0ISkcWHlWcETYw3ILcObNvAIOd+wKlwjM/JlQbZ6dH
         vZOJmYhH07JubrdmQVdrthsBYLFEaMh0zwjeVqPqKMsJMuqjW1is1VDesDCZ8L6VEtG1
         jURN9FPU9wJOCugZNrc+u3sPLGxrLufLBNDA8RGF6S7r8aN22+/ZwxeBlk//9NC8J23r
         Q3vYPKDO3Rl+JDE+oFJfMm53PfLrCSpB/zAjlow2g/88ryPkeEGK2S/0RK/Iiid1E02D
         o77A==
X-Gm-Message-State: AFq9FYL35IhLFC6ys234BMNCsS2WcPwL5NrBiwS8aCdQJBVSkiIuMG56
	66HWzyQEzZTAI3IL2u6SPvC6VEPFp+8NfITCwJsq7919aOBYomjRdLZBceOJ3sAhKJ1cbwTXyrb
	V52GZ
X-Gm-Gg: AYBFou0EErlKAwDs1oyvrmmpaQbRs/Tz0YfXjEz5rco9pxFwsjbgpBZoKVHoYIPfGPp
	7VQEZg4DqZwN1PI6GMq/rrpQn9tvskFmL7ypcGo9ozWZvzgDQL1hlusqLpeQB53gbR8r0XZUmX0
	MRZtVnADW6Pv1z3h48GHz9RJcPQHWYyfXvXNoyxg2J5gz3D93F9tPsEHoGH4l2r4gnG3gbaD7OI
	pc54hP11lRd3kj954srxGZmeTuxnHu5+4rkr3oR7yjiN5imJlPHiyH4iDI+gtPLJHeiLknXifQI
	XBvEvig1TEQPgtVRktsmCL657bUF8qW6sUFt3Uf9HLv5lEOD2vfJm6a9w/pTL6vOrJr/V1/haDt
	ur0sRj1GS4ch593gBf/7gqcpyyR163RDRAQTbjm26h6i8A2kz0skR0pFU3lxQbGcyfdp8cUD7WW
	4aoj8V2sN7aSIO2EX0hnYp3byZ2U1InwAfXzKjBM7kC3qyAoFBehljxDjoVg6IYsSDpOj1kPUBf
	t/klTzjqIkgY3nPVUQcVgNrTDdhg1WiEWy0enp3f6pFgZE9fo8Lb7mV7IVYRheDVkAbUMjFD2pY
	mS7HBA7/La3uoI6yplOmhLU=
X-Received: by 2002:a05:600d:8488:20b0:4a1:e3e2:93e0 with SMTP id 5b1f17b1804b1-4a1e3e2967dmr111862015e9.32.1792499560784;
        Tue, 20 Oct 2026 05:32:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/14] python3-flask-socketio: Upgrade 5.6.1 -> 5.7.0
Date: Tue, 20 Oct 2026 15:32:24 +0300
Message-ID: <20261020123226.4033600-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131170
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.7.0:

See CHANGES.md for release notes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-socketio_5.6.1.bb => python3-flask-socketio_5.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.6.1.bb => python3-flask-socketio_5.7.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb
index 32d8eaa517..4020606494 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "fe5bd995c3ed4da9a98f335d0d830fa1a19d84a64789f6265642a671fdacaeac"
+SRC_URI[sha256sum] = "aa01e50106962808dadc245407c3b6354295b1526e888bd154dc7ff4801a7c88"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3

