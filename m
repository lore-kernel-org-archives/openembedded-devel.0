Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id CFBAB60E9E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:42:42 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g3so2992800wrs.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qHsBJBKuQWrSNR7tKi/papKR/De+RU9indO9XM51iZI=;
	b=q3UuJyk8luTMVY/jbGtp08bar8TRlZmAm81vblzrzQuN0Z68trmyNHFTABH+mMxTXD
	sjFFfEHTK94k1ouanWEp7sNQAQAvhn2t1a9GykJysncUswbHNevrCZclRJc1BbDQtZ16
	25gcNrS7OSg4OMmpc2JXgCMS7vKQmSs1Twqiy8jPc3Z4+nM0VIX0i6k2QC6Mkxttr9FE
	jToXdYzgjUAw0wF0JtGs9S0RGs9SIcui7sOqtejgMPShqN2Zr8pXQssMxZ5OnL9ALQJG
	yND2kn9AN1mpmWnveM+OdkES1kBB/AoyfZRyFpVsj0A1NCVBJlql/AvB7HxNjginCpcO
	lT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qHsBJBKuQWrSNR7tKi/papKR/De+RU9indO9XM51iZI=;
	b=XfVxkBl+NTkhqIO/nH/YYOEzUZHXuuYGeHcHU6ASGBzaui/kdtvCvxphHwXObe1qPw
	xB7osF7fKnH72oXd/LrXJnQxH0TSsjFNCTi7qcWRQkEnGLJVUybDzB5g5Pumptoz+XBm
	h/VVoX9+RGwVcPOYr1kTSRXwXLtwJSvscpPAEdOfGO5cfERBm56T1Xrti9D/ThEl9NPP
	TueZfRIwiaPbr0CJQFuBc7ybLW/VogpfC/5L9Zj6TudzZepCgG9VIxl7zKCpnFm4x0rw
	fO+uDAfV2FadXgDueeoXK7LrUHNeuG2fbkvxh8uLZ3uyjTd5cq0Xl9AJjFe9prEQCzKe
	bYyg==
X-Gm-Message-State: APjAAAWKHQ+ihzh3cOwzkWPKkAkmHhtqYPw+QeSBgzhPUnYL3HiBm1CT
	8shzP9WpSOSuqSbOgWILMDtTgpbE
X-Google-Smtp-Source: APXvYqxB9Fj1mnx7vg/MXfEcMx11TpitsU2wa23x25FPsjG2HFaYwAK4HRXgdQQJ6WZV89wy3FnE/g==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr11345197wru.40.1581248563322; 
	Sun, 09 Feb 2020 03:42:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	a13sm11828426wrp.93.2020.02.09.03.42.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 03:42:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:42:24 +0100
Message-Id: <20200209114226.2584-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209114226.2584-1-schnitzeltony@gmail.com>
References: <20200209114226.2584-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] mypaint-brushes: initial add 1.3.0
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
X-List-Received-Date: Sun, 09 Feb 2020 11:42:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a (r)dependency for upcoming gimp 2.10.14
* there are 2.x versions available but these are not what gimp requires

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
new file mode 100644
index 000000000..d4d08fe8d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "MyPaint brushes"
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+inherit autotools allarch
+
+SRC_URI = "git://github.com/mypaint/mypaint-brushes.git;protocol=https;branch=v1.3.x"
+SRCREV = "be9fdf9ef6c54e29c7499992f04e29114857b3fc"
+PV = "1.3.0+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/mypaint-data"
-- 
2.21.0


