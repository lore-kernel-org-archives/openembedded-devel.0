Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id BBACA7FBFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 16:28:29 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id b9so5413227pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 08:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=q4jUup5m5AsVHBSxUqpgYg/8tnsAiSC+88r35ewJrGI=;
	b=QxXu+713+HB59yEzVZjMrFLeF29UAKqp3jVAC7gq9vY7lqeeJ1aDJOPR6iXMAfd7pQ
	CKkZ1eVPx6O1hfLaWoECJXeY5RnyTuFHwH3S1n2rlddR/z444CAOByOBQlZ0eJJfulPJ
	8aPA2bVU1UBRYr+evFh2TxyxIxNFK8FS5PIHsi1S35oK/4dV/qfJvxEPOQe+HgYmzWGy
	J5AI832TLVudPgxeDMCH5f2OLTM/6crIXglT2ZxnsQdl6EAOl9VouFQYkdJi18n4VrLw
	YlcoJMlE3gCL6ljLTyGGz+qwnlUakmyh+OrAQA3rGDCFv3V9lf0sbX7lhY0TA/MdPpO6
	NEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=q4jUup5m5AsVHBSxUqpgYg/8tnsAiSC+88r35ewJrGI=;
	b=d5RlwZ61sr8FQQEnqZ0dbskoHUzCTy80GokUpsJGCit9zODZzuk5HqDpElceZt7SmT
	vWH5vlQs7Wlyo6jCAEb7cB7kXasedXkYgy5Nwzx8tDfZyGWINNayn1tj1Ey0mNTs46Rw
	8V0iSdKDUoEgsvGZhPu6gB57FKE56AYx4lqyIrKEpvTPO8fPB6ECGS3S5qL/Nu/jJWse
	Zalh2XLPM2gMoC1acuQrEgjqLOvtWWvDRdji04BXzi68chArkFETZU3beR9tHjBP9sRo
	bNNpYsgosQA3D9Zc0TD+bGheXSvNOAUg5hDVAutFhR06bGbA4PQmVKYM3yKj9QaYOPjj
	RE+w==
X-Gm-Message-State: APjAAAVNP50BU6Mna5G5EucF91Dpb+FBT83CWNhLjbmq0QAs3POqmawW
	4p8CYuaYUE9wC1DIMSDqtuE=
X-Google-Smtp-Source: APXvYqzTJ8+A9/vRabS68qm+1iFkOZxWKARcMuxwEtTZMJ6abmy6573aa/czbGkDPKO/5UToBbECSA==
X-Received: by 2002:a62:382:: with SMTP id 124mr552856pfd.11.1575822510737;
	Sun, 08 Dec 2019 08:28:30 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:8551:ea9:91ad:87f7?
	([2601:202:4180:a5c0:8551:ea9:91ad:87f7])
	by smtp.gmail.com with ESMTPSA id
	g30sm21682697pgm.23.2019.12.08.08.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Dec 2019 08:28:30 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7dec2178-6a36-d62a-4add-7308c4cd146c@gmail.com>
Date: Sun, 8 Dec 2019 08:28:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Subject: zeus pull request
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
X-List-Received-Date: Sun, 08 Dec 2019 16:28:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


The following changes since commit aad5b3d070cd8c58828b0975cf861d8ebc90f460:

  README: updated Maintainers list for Zeus (2019-10-30 14:16:04 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded zeus-next

for you to fetch changes up to 0d16b31c3d96e0797d3335d44545412996c48c9a:

  mbedtls: upgrade 2.16.2 -> 2.16.3 (2019-12-08 08:12:43 -0800)

----------------------------------------------------------------
Andreas Oberritter (1):
      samba: fix installation for minimal build

Denys Dmytriyenko (1):
      mbedtls: upgrade 2.16.2 -> 2.16.3

Hongxu Jia (1):
      python-more-itertools.inc: fix python2 package not incorrectly
generated

Khem Raj (1):
      rsyslog: Dont force enable atomic builtins on mips

Michael Scott (1):
      modemmanager: Upgrade 1.10.6 -> 1.10.8

Slater, Joseph (1):
      php: fix CVE-2019-11043

Stefan Wiehler (1):
      nvme-cli: defer host ID generation to post installation

Trevor Gamblin (3):
      rsyslog: fix CVE-2019-17041
      rsyslog: upgrade from v8.1908.0 to v8.1910.0
      quagga: fix PIDFile path for service files

Yi Zhao (2):
      samba: upgrade 4.10.8 -> 4.10.10
      freeradius: fix CVE-2019-10143

Zheng Ruoqin (2):
      mariadb: upgrade 10.3.16 -> 10.3.18
      wireshark: upgrade 3.0.3 -> 3.0.6

niko.mauno@vaisala.com (2):
      gitpkgv.bbclass: Use --git-dir option
      gitpkgv.bbclass: Support also lightweight tags

 ...-to-radiusd-user-group-when-rotating-logs.patch | 104
+++++++++++++++++++++
 .../freeradius/freeradius_3.0.19.bb                |   1 +
 .../{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb}       |   4 +-
 .../samba/{samba_4.10.8.bb => samba_4.10.10.bb}    |  20 ++--
 .../recipes-protocols/quagga/files/bgpd.service    |   4 +-
 .../recipes-protocols/quagga/files/ospf6d.service  |   4 +-
 .../recipes-protocols/quagga/files/ospfd.service   |   4 +-
 .../recipes-protocols/quagga/files/ripd.service    |   4 +-
 .../recipes-protocols/quagga/files/ripngd.service  |   4 +-
 .../recipes-protocols/quagga/files/zebra.service   |   4 +-
 .../{wireshark_3.0.3.bb => wireshark_3.0.6.bb}     |   4 +-
 meta-oe/classes/gitpkgv.bbclass                    |  15 ++-
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb       |   5 +-
 ...demmanager_1.10.6.bb => modemmanager_1.10.8.bb} |   4 +-
 ...native_10.3.16.bb => mariadb-native_10.3.18.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
 .../{mariadb_10.3.16.bb => mariadb_10.3.18.bb}     |   0
 .../recipes-devtools/php/php/CVE-2019-11043.patch  |  38 ++++++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb          |   1 +
 .../rsyslog/rsyslog/0001-Out-of-bounds-issue.patch |  31 ------
 .../{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}   |   6 +-
 .../python/python-more-itertools.inc               |   2 -
 22 files changed, 188 insertions(+), 75 deletions(-)
 create mode 100644
meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.2.bb
=> mbedtls_2.16.3.bb} (92%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb =>
samba_4.10.10.bb} (95%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb =>
wireshark_3.0.6.bb} (95%)
 rename
meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb =>
modemmanager_1.10.8.bb} (92%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb =>
mariadb-native_10.3.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb =>
mariadb_10.3.18.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
 delete mode 100644
meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb =>
rsyslog_8.1910.0.bb} (97%)


