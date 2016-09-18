Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE31160761
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 22:56:28 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vz6so6064695pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zLY7bRN437JHN20RmFiUn7qdHSpTCvKSNceFi/creYs=;
	b=xNn5vmq1m8vOgXeID1wv+a3lET5ZhzcVdgR/HnwVZt2h0EBEMVTv43R7hbF4/9pFT0
	dKUemdj8TykDUhAIE5XEAFZiXr9cKoP12g3uomCSBAbY4zLUAlSyQZWBXjWPsEzasVh5
	SwsEPlfAXkn7jAnwk+6SNUK1HlA4+Fvqx2elpTWD3qJJZP47vUoovNLQYhpHN9pT1sAB
	ckng5otLf0g/LfISJdpwxLH+7Pr4lIqu1w+6LQumPMow+n/du3WpysazJghxeHWUs/ZB
	bgS4YE4kiJ/P+k3uvrvuQ3Nohd3/vJSLPuHjWjT3VfZohtkmV4EASiTpwFx0x1duK3CX
	XREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zLY7bRN437JHN20RmFiUn7qdHSpTCvKSNceFi/creYs=;
	b=B+Ra0rDlpJUvOewVORyYN5QzLWlECeh6hhS17ZrMCwxLLslTWXB4v9tjFq+l//h2ck
	cXgViF3qvScS8VpxR7G5YQJW04aKO3BucPY6x2pvAd++hjW2Jfcm9YXg+9KSKm/e9vJA
	zeMunKSLj3wwl9IB+plq851n5eOiJoOZ0dsHQZxJMlozpIXozjRAVjKoOA435hR2lyBy
	iYOcDT2q8+xq16RDanede8vrK3rs+NeaPVYADNF+zWiwL+canfw6PuMvWnCO2FEk7gJ8
	DfOeFEhnIugbEfUGMAEsfyf+I+YFqyBwEZCIScrwJjPkVYtiQWQmDreX/ExUEP5ToDjX
	M5+Q==
X-Gm-Message-State: AE9vXwOB/DZcx2ww7UfRP1yM+jRhrHtGmm6+8PSZDQnsbJelV7wLlZ0uyRkQCJaFqG3yOg==
X-Received: by 10.67.8.41 with SMTP id dh9mr41649599pad.132.1474239389003;
	Sun, 18 Sep 2016 15:56:29 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:64bb:faf9:2b9d:369a])
	by smtp.gmail.com with ESMTPSA id
	zy17sm10279740pab.28.2016.09.18.15.56.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Sep 2016 15:56:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2016 15:56:13 -0700
Message-Id: <cover.1474239076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/12] Jethro-next pull request
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
X-List-Received-Date: Sun, 18 Sep 2016 22:56:29 -0000

Please consider these changes for meta-openembedded jethro

The ntp, php and wireshark updates are bug and security fixes. No new features added

The following changes since commit 8ab04afbffb4bc5184cfe0655049de6f44269990:

  python-cryptography: fix compile issue with openssl 1.0.2h (2016-05-31 19:01:26 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/jethro-next
  http://cgit.openembedded.org/cgit.cgi//log/?h=akuster/jethro-next

Andre McCurdy (1):
  ntp: avoid floating dependency on mdns (aka mDNSResponder)

Armin Kuster (2):
  php: update to 5.6.18 and 6.6.32
  wireshark: update package to 1.12.13 for security fixes.

Derek Straka (2):
  php: check for existance of directory before 'rmdir' in
    do_install_append_class-target
  php: update to 5.6.17 and 5.5.31

Jackie Huang (3):
  php: update to 5.5.37 and 5.6.23
  php: control ipv6 support based on DISTRO_FEATURES
  php: update to 5.5.38 and 5.6.25

Robert Yang (1):
  php: fix aclocal-copy aclocal-copy

fan.xin (3):
  php: Upgrade 5.5.26 -> 5.5.30
  php: Upgrade 5.6.12 -> 5.6.16
  ntp: Security fixes via Upgrade to 4.2.8p8

 .../ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb}         |  5 +-
 .../{wireshark_1.12.8.bb => wireshark_1.12.13.bb}  | 10 +--
 .../php/php-5.6.12/CVE-2015-7803.patch             | 85 ----------------------
 .../php/php-5.6.12/CVE-2015-7804.patch             | 64 ----------------
 .../php/php-5.6.12/CVE-2016-1903.patch             | 55 --------------
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |  0
 meta-oe/recipes-devtools/php/php.inc               | 14 ++--
 meta-oe/recipes-devtools/php/php_5.5.26.bb         |  4 -
 meta-oe/recipes-devtools/php/php_5.5.38.bb         |  6 ++
 meta-oe/recipes-devtools/php/php_5.6.12.bb         |  9 ---
 meta-oe/recipes-devtools/php/php_5.6.25.bb         |  7 ++
 11 files changed, 29 insertions(+), 230 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb} (96%)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.8.bb => wireshark_1.12.13.bb} (89%)
 delete mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903.patch
 rename meta-oe/recipes-devtools/php/{php-5.6.12 => php-5.6.25}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.26.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.38.bb
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.6.12.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.25.bb

-- 
2.7.4


