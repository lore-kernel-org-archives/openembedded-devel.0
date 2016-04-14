Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F1D7E65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:47:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u190so3124426qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=wIkE5oAhHoXC49anqVxLww3G0LkAH3ZMGsXZQPSFg9Q=;
	b=VZym50tpN4iPB0FGz5N+89Q+rAF94QHG2MraxRqNW0+66dET66c2KrFNoH7fDnDAxA
	qLFArGPjmHbBbeQ941e6uCchtfe4o+g9UkPvI892qLimxOJOHdZggyLN6DJBvpz+SSdY
	wxNqSZ6C+CSsgzuZMx/d26N9pLMs+BFPoNRfFNalZofjv8fjgPL79bzsYiPFS7OFNsKC
	/Ov87mzBK5O92YtkvT9B/3d9hJp81/Nv719eqcNoAtKxdjWItHfWveAXd6+YCquFPtRR
	3Yy2BkWFHPeiLysZFn7YFwmb7F2cDT5C8CkIGQB0SCOw5k1YuD3Ji2SrgFJLX6Q3QWtm
	Bong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=wIkE5oAhHoXC49anqVxLww3G0LkAH3ZMGsXZQPSFg9Q=;
	b=XJK0Pa7JKoEZFL51dG3ql54TvVa9DWsSpIp7zfDnv/DAWfgXdyICzM6GhaOfw0DsSj
	UVZJ/Ukw5ZfecS1MRpcnEg7ihsTaFxt/hIoukeru/0ETYRVe8SHY2XMpFQI9vVFi92Ty
	2Qauhr4r5opsxV0eJt0OlhbuWxLfCBYjPFe2MBRBty5wVRF6L66anvoEmNSOYRlkiWCx
	VIKbGGaCb1+jXjGSm3UI1cm4D51R8CdQo77UPjBTJz7EucnUxDkTle1Ji1Dctto1TKPK
	wUxDXGX4fYYIsKGzK3oInaPRnVjZVEDMujaU03pv6pjtP29CemxloXx120JL9fe3BJqP
	yCeQ==
X-Gm-Message-State: AOPr4FXF9jEvSkp1Og9cCgS4HcjBpmV+ir79vvIy7CCH29nuyYzHMMkKbH6d1KFz4JrINg==
X-Received: by 10.55.17.102 with SMTP id b99mr18704248qkh.86.1460645250864;
	Thu, 14 Apr 2016 07:47:30 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	m144sm14048716qke.4.2016.04.14.07.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 07:47:29 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 11:46:30 -0300
Message-Id: <1460645190-15886-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH v2] lldpd: Update to version 0.9.2
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
X-List-Received-Date: Thu, 14 Apr 2016 14:47:32 -0000

This new release has following changes since version 0.9.0:

lldpd (0.9.2)

  Change:
    - Ability to add/remove/replace custom TLV from lldpcli.
    - LLDP-MED capabilities are displayed differently in lldpcli.
    - Limit the maximum depth (5) when trying to apply a VLAN.
    - Change JSON output format when using json-c to match Jansson
      output.
    - Integration tests for the major parts of lldpd, including use of
      address and leak sanitizer.
  Fix:
    - LLDP-MED POE TLV are now displayed in lldpcli.
    - Ignore lower link when it is in another namespace.
    - Fix various problems with interfaces being enslaved.
    - Fix a memory leak when modifying port-related settings.

lldpd (0.9.1)

  Change:
    - Rework packaging for OS X to make it work with El Capitan. To
      simplify a bit, it is not possible anymore to build fat
      binaries. Latest version of OS X supporting 32bit was 10.6.
  Fix:
    - By default, when using port alias as description, use port name
      as port ID.
    - Miscellaneous fixes with netlink cache.
    - Ensure large netlink messages can be received.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-daemons/lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
index c590fae..77ed09f 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[md5sum] = "ed0226129b0c90b3a45c273fe1aba8de"
-SRC_URI[sha256sum] = "300e4a590f7bf21c79d5ff94c2d6a69d0b2c34dbc21e17281496462a04ca80bc"
+SRC_URI[md5sum] = "b809887bc927fb558fd5dd64b6c0a494"
+SRC_URI[sha256sum] = "6054f29d41faf32186a22331853a299c87f4419b4332df4a564f76a139305a32"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.1.4


