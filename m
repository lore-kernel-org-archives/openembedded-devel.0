Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 36B727F2F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 02:48:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id gn20so7221208plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 19:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=95NrfUC8HSDLxOoVs3UpcLd0FBcl544N6/6K/jW7WAk=;
	b=sUyOazKD7jfL4DtiEArqFSR3jtYVcsSL/vIcXzYb0avPmu3Nsk6z/ohRZUb359JIy9
	uruqUfIHIl8udjWwlnaZ5sulY9817IWrjIOeFuTXjC6EmDNa96Zg4zr1jzMqlWn/ATOe
	g8CipeeOTqrNfqK2Ji0DwgNHVXoRU3odrUE3/sNtAEKGtaurGv25mcRMG0OOklCclk7L
	3pZlitWEorTcAOSslqC7GbNqqwt8LPNtagb2H5/Cm1q7OBK9Xt4gm3SEdgiK7fa98yWd
	fgN7aVHm7VSVJg2pSrLq8YJ71p/r47dAdkHiD+LJXSfxP/8JDzxumJp9Sl8mK3eFM2ym
	9PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=95NrfUC8HSDLxOoVs3UpcLd0FBcl544N6/6K/jW7WAk=;
	b=pawoGd2W/LR6rVi4zoESQpldVwwopu5uOcn+LLETB2ekX8IHelwou/XjB32XH5Y7Fg
	6d5W81Gx7/WZ1aOg5wjmkqa8LZeZUlkjrOXmaLoE1Uw4zrlYgqe0jeO80LbLg1LQiIE/
	bP2cjsX4ZKjLLNBIH3UsbWNlvSzZhTXtkruU5aVF28b9zKDregnxyNRQqstAW47IdF36
	p9KdsKXGhhGCfhxp+rCE2+6PSjtJoAzn4DnZg+uS5El/CRvR0bbhsGEcOrIkJAYfLRHk
	yWzenKLRrsALe24KRx2EETlvNcON1YkLuwtvWxvCPd62HIes5Uv9kPFA7UXOMIJYyaYf
	np5g==
X-Gm-Message-State: APjAAAXssxCQX8Nv9JkssuVflCqhapjXZ44NuND3rv6KFQ+ToqN36DZY
	6uDIqJpGhd+TMovtpQe/b5RNqX/6
X-Google-Smtp-Source: APXvYqxJe3qafOKqM24lBXK4ueFp8OtQr4pBEd/mfnZRmqWjBC/yBKikKp/kmXyDiWY8a2767DXuQw==
X-Received: by 2002:a17:902:e592:: with SMTP id
	cl18mr32573896plb.291.1567478928081; 
	Mon, 02 Sep 2019 19:48:48 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	ce20sm15274729pjb.16.2019.09.02.19.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 19:48:47 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fe511106-68be-88ad-8cfd-572a1858f440@gmail.com>
Date: Mon, 2 Sep 2019 19:48:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Subject: pull request for warrior
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
X-List-Received-Date: Tue, 03 Sep 2019 02:48:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

he following changes since commit 222cafdcd97549f67c98833721b4f8f33607555e:

  wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03 (2019-07-13 12:43:43
-0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded
0afee3eacfd18a9962013830028f9e54b4973657

for you to fetch changes up to 0afee3eacfd18a9962013830028f9e54b4973657:

  apache2: upgrade 2.4.39 -> 2.4.41 (2019-09-02 19:39:53 -0700)

----------------------------------------------------------------
Adrian Bunk (5):
      zeromq: Upgrade 4.3.1 -> 4.3.2
      gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
      wireshark: Use an upstream URL that stays valid longer
      libgit2: Upgrade 0.27.8 -> 0.27.9
      vlc: notify switched to GTK+3 some time ago

Carlos Rafael Giani (1):
      openh264: Fix armv7ve build

Changqing Li (3):
      volume-key: fix "Nothing RPROVIDES" when multilib enabled
      isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
      satyr: fix "Nothing RPROVIDES" when multilib enabled

Fabian Klemp (1):
      openvpn: respect pid file in init.d service start

Kai Kang (1):
      net-snmp: update SRC_URI

Luca Ceresoli (2):
      fuse-exfat: moved to github
      exfat-utils: moved to github

Martin Jansa (5):
      redis: backport a fix for stack trace generation on aarch64
      ntop: fix missing return from non-void function
      freeradius: add runtime dependency on perl
      scsirastools: add runtime dependency on bash
      scsirastools: add runtime dependency on bash II

Mingli Yu (1):
      mariadb: Upgrade to 10.3.16

Yi Zhao (2):
      fuse: upgrade 2.9.8 -> 2.9.9
      apache2: upgrade 2.4.39 -> 2.4.41

 .../fuse-exfat/fuse-exfat_1.2.3.bb                 |  6 +--
 .../fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}          |  4 +-
 .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |  2 +-
 .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  2 +-
 .../recipes-multimedia/openh264/openh264_1.7.0.bb  |  1 +
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  2 +-
 .../freeradius/freeradius_3.0.17.bb                |  2 +-
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  6 +--
 ...fix-missing-return-from-non-void-function.patch | 19 +++++++++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb |  1 +
 .../recipes-support/openvpn/openvpn/openvpn        | 12 +++++-
 .../recipes-support/wireshark/wireshark_3.0.1.bb   |  2 +-
 .../zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb}    |  4 +-
 ...native_10.3.15.bb => mariadb-native_10.3.16.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  8 ++--
 .../{mariadb_10.3.15.bb => mariadb_10.3.16.bb}     |  0
 .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb  |  8 ++--
 .../Fixed-stack-trace-generation-on-aarch64.patch  | 45
++++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb     |  1 +
 .../scsirastools/scsirastools_1.6.6.bb             |  4 +-
 .../volume_key/volume-key_0.3.12.bb                |  7 ++--
 .../{libgit2_0.27.8.bb => libgit2_0.27.9.bb}       |  3 +-
 meta-oe/recipes-support/satyr/satyr_0.27.bb        |  4 +-
 .../{apache2_2.4.39.bb => apache2_2.4.41.bb}       |  4 +-
 24 files changed, 110 insertions(+), 37 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb =>
fuse_2.9.9.bb} (94%)
 create mode 100644
meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.1.bb =>
zeromq_4.3.2.bb} (85%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.15.bb =>
mariadb-native_10.3.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.15.bb =>
mariadb_10.3.16.bb} (100%)
 create mode 100644
meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb =>
libgit2_0.27.9.bb} (90%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb =>
apache2_2.4.41.bb} (98%)


