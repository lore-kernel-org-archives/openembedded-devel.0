Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.43025.1585538088059259993
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 20:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g5ZbGpGI;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id c21so7263371pfo.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 20:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OV9wjnJJHssF/bNBVxTqFy2e4s6ezDPBJd3YhMh/rsg=;
        b=g5ZbGpGIVaQY4LxG+11HBloydW2JSrl8H18Q0p5ZEq1is7eH/Fvgd3LeUGfFLjnKYi
         hgOPIC75YRmT5hIrcySlp3PanKB9TIrMGZID+YHDtCufEcF3IxJBt4JVuZufbf2DHLrT
         TBcI+tCfrlBkc31Qofrt2NH9EkvaYwUq3AHGbHB8jxtBOCRmcOT/DRl2QVpFXauvI084
         pBVN446RRvGaUgUK9soTBwR76JzfT8pq7nqj0ntDIdBO0khaoIIMh6tDaaD6PuzmCnoT
         +OFX+XUChZ80fwtgcD3z8936V57O7cDNYqkp8Z4pKKvioUienlp03wdHx2tGhjFsQZNA
         mxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OV9wjnJJHssF/bNBVxTqFy2e4s6ezDPBJd3YhMh/rsg=;
        b=hdsT4AhbB7ussmtFuF4eeRHZivqnoNOKE1bXio4eLCvDGtBEhDj5IYPvYgpJU7hDH0
         K3s93M5j29Q2U+Qon0w1jf6+d0VuyiJ+ixBum7hpmixH6TxOfZs7qt7aoLoWQPpzAYnO
         GQZXzdW4xelJ3Ca2UyHMjifztLSr2uu2F7DoTvC9v/4kcTgs0VSYjv1Wou7pvx+3c1iW
         SCIpEAtjfKEjDGSoc0USXHBPpo/YbQKqyOzcSNlivdCgPJBDT40kArkOKkLf3nJhoYSu
         Nc1cJBpKVvqtLPC1YxSVGCf4L0sVoGQKD3NP8e5RJL/PfS9I6S0TjF0hg7L34E3KM6aQ
         +53A==
X-Gm-Message-State: ANhLgQ3oE1bAlkIG4SPt2lwV2naOpetEKsWtHDkC/I5/sYShDE4845Dj
	BUxSQgYVdurnYiCnmiyv0JQ9kSkqUq8=
X-Google-Smtp-Source: ADFU+vvAmtTS96gtVa+WCvETgw8C02qzEvLigxyOvlQbCU4iZhRtBa9w1N7bOAjNQPlQFxQvL9xLJw==
X-Received: by 2002:a65:4249:: with SMTP id d9mr10642634pgq.198.1585538087254;
        Sun, 29 Mar 2020 20:14:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id r7sm9009569pfg.38.2020.03.29.20.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 20:14:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] wireguard-tools: Ensure make clean target is run properly
Date: Sun, 29 Mar 2020 20:14:56 -0700
Message-Id: <20200330031456.1708148-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330031456.1708148-1-raj.khem@gmail.com>
References: <20200330031456.1708148-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When S is pointing to a level up, it calls clean target which also tries
to clean the module build objects, which causes make clean to misnehave
since the env is not set to build module and it tries to reach out to
/lib/modules dir on host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wireguard/wireguard-tools_0.0.20191219.bb            | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
index c4ddbcb0e9..267124a294 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
@@ -1,15 +1,14 @@
 require wireguard.inc
 
+LIC_FILES_CHKSUM = "file://../../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
 inherit bash-completion systemd pkgconfig
 
-DEPENDS = "wireguard-module libmnl"
+DEPENDS += "wireguard-module libmnl"
 
-do_compile_prepend () {
-    cd ${S}/tools
-}
+S = "${WORKDIR}/WireGuard-${PV}/src/tools"
 
 do_install () {
-    cd ${S}/tools
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
         SYSTEMDUNITDIR="${systemd_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
-- 
2.26.0

