Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id CBAB67F2F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 03:02:15 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y1so7212059plp.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 20:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=UA2lak9e9/noLvjPLugNcL2NHJYRStJpToHTWBR4bHI=;
	b=N3hcrANSSGQi3fD0rHh6vMGGr5cy+KrHW7B0k91KD0UkQHwvpqtm7HbROF3/8GaFrr
	Mw9M/fpzKGBo3PKOzE8RM6Qsm3emFuIXnZKIx8nytwNMxlxnOs2jmUL/mIDnVxU5zM/Z
	oCiyO2cE2gHxVuAytz1JDCnR7i2kuu002bsH2H+2l5LH1dfTywtAjXLAy28P1+KB2XzK
	1NHwTKdtXa2QDoSarwMEhXnXbFMOoOuEKDicVnPcVF0UDpDtfSo7sJBnW4UMkp8P5DJG
	Jbddwfycnzb826COhLjKjhtS9fEcJBDLTdWxMZCDu2xqYZl0mG3Y64mWiIyacDpLo2Cs
	6a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=UA2lak9e9/noLvjPLugNcL2NHJYRStJpToHTWBR4bHI=;
	b=ndPS4uhgXbA3T4SJt4WtrrSFCMiKCNFZZ/SBXAMbFFrrU4GmhapnULZWbbDEkKF6CZ
	iwtdOyYxGEg16G/GdfimeQocibP282vmfw4AH2rYzlD51cqB3TnZMTUoGaV07pV00hVL
	uda80MtQejpyQl3gmyIrPghtTed2xoskD1qqIkB+CcZTHjZY9rlMDP0RlCqlmnnFpalp
	TcEOayvRfe3RkJGAQJfmc3HCqFncG2T5kMQz/WD6sedoxb2MWNC5KPkRWnwozFyuXW6G
	l9TCyGAiWBCToOqFn/aiu1qPrY4QfsFHkV+sFooSFh+gNraBY1QmaXZMfknM8ypuL72o
	lwlg==
X-Gm-Message-State: APjAAAXbh7FsRnFLc6UthRR1UI+Xh4NINGh0doj8jQueQ2s66SbScSYf
	mVRKUyrWdwu77EH5QWMBn370ALMP
X-Google-Smtp-Source: APXvYqxVUqTjartVyDJ8sA1Yq9Hc+aV9IDMkqz8ndjXwK7y5vc+6ZrjQ5m+URrDQaAEdaDvTBEuSaA==
X-Received: by 2002:a17:902:b40c:: with SMTP id
	x12mr2757534plr.145.1567479736785; 
	Mon, 02 Sep 2019 20:02:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	j10sm14946694pjn.3.2019.09.02.20.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 20:02:16 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f8250bb8-db71-1946-45c5-94722c6c81f6@gmail.com>
Date: Mon, 2 Sep 2019 20:02:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Subject: Merge request for thud
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
X-List-Received-Date: Tue, 03 Sep 2019 03:02:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 9b3b907f30b0d5b92d58c7e68289184fda733d3e:

  netkit-rsh: add tag to CVE patch (2019-05-27 22:22:25 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded
aaa6eb0bb5da516373aa9e8c1dde8fdf85a54e95

for you to fetch changes up to aaa6eb0bb5da516373aa9e8c1dde8fdf85a54e95:

  lua: Security fix for CVE-2019-6706 (2019-09-02 19:54:39 -0700)

----------------------------------------------------------------
Armin Kuster (1):
      lua: Security fix for CVE-2019-6706

Peter Kjellerstedt (1):
      apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS

Qi.Chen@windriver.com (1):
      apache2: set CVE_PRODUCT

Yi Zhao (2):
      apache2: upgrade 2.4.34 -> 2.4.39
      apache2: upgrade 2.4.39 -> 2.4.41

 .../recipes-devtools/lua/lua/CVE-2019-6706.patch   |  32 ++
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |   1 +
 .../recipes-httpd/apache2/apache2-native_2.4.34.bb |  46 --
 ...nfigure-use-pkg-config-for-PCRE-detection.patch |   8 +-
 ...-up-the-core-size-limit-if-CoreDumpDirec.patch} |  12 +-
 ...ot-export-apr-apr-util-symbols-when-usin.patch} |  10 +-
 ...ache2-log-the-SELinux-context-at-startup.patch} |  23 +-
 ...replace-lynx-to-curl-in-apachectl-script.patch} |   6 +-
 ...-the-race-issue-of-parallel-installation.patch} |   6 +-
 ...apache2-allow-to-disable-selinux-support.patch} |   8 +-
 ...-not-use-relative-path-for-gen_test_char.patch} |   8 +-
 .../apache2/apache2/CVE-2018-11763.patch           | 512
---------------------
 .../apache2/apache2/apache-configure_perlbin.patch |  27 --
 .../{apache2_2.4.34.bb => apache2_2.4.41.bb}       | 202 ++++----
 meta-webserver/recipes-httpd/apache2/files/init    |   0
 15 files changed, 190 insertions(+), 711 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2019-6706.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
 rename
meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-corelimit.patch
=> 0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch} (83%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.4-export.patch
=> 0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch} (80%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-selinux.patch
=> 0004-apache2-log-the-SELinux-context-at-startup.patch} (85%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{replace-lynx-to-curl-in-apachectl-script.patch
=> 0005-replace-lynx-to-curl-in-apachectl-script.patch} (95%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.3-fix-race-issue-of-dir-install.patch
=> 0006-apache2-fix-the-race-issue-of-parallel-installation.patch} (94%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{configure-allow-to-disable-selinux-support.patch
=> 0007-apache2-allow-to-disable-selinux-support.patch} (91%)
 rename
meta-webserver/recipes-httpd/apache2/apache2/{server-makefile.patch =>
0008-apache2-do-not-use-relative-path-for-gen_test_char.patch} (76%)
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.34.bb =>
apache2_2.4.41.bb} (61%)
 mode change 100755 => 100644
meta-webserver/recipes-httpd/apache2/files/init


