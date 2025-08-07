Return-Path: <dean@sellers.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C193C87FCF
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 00:00:04 +0000 (UTC)
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by mx.groups.io with SMTP id smtpd.web11.10442.1754611200885220139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 17:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup default._domainkey.sellers.id.au on 100.100.100.100:53: no such host" header.i=@sellers.id.au header.s=default header.b=FVwCsC/8;
 spf=none, err=permanent DNS error (domain: sellers.id.au, ip: 35.89.44.39, mailfrom: dean@sellers.id.au)
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id k4uMutKYKanSskAWduvtaC; Fri, 08 Aug 2025 00:00:00 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id kAWcutJDBXZDSkAWcuSgfK; Thu, 07 Aug 2025 23:59:58 +0000
X-Authority-Analysis: v=2.4 cv=SdD3duRu c=1 sm=1 tr=0 ts=68953dfe
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=rYJWqwM8jy5GC5dGn5DjfA==:17
 a=2OwXVqhp2XgA:10 a=QzMiS2WfBm8A:10 a=zVQgEkJGAAAA:8 a=Zqbe0Ig8F8ON6OjErvMA:9
 a=f9Z7W1HAzlP95tlrx9U8:22 a=kx6rClhKpNpzm8O-7uKn:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yb4I9JiT/qZJ7UAK4snOgm2108WhLTg/iHkTketmtk4=; b=FVwCsC/8zfTct+9PQNr6AuRjcg
	oq++WlUMtXG6evKNpUaYDTiO3jiXuDTw7+SUb4ylPqkIhMMkav7BN2U56GHOWUBTUxCMVAdmUOezH
	MxNc+JgIe21N8kQPU1HR9Pbcjz8d9iiIEOebqXMsD2pH024wEagsPKO3kO4gt2akXqCM59Xg4zYqk
	RO2MNgspkGsYRVrOrf5Q2i9UzHcWL9gEFoVU64IDPG/FvNu8VLJRyRzRtgSlAOU1ywwOhyNOA/Vws
	IsAp+dfemcTSEboE454/YCXfEwaqVF3rc6AjIgq6UWOLuxGsFEjx00eAm1dho+uF06lQdfQGpB91l
	ZpakWynw==;
Received: from [60.227.177.195] (port=49108 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <dean@sellers.id.au>)
	id 1ukAWb-00000003ZBm-2WWU;
	Thu, 07 Aug 2025 17:59:58 -0600
From: dean@sellers.id.au
To: openembedded-devel@lists.openembedded.org
Cc: Dean Sellers <dean@sellers.id.au>
Subject: [meta-networking][PATCH] tailscale: Added support for systemd init
Date: Fri,  8 Aug 2025 09:59:50 +1000
Message-ID: <20250807235950.2999935-1-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 60.227.177.195
X-Source-L: No
X-Exim-ID: 1ukAWb-00000003ZBm-2WWU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [60.227.177.195]:49108
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 1
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIyTYH+Gf6a+jv7eXahGziNGbRBECHuWVP9k0ZuzOJ9KTSZ18xpsbA5yzwnHNOuj91RE/atxs1SkfzxvDT+pYul6ko4Pd9VhU3zvTzhN1naokmk7db2K
 kIYAdK1LJQ5WGLRhS4ViLJxkWvmqO/Z8fSEv8ezo4fxmTnBapMnnRQ1oTjWt+ow98kBS33Pk8XIInPYPIvTRmf0eJJmty9egNTbFwc72hAF6WQNv/eWg6ZbC
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Aug 2025 00:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118900

From: Dean Sellers <dean@sellers.id.au>

Includes the provided service and defaults files for using the
tailscale daemon on systemd init machines.
Added the other kernel modules necessary for tailscaled to work
without warnings to RRECOMMENDS.

Tested with `core-image-minimal` under qemu with machines
`qemux86-64`, `genericx86-64` and `qemuarm64`. Ping
host on tailscale network using magicDNS host lookup.

Signed-off-by: Dean Sellers <dean@sellers.id.au>
---
 .../tailscale/tailscale_1.84.3.bb             | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.bb
index 25b54ae93a..33ae1925d5 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.84.3.bb
@@ -22,7 +22,9 @@ GO_LINKSHARED = ""
 GOBUILDFLAGS:prepend = "-tags=${@','.join(d.getVar('PACKAGECONFIG_CONFARGS').split())} "
 GO_EXTRA_LDFLAGS = "-X tailscale.com/version.longStamp=${PV}-${SRCREV_SHORT} -X tailscale.com/version.shortStamp=${PV}"
 
-inherit go-mod update-rc.d
+inherit go-mod \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'update-rc.d', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
 PACKAGECONFIG ??= "aws bird capture cli kube ssh tap wakeonlan"
 PACKAGECONFIG[aws] = "ts_aws,ts_omit_aws"
@@ -39,6 +41,9 @@ INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME:${PN}d = "tailscaled"
 INITSCRIPT_PARAMS:${PN}d = "defaults 91 9"
 
+SYSTEMD_PACKAGES = "${BPN}d"
+SYSTEMD_SERVICE:${BPN}d = "${BPN}d.service"
+
 # override do_install, since it installs in bin instead of sbin
 do_install() {
     install -d ${D}/${sbindir}
@@ -49,22 +54,34 @@ do_install() {
         ln -sr ${D}${sbindir}/tailscaled ${D}${bindir}/tailscale
     fi
 
-    install -d ${D}${sysconfdir}/default
-    install -m 644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/${BPN}d
-
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${UNPACKDIR}/tailscaled.init ${D}${sysconfdir}/init.d/tailscaled
+        install -d ${D}${sysconfdir}/default
+        install -m 644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/${BPN}d
     fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 644 ${B}/src/tailscale.com/cmd/tailscaled/tailscaled.service ${D}${systemd_system_unitdir}/${BPN}d.service
+        install -d ${D}${sysconfdir}/default
+        install -m 644 ${B}/src/tailscale.com/cmd/tailscaled/tailscaled.defaults ${D}${sysconfdir}/default/${BPN}d
+    fi
+
 }
 
 PACKAGES =+ "${PN}d"
 
 # mark these as src, since there are bash script etc in there and QA will complain otherwise
 FILES:${PN}-src += "${libdir}/go/src"
-FILES:${PN}d = "${sysconfdir}"
+FILES:${PN}d = "${sysconfdir} ${systemd_system_unitdir}"
 
 RDEPENDS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'completion', 'bash-completion', '', d)}"
 RDEPENDS:${PN}d = "iptables"
 
-RRECOMMENDS:${PN}d = "kernel-module-wireguard"
+RRECOMMENDS:${PN}d = "\
+    kernel-module-wireguard \
+    kernel-module-tun \
+    kernel-module-xt-mark \
+    kernel-module-xt-tcpudp \
+    kernel-module-xt-masquerade"

