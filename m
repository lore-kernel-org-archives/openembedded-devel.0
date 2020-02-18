Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C53D6150D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:22:59 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b7so20026992qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 08:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2G+VZjq0mXT7qBzjf6oy9Otn9HdAM1sMa/CHuW5iUDc=;
	b=oam70uYugO2VjcJWnRmxA4LKNXku9M32onxILhOmmFiXIPcZo1XcV3Q2A/Nnm+OQww
	XwHP/Z8wD7/MWrsSD2y67JikjFWzs+57m8T+w1aqdvsPmnHOlXUjth7kXTcL0ncHoE3+
	V8hx98aSzU6zFu7WzKQ+6lMDS7nZK1tzQnVSoWETaY7wjR3r63DMcic9ncprGsJHhBc/
	6br6OYR6J2trTE3YueZBO2WDwuWRnoo53SFKWfVVn1Wjfxi587qKQxVPn9Em8euXIlM+
	ulpt72Zcri9ID2zaFPYnk9Q7oWINZXTeRzJR6nHqQ5/sCAylNi9a98OfqvoLXT3dGnBl
	gPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2G+VZjq0mXT7qBzjf6oy9Otn9HdAM1sMa/CHuW5iUDc=;
	b=FyhcYxHhdIEpqEXhD6EecJY066/Ze+NmDqn9L8Li9SKvoMv/2e0MQFfem8mtej0X2Y
	CbqfpOuMurg8KG5hdxeazCoiWa/7As6nZCSUhkm/oK5pGaEskIe3Y4v63wI6RE2B1Hbp
	s4j/fiC+md9Eocslml2SzghRCNzf5vrFFGV20Fh8+VnXzZx59bQBeia4XkMZ1dKw7mTm
	2UWYiL5ZP7S+tDpMcv/y/OfjKmNdVzjPdkBD8DmwNIJpflflt6TF1Tn2pKpbgBjkQpD0
	lgj9EsRzROkegNsURDq5TRc424EZ6wUdX8gy2uImmxk0fbpomAoddPmkD9QGvsOt/oDA
	klsw==
X-Gm-Message-State: APjAAAUAprVxrdfrYMp5QAsXj82wa7NeHodjrgheHYGRjgXrQynxY0Ks
	GSA7uaMZTftBnIMs2coTay7HC0DH0bECuxp0Lbg=
X-Google-Smtp-Source: APXvYqxrfalYj3cAbCvNbaj5Mbvyx0j/DBwuV9oc7o6/Iy5Scb6VcEh0qLR2BQD5KGHpKST8thWiqG49zxH8hc0GBxU=
X-Received: by 2002:a05:620a:1415:: with SMTP id
	d21mr18769854qkj.17.1582042980075; 
	Tue, 18 Feb 2020 08:23:00 -0800 (PST)
MIME-Version: 1.0
References: <d717ec49-d5f6-6cf0-18c4-107435d6949c@gmail.com>
In-Reply-To: <d717ec49-d5f6-6cf0-18c4-107435d6949c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2020 08:22:33 -0800
Message-ID: <CAMKF1sqRPG5DBLSj4h7XnM6BAmi_38CJ_qsPRuRN8XYupUn3KA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: zeus merge request
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
X-List-Received-Date: Tue, 18 Feb 2020 16:22:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 4:21 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit e855ecc6d35677e79780adc57b2552213c995731:
>
>   ruli: Fix install step and build samples too (2020-01-05 14:44:11 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded zeus-next
>

merged thanks


> for you to fetch changes up to bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
>
>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
>
> ----------------------------------------------------------------
> Gianfranco Costamagna (3):
>       cpprest: fix cmake installation directory
>       websocketpp: add various upstream accepted and proposed patches to
> fix various issues, including:
>       websocketpp: refresh clang patch
>
> Kai Kang (1):
>       adduser: set default shell with /sbin/nologin
>
> Khem Raj (9):
>       nodejs: libatomic patch should be target specific
>       websocketapp: Fix multilib build
>       websocketpp: Fix clang specific flags in cmake files
>       squid: Link with libatomic on riscv
>       grpc: Link with libatomic on clang/x86
>       grpc: Link with libatomic on powerpc
>       grpc: Link with libatomic on riscv
>       netdata: Add libatomic to link step
>       fluentbit: Fix packaging in multilib env
>
> Peter Kjellerstedt (1):
>       gitpkgv.bbclass: Add support for extending the supported tag formats
>
> Sumit Garg (1):
>       mariadb: fix library LZ4 lookup
>
> Trevor Gamblin (2):
>       python-twisted: add required RDEPENDS for twistd
>       pyhamcrest: add python3 version of recipe
>
> Yi Zhao (1):
>       libldb: upgrade 1.5.5 -> 1.5.6
>
> Zhixiong Chi (1):
>       dnsmasq: CVE-2019-14834
>
>  meta-networking/recipes-daemons/squid/squid_4.6.bb |   2 +
>  .../recipes-devtools/grpc/grpc_1.24.1.bb           |  16 +++
>  .../0001-dnsmasq-fix-memory-leak-in-helper-c.patch |  49 ++++++++
>  .../recipes-support/dnsmasq/dnsmasq_2.80.bb        |   1 +
>  .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}    |   4 +-
>  meta-oe/classes/gitpkgv.bbclass                    |  14 ++-
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |   1 +
>  .../mariadb/0001-Fix-library-LZ4-lookup.patch      |  30 +++++
>  meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb  |   2 +-
>  .../fluentbit/fluentbit/cmake_multilib.patch       |  18 +++
>  .../fluentbit/fluentbit_0.12.19.bb                 |   1 +
>  meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb |   2 +-
>  .../0001-Correct-clang-compiler-flags.patch        |  32 +++++
>  .../0001-cmake-Use-GNUInstallDirs.patch            |  35 ++++++
>  .../websocketpp/websocketpp-0.8.1/771.patch        |  22 ++++
>  .../websocketpp/websocketpp-0.8.1/842.patch        |  30 +++++
>  .../websocketpp/websocketpp-0.8.1/855.patch        |  23 ++++
>  .../websocketpp/websocketpp-0.8.1/857.patch        | 132
> +++++++++++++++++++++
>  .../websocketpp/websocketpp_0.8.1.bb               |  17 ++-
>  meta-perl/recipes-perl/adduser/adduser_3.118.bb    |   1 +
>  ...duser-set-default-shell-with-sbin-nologin.patch |  34 ++++++
>  .../recipes-devtools/python/python-twisted.inc     |  18 ++-
>  .../python/python3-pyhamcrest_1.9.0.bb             |  10 ++
>  .../recipes-webadmin/netdata/netdata_git.bb        |   2 +
>  24 files changed, 486 insertions(+), 10 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb =>
> libldb_1.5.6.bb} (95%)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
>  create mode 100644
> meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
>  create mode 100644
> meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
>  create mode 100644
> meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
> ~
>

