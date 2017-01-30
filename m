Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8226D772CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:29:19 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u25so134172602qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=HinQq95AbVDW0Ec0SBiZbfwMRBmg+4fGtUMtBikGBcg=;
	b=gnsBPVULMf4lmTuHsPw6wN6mXR0v8trxre27wWRkbQzMNaltJ+LHPCV5VyOXCwhmPv
	RQl5vEJbyAcbH9G2pbVUkhTgGrvQU2nt0KLiQyt0Mn0lcMDg2ht+RjewTUfezKKLq26l
	bmNhz9tFLPOAj45n6Sg5rPoo/zYSLd01MHrBLpSuu0MHbGpGycSGTiTMXhGHi1QrFfLQ
	g1J51JdJRvKvPNBEuEDuaXUirMeS2D7fVsU4d6Q7run6nDhlzoJKLs5pddCy7txPVGtt
	wRTxaCy5uk56xbjTpMicM3+Dc9XYl+ePm8t16zJ6NLfKfY5pdmUu2PGnIdZ5y4rbN8ZO
	d2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=HinQq95AbVDW0Ec0SBiZbfwMRBmg+4fGtUMtBikGBcg=;
	b=Zzpg5z2Tw9qTPKeeM6AE3EGbyQO2AVrI7lxD42AmVnJtCSbHCB1zR4FcyXktcN265Q
	D0NDwpBa3i2ir776euddlrkmghtPoBYjd9rUMmekojFHKFmFvuPgCZAw5bIz3rOkr1sA
	ZkVjgSDKJqPhA+lrbODKofTGR+xwCahMV2iOYIipYS4Lr5SWfKLSRIVdIse/cZPj8O+d
	sXec5PhZBmwluLm6lCNfMEqtISGXQioxHRUR6qaLxwrjDu/QlEMor4hBYRn+UNSB/hwO
	ozaK6yeY+m6wdg1W0O6HCTiiG4xmVCbJpMT+9r0k37Hx6cIlic+QhJludJeqahoc8IS2
	papg==
X-Gm-Message-State: AIkVDXLonnXqkrikEaGWsCSj6doRtfaYrNPVdBsdiwrXD4ZPnkJiQ3GAVK6gMQbQ1jWmNQ==
X-Received: by 10.233.223.129 with SMTP id t123mr21049874qkf.191.1485793759000;
	Mon, 30 Jan 2017 08:29:19 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	p70sm6035235qke.48.2017.01.30.08.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jan 2017 08:29:17 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 14:29:26 -0200
Message-Id: <20170130162926.28180-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH] lldpd: Update to version 0.9.6
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
X-List-Received-Date: Mon, 30 Jan 2017 16:29:19 -0000

This update includes following changes:

lldpd (0.9.6)
  * Changes:
    + Add a compile-time option to restore pre-0.9.2 JSON format (when
      using json-c). Use `--enable-json0` to enable this option.
    + Support for newer ethtool interface on Linux
      (ETHTOOL_GLINKSETTINGS) and additional speed settings.
    + Current MAU type is displayed even when autoneg is off.
    + Increase netlink receive buffer by default. Can be changed at
      compile-time through ./configure.
  * Fixes:
    + Correctly parse LLDP-MED civic address when the length of the
      TLV exceeds the length of the address.
    + Fix 100% CPU on some rare error condition.
    + Fix lost timer when an interface is enslaved on Linux.

lldpd (0.9.5)
  * Changes:
    + More Ethernet media supported. However, RFC4836 is quite
      out-of-date with respected to 10G+ speeds, bringing some
      inaccuracies.
    + Directly get media information for an interface without using
      the privileged process.
    + LLDP-MED capability TLV is not sent when LLDP-MED is not
    enabled,
      even if other LLDP-MED TLV are present.
  * Fixes:
    + Compilation fix with older versions of GCC.
    + Don't use ethtool at all to get real MAC address for enslaved
      devices (always use /proc).

lldpd (0.9.4)
  * Changes:
    + Make lldpd accepts a `-p` option to specify the PID file.
    + Ability to change multicast MAC address to two additional values
      to reach customer bridges.
    + lldpcli will now display chassis TTL when detailed view is
    enabled.
  * Fixes:
    + Fix setting of local value for port ID.
    + Fix compilation with BSD make.
    + Ensure lldpcli returns an error code on invalid commands.

lldpd (0.9.3)
  * Changes:
    + Do not rely on support of constructors for liblldpctl.
    + Always log to stderr (even in addition to syslog).
    + `lldpcli watch` accepts a limit on the number of received
    events.
  * Fixes:
    + `lldpcli -f {xml,json} watch` should work now.
    + Consider `veth` interfaces as physical interfaces.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-daemons/lldpd/{lldpd_0.9.2.bb => lldpd_0.9.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.2.bb => lldpd_0.9.6.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
index 77ed09f54..0cd063720 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[md5sum] = "b809887bc927fb558fd5dd64b6c0a494"
-SRC_URI[sha256sum] = "6054f29d41faf32186a22331853a299c87f4419b4332df4a564f76a139305a32"
+SRC_URI[md5sum] = "0dcdee7c1b3c62362d73f6508c11edae"
+SRC_URI[sha256sum] = "e74e2dd7e2a233ca1ff385c925ddae2a916d302819d1433741407d2f8fb0ddd8"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.11.0


