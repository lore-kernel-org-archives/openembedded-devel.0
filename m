Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8959978400
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:38:47 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id p84so11269442pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=g3YNNhGKM9IHJq62ChBfY4hZjk37hw9GU6Nuq35laiA=;
	b=gm3wuQYPSKd/nuD+sWU7b0ead+HxqTLk5NlP781xv76LUtnlIc9mf18WIdDRBBSIDW
	BvI1YZR6KBR8e6Pz5+YLKo0Z4E+LRk3FNkeO4pYUUN1DeFQFR7AaUWf/k3NpoXmnAV46
	OQC4of3TvRvHuXdbx7gusZw8FX3087v7mK416To8pLZDRJKXAvX3ZGMs8GCEJ82y07mT
	0cKKmas5k0QFF4erAcKLnC+4nE8WFc6+ntUb8YyrOD5rHFvTP++U27MEGQ61Nv8R13vf
	3akPc2FBWDz2Vli/mWrbP1jO9DW3ocFj5vQ/QV72z6iFEMzFcGiAkVBn1ylwQnoLaTPL
	XjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=g3YNNhGKM9IHJq62ChBfY4hZjk37hw9GU6Nuq35laiA=;
	b=KekhweObEj8HlBAby9ziiRfNHXUgXpfrIm4JOSp8Nw/NEoPog0GWEhMCVlm4s1h/Ey
	9aXf5NOLggnq8mKYg1vukhmtuf7GzlxqrdOgJ7yblzTsFyJmbLqIYaXfCCWvZJPZODKH
	oCWNXA1yKW+cqulRpbaMh/IbqQTopdQYv/cDvCaaG3Fi9jkZh239qfESfk9Oh0x0VAwM
	AUNJTC0lKVXpUt7fK+llgr9DlR2LNIXMxS4HY/JrtAWanCXzg+Q+X2Ud67em4Fe+XPfn
	GTl3mbs7mrqwre4DGgaVatvkUpT9ORtZhMFrs35t8QapXG0PntNpERdGAor3/CNj2suP
	97BQ==
X-Gm-Message-State: AKGB3mIvDaB1MEBDtAwET4Ky/dYJO1WTTgTK5FF7QSb9p0XPWHPtyH8V
	CFa02xdNw2RM0FiJl7pAjag=
X-Google-Smtp-Source: ACJfBotm9vCkyU1VPEISPMDJJ4M6EG9mIk7WgXfd+i5ZF8o1z8Tmv///tFNdUkDFH+ny8toq8ZZFzg==
X-Received: by 10.99.123.80 with SMTP id k16mr3383447pgn.43.1513697928533;
	Tue, 19 Dec 2017 07:38:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2140:490b:44ae:216c])
	by smtp.gmail.com with ESMTPSA id
	j6sm30770880pfg.85.2017.12.19.07.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:38:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 07:38:46 -0800
Message-Id: <1513697926-23442-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: Update to 2.2.11
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
X-List-Received-Date: Tue, 19 Dec 2017 15:38:47 -0000

From: Armin Kuster <akuster@mvista.com>

changed --with-ssh to --with-libssh=DIR

includes:

wnpa-sec-2017-47 : CVE-2017-17084
    The IWARP_MPA dissector could crash. (Bug 14236)

wnpa-sec-2017-48 : CVE-2017-17083
    The NetBIOS dissector could crash. (Bug 14249)

wnpa-sec-2017-49 : CVE-2017-17085
    The CIP Safety dissector could crash. (Bug 14250)

release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
index 5358ba0..5eb372e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
-SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
+SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
+SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
 
 inherit autotools pkgconfig perlnative
 
@@ -39,7 +39,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
 
-PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
 
 
 # these next two options require addional layers
-- 
2.7.4


