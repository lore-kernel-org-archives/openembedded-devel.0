Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37971.1795594148774370195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N3VGPcnN;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386ab9ab619so6450634eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594148; x=1796198948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3rZGdvKfZNNDubG35IVbTjKWCOgUyw2RrXblQ71hSk=;
        b=N3VGPcnNX0LkcRCu86lmHt90LfMevW146vLvnlyhoUFcwRFwnIC2n2/11LNoCE6l2D
         rBlcGbaXD1/R4p0XcdGl1B8fpcFOJrFiQPX4Wn2gEj6s68xOgKiOt0RmKWVQblPFlDWE
         wzvo0/Isyh4VFvARg2bDvCQ5/3RJcbjgxIZIzKr17QZVclxBrkbEUuepZn89DCae3pJW
         iJk6q3MC8TpslaKf65GdjTTXixdXRH5x/x/8NhV70w3ku925z6dXSu6t8jCZW6UpmCB6
         sHgLo9ycH05qV+WgKkL1eGJGaXptdQODrkWvJA4uZCt8io4DP8E8MF8oYmypvfJh9Pfo
         X9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594148; x=1796198948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3rZGdvKfZNNDubG35IVbTjKWCOgUyw2RrXblQ71hSk=;
        b=pjZlpXA9XedrwWoKWvASj4Zv30vVXJo1d/QgQxYKvf1MKLXnqpQn9JolXJ+gmRd5Ri
         49G0laQixTbMUK+2X1v2GIzjct4DoCf/6tUOsXIwa2akdntvB5FLD2W13zTt5mT1X91W
         HvQxyXcPHk0iojrjp7K2QXU/PJK2TUdltTwoAG+boQIaKgKm7O+34IQN7fKzGY7AGoZa
         AetVHX5Ry9CqTybaEpem9aCpsiU+hrd6EvPGNIqeCN4RhXlNnpillogh2oipfLjDc7Kd
         nAKc6nZPgt3cGOWCs48KPu/31klGjODvdH3mpd35aNSR8cU5+0/e9AkxlXiapdn5B7Am
         KowA==
X-Gm-Message-State: APuU4Z+PG6rK+FzrmbGQdA4wKGlc+btfegaDKCMyZ2ahdxZHL7woleBi
	hX/8OUu/Qngyb9VnFsgY9TUzVetLEeH18ZBirRixQFb01ckRd/R7apm5vsiEH1XI
X-Gm-Gg: AZFdTZcsCqNFLmUG90qlRofRNgyiNgkbG6kTmEU6t03GZOzc7k4IJ1SYYk+in9kLzm4
	FKT67fDoV0i7KHLVoiBQM6y3f7yDUlMTDy9BF/HC1JC8nlF43uHgB8Tisw+97s2pyr/UP5XCJLW
	bZyy1J5Xsu+TDOfI+Jrs2FbGzgmEAuvqT0GhDxb4REipnNwg2kIyxIgjxGLvtAkyMRgg/Uz2GIK
	Go1QDZ5jAT3kIPYBzxN03n6nrgqjk2xghqUtGidfAZpiNnUMYZnbAKQ6SkY63l3U9Ys91VJESLU
	EOUTbGJcXX8zNYO7JuZ8rSmuL1RqmxRUUktRrypGEnJQLx4PVPBxnLU5xpU5SrDVMOk4XYilSgx
	wY48rs8EvA6VyAdZiIeZ7BQNGXt1Y1XoNGBSsY9BRRmNckBzZS/u+0iakn3dE8B8R3Ke2zBNxgh
	phMYEyKeSpsI/Q4BfzRGclH0seADea/JWs92gr4D4ZI3mqqaG8eEy1DLNik42ASSTFDC7MgEMws
	cvfzGjahZWbHbNICqoHe3X1FsIedPeV6dJnRjfrxeAk42nrjZYgn0LbMULB7+O4KOpsTuhibIDQ
	nlkQhvFiI5SMHPfj+SHRJjhuB6fYpuq37Ppvb7THRD7Okh5RJF3GM1gZqrNXUCksN4Tl8c8Wovx
	xmO7omyzjhMm3hOZGKSAuTN6gTavzVCF0JFHmcSWwOgHB+r4rke+8TGaesEv87Jc+UZkwhHsNyb
	a5lcKIWWV0/UEQMswfw9wK19AozMHOOxb1EBJXGGa0ng1kTWafXn3ZOUMMsS7Eja+OIUBKG2WkL
	NnXf+rS/eJ1vVkqqBd3cakwGFF2AhCphuJPc5PE1Jc+t0AcJS2oal3Uoepd7dl8kW4usa+NzGm1
	KTS9WshM0yZ+KNx7wvg/PCaIag==
X-Received: by 2002:a05:7300:c011:20b0:386:b100:467f with SMTP id 5a478bee46e88-386b1004ac7mr9681802eec.11.1795594147999;
        Wed, 25 Nov 2026 00:09:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 13/14] python3-glances: Add missing runtime dependencies
Date: Wed, 25 Nov 2026 00:07:24 -0800
Message-ID: <20261125080732.2419614-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133071
Content-Type: text/plain; charset="utf-8"

glances 4.5.9 imports tracemalloc in glances/__init__.py, which is in
python3-misc, so "import glances" fails and the ptest stops at
collection:

  ModuleNotFoundError: Standard library module 'tracemalloc' was not found

The next import that fails is statistics. Add every stdlib package that
glances itself imports: python3-crypt (hashlib), python3-ctypes,
python3-curses, python3-datetime, python3-io (socket), python3-misc
(tracemalloc, webbrowser), python3-statistics, python3-threading (queue)
and python3-unixadmin (getpass). The tests also need python3-shell
(shlex). Sort the list.

ptest: 55/55 pass on qemux86-64 (glibc, systemd).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-glances_4.5.9.bb            | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb b/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
index ff52b2a7ef..7b304c55b5 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
@@ -28,22 +28,32 @@ do_install_ptest:append() {
 # psutil/jinja2/packaging are oe-core; fastapi/uvicorn/defusedxml are
 # meta-python.
 RDEPENDS:${PN} += " \
-    python3-psutil \
-    python3-packaging \
+    python3-asyncio \
+    python3-crypt \
+    python3-ctypes \
+    python3-curses \
+    python3-datetime \
     python3-defusedxml \
     python3-fastapi \
-    python3-uvicorn \
+    python3-io \
     python3-jinja2 \
     python3-json \
     python3-logging \
-    python3-asyncio \
+    python3-misc \
     python3-multiprocessing \
     python3-netclient \
+    python3-packaging \
+    python3-psutil \
+    python3-statistics \
+    python3-threading \
+    python3-unixadmin \
+    python3-uvicorn \
     python3-xml \
 "
 
 RDEPENDS:${PN}-ptest += " \
     python3-requests \
+    python3-shell \
 "
 
 # Optional fast-JSON accelerator glances uses if present.
