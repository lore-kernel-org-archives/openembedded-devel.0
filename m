Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B13A674D56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:12 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id n9-v6so18084703pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dPZ2WNUulGrI4i18zvQNEeE98XNhg8/OTOsXCSBoSeA=;
	b=cV1Bs8N+YO7C19oglN5jbddK3M2qd51cN8Ev+k8Fhv+MsM66/D3xuaPMUerCTv6gmh
	tM4WVHKUYMeu1ny1aqudep5nC5IvqoMGruSCiraNUyUWqeUv2aISnxwNo/yfRLD5cQ2/
	L2I3J5QZFSMIckuE3tFXxOMiJe1rRTnxHBRsNiRbVbIBG0OlcaNU36jifzAKmkzu/aM0
	OmCQ1J5S4j1koAAGmcKbY9acT9oEu4/gVaKi/yAcWcNwg0IpArzHLPCRX0SI61UCRttI
	KrTd6gv1RvKkX/pEgU/hWSJSjNajWLR5Ap+o/TCT+nEIOVzyFo+XO3QzogLs6nBg9U8S
	o/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dPZ2WNUulGrI4i18zvQNEeE98XNhg8/OTOsXCSBoSeA=;
	b=pClhzKhh3FgJw0LaVJjOR5bBCaZVlZa/vuVIHDkginRsOdVeiAir1P8X9sqt3IA62H
	waE7I83+a5Er2E/12xI4zgiNVt9v4+LNtI4M4PkXRxxy3tlljjTnARxXdTp+zqjn17K1
	SMaTu0gdeC6qPqF1l6EeFr209dh+nYIlCmKxvJHgXAX0v7F75wAHGh6kmd5jl4j87hMw
	BDMX378zJ2wteApabmNN2D8mZdSCaEf00F3QE1M1BCjVOhgYYhFw54NGnGPOVOmOXjME
	zv/VJ72qlmH2rPbx4D7h1BN6n9lYEwsaUAmcAqHqaW3/yMa3dOmvfq76C7zMqdBIBWF7
	MxSg==
X-Gm-Message-State: ALQs6tDVFFIHrfHwEd3dQgc4YpcQH/og0C12TdUEoeca1qEjsgv5hjUU
	b4tl5gb4IS6/HhCaT7ua4wqVog==
X-Google-Smtp-Source: AB8JxZo1RRFr2pr0XDb07zVKlGlSH5o5r3qdMDay/d0kAEjYB6NR2MA1ddD5FibMK9KpzzD51FHvAQ==
X-Received: by 2002:a17:902:8f93:: with SMTP id
	z19-v6mr18718328plo.166.1525587493581; 
	Sat, 05 May 2018 23:18:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:18:02 -0700
Message-Id: <20180506061804.19509-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180506061804.19509-1-raj.khem@gmail.com>
References: <20180506061804.19509-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 4/6] xfce4-vala: Build with 0.40.x vala APIs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 May 2018 06:18:12 -0000

OE-Core has updated to 0.40.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 28f9cde97..388659f20 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.38"
+EXTRA_OECONF = "-with-vala-api=0.40"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.17.0


