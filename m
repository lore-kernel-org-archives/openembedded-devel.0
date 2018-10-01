Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7437C795DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 15:05:29 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j23-v6so85130pfi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RZY+jDIFdi2+0zMlw4a7O5xOvv8FgipcLhYK4fTQgOU=;
	b=Rwov+z2Zjva354R7HELRe/Rmps2WUqzVSCAVSgWHSEDYycIKuSpoSsHh/HMQRe2d0P
	ll5MQQfwNKP0/W50PEfwDV76MxRMEGpmlg4GvB7nXONfr5J+dT6yhbLVT82tCN4PpWk7
	pff1C5UnzobOkNVavMuSAzkVPyCidVgS/vIXV0ZwD8XhKq2XqXIVWBmE0Eatz70JY00c
	qXb2GnZTRnXcPbvgylrb8uP8VMO6m/8qQEL2+NAI7NoJmRudvcJDWAsQx9RUnFN0VTCW
	DsyzKTHK6vA0Si97Tk4wP12wFACpeU1Zri81G/e13jfwABtoFjmHho6xqAPCsjH8t1nX
	yvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RZY+jDIFdi2+0zMlw4a7O5xOvv8FgipcLhYK4fTQgOU=;
	b=J1oJgIK/rrZIBM0c97QGZ/Rb7aPoaxGOGQ5wPiGcplP4XYyFF8pXvdY3IP5Bi6pfJ7
	of0FcBOsSJ7uQ9CNjmH+iBkH7VN4pbSXig+Qv+zyaiI5OVm6nVEzEU8YwNaYZexYfsxy
	IkOFjmEZkYWo4RpWLbAkNM0zOH/iP/4/MN0vgJkG+QN5k07e1hEcfP8UQXoAkDf8S/Gr
	ujbnuTsnkiCzbIOmw9Bl/l5Kw88Cyvzr/yWDWR16XCpUbG8byhxCtXeb0yWUIDIdqf0h
	KnB0OakjRyOSXDsQkVgqFbMIg3v3jZE7PjeOqjUlkDIjbgZ7jDxlt28p2OwZDsf4YEbL
	5vRw==
X-Gm-Message-State: ABuFfoj8Wa/5i5J0e1Z1vLIWXUYEg7sjchRkZeYKIV8axMYQKcDmb+Lp
	6Y0JipY84Oz7iWjeCPuBrN4X0D6P
X-Google-Smtp-Source: ACcGV61nL1KKt2re1SlcS8MBCNFWz5WhY+hVwoV9BwGrPvoSjHvFO7hjnEaR50qM/QPdQwHSHRHUpA==
X-Received: by 2002:a63:646:: with SMTP id
	67-v6mr10107556pgg.230.1538406330190; 
	Mon, 01 Oct 2018 08:05:30 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	i80-v6sm21990376pfi.87.2018.10.01.08.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 08:05:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  1 Oct 2018 08:05:28 -0700
Message-Id: <20181001150528.19700-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][v3][PATCH] mpd: enable aac PACKAGECONFIG only with commercial LICENSE_FLAGS
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
X-List-Received-Date: Mon, 01 Oct 2018 15:05:29 -0000

ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on or otherwise requires it)

enable aac only if LICENSE_FLAGS is commercial

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---

[v2]
fix typo in commit message
rebase on latest master

[v3]
Fix commit message
Fix PACKAGECONFIG
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index 9123673fb..d4edd5b31 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -26,7 +26,8 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
 
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-- 
2.17.1


