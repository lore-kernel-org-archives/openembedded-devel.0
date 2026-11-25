Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37948.1795594114788932516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qkmzyIHi;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so7290624eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594114; x=1796198914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rYDJoLBOJZxYH4M2g1kKFvEVhx2vvVAgKh0rz0/8Pw=;
        b=qkmzyIHiUu5ltm9zoCQe77g+VOTQuLDyZU75+/LS6oatsB2bE3wsvNAhDH16TXieyM
         RxMoBraWYGcXmzZAg5rgUZIILdgSBr22XsDw/k8AQyfv5Qw9oN7H8H4AkgWvs1oM3t6F
         1d/mFUnhgS6iVHXZGSItEbFjjDSR2hZXXg/WoWxeM/tdJtvkW3w7Jsrbj3OWtwwiN3sh
         5tFZyYnJruM5toNsnUlm/BnF2NKFtPNL/PBVX6osCOvHTSVSz0nf08Vu7AleVzhYhVAt
         VOk6v7Gzn2BUuB967KUDz14wJDKL5rK8SLUTWxUnSa78YWcb4+B7UjkR10elQhJM34aK
         5cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594114; x=1796198914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rYDJoLBOJZxYH4M2g1kKFvEVhx2vvVAgKh0rz0/8Pw=;
        b=XdqEnIWbsd9EiQQn0tDZvk7OPYIAbAf7ICp6n3jwLwfFUIkrzuqCsyu4vPPyWMRJYm
         G33//N4WJDh8ABkiwcYB8ZnAzU9DI/XafY1xUmym4Gqt3RZ0heSVqpSTqG+V98y7yGIg
         ZL7gmiAgFRmhrIDNva8iLKQLVvN04eqtkLeB4xqrPDrpcIOESo7y4gND6iXEaR8W0zZa
         Q0Q6/Fla85qoJpZjIurW3KxKAxiTPUwAXhyHz3R4p9qNUJOhiXO1WAm5it8qnS1FsvuD
         9oOqzMMFxgqzuo4dCAKwh5gpOm53AANTldw/uPuJXWPKwR9WB5Hy8SVbh2IG93YOWZIH
         VHrQ==
X-Gm-Message-State: APuU4Z+dNFNxBjAAWKudogTDnv0MxcwYuzYnds/mo+xWNd+UMDuKxMeT
	fBOXtABZ+7ZunqHcBDjSSmCXf70idx2c+Hibe7lC10GsWrw4BBnrCsyBXujEvd65
X-Gm-Gg: AZFdTZdwYCFMMIJmg0UDjzwHRbUQmLdeHWzWjcWIqDtU/CkYUnzSqDftStcl8Q0GpiL
	pT37o4ZCwBW54KshLXAUenV66sfhEF3mm+o0M2g+85qcaEjP1bSEuDRzUxpzQu7dLn697REnLAH
	OmUxygvrXG4pUVR3U0o98DFUFyqlJxLdpIgNpfO5NG98xesufH79JidRcqjOYVXGPEm3Xw9E4zk
	uhdAvej2MKqQwSYr6ecabzt5vqU8OPBdC6XTNSINLw31lEB4qJ90N0zpyXiToq7mJaE73t3bgMA
	VGDtXCyUCbp7qpF2YjSvsCLhVjGLVlOD0hme8I6WVPpGguFjmyAbESEAeeAe2G2WuKKH5BDBYcB
	+MNGS6Fx1UX1rRjp2KPkJxFRcsfWhQB1vw5HzbGx3/E3vGITMNRaF18z2AC4Ej6r2elCWdGtK8v
	C6dULwdIr/PI/3l6e5Ar7n+M4LgLQWekaMaerHk8DI0YtCgEQn/uwBPiXTQOMuiFfjNkCpZtTp0
	RHjvc7TSovdE6+5kGeJeOT6YSP5pQfenT16Uc8G9RWj+6VJHgsFrxsxyiKkAxZiE+3Lf9/K+h/a
	n9MRpiVfNcZdRfuLUAdSNAgjsSgFNnn2qrAfXPIuWYoM8QvehHVM0Wov+UIAca8ajQI52Bzy9Ri
	sXHsZjfEpvtEZp75OkISS+iltAP4+j5lB6XqxkwHOdGen2WOsvrlIA27R4UnsqYBD6avz8afV7c
	JSe1bsOY6SGL3b1XhYPsyY3co+arKH8TSNBsnjFM+fTDC6iYQba2cpvHP1m1sifRijK92Rxgapf
	+Xa/h4KmfgWEfF+BaR/VS7k/k+F1bfkQLsEQWXLJaKSCWwwKTLRM05HbGZSQGlPUXisirdVj/ZY
	O9JY
X-Received: by 2002:a05:7301:6e9a:b0:37b:e01b:9f15 with SMTP id 5a478bee46e88-3857025f802mr18592624eec.24.1795594113697;
        Wed, 25 Nov 2026 00:08:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 41/55] simpleiot: upgrade 0.18.5 -> 0.36.1
Date: Wed, 25 Nov 2026 00:06:57 -0800
Message-ID: <20261125080732.2419614-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133044
Content-Type: text/plain; charset="utf-8"

Upstream changes (CHANGELOG.md):
- The Elm web UI is replaced by a SvelteKit UI; the built assets are
  committed and embedded, so no node/npm is needed to build.
- The legacy gps package is removed (breaking).
- The `siot store` command, the Flux-query API, GET /v1/nodes and
  auth.getNatsURI are removed; the SQLite store is replaced by NATS
  JetStream streams (existing databases need `siot export`).
- Client API renames, Influx tag nodeID -> node.id, and many security
  hardening changes (HTTP timeouts and limits, per-device credentials).
- Built with Go 1.27.x (go.mod requires go 1.27.4).

Drop the removed gps package from GO_INSTALL. Fetch by tag and add an
upstream check that skips the stray 2020 v1.0.912 tag. modernc sqlite
and bigfft are no longer dependencies, so drop the riscv64 bigfft
license removal.

simpleiot-go-mods.inc and simpleiot-licenses.inc are regenerated with
`bitbake -c update_modules simpleiot`. The class cannot classify three
module licenses, so set them by hand from their LICENSE files:
beevik/ntp (BSD-2-Clause), warthog618/go-gpiocdev (MIT) and
klauspost/compress/s2 (BSD-3-Clause).

Remove the release helper scripts from the installed Go sources; they
would pull bash into simpleiot-dev.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../simpleiot/simpleiot-go-mods.inc           | 197 +++---------------
 .../simpleiot/simpleiot-licenses.inc          |  75 ++++---
 ...impleiot_0.18.5.bb => simpleiot_0.36.1.bb} |  11 +-
 3 files changed, 75 insertions(+), 208 deletions(-)
 rename meta-oe/recipes-extended/simpleiot/{simpleiot_0.18.5.bb => simpleiot_0.36.1.bb} (87%)

diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc b/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc
index e2a7ba55aa..13a521cdf0 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc
@@ -5,189 +5,60 @@
 # running the update-modules task.
 
 SRC_URI += "\
-    gomod://dario.cat/mergo;version=v1.0.1;mod=1;sha256sum=e23c4b803a6c6e6e45747946e87d24704cd77756cc484bdfd17b57223bf320d6 \
-    gomod://github.com/RaveNoX/go-jsoncommentstrip;version=v1.0.0;mod=1;sha256sum=2b6982af288513a74b1e988042dad3f4a12d7ecb7af7320408d896e985ce7136 \
     gomod://github.com/Wifx/gonetworkmanager/v2;version=v2.2.0;sha256sum=18ade00b4f176832df17d82c4877c7ddd415631f2e5622a83fd82efc98e30693 \
-    gomod://github.com/adrianmo/go-nmea;version=v1.10.0;sha256sum=ee43675a0f61fa3a31cd51dc6e1484d7183867c654235a9671ba62b65fa2b030 \
+    gomod://github.com/adrianmo/go-nmea;version=v1.11.0;sha256sum=fc3a281da709b93cbd05e6a4edf9e28984cd053f6e9359bf350959469138a470 \
+    gomod://github.com/antithesishq/antithesis-sdk-go;version=v0.8.0;sha256sum=dd04b26ea465b9a90c8d4c87c4420091ed582df4ff384aeaa92d12e6be23856d \
     gomod://github.com/apapsch/go-jsonmerge/v2;version=v2.0.0;sha256sum=b5fbdf29dc23b3ce98f5215b125ccd324b7673f0e940bc122080fcf2c77bbaf7 \
-    gomod://github.com/beevik/ntp;version=v1.4.3;sha256sum=825c41d73aa363f10d94900c04b73b9ff6e43bfcfefb3666fdaaa8ce89434349 \
-    gomod://github.com/bep/godartsass/v2;version=v2.5.0;mod=1;sha256sum=02ce0aa4e6352343bd13acc77da9f9785c606e701496d992e62db3d703a73f04 \
-    gomod://github.com/bep/golibsass;version=v1.2.0;mod=1;sha256sum=7fb5d50c053fec7489a7b44ec2729f6315393a3c023c9055862e34ffef2d669a \
+    gomod://github.com/beevik/ntp;version=v1.6.0;sha256sum=385cb6c9913b2e7614dc29f66c85de12861071f65f16c05eb858672b497891f5 \
     gomod://github.com/blang/semver/v4;version=v4.0.0;sha256sum=96a2bbe11960f3a3c16db0da822c69ce9ac4b738ee731a0476031bbb71987504 \
-    gomod://github.com/bmatcuk/doublestar;version=v1.1.1;mod=1;sha256sum=8742788f26a4d073c6a72174e6a068867c48ae4ea596664f7906a2d07329df52 \
     gomod://github.com/cavaliercoder/grab;version=v2.0.0+incompatible;sha256sum=da1bd01e727ce57f8c5b49ce96e588cd831693a8f176481a3990fb93c4538cae \
-    gomod://github.com/cosmtrek/air;version=v1.61.2;mod=1;sha256sum=9c2caf994a9a9c350c5b70d33890e0534ada6275b7af77a1ac532e93433e1054 \
-    gomod://github.com/creack/goselect;version=v0.1.3;sha256sum=822b19b2e93d0d539af2d4549a20e4d0e30f7bc36b2c8b1a2e1e9f086e292702 \
-    gomod://github.com/creack/pty;version=v1.1.24;mod=1;sha256sum=a3979fd32c00f35d17eb3b97d0b3cc6f4efb057bf78271361fa773531e601531 \
-    gomod://github.com/davecgh/go-spew;version=v1.1.0;mod=1;sha256sum=bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
-    gomod://github.com/davecgh/go-spew;version=v1.1.1;mod=1;sha256sum=bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
-    gomod://github.com/dim13/cobs;version=v0.1.0;sha256sum=d43f6a1982362758699cc0b2eba466605f6a410ab4f9c6b4061b85ee5545ec7e \
+    gomod://github.com/dim13/cobs;version=v1.0.5;sha256sum=7a7b47629fd498d3f7108c81fd34f3ac50605194ced93c6a8d115c71a7f2f416 \
     gomod://github.com/donovanhide/eventsource;version=v0.0.0-20210830082556-c59027999da0;sha256sum=cf2e0fb54521715528f53d7030b286bb0896b4d6f11ee4478a456efcc25c4269 \
-    gomod://github.com/dustin/go-humanize;version=v1.0.1;sha256sum=319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46 \
-    gomod://github.com/fatih/color;version=v1.18.0;mod=1;sha256sum=8732da74f45ec4c0ea5a7a3072c4d458aafb6102af75155d459dcb70afce6ae6 \
-    gomod://github.com/frankban/quicktest;version=v1.7.2;mod=1;sha256sum=08a3eadc1b2c1b26532c07f937c883de0b29cb4df016f772907e75a934a9ce47 \
-    gomod://github.com/fsnotify/fsnotify;version=v1.9.0;sha256sum=94e64824b23591b7aa504e3321d5ec3f57de88f4d49882eaefbbf6820dab746e \
+    gomod://github.com/fsnotify/fsnotify;version=v1.10.1;sha256sum=b2c6a334e0d518da2e046066bdd9da34cb26bad6df9f17701802d3de522ab016 \
+    gomod://github.com/fxamacker/cbor/v2;version=v2.9.6;sha256sum=f336ba6592c33671f7c331f3182ed60dbcc5e946c9cc9aef7818344634486652 \
     gomod://github.com/go-audio/audio;version=v1.0.0;sha256sum=67d0a0608e5938058051a424e0ddddc351f14d053af4cc3b912eb0ef3b03d7a6 \
     gomod://github.com/go-audio/riff;version=v1.0.0;sha256sum=1fb211d7f24bd1bbadf764ce92debf386fd4d86d17c5d3ab5198eeda0761e2fa \
     gomod://github.com/go-audio/wav;version=v1.1.0;sha256sum=884d351372627717f4779da1fa58751481db5bfe9a623bdfd9a9e887c13e2e62 \
-    gomod://github.com/go-ole/go-ole;version=v1.2.6;mod=1;sha256sum=de7da59858d6121956da002ded711242cc14ecf597e932a8625246418fd3bbaa \
-    gomod://github.com/go-ole/go-ole;version=v1.3.0;mod=1;sha256sum=fcf0840f2ff50fbc3b5a54b9d4cb240c64d47003ab03e420aeff0057015a8953 \
-    gomod://github.com/go-stack/stack;version=v1.8.1;mod=1;sha256sum=59885252908f44191d242c2384fbcc10b551763eb579c76c31301ef2b231194b \
-    gomod://github.com/gobwas/glob;version=v0.2.3;mod=1;sha256sum=b5c6b172adc1878cd8e690ba9123b0a65753bacb38d87e6d683aca136d435578 \
-    gomod://github.com/goccy/go-yaml;version=v1.17.1;sha256sum=d696eddbab891896b3a70334d04cfb0208cdc0e18544bebdf95926e1f64df310 \
-    gomod://github.com/godbus/dbus/v5;version=v5.1.0;sha256sum=03dfa8e71089a6f477310d15c4d3a036d82d028532881b50fee254358e782ad9 \
-    gomod://github.com/gofrs/uuid;version=v4.4.0+incompatible;sha256sum=5679a06ff2120efb43764a2d1389baf32c8971c0e664741c4d184299c76ebd3d \
-    gomod://github.com/gohugoio/hugo;version=v0.146.5;mod=1;sha256sum=a9df5025ea96784eb9e982b83a6fb7b93af784931289942137e78670cb00a998 \
-    gomod://github.com/golang/mock;version=v1.6.0;mod=1;sha256sum=bfb6a97ee76c72a56da2e8ac5dfd926166f793dfeafbbfb80cb33e6a060301a8 \
+    gomod://github.com/goccy/go-yaml;version=v1.19.2;sha256sum=9ea8b466385c1ecf61fa55b68e409ea048b3d7fb1178eba66c1e24a7a30dfffb \
+    gomod://github.com/godbus/dbus/v5;version=v5.2.4;sha256sum=2a3a2996c274cbb735aa7f634dbcc0b292c0dff154447896d3a95955d078fb83 \
+    gomod://github.com/gofrs/uuid/v5;version=v5.5.1;sha256sum=1f3a1af9f73c5934482bccfeb3bca76779d0ea6668e1f21d7e8771052c6c8ada \
     gomod://github.com/golang/protobuf;version=v1.5.4;sha256sum=9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b \
     gomod://github.com/golang-jwt/jwt/v4;version=v4.5.2;sha256sum=ec5ee69a31fd478fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f \
-    gomod://github.com/google/go-cmp;version=v0.3.1;mod=1;sha256sum=81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
-    gomod://github.com/google/go-cmp;version=v0.7.0;mod=1;sha256sum=31c874a1d2a18e62b0550f823ce7a575c8dec7f8fd9d4fa1959bb12d7f7c0f14 \
-    gomod://github.com/google/go-tpm;version=v0.9.3;mod=1;sha256sum=356b36889e4a391711d858bc6232b174b0dc9f6c527f7702f82dbf58a0fc5931 \
-    gomod://github.com/google/uuid;version=v1.3.0;mod=1;sha256sum=73da47b6338b00a082fd451aa35a3273d3adc09b8e9bba98dab01091e402af6e \
     gomod://github.com/google/uuid;version=v1.6.0;sha256sum=d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
     gomod://github.com/gorilla/websocket;version=v1.5.3;sha256sum=dbbd31dd0f08548c5dc43e4c2f12bbba66abff5252b224b1cd06afbb72783a76 \
-    gomod://github.com/inconshreveable/log15;version=v3.0.0-testing.5+incompatible;mod=1;sha256sum=7fed6370677c9ae877d9debbf3b11e0bfb9d3a8b1eee7ffcda6eba8b24f6f4be \
     gomod://github.com/influxdata/influxdb-client-go/v2;version=v2.14.0;sha256sum=4ffe08fb3627acb6b8d2e3123b81e078b1ac80e43f7df99c07774350ee28cb20 \
     gomod://github.com/influxdata/line-protocol;version=v0.0.0-20210922203350-b1ad95c89adf;sha256sum=5066d4c259facbf60f7bb1e9958ccdd6ea1a48b3091f473728264fbaa3acc868 \
-    gomod://github.com/jacobsa/go-serial;version=v0.0.0-20180131005756-15cf729a72d4;sha256sum=9e41a562f445b3af5d55c4c2b2260a0c72905a7450b19e29cf5cebc68d3341fc \
-    gomod://github.com/juju/gnuflag;version=v0.0.0-20171113085948-2ce1bb71843d;mod=1;sha256sum=6b38f2d5b0b9aaa7b7291c452735479c60d52e9b965e8c98628628914bd2757b \
-    gomod://github.com/kevinburke/go-types;version=v0.0.0-20240719050749-165e75e768f7;sha256sum=f124d1b875448933a3f29f28c03e84686fb67b8ad225d2302afbf4c0cbdec741 \
-    gomod://github.com/kevinburke/rest;version=v0.0.0-20240617045629-3ed0ad3487f0;sha256sum=954fe77c8119256baddee2d25fd1e5fdbf92436779e30c95bbdd7111abb730aa \
-    gomod://github.com/kevinburke/twilio-go;version=v0.0.0-20240716172313-813590983ccc;sha256sum=4ab3e20e601335565e9ffed36f9add0b7f02f6b39317b8598efa329b4ea12711 \
+    gomod://github.com/kevinburke/go-types;version=v1.3.0;sha256sum=63a551ac86d3cf40ecb2fafbd96e5dccfc589ba9b36fddefdbf3011d8c217000 \
+    gomod://github.com/kevinburke/rest;version=v0.0.0-20260604005914-d145d8a0294b;sha256sum=a2a8a071b6c823f4ef8798239f17e1d58e535e93e7e184e071a71327aee0f6a7 \
+    gomod://github.com/kevinburke/twilio-go;version=v0.0.0-20260522200016-74f727d55757;sha256sum=88755c6b8b7f329e12171e9a33287c5e5dd91089e7037c0fc481bf7c833db279 \
     gomod://github.com/kjx98/crc16;version=v0.0.0-20190915014410-d407ba22e1b5;sha256sum=26290d513e54c37f15290333a12cbc1186ccdbf082b439d54ff7c2f3765b7809 \
-    gomod://github.com/klauspost/compress;version=v1.18.0;sha256sum=c4679e4cbc820a21758199d985be754abf5eb2a38e6f1de95cd70b2e7ef06905 \
-    gomod://github.com/koding/websocketproxy;version=v0.0.0-20181220232114-7ed82d81a28c;sha256sum=f6b7634941bce86359a30d42f15e9ff481e27586efb32c79195c3b150a4b1520 \
-    gomod://github.com/kr/pretty;version=v0.1.0;mod=1;sha256sum=e3d5d46d2f6ac94a666a54b5e867ec16bf199d9f4b700827cd731607efdd109a \
-    gomod://github.com/kr/pty;version=v1.1.1;mod=1;sha256sum=6da4c9c7364446894e5ef877e19f985cd51d671ce6e8f4ca87862b449f6dd7f6 \
-    gomod://github.com/kr/text;version=v0.1.0;mod=1;sha256sum=2fba9529e5c13dde62f371ef7383baf04d7132501dac6aa08e910f9ec0bf85c5 \
-    gomod://github.com/lufia/plan9stats;version=v0.0.0-20250317134145-8bc96cf8fc35;mod=1;sha256sum=37a53f16d9ab910339d4395983695afb4490aae01435c0a59980675c45d0bd95 \
-    gomod://github.com/mattn/go-colorable;version=v0.1.13;mod=1;sha256sum=d6743ae2eae65716122f12b42c9f3f83a805c0ae32bd3c553d4a6f1bcb9243a5 \
-    gomod://github.com/mattn/go-colorable;version=v0.1.14;mod=1;sha256sum=c199aee551968c8290b917524e0b232a862790a4831b0ed4cb43687e8c08aa18 \
-    gomod://github.com/mattn/go-isatty;version=v0.0.16;mod=1;sha256sum=714766ec82d67db895ade8af6b8054ad430c3cea5e15b3a888f23ed2f3e1b863 \
-    gomod://github.com/mattn/go-isatty;version=v0.0.20;mod=1;sha256sum=1eeabef1b4d98db73c6c2073289163649bc9a044552aca86b9d592fe84eaa1c8 \
-    gomod://github.com/mattn/go-runewidth;version=v0.0.15;mod=1;sha256sum=216c93d19310612c81d5c741024989f83897d2333c3a9f967b58b1317587f519 \
-    gomod://github.com/miekg/dns;version=v1.1.55;mod=1;sha256sum=aceec437e5016204726d92a6e111832f7e2f2f868beda5983b9e42d8d577cf74 \
-    gomod://github.com/miekg/dns;version=v1.1.65;sha256sum=bec3cb244380ff7c70b492bd751c83450d9e7e67144c80ba9b926da79d344c53 \
-    gomod://github.com/minio/highwayhash;version=v1.0.3;sha256sum=5fb067ae0c887ef9a9f4349fe32961533d0d7b33aad5fecea5bc451bd99029ed \
-    gomod://github.com/nats-io/jwt/v2;version=v2.7.4;sha256sum=92c5eeb1ec70adb0360ce8ff3ea22d70d8f47be807ffb5cbe40dc5f518a1c0b5 \
-    gomod://github.com/nats-io/nats-server/v2;version=v2.11.1;sha256sum=90fae990a307cfd37695a56e17bdd470c1a931bec696717ce5104c3cb5572ce2 \
-    gomod://github.com/nats-io/nats.go;version=v1.41.2;sha256sum=6a1b2631e0d983032860c79ba138f008ba2cd5ce936595ae0f9d9eff36e3696f \
-    gomod://github.com/nats-io/nkeys;version=v0.4.11;sha256sum=e4995029fc7859a685d5dd87532de27e259ca00ec077a0a55a185c983b02589d \
+    gomod://github.com/klauspost/compress;version=v1.20.3;sha256sum=1eb710a814c44bf21332a512a19f496fb5c489ca8eb72244bb9c49f80900848f \
+    gomod://github.com/miekg/dns;version=v1.1.73;sha256sum=bbed3c53b503db53002598615bf9bdb59918a6f9d72bd9151e0c52ab19e22a6f \
+    gomod://github.com/minio/highwayhash;version=v1.0.4;sha256sum=7161afca7e587e4e3b5f76f6b7b9422eb14b2246c13cc1e7d6a7ac374f5f219b \
+    gomod://github.com/nats-io/jwt/v2;version=v2.8.2;sha256sum=5e0760f093da6da081edf1940adba0d8bb03634075c8cbdc83639e6dab7713d0 \
+    gomod://github.com/nats-io/nats-server/v2;version=v2.15.2;sha256sum=cd32ac3e814234d2b99368ad1eef71c3c76334a5595780b5c32166eee49aaba6 \
+    gomod://github.com/nats-io/nats.go;version=v1.55.0;sha256sum=18e655f24519136d879af6017897a33e7d472174b3e4516306627e3e3acbff5d \
+    gomod://github.com/nats-io/nkeys;version=v0.4.16;sha256sum=622f43893c8136fae2ee5a3b4375e5e6812ad564fde63fc80b806c1438428a31 \
     gomod://github.com/nats-io/nuid;version=v1.0.1;sha256sum=809d144fbd16f91651a433e28d2008d339e19dafc450c5995e2ed92f1c17c1f3 \
-    gomod://github.com/ncruces/go-strftime;version=v0.1.9;mod=1;sha256sum=e5864a1dd9ac62bd778e7444e02e1e4130fa7c00d88eaea271c34f934e724f73 \
-    gomod://github.com/oapi-codegen/runtime;version=v1.1.1;sha256sum=59ad08313df3b8b1a24d9f8ecce0215ce48f5e39c16ad9a6b30aa393e0a80f89 \
-    gomod://github.com/oklog/run;version=v1.1.0;sha256sum=d6f69fc71aa155043f926c2a98fc1e5b3a8ebab422f2f36d785cfba38a7ebee4 \
-    gomod://github.com/pelletier/go-toml;version=v1.9.5;mod=1;sha256sum=c0ec26c7f843d368a2d5a9390359c567ebe316171bd651d31dcead1bb2e07ad9 \
-    gomod://github.com/pelletier/go-toml/v2;version=v2.2.4;mod=1;sha256sum=72b2ddd20583039d110a50147c63fd1e419a5c4acc1ba8f28881f1df4486abae \
+    gomod://github.com/oapi-codegen/runtime;version=v1.7.0;sha256sum=cd296c9a4b9d6d8e47de57c3e07b4f192ce5188253f8c29581f380404f99bb4b \
+    gomod://github.com/oklog/run;version=v1.2.0;sha256sum=730451ad4b759a648873e99b72abb9e8b3f7e23a4949f808d0238b827594073d \
     gomod://github.com/pkg/errors;version=v0.9.1;sha256sum=d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07 \
-    gomod://github.com/pmezard/go-difflib;version=v1.0.0;mod=1;sha256sum=74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
-    gomod://github.com/power-devops/perfstat;version=v0.0.0-20240221224432-82ca36839d55;mod=1;sha256sum=05744a9262bcd294613e65624f3f8bae83d79a58aa48b8328c7df91190aa07bf \
-    gomod://github.com/remyoudompheng/bigfft;version=v0.0.0-20230129092748-24d4a6f8daec;sha256sum=9be16c32c384d55d0f7bd7b03f1ff1e9a4e4b91b000f0aa87a567a01b9b82398 \
-    gomod://github.com/rivo/uniseg;version=v0.2.0;mod=1;sha256sum=6c7318a27a8d5473a8eb661e75fb00528176e0efc59310ed277ca13bd12a53f1 \
     gomod://github.com/shirou/gopsutil/v3;version=v3.24.5;sha256sum=95ae6f59bf23d3400d96bdd3b8c84117effbd59cfab6ab37bd667d4b0ed79518 \
-    gomod://github.com/shoenig/go-m1cpu;version=v0.1.6;mod=1;sha256sum=ddbcd6c6572075e609cbda5b7af0547a734e6ff2e1736e326051f5209c458b17 \
     gomod://github.com/simpleiot/canparse;version=v0.0.0-20221213134514-84672be992d4;sha256sum=7e4fbfe8c354573384615cd35110dd399758332d0f133bbc451e71a573b7bd97 \
     gomod://github.com/simpleiot/mdns;version=v0.0.1;sha256sum=fd4aa5408c4f2bc0f91d0d9a76f3f11040f30f254e6744a6e8ae8db60cca008d \
-    gomod://github.com/spf13/afero;version=v1.14.0;mod=1;sha256sum=f2957f49917d0f746a956a2d8b2eed9d85b138427c74830d5555a9c0658f7e33 \
-    gomod://github.com/spf13/cast;version=v1.7.1;mod=1;sha256sum=7d2f6a01b576af92f8a35c582145dc94137966ee88378b4a3a611457d7104211 \
-    gomod://github.com/spkg/bom;version=v0.0.0-20160624110644-59b7046e48ad;mod=1;sha256sum=5b5cb30d6228ba0011eaa47ad0526c2ed1ec0764e25581b0979899c0b955431b \
-    gomod://github.com/stretchr/objx;version=v0.1.0;mod=1;sha256sum=1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
-    gomod://github.com/stretchr/testify;version=v1.3.0;mod=1;sha256sum=ab063d5154a8e8730bced4c52698e5770eb50bfae347bebc35eca488b8e3f6e3 \
-    gomod://github.com/stretchr/testify;version=v1.5.1;mod=1;sha256sum=e3a11c2a6c5fe06f8a221e7289684917ac49ad01233f81b51c8360773707e700 \
-    gomod://github.com/tdewolff/parse/v2;version=v2.7.23;mod=1;sha256sum=441757c222cd891c400ec37f144a2180982684bea7fe2389f3d849ad2ac2ac2f \
-    gomod://github.com/tdewolff/test;version=v1.0.11;mod=1;sha256sum=f4479f3afd09fbb91a219348a522207effae7389ae5da311fd866ff48b8616eb \
-    gomod://github.com/tklauser/go-sysconf;version=v0.3.15;sha256sum=caa29c6df6c316969c9f2559186bd1ca8f8aceafbef236233e415c1d974f0383 \
-    gomod://github.com/tklauser/numcpus;version=v0.10.0;sha256sum=b2526d47517ccff481cc7baad7f450bdde58ddb9b65d53e3eec7c3504f94e853 \
+    gomod://github.com/tklauser/go-sysconf;version=v0.4.0;sha256sum=61e89253bc4d7091170601be12633dc02e94a3bc30470b081a2449944fa18784 \
+    gomod://github.com/tklauser/numcpus;version=v0.12.0;sha256sum=56c22a112976df3a4d8db776b41288658070650ae6382ec86d0a32fc07af0276 \
     gomod://github.com/ttacon/builder;version=v0.0.0-20170518171403-c099f663e1c2;sha256sum=f557d1c3978f22d3b4aa564881e71ae6f25cbfa4e30c574ab95259ba8c5c20f7 \
     gomod://github.com/ttacon/libphonenumber;version=v1.2.1;sha256sum=607fc7cf995eb8a26acc36cb9292bc7c82ccac8ba83bd3933bb7def85dc77020 \
-    gomod://github.com/yuin/goldmark;version=v1.3.5;mod=1;sha256sum=dab1d663b860ebe545fcdcec24e5f933d517bd2019af68d7a6b5a8764aa61b0f \
-    gomod://github.com/yuin/goldmark;version=v1.4.13;mod=1;sha256sum=ee7fe4466203a01d3ac19adc134cdec99bc6de71992c28f3dd9a74480bff0603 \
-    gomod://github.com/yusufpapurcu/wmi;version=v1.2.4;mod=1;sha256sum=ff2a9c8c99aaed6bc6984eae094a9e8cdc36f6ab2ef2c56779dd98ecc583135b \
-    gomod://go.bug.st/serial;version=v1.6.4;sha256sum=4d529616edc9d0ae1213c7bdf76ff45b2c269561262d958f8113993fde38fd49 \
-    gomod://go.einride.tech/can;version=v0.12.2;sha256sum=d7bc5a3d13aa66513e7d5ba2018111cf82441eb670f169850cefef00ed54dc53 \
-    gomod://golang.org/x/crypto;version=v0.0.0-20190308221718-c2843e01d9a2;mod=1;sha256sum=33ed070a5a66e0960685ac5386440e1b59899e74d8a38a1180685e72a2195ded \
-    gomod://golang.org/x/crypto;version=v0.0.0-20191011191535-87dc89f01550;mod=1;sha256sum=3ab9f01f4610fe7b39bd85d68e8d97825351e7e282c39cda41457c2a276f3be3 \
-    gomod://golang.org/x/crypto;version=v0.0.0-20210921155107-089bfa567519;mod=1;sha256sum=cd6311612a2aa4d0d7e03c41b3aa1fbc2d5f895ab3f61089fab80bfe9f8f5485 \
-    gomod://golang.org/x/crypto;version=v0.11.0;mod=1;sha256sum=fcbb894badd69e1e81ba36878fa88b90dad5ee703d5f55069d4b5fa240019743 \
-    gomod://golang.org/x/crypto;version=v0.37.0;sha256sum=7ce6b2be21be1ce9e04dc784830e08931f09b5903596b8017839322c9e828667 \
-    gomod://golang.org/x/exp;version=v0.0.0-20250408133849-7e4ce0ab07d0;sha256sum=2d49e384cac0121dd56d7acba9d396f69e05203a5a9931c47879984f333c3963 \
-    gomod://golang.org/x/lint;version=v0.0.0-20241112194109-818c5a804067;mod=1;sha256sum=4be743c2c22d63cc685d604114b0ab9312ab1f1c35266441e503317b78b7cf50 \
-    gomod://golang.org/x/mod;version=v0.1.1-0.20191105210325-c90efee705ee;mod=1;sha256sum=d76bbdea81d196d09858967a67ac805dacecdd1fb30c5001a187d24c129b1597 \
-    gomod://golang.org/x/mod;version=v0.24.0;mod=1;sha256sum=1fb8ad2f7201cd79bf178578b35aaead1720cab2b8cfea35b99b25b60839f1ef \
-    gomod://golang.org/x/mod;version=v0.4.2;mod=1;sha256sum=b288f088fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
-    gomod://golang.org/x/mod;version=v0.6.0-dev.0.20220419223038-86c51ed26bb4;mod=1;sha256sum=42d19023ff8f2eae700bc5495f371ecd998a22d19ba985d0af5f69900b254083 \
-    gomod://golang.org/x/mod;version=v0.7.0;mod=1;sha256sum=624567459c6e9947ac4abde0b7034ee61dcbb6a9373f5970094c0bb3e8121964 \
-    gomod://golang.org/x/mod;version=v0.8.0;mod=1;sha256sum=624567459c6e9947ac4abde0b7034ee61dcbb6a9373f5970094c0bb3e8121964 \
-    gomod://golang.org/x/net;version=v0.0.0-20190404232315-eb5bcb51f2a3;mod=1;sha256sum=f7046769daac02beb57cbcc481280df59fb403c96fe8262282aba858c7f7fa4d \
-    gomod://golang.org/x/net;version=v0.0.0-20190620200207-3b0461eec859;mod=1;sha256sum=e6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca2b4ab41da \
-    gomod://golang.org/x/net;version=v0.0.0-20210226172049-e18ecbb05110;mod=1;sha256sum=fef5896d103a0bce5055fdb5e96e830944334792437865347718edceb633348a \
-    gomod://golang.org/x/net;version=v0.0.0-20210405180319-a5a99cb37ef4;mod=1;sha256sum=f6b0f9968f5a7d986fcb57ebe2a14095118bbd1cbf6785d003f7afd711dcb1bd \
-    gomod://golang.org/x/net;version=v0.0.0-20220722155237-a158d28d115b;mod=1;sha256sum=b315c52647d2da2f76e5cdb9d367e1d6727784236a9bffb612192b19b10a128d \
-    gomod://golang.org/x/net;version=v0.10.0;mod=1;sha256sum=d3b7e236ff09e6322be489170216e018d3221862f1a053dcb63e53eab8533c17 \
-    gomod://golang.org/x/net;version=v0.12.0;mod=1;sha256sum=081afe562ad029bcf9a528eadada1f210d75aaa37b51773ede7b3eab1d2bc0e9 \
-    gomod://golang.org/x/net;version=v0.2.0;mod=1;sha256sum=07ec645e3353fc2673f2d8dee5c14eb928b9c13127a409fe3ec40eaba4dbdb30 \
-    gomod://golang.org/x/net;version=v0.39.0;sha256sum=d8434ce72d2356472570adbbd38c538d24fe9a9678bffaa6ef99ec47ca3be0a5 \
-    gomod://golang.org/x/net;version=v0.6.0;mod=1;sha256sum=41ec76ea2172f3ee3031e38f9a535939a584d6bb35ef480854fdcb8c2026701b \
-    gomod://golang.org/x/sync;version=v0.0.0-20190423024810-112230192c58;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
-    gomod://golang.org/x/sync;version=v0.0.0-20210220032951-036812b2e83c;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
-    gomod://golang.org/x/sync;version=v0.0.0-20220722155255-886fb9371eb4;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
-    gomod://golang.org/x/sync;version=v0.1.0;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
-    gomod://golang.org/x/sync;version=v0.13.0;sha256sum=4bdaaffe69cc7c997cff97cd81dc9c6777777bd311175f100f76b049bbbe7ed9 \
-    gomod://golang.org/x/sys;version=v0.0.0-20190215142949-d0b11bdaac8a;mod=1;sha256sum=8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb50fffc8c1 \
-    gomod://golang.org/x/sys;version=v0.0.0-20190412213103-97732733099d;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
-    gomod://golang.org/x/sys;version=v0.0.0-20190916202348-b4ddaad3f8a3;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
-    gomod://golang.org/x/sys;version=v0.0.0-20201119102817-f84b799fce68;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
-    gomod://golang.org/x/sys;version=v0.0.0-20201204225414-ed752295db88;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
-    gomod://golang.org/x/sys;version=v0.0.0-20210330210617-4fbd30eecc44;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
-    gomod://golang.org/x/sys;version=v0.0.0-20210510120138-977fb7262007;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.0.0-20210615035016-665e8c7367d1;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.0.0-20220520151302-bc2c85ada10a;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.0.0-20220722155257-8c9f86f7a55f;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.0.0-20220811171246-fbc7d0a398ab;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.1.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.10.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.13.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.14.0;mod=1;sha256sum=d227b325f621f4ebe28d39ba773ea99b870f393b7c09c34592c365b16dd560de \
-    gomod://golang.org/x/sys;version=v0.2.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.21.0;mod=1;sha256sum=d227b325f621f4ebe28d39ba773ea99b870f393b7c09c34592c365b16dd560de \
-    gomod://golang.org/x/sys;version=v0.32.0;sha256sum=85d47075d21fd7ef35d9a47fc73f2356fb3cd2e7fab7f45c874b814bf312127d \
-    gomod://golang.org/x/sys;version=v0.5.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.6.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.8.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/term;version=v0.0.0-20201126162022-7de9c90e9dd1;mod=1;sha256sum=4cbab14f7706771b271d995a1b3cc131fe5a246aadc7ee6d1ba6f0bd894781fa \
-    gomod://golang.org/x/term;version=v0.0.0-20210927222741-03fcf44c2211;mod=1;sha256sum=740794e2914f5cc87e25656c5843222b2c65665821205f45632a0477c8d3f79b \
-    gomod://golang.org/x/term;version=v0.10.0;mod=1;sha256sum=db4065eb2413a271c2a3b3c71c8a8aa20b77fa185953d9664faa87ac95a99d81 \
-    gomod://golang.org/x/term;version=v0.13.0;mod=1;sha256sum=26277b0b5bc33d0241f2337839e8a663d2a6c603058870f27ced9df1fee7e357 \
-    gomod://golang.org/x/term;version=v0.2.0;mod=1;sha256sum=edf833da101900fe2ce8db23409e42448f441898d3d7d8ee451988e3b30c9302 \
-    gomod://golang.org/x/term;version=v0.5.0;mod=1;sha256sum=0d6f58228aadc1a6528e6755da018516566e3ae5c5201f7ade1773f56fa8d934 \
-    gomod://golang.org/x/term;version=v0.8.0;mod=1;sha256sum=5d362d6a83453f7024725e824c05c5949624ef8f4cb13f5d7e3d4b7f1ca0b327 \
-    gomod://golang.org/x/text;version=v0.11.0;mod=1;sha256sum=151e6a1839491c4b50dfe9c33451f06328d5518bd8ee4a0061de02b7ad332fb2 \
-    gomod://golang.org/x/text;version=v0.24.0;sha256sum=f585335a57a6fa5fa0c0bf319b45f0909e5ff1aba91e8567187ba8e423084c00 \
-    gomod://golang.org/x/text;version=v0.3.0;mod=1;sha256sum=36879d586fd8001e84da8787190a11e4f78749e2a81dfe8b9b6931899fff31cf \
-    gomod://golang.org/x/text;version=v0.3.3;mod=1;sha256sum=fbb7a88ed140515e790eca7a10ffd319c9786b11c6a6c7e59f80f7fb37bb4542 \
-    gomod://golang.org/x/text;version=v0.3.7;mod=1;sha256sum=c45d669089427bc4635d07b185f9b9680332d1c48c75b3c49cb715b81a04a5b0 \
-    gomod://golang.org/x/text;version=v0.4.0;mod=1;sha256sum=15929e76fce04aea4c92a354426bb43370684645a4ee03f2e75d0c2eb1466304 \
-    gomod://golang.org/x/text;version=v0.7.0;mod=1;sha256sum=15929e76fce04aea4c92a354426bb43370684645a4ee03f2e75d0c2eb1466304 \
-    gomod://golang.org/x/text;version=v0.9.0;mod=1;sha256sum=436f592e77b593b02fbea374e23ad3369c8623ff0d29c91de7de1e6672db9a41 \
-    gomod://golang.org/x/time;version=v0.11.0;sha256sum=a94a0e3766428c1b0acb6f33d8e97f162403530d993938c1741088f6d2a4cd13 \
-    gomod://golang.org/x/tools;version=v0.0.0-20180917221912-90fa682c2a6e;mod=1;sha256sum=a0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0337392b52af \
-    gomod://golang.org/x/tools;version=v0.0.0-20191119224855-298f0cb1881e;mod=1;sha256sum=88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5ab0b3501aca1 \
-    gomod://golang.org/x/tools;version=v0.0.0-20200130002326-2f3ba24bd6e7;mod=1;sha256sum=5ea469c803b6ef8d41d1561b9e301a003fdd93976468bda5574b26b056ea7f49 \
-    gomod://golang.org/x/tools;version=v0.1.1;mod=1;sha256sum=03697605374ee3b0fa9b502ea456d9c6ae1835dac22e35baa2a99c4058a0fe31 \
-    gomod://golang.org/x/tools;version=v0.1.12;mod=1;sha256sum=2a8b9365898f0822face65ba089a1353e68a65d342f300ca317cceccde6421f3 \
-    gomod://golang.org/x/tools;version=v0.3.0;mod=1;sha256sum=be082bd1ac60dce89e16e82652f02d1236109c95f3fd76c165b500d97ea3984e \
-    gomod://golang.org/x/tools;version=v0.32.0;mod=1;sha256sum=4fa3f3fcd7c18fc9ee29aa942ab9d27ec1d88faa932d32a68652bbb4dc20dcd9 \
-    gomod://golang.org/x/tools;version=v0.6.0;mod=1;sha256sum=830ed78dcd3e9927c412e2641230308447749d513d31024d276e2443b2016609 \
-    gomod://golang.org/x/xerrors;version=v0.0.0-20190717185122-a985d3407aa7;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
-    gomod://golang.org/x/xerrors;version=v0.0.0-20191011141410-1b5146add898;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
-    gomod://golang.org/x/xerrors;version=v0.0.0-20200804184101-5ec99f83aff1;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
-    gomod://google.golang.org/protobuf;version=v1.36.6;sha256sum=3294ac8ea5089b3c231351afaea4f012e8027a9beeb523bbf31dcb383cc0ab99 \
-    gomod://gopkg.in/check.v1;version=v0.0.0-20161208181325-20d25e280405;mod=1;sha256sum=5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb45ee40c33f \
-    gomod://gopkg.in/yaml.v2;version=v2.2.2;mod=1;sha256sum=88d979d2f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
-    gomod://gopkg.in/yaml.v3;version=v3.0.1;mod=1;sha256sum=21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939 \
-    gomod://modernc.org/libc;version=v1.63.0;sha256sum=e74cb037965c63872c284d6db4f7a77bad774be3252ab3fcb7507449ab3a8b1d \
-    gomod://modernc.org/mathutil;version=v1.7.1;sha256sum=5be0da18eb557a1198bfe370e37022f2dbdb9cdc5d63130fc8e8330ab240bd2e \
-    gomod://modernc.org/memory;version=v1.10.0;sha256sum=491975efca8af6053b783363ea99d111fdee588413280cd35aef23aaacb8cc92 \
-    gomod://modernc.org/sqlite;version=v1.37.0;sha256sum=3d76af7bb3f336f1880dd7b29f7edc78f58dfcb9b0df664e6d6aca9cc6996ebe \
+    gomod://github.com/warthog618/go-gpiocdev;version=v0.10.0;sha256sum=ada5f6dad2eb20a70672d9297920ca09a2f2ba70bc8e7338c47a6a4437805ab2 \
+    gomod://github.com/x448/float16;version=v0.8.4;sha256sum=73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500 \
+    gomod://go.bug.st/serial;version=v1.8.0;sha256sum=378c14e9abfbee0dcf681ce6603a5d21ce10bdb2930a4aedc571aa0e6eb2fb93 \
+    gomod://go.einride.tech/can;version=v0.17.0;sha256sum=636fcff5905e020f5ec9f390c9189231fdb2a4956b7a8101158cb1944e4105cb \
+    gomod://golang.org/x/crypto;version=v0.58.0;sha256sum=b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95 \
+    gomod://golang.org/x/net;version=v0.61.0;sha256sum=f6843a98d608298e48a6ca287292c9a6fae066284050ce174d5ffb781c9b3dcf \
+    gomod://golang.org/x/sync;version=v0.24.0;sha256sum=ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019 \
+    gomod://golang.org/x/sys;version=v0.49.0;sha256sum=e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31 \
+    gomod://golang.org/x/text;version=v0.43.0;sha256sum=b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863 \
+    gomod://golang.org/x/time;version=v0.16.0;sha256sum=ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e \
+    gomod://google.golang.org/protobuf;version=v1.36.12;sha256sum=68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6 \
 "
diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc b/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
index 30d1dcaed8..2a68e49e71 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
@@ -8,65 +8,60 @@ LICENSE += "AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"
 
 LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/!wifx/gonetworkmanager/v2@v2.2.0/LICENSE;md5=6141b9302c8d2bf2b55e88f6b544aca4;spdx=MIT \
-    file://pkg/mod/github.com/adrianmo/go-nmea@v1.10.0/LICENSE;md5=6e0535478493248dd9a4800d34e3c5e4;spdx=MIT \
+    file://pkg/mod/github.com/adrianmo/go-nmea@v1.11.0/LICENSE;md5=6e0535478493248dd9a4800d34e3c5e4;spdx=MIT \
+    file://pkg/mod/github.com/antithesishq/antithesis-sdk-go@v0.8.0/LICENSE;md5=d4acd312580e85f1c3581f3db0284c3f;spdx=MIT \
     file://pkg/mod/github.com/apapsch/go-jsonmerge/v2@v2.0.0/LICENSE;md5=d28a9354af0254dfae10c119378968c3;spdx=MIT \
-    file://pkg/mod/github.com/beevik/ntp@v1.4.3/LICENSE;md5=4a1cd241543bc24ca646216d5070e3ba;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/beevik/ntp@v1.6.0/LICENSE;md5=6eb8be47a6e20b65c54e10079cf78fed;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/blang/semver/v4@v4.0.0/LICENSE;md5=5a3ade42a900439691ebc22013660cae;spdx=MIT \
     file://pkg/mod/github.com/cavaliercoder/grab@v2.0.0+incompatible/LICENSE;md5=73a9fd187cdcda4e3009f73e69b5b348;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/creack/goselect@v0.1.3/LICENSE;md5=53145d9bb75251a18e111de5d23803e6;spdx=MIT \
-    file://pkg/mod/github.com/dim13/cobs@v0.1.0/LICENSE;md5=03347de97baa07892a6fd07d08c7d69f;spdx=ISC \
+    file://pkg/mod/github.com/dim13/cobs@v1.0.5/LICENSE;md5=03347de97baa07892a6fd07d08c7d69f;spdx=ISC \
     file://pkg/mod/github.com/donovanhide/eventsource@v0.0.0-20210830082556-c59027999da0/LICENCE;md5=b8c58c415ca3eaa2fd30f0e87a1f6d0b;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/dustin/go-humanize@v1.0.1/LICENSE;md5=8c6127b79304a5e0a5756d03c7a58766;spdx=MIT \
-    file://pkg/mod/github.com/fsnotify/fsnotify@v1.9.0/LICENSE;md5=8bae8b116e2cfd723492b02d9a212fe2;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/fsnotify/fsnotify@v1.10.1/LICENSE;md5=8bae8b116e2cfd723492b02d9a212fe2;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.6/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
     file://pkg/mod/github.com/go-audio/audio@v1.0.0/LICENSE;md5=754bb36ff8a144c2b48c0d94a7d4dc93;spdx=Apache-2.0 \
     file://pkg/mod/github.com/go-audio/riff@v1.0.0/LICENSE;md5=b56ab64450854def91d77fe6e243bbbf;spdx=Apache-2.0 \
     file://pkg/mod/github.com/go-audio/wav@v1.1.0/LICENSE;md5=754bb36ff8a144c2b48c0d94a7d4dc93;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/goccy/go-yaml@v1.17.1/LICENSE;md5=346470d8ac0a6ffe1eb8635a452cec2b;spdx=MIT \
-    file://pkg/mod/github.com/godbus/dbus/v5@v5.1.0/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
-    file://pkg/mod/github.com/gofrs/uuid@v4.4.0+incompatible/LICENSE;md5=ae4ba217c6e20c2d8f48f69966b9121b;spdx=MIT \
+    file://pkg/mod/github.com/goccy/go-yaml@v1.19.2/LICENSE;md5=346470d8ac0a6ffe1eb8635a452cec2b;spdx=MIT \
+    file://pkg/mod/github.com/godbus/dbus/v5@v5.2.4/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/gofrs/uuid/v5@v5.5.1/LICENSE;md5=ae4ba217c6e20c2d8f48f69966b9121b;spdx=MIT \
     file://pkg/mod/github.com/golang/protobuf@v1.5.4/LICENSE;md5=939cce1ec101726fa754e698ac871622;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/golang-jwt/jwt/v4@v4.5.2/LICENSE;md5=a21b708d8b320c68979c44ac9dba9b0d;spdx=MIT \
     file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/gorilla/websocket@v1.5.3/LICENSE;md5=c007b54a1743d596f46b2748d9f8c044;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/influxdata/influxdb-client-go/v2@v2.14.0/LICENSE;md5=d9c113dde7e4204f5f9d358891a4e443;spdx=MIT \
     file://pkg/mod/github.com/influxdata/line-protocol@v0.0.0-20210922203350-b1ad95c89adf/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6;spdx=MIT \
-    file://pkg/mod/github.com/jacobsa/go-serial@v0.0.0-20180131005756-15cf729a72d4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/kevinburke/go-types@v0.0.0-20240719050749-165e75e768f7/LICENSE;md5=4204bfe0edce818653d44307464444b7;spdx=MIT \
-    file://pkg/mod/github.com/kevinburke/rest@v0.0.0-20240617045629-3ed0ad3487f0/LICENSE;md5=227f6afd9446fe7966184746a27f5242;spdx=MIT \
-    file://pkg/mod/github.com/kevinburke/twilio-go@v0.0.0-20240716172313-813590983ccc/LICENSE;md5=b791e6d3eb7e39934aeaedd48ce381f8;spdx=MIT \
+    file://pkg/mod/github.com/kevinburke/go-types@v1.3.0/LICENSE;md5=4204bfe0edce818653d44307464444b7;spdx=MIT \
+    file://pkg/mod/github.com/kevinburke/rest@v0.0.0-20260604005914-d145d8a0294b/LICENSE;md5=227f6afd9446fe7966184746a27f5242;spdx=MIT \
+    file://pkg/mod/github.com/kevinburke/twilio-go@v0.0.0-20260522200016-74f727d55757/LICENSE;md5=b791e6d3eb7e39934aeaedd48ce381f8;spdx=MIT \
     file://pkg/mod/github.com/kjx98/crc16@v0.0.0-20190915014410-d407ba22e1b5/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.0/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/koding/websocketproxy@v0.0.0-20181220232114-7ed82d81a28c/LICENSE.md;md5=25aa8f754fcf7724a7cc932e6e402467;spdx=MIT \
-    file://pkg/mod/github.com/miekg/dns@v1.1.65/COPYRIGHT;md5=2ba6b7bd91e16af46a856eca87db2504;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/minio/highwayhash@v1.0.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/nats-io/jwt/v2@v2.7.4/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/nats-io/nats-server/v2@v2.11.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/nats-io/nats.go@v1.41.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/nats-io/nkeys@v0.4.11/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/s2/LICENSE;md5=2460814a2b25a7277556c2d89de915d1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/miekg/dns@v1.1.73/COPYRIGHT;md5=2ba6b7bd91e16af46a856eca87db2504;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/minio/highwayhash@v1.0.4/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/nats-io/jwt/v2@v2.8.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/nats-io/nats-server/v2@v2.15.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/nats-io/nats.go@v1.55.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/nats-io/nkeys@v0.4.16/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/github.com/nats-io/nuid@v1.0.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/oapi-codegen/runtime@v1.1.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/oklog/run@v1.1.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oapi-codegen/runtime@v1.7.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oklog/run@v1.2.0/LICENSE;md5=c19dbea2f4885137f8d45fede9891755;spdx=Apache-2.0 \
     file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=6fe682a02df52c6653f33bd0f7126b5a;spdx=BSD-2-Clause \
-    file://pkg/mod/github.com/remyoudompheng/bigfft@v0.0.0-20230129092748-24d4a6f8daec/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/shirou/gopsutil/v3@v3.24.5/LICENSE;md5=ae6de3dee02712a1e55b280671be53bf;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/simpleiot/canparse@v0.0.0-20221213134514-84672be992d4/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/github.com/simpleiot/mdns@v0.0.1/LICENSE;md5=448ff43c4a3e516543f6851bbd93e91c;spdx=MIT \
-    file://pkg/mod/github.com/tklauser/go-sysconf@v0.3.15/LICENSE;md5=d4eb2084b3083d2c275ec52ef4ba9ac1;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tklauser/numcpus@v0.10.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/tklauser/go-sysconf@v0.4.0/LICENSE;md5=d4eb2084b3083d2c275ec52ef4ba9ac1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tklauser/numcpus@v0.12.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/ttacon/builder@v0.0.0-20170518171403-c099f663e1c2/LICENSE;md5=aafb066baab23d173788a374c4f1237c;spdx=MIT \
     file://pkg/mod/github.com/ttacon/libphonenumber@v1.2.1/LICENSE;md5=c50a0d1f6d5c976b3a49e7446b35dad4;spdx=MIT \
-    file://pkg/mod/go.bug.st/serial@v1.6.4/LICENSE;md5=6067cc6529e21146d9c556ee2f680c27;spdx=BSD-3-Clause \
-    file://pkg/mod/go.einride.tech/can@v0.12.2/LICENSE;md5=4b52f8fd14bd4d6b199350d4963091e5;spdx=MIT \
-    file://pkg/mod/golang.org/x/crypto@v0.37.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/exp@v0.0.0-20250408133849-7e4ce0ab07d0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.39.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.13.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.32.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.24.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/time@v0.11.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/google.golang.org/protobuf@v1.36.6/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
-    file://pkg/mod/modernc.org/libc@v1.63.0/COPYRIGHT-MUSL;md5=b03f1cc25363d094011f8f4fd8bcfb68;spdx=BSD-3-Clause \
-    file://pkg/mod/modernc.org/mathutil@v1.7.1/LICENSE;md5=2604a98416f52ae5aaceb3630431020c;spdx=BSD-3-Clause \
-    file://pkg/mod/modernc.org/memory@v1.10.0/LICENSE;md5=c4dac399c2cb8794cc72e762c9f07263;spdx=BSD-3-Clause \
-    file://pkg/mod/modernc.org/sqlite@v1.37.0/LICENSE;md5=3cd92e5f84bae63802a058f3ff54fbe7;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/warthog618/go-gpiocdev@v0.10.0/LICENSE;md5=b2cd159d37bfc3904adf7de1e8ecb7a0;spdx=MIT \
+    file://pkg/mod/github.com/x448/float16@v0.8.4/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b;spdx=MIT \
+    file://pkg/mod/go.bug.st/serial@v1.8.0/LICENSE;md5=6d76123cc4ba1191dac3099b3828cdd4;spdx=BSD-3-Clause \
+    file://pkg/mod/go.einride.tech/can@v0.17.0/LICENSE;md5=4b52f8fd14bd4d6b199350d4963091e5;spdx=MIT \
+    file://pkg/mod/golang.org/x/crypto@v0.58.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.61.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.24.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.49.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.16.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.12/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
 "
diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb b/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb
similarity index 87%
rename from meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
rename to meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb
index e852e3d3e5..07fc60128e 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb
@@ -6,15 +6,15 @@ HOMEPAGE = "http://simpleiot.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX}"
+SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;tag=v${PV};destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
-SRCREV = "9addf01e40eae111f59c822141a47aa87caf04b6"
+SRCREV = "0d7ca333b4818c4176324ac258abb96828ea84d1"
+# v1.0.912 is a stray 2020 tag, not a release
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>(?!1\.0\.912$)\d+(\.\d+)+)$"
 
 require ${BPN}-licenses.inc
 require ${BPN}-go-mods.inc
 
-LIC_FILES_CHKSUM:remove:riscv64 = "file://pkg/mod/github.com/remyoudompheng/bigfft@v0.0.0-20230129092748-24d4a6f8daec/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause"
-
 GO_IMPORT = "github.com/simpleiot/simpleiot"
 
 GO_INSTALL = "${GO_IMPORT}/cmd/edge \
@@ -29,7 +29,6 @@ GO_INSTALL = "${GO_IMPORT}/cmd/edge \
               ${GO_IMPORT}/cmd/siot \
               ${GO_IMPORT}/cmd/tof10120 \
               ${GO_IMPORT}/cmd/test-resp-reader-close \
-              ${GO_IMPORT}/gps \
              "
 
 inherit go-mod go-mod-update-modules pkgconfig systemd update-rc.d
@@ -47,6 +46,8 @@ do_install:append() {
     else
         install -Dm 0755 ${S}/src/${GO_IMPORT}/contrib/siot.init ${D}${sysconfdir}/init.d/siot
     fi
+    # release helper scripts would pull bash into ${PN}-dev
+    rm -rf ${D}${libdir}/go/src/${GO_IMPORT}/scripts
 }
 
 SYSTEMD_SERVICE:${PN} = "siot.service"
