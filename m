Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 152616140C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 00:21:37 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 6so10056481pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 16:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=xVt0viHjVkREz5idif7yFsZP2YnR+4GXvozZByxeC10=;
	b=L5Vh/2FBYAuAaFUVTpdVyg+/1PMo2b3eQXbKiX8qYQihekiUJpCdD3hTE/qcQ2ZH1q
	Q86Kk8w4mlNxnSIahW3fJ4NpAlIKYxA+X7eeIcIJSAeZvsRl1vqHyHLWa/zSU/Bqkd8M
	XZ38Tv3NBwAd1oQvQltCNhcfCyA/dQ9bkR/FPphsvcczB2+Y9exhfU7bJXsA0/EGVNNA
	aAL7kqtb7z1A+oj4dFTE/vOvDtcYeRaQP7zYIblsoS6W5Dx4LdoG4j0pE4PG6A3r+b75
	IxFSFaJV4ndPy8t1HrrAJzBT917DdzpKl5wyT0txRNK8gMqxZoE27tmy7Pejr6WjrKHe
	qhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=xVt0viHjVkREz5idif7yFsZP2YnR+4GXvozZByxeC10=;
	b=sqIkh2OcpOrPxgL5Sh+3EeCWUIbjrR0dKEz7pnC64MvctKMaral68TQIfanOBmq67u
	BU66zRhWhpSXJjFpayj7w6GUVdXTN/ST+urFVC1FYJndobHwtAIDrDYgE7/I7bP7B64n
	P+yjz9ZnpV7fCJwbFoO2P+swj2BYSx+n4s8cPUSIiftBSnzYKfUXCEmpJJzuFqMWHxJ1
	X213jm23Uf8IThMpaBtsYXDdVXcRk24jd5YZwueQfceYZ90h5KR7KQwQBEtKQNvNGKBN
	96rRSPK/0e894Nz3q3e/lTKhDa9FUwl/3qeGf4cXhXmKme2h+6+ejV5LyVhTARbbMCs3
	GvQQ==
X-Gm-Message-State: APjAAAU7EGcTSOaoD+Eu8GvCV9nAargII2k/OKQNC+simFf3az0KJckq
	yDOw6/AtE3YfYvVI5JWFhM8=
X-Google-Smtp-Source: APXvYqw/CWYb1AoYcAkGdMow2oqvCSv/i5NMNEv/nWA41NGwXYpCcSCXf9kt6NeSGK+c3CkoK9DKYA==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr21031623pgi.374.1581985298922;
	Mon, 17 Feb 2020 16:21:38 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:103:47a6:6829:8136?
	([2601:202:4180:a5c0:103:47a6:6829:8136])
	by smtp.gmail.com with ESMTPSA id h7sm2041662pgc.69.2020.02.17.16.21.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 17 Feb 2020 16:21:38 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d717ec49-d5f6-6cf0-18c4-107435d6949c@gmail.com>
Date: Mon, 17 Feb 2020 16:21:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Subject: zeus merge request
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
X-List-Received-Date: Tue, 18 Feb 2020 00:21:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit e855ecc6d35677e79780adc57b2552213c995731:

  ruli: Fix install step and build samples too (2020-01-05 14:44:11 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded zeus-next

for you to fetch changes up to bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:

  fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)

----------------------------------------------------------------
Gianfranco Costamagna (3):
      cpprest: fix cmake installation directory
      websocketpp: add various upstream accepted and proposed patches to
fix various issues, including:
      websocketpp: refresh clang patch

Kai Kang (1):
      adduser: set default shell with /sbin/nologin

Khem Raj (9):
      nodejs: libatomic patch should be target specific
      websocketapp: Fix multilib build
      websocketpp: Fix clang specific flags in cmake files
      squid: Link with libatomic on riscv
      grpc: Link with libatomic on clang/x86
      grpc: Link with libatomic on powerpc
      grpc: Link with libatomic on riscv
      netdata: Add libatomic to link step
      fluentbit: Fix packaging in multilib env

Peter Kjellerstedt (1):
      gitpkgv.bbclass: Add support for extending the supported tag formats

Sumit Garg (1):
      mariadb: fix library LZ4 lookup

Trevor Gamblin (2):
      python-twisted: add required RDEPENDS for twistd
      pyhamcrest: add python3 version of recipe

Yi Zhao (1):
      libldb: upgrade 1.5.5 -> 1.5.6

Zhixiong Chi (1):
      dnsmasq: CVE-2019-14834

 meta-networking/recipes-daemons/squid/squid_4.6.bb |   2 +
 .../recipes-devtools/grpc/grpc_1.24.1.bb           |  16 +++
 .../0001-dnsmasq-fix-memory-leak-in-helper-c.patch |  49 ++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb        |   1 +
 .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}    |   4 +-
 meta-oe/classes/gitpkgv.bbclass                    |  14 ++-
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   1 +
 .../mariadb/0001-Fix-library-LZ4-lookup.patch      |  30 +++++
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb  |   2 +-
 .../fluentbit/fluentbit/cmake_multilib.patch       |  18 +++
 .../fluentbit/fluentbit_0.12.19.bb                 |   1 +
 meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb |   2 +-
 .../0001-Correct-clang-compiler-flags.patch        |  32 +++++
 .../0001-cmake-Use-GNUInstallDirs.patch            |  35 ++++++
 .../websocketpp/websocketpp-0.8.1/771.patch        |  22 ++++
 .../websocketpp/websocketpp-0.8.1/842.patch        |  30 +++++
 .../websocketpp/websocketpp-0.8.1/855.patch        |  23 ++++
 .../websocketpp/websocketpp-0.8.1/857.patch        | 132
+++++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb               |  17 ++-
 meta-perl/recipes-perl/adduser/adduser_3.118.bb    |   1 +
 ...duser-set-default-shell-with-sbin-nologin.patch |  34 ++++++
 .../recipes-devtools/python/python-twisted.inc     |  18 ++-
 .../python/python3-pyhamcrest_1.9.0.bb             |  10 ++
 .../recipes-webadmin/netdata/netdata_git.bb        |   2 +
 24 files changed, 486 insertions(+), 10 deletions(-)
 create mode 100644
meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb =>
libldb_1.5.6.bb} (95%)
 create mode 100644
meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
 create mode 100644
meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
 create mode 100644
meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
 create mode 100644
meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
 create mode 100644
meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
~                                                                                        


