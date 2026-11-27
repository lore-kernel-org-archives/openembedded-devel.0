Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11754.1795762845344305476
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R12QsvtS;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f041f88577so42402445ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762845; x=1796367645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df03YH6xg3YMwxqJHadcoqGbarCemKLBxeHU5WLPv9c=;
        b=R12QsvtSRr8/sdbbgp5nd+SrQ4AouF27sEQxGopfoqEZf8/DepntxnVBok5rLUK9eB
         wTW8tcXs1suiH2pXbVCLoHBoLha/BzH1IHf47NClVnOjxoQ4nq4R3yF4pM0F/TCTHu8V
         J9Y500ZSnV9s9a7svl1twPP4IwTVD3j98yBiTx+sdZgSG5Rqh1hQtcRr1z2xpkU0zvnb
         8Bj8XDMq+hu73IcOxvtZOGBVcXJMDoWY0bd0GekXhsouAt362FH+CyX5ytdtBv1M35tQ
         e2p7edridMw3KSOW+wtkMS6TT9qRv0mFS3SoC9rvsMQnPMtE1pnJL3guw6XeavmziqJ7
         G6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762845; x=1796367645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Df03YH6xg3YMwxqJHadcoqGbarCemKLBxeHU5WLPv9c=;
        b=o1YvKcQbt3Ga8+6t++gUhs/wyLZQD17V8ufagmi+9LMfEq0Jii2hYhLZtuo9vu96AD
         img+O2V4QuuX8pGyNZwFngRp1PFcNcT50w6Z5EozhHoA3H8/AeZ7XdpDaUhVG7sm91Px
         8CtM3MKda8XUT8fiqCy0GfPlVtM8KvlUWsDboF3wxgP9C+Geo+MV29MtfFpGY5tl7Xoo
         tnlb1XHn/BonqHH7qgJiOQ3pkOqPtEVzCLmaAUtkHjK+oT60mR9utmNBSTEl/zb5kNVH
         zzARChoXZtON2sVIAYRpZepRuYJmLLpu4ul0nOla2Qf0QQD2T3XZNi7hdr6ElAgqXz2k
         oQdA==
X-Gm-Message-State: APuU4Z8HybiJSSNDCjxvRyDSVWamEeRcwjSdeojJBWprpiW3P0CbyiW4
	1ZluFyk7p0NljhD3Reh7TnFxG1+vYyAVRAyhl+UKYREO9angxjmaDNvE0wMTDTKj
X-Gm-Gg: AZFdTZeEQ8TBZnNKpuRI2UXlCWT1pef6DnpWl7KeGSMgLBNq4RnHaXTUhj79pEsZZso
	rS7bGLGHdZr/aTowcZMpwZ/XLjUsbpoKsCwIHQ1S1Tz+coowQN8ZG6vhk+3edkHI1SJ0lRUKJJH
	09NPlcitZevVq2gZNeG3ukKCTq4vdvk4O5pQpBPgxnCo4Yl6DXVBRLR2IIRt95BojsqFe+B4Zwp
	XYF7Xcx6HAg+GcXD0AFyiZ1bknTktaTsvlADfn5jLjoD0+oALnOzxRPhWnWvaAGwqqHna+98Tut
	nbCjh1Y9dWcRwmvSaa2jyVN6tsTJQ/+UpOX58PQcHUxdryqUtyHa73AeYXIg/eheBlVxk+vHien
	Mlxf+KV2OCrT5//om1LePNSCPMz1rLHZ6ubvlLIyanNNLy5wnWUwih3UyPoptO+qFcvN9r8cjgg
	HXUFGeWRENqs8mN71kwb8oAO4NoAL5VT+8hLcsSICItO363Q/PYj7D0ewe9aA4QQ7MVpNg7N/IX
	a6ivluleEW+Kg7/yGb4nFpZsi3y/guevLJBK9AyjGAXPbvvo4JG/st0/eHKg9ZXlbVjdxYtyIcy
	2DN/c/QxOAareBK+ER3au+1I+yf2LPA+RzeWbVmsqk1VXslgWFDsdm/ZHorifWy+K5emiodE/xv
	eKR1n/Ix3JsWje9Vj72djyojMnB53BAHo+7Ow49hx4pYOatvLhRAGJ3VKwnojZjyqakvm5pMYhg
	uz4P3/V2I0yALH8pylwAijAiarqtdJxUSJuZOuKiavheZBWlCNkwO2uke5jmg4vWL/l8hLJpVfS
	Lc6d1og55QEmK91z46EXe/wt2Mo2fM8iSIiMiSV7Xs1dDzQTuxsNxcuyiE+xAB/XldGmIGv273g
	wABY
X-Received: by 2002:a17:903:32ce:b0:2e9:7ff5:5459 with SMTP id d9443c01a7336-2f03f17d17amr256804255ad.15.1795762844089;
        Thu, 26 Nov 2026 23:00:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 12/15] cloudflared: upgrade 2026.11.1 -> 2026.11.2
Date: Thu, 26 Nov 2026 23:00:35 -0800
Message-ID: <20261127070038.2221538-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
References: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133301
Content-Type: text/plain; charset="utf-8"

- Read the whole protocol version of a tunnel stream (TUN-11362)
- Bump golang.org/x/net, x/crypto, x/sys, x/sync, x/term and x/text
  (TUN-11396)
- Update Google Distroless image digests

Fetch by tag now and add UPSTREAM_CHECK_GITTAGREGEX for the date based
release tags. The go-mods include still lists the old golang.org/x
versions and has to be regenerated with the update-modules task.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cloudflared/cloudflared-go-mods.inc              | 12 ++++++------
 .../cloudflared/cloudflared-licenses.inc             | 12 ++++++------
 ...dflared_2026.11.1.bb => cloudflared_2026.11.2.bb} |  7 +++++--
 3 files changed, 17 insertions(+), 14 deletions(-)
 rename meta-networking/recipes-connectivity/cloudflared/{cloudflared_2026.11.1.bb => cloudflared_2026.11.2.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc b/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
index af5fd7a0c3..529f5915c8 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared-go-mods.inc
@@ -57,13 +57,13 @@ SRC_URI += "\
     gomod://go.opentelemetry.io/otel/trace;version=v1.47.0;sha256sum=dfffa6cb848954b5d3413007b6553ad3e508a9fc992a81ab4bd9026c236229be \
     gomod://go.opentelemetry.io/proto/otlp;version=v1.11.0;sha256sum=790b98d472e7095511fa7feddd04e1d85bd844226e03ba482bd4105ef2217e09 \
     gomod://go.uber.org/automaxprocs;version=v1.6.0;sha256sum=964c6f548f7ee6df9fa3a9080d722c7950060bda0cb84ff9e2ae065f078813c4 \
-    gomod://golang.org/x/crypto;version=v0.58.0;sha256sum=b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95 \
-    gomod://golang.org/x/net;version=v0.61.0;sha256sum=f6843a98d608298e48a6ca287292c9a6fae066284050ce174d5ffb781c9b3dcf \
+    gomod://golang.org/x/crypto;version=v0.59.0;sha256sum=b5cff645013a39d6b3348dce3c53eb452de71309f9a6831c5b12b3f8d6caf1d2 \
+    gomod://golang.org/x/net;version=v0.62.0;sha256sum=50e869800f4921e910eb6550369f937c7187d130a7f7f78a26ef9b589a7071a6 \
     gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
-    gomod://golang.org/x/sync;version=v0.24.0;sha256sum=ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019 \
-    gomod://golang.org/x/sys;version=v0.49.0;sha256sum=e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31 \
-    gomod://golang.org/x/term;version=v0.47.0;sha256sum=d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf \
-    gomod://golang.org/x/text;version=v0.43.0;sha256sum=b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863 \
+    gomod://golang.org/x/sync;version=v0.25.0;sha256sum=c27da17d7e217dec0c2f8c715e5ce2b92815fa76fc08da13c41a73dd6a67dfe0 \
+    gomod://golang.org/x/sys;version=v0.50.0;sha256sum=b115e8a144a7c9d1df3ffb8af20b283e162844b5b624a97ee342955cca69b9e6 \
+    gomod://golang.org/x/term;version=v0.48.0;sha256sum=3f6dfe1b6031005d556ad54027c191636299aa4496fd631d1b1dcd23ada8bec7 \
+    gomod://golang.org/x/text;version=v0.44.0;sha256sum=e51c60a7d121a493048b1638023983ce183bd5d70df1db495423ce1415663202 \
     gomod://google.golang.org/genproto/googleapis/api;version=v0.0.0-20260720211330-0afa2a65878a;sha256sum=df4e8023b2b9efa58561b12e3177f4fb6789e2a271a9e03baf6f6501c7961694 \
     gomod://google.golang.org/genproto/googleapis/rpc;version=v0.0.0-20260720211330-0afa2a65878a;sha256sum=03a9f622788b07abc4873b3b57bdd9a3e2c8ca248587a2196578dda0bf74ddd5 \
     gomod://google.golang.org/grpc;version=v1.83.2;sha256sum=84292905a694e17862d15abc123a6f7f7efa9e1e3a77e80120982ff95b2605ea \
diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc b/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
index ad28fddc21..7daa2d3001 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared-licenses.inc
@@ -61,13 +61,13 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/go.opentelemetry.io/otel@v1.47.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0+AND+BSD-3-Clause \
     file://pkg/mod/go.opentelemetry.io/proto/otlp@v1.11.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/go.uber.org/automaxprocs@v1.6.0/LICENSE;md5=513f1cf32c6e4e3236a335fa13bb1c89;spdx=MIT \
-    file://pkg/mod/golang.org/x/crypto@v0.58.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.61.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.59.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.62.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.24.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.49.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.25.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.50.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.48.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.44.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-20260720211330-0afa2a65878a/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-20260720211330-0afa2a65878a/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/google.golang.org/grpc@v1.83.2/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.2.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb
rename to meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.2.bb
index b3e2f14f23..79aacb974d 100644
--- a/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.1.bb
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.11.2.bb
@@ -8,11 +8,14 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 require ${BPN}-licenses.inc
 
-SRC_URI = "git://github.com/cloudflare/cloudflared.git;protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+SRC_URI = "git://github.com/cloudflare/cloudflared.git;protocol=https;branch=master;tag=${PV};destsuffix=${GO_SRCURI_DESTSUFFIX} \
            file://cloudflared.service \
            file://default \
            "
-SRCREV = "518d7f7969b764df628bb4b1088f0f154901dc4e"
+SRCREV = "dc57315806d5faa8715f728fd37b5302c81c467b"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d{4}\.\d+\.\d+)$"
+
 require ${BPN}-go-mods.inc
 
 GO_IMPORT = "github.com/cloudflare/cloudflared"
