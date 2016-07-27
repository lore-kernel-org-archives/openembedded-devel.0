Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7C848606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:50:43 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id f93so23422204lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2u3i62V7Uq7BMW9NnJpAh9qliYOxUaQzTslzGQUnLhM=;
	b=hmbRPEaC2YDAWpWMcUSdTOfiKjta0f7iBr0JZODiKT9AzaEU7BmeylkZBngxVRe23h
	sAw4TDi5rFlgPpn9ZO6s6suSO+sGw3JoBCXdIFG5BcYt2gWz6HGcH1vxZZoObltx/IaN
	nV/uwOnVA3SbOnGsIa7DtzCmbWo0rTgWUeLk72dHF7QYGp9y9TJRj2buJjTalsq0du+G
	auVzx2hwjdOjwIzwKXYPSjAhzSv7EcyBf+KoN0OlOSXNN6pvN4Q9xWXai7mboZyhl+IH
	dwfsI/Aw4E4SXgCLjPRIaYteNK8BUeY7O01X3UcEim6vg0Q8wepedtzUWpoeFkAVWjjQ
	4lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2u3i62V7Uq7BMW9NnJpAh9qliYOxUaQzTslzGQUnLhM=;
	b=N20Cwr3CvyQ+hx2wdGIlutz1WEVXNDdUi+6xMK14jUbvl1BMwVXXz7eox2eve94H6g
	EnOmUh0Gehtikrvk/iJ2eui4rZXiswYZYxaZ6LCyNU+Bs9oYWSdYoijZGmpljA3JzV5d
	e3LDbbICbI0Kd9S3Gnv3NoCR/dAORFQ7BQ9DvsQuTLAiIdauMJwTrinh3Q1Irc239dzA
	XopQ5Ve6O4OHbXwvtGFTFcTAmqmD1QydsurSfJE+/7HBuiaPOT2LjMNS1cmVsugj6kAl
	QPfpFBUIZmwzceEUUfUVzAcqWevwWd5kiJgTu2BTzZnHb7kb0PfYPBYC+BRugE35YlNT
	G89w==
X-Gm-Message-State: AEkoousgQDyUBk8xS/O0dIV7lvhey2+zwWF9A/PhEGWbDZ+fBBpeM2qcdsFYvXg/ecZJYHba8dvyUZjkYC9vaA==
X-Received: by 10.25.19.32 with SMTP id j32mr11747543lfi.204.1469613043003;
	Wed, 27 Jul 2016 02:50:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 27 Jul 2016 02:50:42 -0700 (PDT)
In-Reply-To: <20160726092312.16134-1-kai.kang@windriver.com>
References: <20160726092312.16134-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Jul 2016 11:50:42 +0200
Message-ID: <CA+chaQdZE=VDh7w61d0OHi15id+oRwhj1LudsRj1B_Z0MGC7nA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mariadb: upgrade to 5.5.50
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
X-List-Received-Date: Wed, 27 Jul 2016 09:50:46 -0000
Content-Type: text/plain; charset=UTF-8

Can you please double check the checksums? Doesn't work for me:

ERROR: mariadb-native-5.5.50-r0 do_fetch: Fetcher failure for URL:
'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz'.
Checksum mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
has md5 checksum 13cc3e0dfbc64698fd7838990ecae828 when
5cfb169934170a429589e05f0f5aba9c was expected
File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
has sha256 checksum
01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a when
030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76 was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[md5sum] = "13cc3e0dfbc64698fd7838990ecae828"
SRC_URI[sha256sum] =
"01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

ERROR: mariadb-native-5.5.50-r0 do_fetch: Function failed: Fetcher
failure for URL:
'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.50-r0/temp/log.do_fetch.31301
NOTE: recipe mariadb-native-5.5.50-r0: task do_fetch: Failed
ERROR: Task /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb:do_fetch
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb:do_fetch)
failed with exit code '1'


On Tue, Jul 26, 2016 at 11:23 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade mariadb from 5.5.46 to 5.5.50.
>
> * update runtime dependency of mariadb-setupdb which requires command
> install
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../mysql/{mariadb-native_5.5.46.bb => mariadb-native_5.5.50.bb}     | 0
>  meta-oe/recipes-support/mysql/mariadb.inc                            | 5
> +++--
>  .../recipes-support/mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb}   | 0
>  3 files changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.46.bb =>
> mariadb-native_5.5.50.bb} (100%)
>  rename meta-oe/recipes-support/mysql/{mariadb_5.5.46.bb =>
> mariadb_5.5.50.bb} (100%)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> b/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
> similarity index 100%
> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
> b/meta-oe/recipes-support/mysql/mariadb.inc
> index 4801ffe..9c3d234 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -17,8 +17,8 @@ SRC_URI = "
> http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
>             file://fix-a-building-failure.patch \
>            "
>
> -SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
> -SRC_URI[sha256sum] =
> "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
> +SRC_URI[md5sum] = "5cfb169934170a429589e05f0f5aba9c"
> +SRC_URI[sha256sum] =
> "030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76"
>
>  S = "${WORKDIR}/mariadb-${PV}"
>
> @@ -176,6 +176,7 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd
> perl-module-benchmark perl-modu
>      perl-module-file-spec perl-module-file-find perl-module-file-basename
> perl-module-file-path \
>      perl-module-constant perl-module-lib perl-module-file-temp
> perl-module-file-spec-functions \
>      perl-module-io-socket-inet perl-module-io-select"
> +RDEPENDS_${PN}-setupdb = "coreutils"
>
>  # Allow old code to link to the backward compatible library
>  RDEPENDS_libmysqlclient-dev = "libmysqlclient-r-dev"
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
> b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
> similarity index 100%
> rename from meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
> rename to meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
> --
> 2.9.2.368.g08bb350
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

