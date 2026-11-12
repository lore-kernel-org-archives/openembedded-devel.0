Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7997.1794465775246492555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ug2oOY0h;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cddac941ed1so430677a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465775; x=1795070575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9osQM+tggE3hmayrdcMw5gvQAskjUxCulWfP4G3MnY=;
        b=Ug2oOY0hNaXeNwUEqHGPtIoLTIAaVe8ZZZC3I3X03CR0gVo2bNdsQ6QjyRgenGxLsB
         0eG+tsNSD03EXFH5TznnpA/hzARQMNqorQ0H+1vibXXFAHXA2FlgHqBcu4bLMg1ky+Tn
         pc3/I0canQuA6HiMl7+zdO9nFO/Y2nWOa1ZyqcQ6tlpdr4078qydKW9z5kqUOPAo2BEj
         iFCX3SUEQLpZN+v7DGA4ocKj8pL5gOoI1jkgqkLHvFOSAikf9apO/xC19cOi6uYdXIFc
         JHoeYbSH0NZMy+mtgMMc9n5YjjNkBM1+UclPbjLRxsTUSOtm/ZOH/xP7yDX7R2C/ZR7e
         p7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465775; x=1795070575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9osQM+tggE3hmayrdcMw5gvQAskjUxCulWfP4G3MnY=;
        b=RkM8MnClJoEryQ4FCzDsQy36EMwdz1mJ4bnYzudL5sI3E6n1LvfWZKI/7DmTdYtQH7
         DPD+u5Nynmlyo4OunRAkAFUc39Lu87Ii9bDx9HhSugDt7kUOwoxe2b+I7N1+EqLu5nqB
         HkNNMc+yloW1Vq1VkBk9SG4uSLgMFw2rU/GsbwXfz3ARI7ycmM7Pu0N1bU46P5lXjABw
         cKz/hY2Y/+75FRinjbD4F5nW+efIwrkuGOhBL/CD5VGjy9gnpcVEQgFKhynZqxwsTbUB
         xkvje2e3BeNxnbFZNIBD7CSAM+BJY0+u7yGKs+BSxTdab0PglUzPLZAjMvyxgmyUUYbR
         xwiw==
X-Gm-Message-State: APuU4Z9WwB5WPjR+tsMP3KNgDuUtlGytZseUPPSJbVtlmIxI2XwdngJq
	XQCRQDh2CsnQeZzcq9OgQPNHdBTyZoCdq9pBLqETmrKHnMhvu9n5zjSbYUb3aw==
X-Gm-Gg: AYBFou1JFn+FV17a3rCUrskaeTsk3OJJbMY3i+ie/wsVfjAmpZsFSVlorhb3m7YzcaX
	bfOfc6L9cgRM2VgYdy49TrP/KpAKJewGn/2blWGu3b4U3mo3zxY2QfUAVZ2tT6H/IiV++rQ9XNi
	cxr6A3+033onFiRB9zE11QLc1Z+f4iUWbeM5rrwWLFPb2C9NgyNEhHA8ZoWFW2vX5KigxI9midR
	jAP4ma8rBLXtqv/VxI8x2GLmzwxhavUDTxGHO+K8l7iyiOoh724oILPbjQlJZWoSdfVOHtuxAkL
	ydF3qdnvgmk68/UZJH2+0V+2nmNx0GDXsS2e9WWXw92nywFe/9nVd7PVF1wQULbe6dktuL9REf2
	poxG10sVL8ny7jhE9uzZyAKCIj/qSQUm5Tj7HwjYDeSO5VIAzPo5Ng1zSav2wR1BKGSwspVD73Y
	NoKI+LzLmVt6ayQAHdZiSd9x9YdOST8pyHone+hzRAS28VOfU0qjGVVJ76zqIal3syqoWuasMTJ
	LiWr3wl983At0lRq8T+F+jCn5hJqOVZ95nKunlLv/6uSXMx5gRmI+e3WkUPlFzC21JZubsfUrUJ
	74MIgFGGI7ObDebUZsSxtxTSokpTKZMYJuT/SSlgrcX1jcLlebC71QvuT9pcpxqjge2HOe1IJ3p
	V/0Ldl5Jc0ESxD6iXoN+e6m/zbk7gGD6Rjiu0Rxlai4sgYbmJ/0/7b73psIhtX59l0cfL4mwQLP
	1MvX+kbDyN0DSt7jVpYFpfB8Fx6DEcMI8y0WSffZcscIM+kLx62SkDne8W/N1x1rGdEPFykZj3Z
	dl/as32EYXmDkDBKH13eJ3DzILpCt3ZeNTtL7ti0EAMc/nlIZFe1LsIYbhuymUlT9yJyChv/ARW
	Q77y
X-Received: by 2002:a17:90b:2246:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b182ee5a9amr4418991a91.39.1794465774456;
        Wed, 11 Nov 2026 22:42:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 20/24] tailscale: upgrade 1.104.1 -> 1.104.6
Date: Wed, 11 Nov 2026 22:42:20 -0800
Message-ID: <20261112064225.2410019-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132189
Content-Type: text/plain; charset="utf-8"

Regenerate tailscale-go-mods.inc and tailscale-licenses.inc with
bitbake -c update_modules.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tailscale/tailscale-go-mods.inc           | 16 +++++++--------
 .../tailscale/tailscale-licenses.inc          | 20 +++++++++----------
 ...lscale_1.104.1.bb => tailscale_1.104.6.bb} |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.104.1.bb => tailscale_1.104.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
index 9d4171dea8..bf59e0a41b 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
@@ -67,12 +67,12 @@ SRC_URI += "\
     gomod://github.com/pkg/sftp;version=v1.13.11;sha256sum=f22fb06ecb083adb09981b0a4554fa370f2cb5accc4837cdd038312008a384b5 \
     gomod://github.com/safchain/ethtool;version=v0.7.0;sha256sum=7a285eefd304a1b429db0c40e3a33308811e2e0a640b747703537ab94b34b0da \
     gomod://github.com/skip2/go-qrcode;version=v0.0.0-20200617195104-da1b6568686e;sha256sum=3fc1c4d11c79001d1cc2df0de87493b324b9af141cc59ae8c212612dd2c90e90 \
-    gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20260716005906-1a0f895faf28;sha256sum=7f1a31c7982476845ba2fddc693ce8755ddf573be83f95e4136ecde59fdb6de8 \
+    gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20261026144310-31f7cf365d3a;sha256sum=25c904c5a04ff56a8ca1ac4f613a5ac80c1e05950c0e4004e9129eff8bb4c548 \
     gomod://github.com/tailscale/hujson;version=v0.0.0-20260727124030-b80ff77dac4f;sha256sum=844d7b9f2ab7cd7a7c9b0b0bbf933feae2ef43a5fb9507884fe08cef059dee3d \
     gomod://github.com/tailscale/netlink;version=v1.1.1-0.20240822203006-4d49adab4de7;sha256sum=a5195ef600f8d9a0fb8501eea85e4fe0321a74bd57dec88f07b8569d0ee4f55e \
     gomod://github.com/tailscale/peercred;version=v0.0.0-20250107143737-35a0c7bd7edc;sha256sum=87d0f4f3b1d59ea45c9a87b775b615bebd721a5870dafedc63cc860ec4aac281 \
     gomod://github.com/tailscale/web-client-prebuilt;version=v0.0.0-20260917222731-e0ed2d0d0fea;sha256sum=766636fd08bfa785d34d10956dda8a9717188e5e43fe2bef9d54abce7c559438 \
-    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260928213032-417aef361226;sha256sum=605f0926477b953bb6a0ee13d7baad9a3b3eab5bb17ae26bfff245df80fe19b6 \
+    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20261106233718-9e0ab45c16ca;sha256sum=f4ccfba2206bd554e178b98de941ec327ba66f39b34bdedc1f4eadc62fa521ff \
     gomod://github.com/tailscale/xnet;version=v0.0.0-20240729143630-8497ac4dab2e;sha256sum=438abf28ce5fb03adf529c2cb57a451f9b243c4a2a181d9d06cdb61bb10960e7 \
     gomod://github.com/toqueteos/webbrowser;version=v1.2.1;sha256sum=b14b0082ec423852240b83a55e45d560da1ea945cd04bbf00481afd2f4647966 \
     gomod://github.com/u-root/u-root;version=v0.16.0;sha256sum=3c84d85161f9950da2cb1023d1044de58ae8e4cebfb832eba2c1e56ec29963d8 \
@@ -82,15 +82,15 @@ SRC_URI += "\
     gomod://go.yaml.in/yaml/v2;version=v2.4.4;sha256sum=1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576 \
     gomod://go4.org/mem;version=v0.0.0-20240501181205-ae6ca9944745;sha256sum=9b5037a57122457fdc5c2c0a31e3996b44cf9dfcdee5c53ed72adfd88d077795 \
     gomod://go4.org/netipx;version=v0.0.0-20260823151212-3075585bcbeb;sha256sum=6d0c289f57693a2a5b7a64b4a7f79f0954ce8f7d451528fe602ea594fbcdffff \
-    gomod://golang.org/x/crypto;version=v0.57.0;sha256sum=856c916b92f1fc5b53983c04f6249f632f56c47ebc003bbcdfc503500dfb58b8 \
+    gomod://golang.org/x/crypto;version=v0.58.0;sha256sum=b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95 \
     gomod://golang.org/x/exp;version=v0.0.0-20260908205506-85c1c2202aba;sha256sum=47318373d2349a65c11daee4239024de4170ced40d9c23add5523c78b5a13c07 \
     gomod://golang.org/x/image;version=v0.46.0;sha256sum=10459a17c3533cc9ca4d1ac7a86674bf0c0514b7bac721531b3c1178cfcda82e \
-    gomod://golang.org/x/net;version=v0.59.0;sha256sum=1dc3bf31fcebe80d393288ac8fe5cac7f0e82e9b3a2630021dcdf5ffbfa3f601 \
+    gomod://golang.org/x/net;version=v0.60.0;sha256sum=052e0453db47a96ae9567503e7c95ea925ab52682cb1cec31250541f7160107e \
     gomod://golang.org/x/oauth2;version=v0.37.0;sha256sum=82b0472ff31d57867bfb95e28c2906acd54764949a215b6a01bda40f4ae4c3bd \
-    gomod://golang.org/x/sync;version=v0.23.0;sha256sum=c19a11baba5c1a093cb4fd2f6d0d8d79673c97a82cb0fe2d693c9b6ad84f0f82 \
-    gomod://golang.org/x/sys;version=v0.48.0;sha256sum=3a47e06431ba1e24d5b2aca3a7ce31fd13faff34df3e5d8e63f105ff9d0c1786 \
-    gomod://golang.org/x/term;version=v0.46.0;sha256sum=9147fdd982f1aed1392183d5b48055f4f74c85d496604766c7f0b1d3bbd61c7c \
-    gomod://golang.org/x/text;version=v0.42.0;sha256sum=a7b64e003056b6470303f408202098d8f3714a115f23091b8cac85edeb265476 \
+    gomod://golang.org/x/sync;version=v0.24.0;sha256sum=ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019 \
+    gomod://golang.org/x/sys;version=v0.49.0;sha256sum=e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31 \
+    gomod://golang.org/x/term;version=v0.47.0;sha256sum=d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf \
+    gomod://golang.org/x/text;version=v0.43.0;sha256sum=b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863 \
     gomod://golang.org/x/time;version=v0.16.0;sha256sum=ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e \
     gomod://gvisor.dev/gvisor;version=v0.0.0-20260915211658-a6f909f08a72;sha256sum=d527abbf3e55053348550a7f0df46cd57e99b43f39355bb84aee208ed360094f \
     gomod://k8s.io/client-go;version=v0.37.0;sha256sum=e48557de0d71c7fe7365be5f325d033945df0bc55969a30be83a5f7e131835c4 \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
index 074229f7dd..cdba31eca0 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
@@ -1,8 +1,8 @@
 
 # This file has been generated by go-mod-update-modules.bbclass
 #
-# Unknown licenses have been checked manually and completed.
-#
+# Do not modify it by hand, as the contents will be replaced when
+# running the update-modules task.
 
 LICENSE += "AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"
 
@@ -73,12 +73,12 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/pkg/sftp@v1.13.11/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/safchain/ethtool@v0.7.0/LICENSE;md5=8e1a430c9c6b9fa0c191191e83efa169;spdx=Apache-2.0 \
     file://pkg/mod/github.com/skip2/go-qrcode@v0.0.0-20200617195104-da1b6568686e/LICENSE;md5=515c25e1450ede2834397875c18439d4;spdx=MIT \
-    file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20260716005906-1a0f895faf28/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20261026144310-31f7cf365d3a/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20260727124030-b80ff77dac4f/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/netlink@v1.1.1-0.20240822203006-4d49adab4de7/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/tailscale/peercred@v0.0.0-20250107143737-35a0c7bd7edc/LICENSE;md5=94eaeed21686fd9816f57f86b9914071;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20260917222731-e0ed2d0d0fea/LICENSE;md5=a672713a9eb730050e491c92edf7984d;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260928213032-417aef361226/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
+    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20261106233718-9e0ab45c16ca/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
     file://pkg/mod/github.com/tailscale/xnet@v0.0.0-20240729143630-8497ac4dab2e/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.1/LICENSE.md;md5=7b9e45681a3ffc9b3d92b1bc3951385d;spdx=MIT \
     file://pkg/mod/github.com/u-root/u-root@v0.16.0/LICENSE;md5=bf431bf303eaf01f17bef6624d9f2208;spdx=BSD-3-Clause \
@@ -88,15 +88,15 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/go.yaml.in/yaml/v2@v2.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/mem@v0.0.0-20240501181205-ae6ca9944745/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/netipx@v0.0.0-20260823151212-3075585bcbeb/LICENSE;md5=628df198dc9e033b86b8eedff039ff86;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/crypto@v0.57.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.58.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/exp@v0.0.0-20260908205506-85c1c2202aba/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/image@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.59.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.60.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/oauth2@v0.37.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.23.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.48.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.42.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.24.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.49.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/time@v0.16.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20260915211658-a6f909f08a72/LICENSE;md5=e566fe37b81dd469e93876dc021ca01c;spdx=Apache-2.0 \
     file://pkg/mod/k8s.io/client-go@v0.37.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb
index 220aff5788..106a50e4c0 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.1.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=releas
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "9a522a9786c97eb7910c01ccb7bd66557b04c910"
+SRCREV = "c54807352ae196919497b3f8fddc3cedf88368b9"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 
