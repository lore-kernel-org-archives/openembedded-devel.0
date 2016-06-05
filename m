Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2D37713D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jun 2016 15:50:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so4331394wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2016 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/I/IEQWQljBOH1RLJp+t7mdNL5zTDb50EcFviTDUWB4=;
	b=L9CXSgugQP9JoL9tX1eq380w+CHB7zvr29BWZqnNbmiUR43k2d5T2/+fHxcOeWWU92
	gPrHKGZta3a/yllOhJnuQtLzTKLAOwGfl7FUP6DAs69UJ+km72WA4SMIumh+Skao+7CV
	50J/6WUxzVzu5QoTOuqmCJAzn1D8uADwby1hk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/I/IEQWQljBOH1RLJp+t7mdNL5zTDb50EcFviTDUWB4=;
	b=tDAI6WSmd5X18yBRuvkmckyveUTez8tfLfRzeMox7QY674A53MjvR/7R1gnTFKgdR3
	gr9b5P/lmY1M1LAJFQI7hbItPMAqn+cKAigGOuecL08eMjlz+EvyUTyOV+gjYOxYLWSd
	+e9rdVFU9AyxMj4uOYc1cspQbvim58EHdUk0ehdAjINDEkjSjWRrcCVldehC9dBrNDQd
	dNjtht7TCikHxAV0S8g9j3mC4dJ4b2I5Di/LFR/mcJhQlbB1CUsbOuvkp6XJFBdVpzyt
	E2464jYtsCGFnZ9wpudvclJa5kfn1qBwkGj2kmG04Ron/tTfAqvqVWjsR4uUEJRpH2XZ
	ZoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/I/IEQWQljBOH1RLJp+t7mdNL5zTDb50EcFviTDUWB4=;
	b=FLC+wss3eKk2WKGvtOASRacbJvaUdKaNyDuvcG/ntUScsuMS0bXW1ETEC1KULDFQM7
	I0Qh4NErWDOiArKsVXugad0kwUPww62zhQzrZGd5+soSxre6Lh11gNUmKXjObGlN6YXe
	u+4bghsp3+p/ciQ2LljrF3fbOFtaMVdn4bAdj8O/ynmIbX34D5f55sfKAmyziCaR0N3i
	T8QJyrfKT5XhVAkDZl9+DQoq4MnIJU9cGPMtricS+iqwnT4hYduhIi34QgKTX2RiHZcU
	wrKMQ+mDB7uwTn1hr5Xtyc3gMm9wiiCaOcJSQTid5R+nfQibrEjz6LP7FYR99y+lfxYi
	wJZQ==
X-Gm-Message-State: ALyK8tLCuYZrXKc7ntmXm++0lowupMX02FzgFpbktwdjQXke3x3PB4uNCboxF51Rbny5Mw==
X-Received: by 10.194.83.103 with SMTP id p7mr4802474wjy.110.1465141836150;
	Sun, 05 Jun 2016 08:50:36 -0700 (PDT)
Received: from b5a0d73cc1ad.vannes.iot. ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id u4sm15852909wjz.4.2016.06.05.08.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jun 2016 08:50:35 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: manuel.bachmann@iot.bzh
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Jun 2016 15:50:29 +0000
Message-Id: <1465141829-9574-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] meta-oe: override SECURITY_CFLAGS for llvm3.3
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
X-List-Received-Date: Sun, 05 Jun 2016 15:50:37 -0000

From: Manuel Bachmann <manuel.bachmann@iot.bzh>

When compiling llvm3.3 and including meta_oe_security_flags.inc:
- on x86 (qemux86 e.g.), text relocation warnings appear ;
- on x86-64 (qemux86-64 e.g.), linking fails with the following
error message:
"relocation R_X86_64_PC32 against undefined symbol [...]
recompile with -fPIC"

Add llvm3.3 to the overrides list, so that it builds correctly.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 2565e32..b0d30a3 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -3,5 +3,6 @@ SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
 
 # This has text reloc errors with the pie options enabled
+SECURITY_CFLAGS_pn-llvm3.3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mozjs = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.8.3.1


