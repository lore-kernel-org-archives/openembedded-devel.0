Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10297.1795753110593898679
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RBpUvtOb;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386bd881d39so8250234eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753110; x=1796357910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoajrmLrqhjrdfJbAHcvtYWUl+EQQ6/9qT1ylAzVl4c=;
        b=RBpUvtObSKwP8HhdtdT4Ny+OuBgAKIGpUYg9/A8lksBZGHAu7m+wQimhvV4oS5YiLi
         leTE7Xmt7VT67haiGXgU/KPIerF7XXdAJzUswHJcSQs9GVBC5gu+CIEkG4l3Swnn6m2I
         eFXK9dBjdt8QnSOI2iJEJ04+YcPT54jwsk2t1xlElpw8ZGDkJ099qVaWx7BUlgWeDOBK
         tQTgskkro47x6Z4wHH9wNlv3uwLynfNLDZ8PUNdQWi3LqPDErofbKBM8X6LrVdZz/Eff
         VdehYQOMsaH8v6xjKsgtST2VFE3Ris1HwOfzZ0Q/9bH4LaV/37WYtcZaRnCyeFnrg8gg
         sb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753110; x=1796357910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoajrmLrqhjrdfJbAHcvtYWUl+EQQ6/9qT1ylAzVl4c=;
        b=Scqd57e23aJXxkrlmuXHft4OJ4e02kWgGvgNx0+6KnUtD1OSKzfAJoczKna+Sg4JFJ
         sV8eMgQrOlQrNE2pTP99DlvCBnhKJVh6nfmGPtgaft6z1N6J4qEjitqsjNDBNksUq69x
         nFFWCwSDGlhQkv4RWIbgdpwmzVt+f9PxqIlExu7/lJAC6bX5wqh5U8PrIUgjirXwecRn
         qy2fdEr/oot3TGfwIdoI94X+gm55hDn6GW3aKxyWE3srs3xP1JeOmLR4kACvWMPLHyxL
         i8X7DWdbzvidfXPfA8CDFN3rWMmERZP7djycj6CO6M8W8iVA7BNeLa+PX8LRWzcXr7qn
         B3Dg==
X-Gm-Message-State: APuU4Z9E7YQTtV0b12PCQEHnGyLA/bgIEjEypfHNWYu0OXCaF2o39oZQ
	CpQNnBtiqfm1N5lSRJSi2caDMVCejk+6CyVbaFill66TBleCwItwO5yCoRxvQ0ld
X-Gm-Gg: AZFdTZe2LIN0PErDRRaSHIfOqsdQm9Lw2V8ma/aTOH+ZMaXJYfH86Odoi8ATMcqBhQe
	oUZrROUpVOjPk5lFGGThrqBA9eU7b84u2WVYHK8MQ5Xfz9oQGVwQoxaTst+wD3Luzo0ZYYY4ExI
	y18NJEbAJH4jRiInEC46xYVJ85YROJ7BXQeXlu7CSvV1cCoUj0delGGkQfCtV7hUva0rNXom6sp
	+WEekHmNKWcfJz0aaHdI0B1iW6+q+Qvml+XsYwBrBokPGEViV/fcraB4GUkue+SFDc69OqHawWR
	TPYptEPxwW3UevsO+ePAItdnzC5OSP878SxvJdEN04uEoisD9eiRgJEZlEBPtPWA96Vof0XIAt8
	xSJ0r945zlWnY+pjqadgMijNK8U4hPqN8XzGgUHpGVkbNTEI8GyzcKD10CbkWXp4W4qq0NnwGLy
	suAlzt4BHvCRukbbsmx6jOHGsrNgK4Fde5W8K2WZ4nBly8K3RqcnQbjoVxVp+rekoWcuXCcq4Nk
	H+2rPtPzTaQ/7JvxjgvfXjryfg+iskIUkW6irHG9KSIKSKYXeYOfshEP1lcleYlcH7WCUG7Gwy5
	KdjrczgTjmBJmS/7vU0xC/dJqwGjankiIVeiLC0uHpy3uBTtE5HaIe0A41Blk/+8gB8x5VbswAI
	XtoDcYI3t5e9ijygZn7fGr72E/4X43DdihUgC055mkjgzq6IGsmHhGfsebARfajILcJUhWVtAJ1
	NjCbH4smSvcw1zJFFbu0I9kdnbomtf5d+5U3K0/X0GVwCvEgtfa7KoeCQ0C8CcptcKg6VHLLEMd
	mEoxQuJD9oT6EvNMGXnt+n43ZzdAXu9GQTF9HTuFppjOKOigaSUu2uv7GJBF3xUPTDevHwZLaFq
	D53C
X-Received: by 2002:a05:7300:8811:b0:386:d86d:d445 with SMTP id 5a478bee46e88-386d86dd49amr6747692eec.36.1795753109894;
        Thu, 26 Nov 2026 20:18:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 00/15] Source fixes and upgrades
Date: Thu, 26 Nov 2026 20:18:12 -0800
Message-ID: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133288
Content-Type: text/plain; charset="utf-8"

dlm fetched from its new gitlab home, relayd over https, and same-series
upgrades.

Security fixes: mbedtls 3.6.8 (CVE-2026-50582, CVE-2026-90469,
CVE-2026-90470, CVE-2026-90475, CVE-2026-93776, CVE-2026-93777,
CVE-2026-93831, CVE-2026-93833, CVE-2026-93835, CVE-2026-93842 to
CVE-2026-93845, CVE-2026-115488 to CVE-2026-115491, CVE-2026-115493,
CVE-2026-116375, CVE-2026-116462), cannelloni 2.1.3 (CVE-2026-37539) and
fetchmail 6.6.10 (CVE-2026-94184).

mosquitto 2.1.4 needs the cjson fix from the meta-oe series.

Khem Raj (15):
  dlm: Fetch from gitlab.com/linux-gfs2/dlm
  relayd: Fetch over https
  mbedtls: upgrade 3.6.7 -> 3.6.8
  arno-iptables-firewall: upgrade 2.1.2a -> 2.1.3
  cannelloni: upgrade 2.0.0 -> 2.1.3
  fetchmail: upgrade 6.6.6 -> 6.6.10
  mosquitto: upgrade 2.1.2 -> 2.1.4
  xl2tpd: upgrade 1.3.16 -> 1.3.20
  tcpreplay: upgrade 4.6.2 -> 4.6.4
  sngrep: upgrade 1.9.0 -> 1.10.0
  postfix: upgrade 3.11.7 -> 3.11.8
  cloudflared: upgrade 2026.11.1 -> 2026.11.2
  libtevent: upgrade 0.17.2 -> 0.17.3
  snort3: upgrade 3.12.2.0 -> 3.13.2.0
  tailscale: upgrade 1.104.6 -> 1.104.7

 .../cannelloni/cannelloni_2.0.0.bb            | 23 --------
 .../cannelloni/cannelloni_2.1.3.bb            | 15 ++++++
 .../cloudflared/cloudflared-go-mods.inc       | 12 ++---
 .../cloudflared/cloudflared-licenses.inc      | 12 ++---
 ..._2026.11.1.bb => cloudflared_2026.11.2.bb} |  7 ++-
 .../{mbedtls_3.6.7.bb => mbedtls_3.6.8.bb}    |  2 +-
 ...{mosquitto_2.1.2.bb => mosquitto_2.1.4.bb} |  5 +-
 .../recipes-connectivity/relayd/relayd_git.bb |  2 +-
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 53 -------------------
 ...{snort3_3.12.2.0.bb => snort3_3.13.2.0.bb} |  3 +-
 ...lscale_1.104.6.bb => tailscale_1.104.7.bb} |  4 +-
 .../{postfix_3.11.7.bb => postfix_3.11.8.bb}  |  2 +-
 .../recipes-extended/dlm/dlm_4.3.0.bb         | 11 ++--
 ....2a.bb => arno-iptables-firewall_2.1.3.bb} |  2 +-
 .../xl2tpd/0001-Fix-build-with-GCC-15.patch   | 39 --------------
 .../{xl2tpd_1.3.16.bb => xl2tpd_1.3.20.bb}    |  6 +--
 ...fetchmail_6.6.6.bb => fetchmail_6.6.10.bb} |  2 +-
 ...1-Add-configure-options-for-packages.patch | 29 +++++-----
 ...ibtevent_0.17.2.bb => libtevent_0.17.3.bb} |  5 +-
 .../{sngrep_1.9.0.bb => sngrep_1.10.0.bb}     |  4 +-
 ...{tcpreplay_4.6.2.bb => tcpreplay_4.6.4.bb} |  2 +-
 21 files changed, 71 insertions(+), 169 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
 create mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_2.1.3.bb
 rename meta-networking/recipes-connectivity/cloudflared/{cloudflared_2026.11.1.bb => cloudflared_2026.11.2.bb} (88%)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.7.bb => mbedtls_3.6.8.bb} (98%)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.1.2.bb => mosquitto_2.1.4.bb} (94%)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.12.2.0.bb => snort3_3.13.2.0.bb} (91%)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.104.6.bb => tailscale_1.104.7.bb} (95%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.7.bb => postfix_3.11.8.bb} (99%)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.2a.bb => arno-iptables-firewall_2.1.3.bb} (97%)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_1.3.16.bb => xl2tpd_1.3.20.bb} (92%)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.6.6.bb => fetchmail_6.6.10.bb} (93%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.17.2.bb => libtevent_0.17.3.bb} (90%)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.9.0.bb => sngrep_1.10.0.bb} (91%)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.6.2.bb => tcpreplay_4.6.4.bb} (93%)

