Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4901360111
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:47:49 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id f105so7347152qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=irjcaF1EwpMHQbNUMFt6PmRZpcIKdQEDQHT4Wbe/0XQ=;
	b=FyQbKNgAe/0Gsj+payFE4pEq0fwT5UCF6V5K6G/C6R0q5fOyOKpP1zmD0Lf1vmVVT+
	GRndzIsjhhQFX/f9/Uq8Fu0Y/jLCh3YbQHmOn/qOWrkd9TkFudqeMt9x7MIXGJ1svhqX
	shG6LFibprlfsucBP5QkWZUkfd17SK4aiknKVj3Yayw1eU8KMkfukIyMsfIZWskOa4PC
	/xY3Ji10+TMQ8pNLupo3NmfY1JYrZScijh33RR859/dzmV8xkZ8Pe3luBxNpP46B2Sip
	Lwd789Np09i2GOxFXFFdlpmUwQYQzOLhyDFTVq3w1dpgZtAdVVRzdmk8qvrm+eSnHDk9
	gnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=irjcaF1EwpMHQbNUMFt6PmRZpcIKdQEDQHT4Wbe/0XQ=;
	b=bGLw9rmM2SRibaCW9d8XhPoI+WMyhjmtxlvLR3IYlKwmQ7sUeL4sh2gn4A4/nKJDLT
	J2EOgJ2KFByOZnJiLyxqTTjL1C7YGWBvm8uHml0uXCXOOGR1X9lduBSCeOfkwOL2Lqii
	K8E7v5QzL6Pb5wrhv94kb9JUU8+byLHw6BOfUypPeOqDchufgdTSMpK0PqFEaOyvWotH
	riuk3dt5TNeJsDrn+X8sKf/S2nHvqg4BWBzkVp68dpeYBSATyfDEySFa7k2Fdk/OZwvB
	DvpKI3IVC2VbuY8+gt4/25aYtUV307ck4KtTOvgYy2DUK4RrBPXbpN6l1t0AUCCj7+lZ
	AvmA==
X-Gm-Message-State: AOPr4FUTdwIxyHoyMlRHZosM9Wce3f+WgheNf8/PgpamO7hs5su3E8hxiWre/gnvbHh58A==
X-Received: by 10.140.100.225 with SMTP id s88mr17322084qge.76.1460638070212; 
	Thu, 14 Apr 2016 05:47:50 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id j8sm347055qhj.11.2016.04.14.05.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 05:47:49 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 09:47:23 -0300
Message-Id: <1460638043-29679-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH] lldpd: Update to version 0.9.2
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
X-List-Received-Date: Thu, 14 Apr 2016 12:47:50 -0000

This new release has following changes since version 0.9.0:

lldpd (0.9.2)

    - Ability to add/remove/replace custom TLV from lldpcli.
    - LLDP-MED capabilities are displayed differently in lldpcli.
    - Limit the maximum depth (5) when trying to apply a VLAN.
    - Change JSON output format when using json-c to match Jansson
    - output.
    - Integration tests for the major parts of lldpd, including use of
    - address and leak sanitizer.
    - Fix:
    - LLDP-MED POE TLV are now displayed in lldpcli.
    - Ignore lower link when it is in another namespace.
    - Fix various problems with interfaces being enslaved.
    - Fix a memory leak when modifying port-related settings.

lldpd (0.9.1)

    - Rework packaging for OS X to make it work with El Capitan. To
    - simplify a bit, it is not possible anymore to build fat
    - binaries. Latest version of OS X supporting 32bit was 10.6.
    - Fix:
    - By default, when using port alias as description, use port name
    - as port ID.
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


