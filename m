Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D89D078A92
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 10:55:50 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id n7so16754721wrn.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 02:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mxv3el96EPtLCBm7zPBPQ+lHwfS6/LgdCQyP5AypxMA=;
	b=Zq/aTygwiOoDkKOVcx9NdZFiuI6N76ZleKpjkO/szWsOsTqOtqaW90JJrvabxIIqdW
	UWM3308yOukwXWjIYnIKo2gdfGVB8WVhDhGk19zh+yTg/GSeK26XcAn8WVCnGEZ9LkM4
	ll9xWvaoNDYGhVZIVi+iIRCm1DG9US3zckNueJZlVXD2fsPGzw0edzQ9WWjOmWybu09y
	/ufDeODMqlBb700y3mUG4008BJmdFOhh5NB138C/Mx9qXRTd/9oRJdNNWWB/EvrL4PYt
	adwk1yZ/Q8OATp9RrrOMasPid4ODf6xBPpxN3YceIPPNUlFMp7YZimYy5KqENj0RSCqj
	k1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mxv3el96EPtLCBm7zPBPQ+lHwfS6/LgdCQyP5AypxMA=;
	b=hkX4i4QpBQSyaXk7gpjWKv4lWtd/oq8ynv7NoJp4j1hSDIEsY3AgDtVRQi/qqjMeYG
	E07uciW/pkypWkGJefHodDcDR9j3ANYYSPKvRR8vphHH22q0jjVRpKicxeilV//mMIv5
	kIbBqM0RGeK2sCDJI5ZZbd7m16awXWd9TWRI2fwXz12so5BDHLLAER23LieM6wtlkSaO
	Pz6FfOdMz4HY6AKmQV25HUA5umkxg7lZX5zWHPhO3sqXIAoF5dpIORawKz3+dfivPzY+
	j+pzssSkLo+D900T5oCnwdN+v7skYQG8+T6xP85E4YY5G+zyBtonfho/zvOuapyXeYxC
	BvBg==
X-Gm-Message-State: APf1xPDBZK7d4m4eDsdmHYFmnCgcjTuR/SRn/uAu5CkVvtgNTB/sqJCc
	q5qnJUa/2544GLnSf6S8SRviTA==
X-Google-Smtp-Source: AG47ELvG+b5WTYv42d0eeYPE8vhz9vs/2jrpsxmM1aJmcfP8L09i2U8T9V5Vadjbs8PsHiRzx9AIag==
X-Received: by 10.223.130.176 with SMTP id 45mr12142590wrc.250.1520247351204; 
	Mon, 05 Mar 2018 02:55:51 -0800 (PST)
Received: from shrikant-Precision-Tower-3420.mgc.mentorg.com
	(nat-sch.mentorg.com. [139.181.36.34])
	by smtp.gmail.com with ESMTPSA id
	s125sm6222158wmf.4.2018.03.05.02.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 02:55:50 -0800 (PST)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 16:25:43 +0530
Message-Id: <1520247343-906-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Shrikant Bobade <shrikant_bobade@mentor.com>
Subject: [meta-networking][PATCH] ntp: add libgcc as runtime dependency
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
X-List-Received-Date: Mon, 05 Mar 2018 10:55:51 -0000

From: Shrikant Bobade <shrikant_bobade@mentor.com>

libgcc is required by ntpd for execution, so add it as runtime dependency.

ntpd execution ref. log.
~# /etc/init.d/ntpd start
Starting ntpd: libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted
done
~#

Signed-off-by: Shrikant Bobade <shrikant_bobade@mentor.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
index 719c60b..6db165a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
@@ -109,6 +109,8 @@ PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
 # with wonky clocks (e.g. OpenSlug)
 RDEPENDS_${PN} = "${PN}-tickadj"
+# ntpd require libgcc for execution
+RDEPENDS_${PN} += "libgcc"
 # Handle move from bin to utils package
 RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
-- 
2.7.4


