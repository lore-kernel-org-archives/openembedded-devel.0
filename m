Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0037378875
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 00:12:10 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k21-v6so2995362pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2018 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=qJOiqepSSwzIzrfBwiUSi20xho5Okx1Q0mqtYIQMV5w=;
	b=PnqR4kOIPKyZwbu4+meOYSRAUTU29IaSaRco/eHB9nQgGGrLABiOcxCMX+6nkUm/Cp
	H98c6uORgpH4cV71iF2P3FdOmloJ6917dcubOoujpOspfmeMEuABuL/6tUEek/E47u/W
	0fXSHURdPonDINkh0UQHvoQr/2U92+YVeXbE9jMrBbjGxy2HWiMhrFVi1iDmjUZGa/oI
	ERYh1ODFZvabBCY0dL/lNpcNRIuJ11pHc5M/k/yH1hx8LLRGPVOHONdmGch4IJ4v63WN
	kyHjpttj6FX1lxSTq9JNzeuKMT7A31t7z5wd1BcGYOCpUPERIEiNw2HoexLrlr/Uc4kz
	vEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qJOiqepSSwzIzrfBwiUSi20xho5Okx1Q0mqtYIQMV5w=;
	b=D6wva/38H+4drtDHUan2V7X/QOTQUL9g3IloG1cSzLplJfppVdUM5i52rd3EyBJsL2
	RgO4pJhxN5VFKrFZiwBjuSDT035DGLHFPJ3NKiQjk6kLDyLNb6Atmr27bOnRxhFb6nBh
	KOIIL13PB02DIPdiwc65dS796E9QV+n3AAHuKB4jx5xUu5iP6kq0Fl9if2/GZNVvICZS
	pCPWS6b9W4YKrTBy/F8Owf1d4nP9BlTLWVYcrTZbdA4xJ1f9C4yZfn8t0bKFWidTTKXh
	VmRFnH9Kzh0AhyW30EPef9OhK5CVfIo5sKXq7a0PvCHwQjd4PjjtN7Vj59AYGF6UG6le
	RO1w==
X-Gm-Message-State: AOUpUlHOoAVo1Ouudiw43nhW60Da0qF3A6LSSoDMKWFkUdwj+zr4T8cN
	qi1wjI+xhleELRzllzJmA6s=
X-Google-Smtp-Source: AAOMgpdkkY8BIdeoHKAC4hMMp0Twt8dlKDQKacu1fELQp9u8KN2puj3dqjKJ8HL4bkAuwcohROkLwQ==
X-Received: by 2002:a63:ac57:: with SMTP id
	z23-v6mr10829300pgn.74.1532823131962; 
	Sat, 28 Jul 2018 17:12:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:2d0e:93fa:42c7:a420])
	by smtp.gmail.com with ESMTPSA id
	g85-v6sm22183078pfk.39.2018.07.28.17.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 17:12:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2018 17:12:10 -0700
Message-Id: <1532823130-27823-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][V2][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Sun, 29 Jul 2018 00:12:11 -0000

[v2]
Fix native build, lemon is the only one needed natively

[v1]
includes security fixes:

wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
index 91c5e96..91ad639 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
-SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
+SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
+SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
 
 PE = "1"
 
@@ -35,7 +35,6 @@ PACKAGECONFIG[libnl] = ",,libnl"
 PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
 PACKAGECONFIG[gtk2] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF, gtk+"
 PACKAGECONFIG[gtk3] = "-DENABLE_GTK3=ON,-DENABLE_GTK3=OFF, gtk+3"
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
 PACKAGECONFIG[graphics] = ",-DENABLE_GTK=OFF,"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
 PACKAGECONFIG[ssl] = ",,openssl"
@@ -50,6 +49,7 @@ PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
 
 EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
                   -DENABLE_NETLINK=ON \
@@ -62,7 +62,7 @@ EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
                  "
 do_install_append_class-native() {
 	install -d ${D}${bindir}
-	for f in make-dissectors lemon make-taps
+	for f in lemon
 	do
 		install -m 0755 ${B}/run/$f ${D}${bindir}
 	done
-- 
2.7.4


