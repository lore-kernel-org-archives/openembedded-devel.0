Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 15D917FBC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 21:32:13 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q8so7874429pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 13:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=j39la+gdJ5W32A/A0S265xyYl4KpQqe0z8MInyb3suE=;
	b=XjNdsfy6SLBGfs0dBd2tCYMQxn/rN6YRfTv5uid9UT+QIP1FMcHySC9KBJecnvChKX
	lpF2ucdoo85wfnJs3xiCQny9Zb75cvJQN+PujaOZ6bLf1ohSYkyiXEMctI8nhDQqRxmm
	bNmj2UCUiE/d9BBLYbbw3i6hL+nxGLkzxrq0vW9a9MXDGAh4hGN1leZMJLyWkDduk8EY
	w0WjeLXrzBgAYEPje2+omigkKLMXzo+X7Fn+89dlr9siu9L/xsczAu+iiHMlcFKtijhJ
	i7MD1f7C9ZXT9w5isV1S3BBaVBMQDtbm3/bwFRcd4j5GUqa76gtAZDdgCudDyywloVtl
	O/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=j39la+gdJ5W32A/A0S265xyYl4KpQqe0z8MInyb3suE=;
	b=S6cWJuzmpU17hwQaDlsOmni5V6H2Rn97KgiZIJYKg31+08QtxIEmnlowoB5kYih4OW
	tUlYPayANH+K/b/T4f4NhgS1Q8ZHpbWUQCIHu9K1daHYvXUzYksA7vhNf/UTN8pyoqX2
	Nbe3p/8tyq2ZZh8tEbFloRJF3RrvoZMRh/B9YvhlWWOgCHmEeB1TpdjZvXHwJ7eQM07t
	OTVbB1ZxecJRcKIw0BVeOWeT+2IYNQ2f73+buzmt1Yab2P4tPN2WHlHl/RdVUvBByn3T
	pwJ3hNJUFZDC0vcPagaZui17/cXMHUguzqnxtq2ygF8i3864xlPF9vd5IOqJs9325bic
	AfFg==
X-Gm-Message-State: APjAAAXTyPrZLSlc1YPsAzANkScZpfHBAnaYAxR80RoVBMDlprN0ROMp
	myi6dSTkWoyG6FPZ/Be9STo=
X-Google-Smtp-Source: APXvYqw9urWhXTrXeulmyLPqUK5iVFYeVA4jlqZPY/S7Ii35zaekTGVLrcTRELdNZTayMA4zq9cb3w==
X-Received: by 2002:a05:6a00:3:: with SMTP id h3mr30505977pfk.78.1575927134771;
	Mon, 09 Dec 2019 13:32:14 -0800 (PST)
Received: from apollo ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id v4sm280713pjb.24.2019.12.09.13.32.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 13:32:14 -0800 (PST)
Message-ID: <5c9072493324957f4b7a995f04e9bca549614db3.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: akuster808 <akuster808@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 09 Dec 2019 13:32:12 -0800
In-Reply-To: <7dec2178-6a36-d62a-4add-7308c4cd146c@gmail.com>
References: <7dec2178-6a36-d62a-4add-7308c4cd146c@gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: zeus pull request
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
X-List-Received-Date: Mon, 09 Dec 2019 21:32:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-08 at 08:28 -0800, akuster808 wrote:
> The following changes since commit
> aad5b3d070cd8c58828b0975cf861d8ebc90f460:
> 
>   README: updated Maintainers list for Zeus (2019-10-30 14:16:04
> -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/meta-openembedded zeus-next
> 
> for you to fetch changes up to
> 0d16b31c3d96e0797d3335d44545412996c48c9a:
> 
>   mbedtls: upgrade 2.16.2 -> 2.16.3 (2019-12-08 08:12:43 -0800)
> 
> ----------------------------------------------------------------
> Andreas Oberritter (1):
>       samba: fix installation for minimal build
> 
> Denys Dmytriyenko (1):
>       mbedtls: upgrade 2.16.2 -> 2.16.3
> 
> Hongxu Jia (1):
>       python-more-itertools.inc: fix python2 package not incorrectly
> generated
> 
> Khem Raj (1):
>       rsyslog: Dont force enable atomic builtins on mips
> 
> Michael Scott (1):
>       modemmanager: Upgrade 1.10.6 -> 1.10.8
> 
> Slater, Joseph (1):
>       php: fix CVE-2019-11043
> 
> Stefan Wiehler (1):
>       nvme-cli: defer host ID generation to post installation
> 
> Trevor Gamblin (3):
>       rsyslog: fix CVE-2019-17041
>       rsyslog: upgrade from v8.1908.0 to v8.1910.0
>       quagga: fix PIDFile path for service files
> 
> Yi Zhao (2):
>       samba: upgrade 4.10.8 -> 4.10.10
>       freeradius: fix CVE-2019-10143
> 
> Zheng Ruoqin (2):
>       mariadb: upgrade 10.3.16 -> 10.3.18
>       wireshark: upgrade 3.0.3 -> 3.0.6
> 
> niko.mauno@vaisala.com (2):
>       gitpkgv.bbclass: Use --git-dir option
>       gitpkgv.bbclass: Support also lightweight tags
> 

merged thanks

>  ...-to-radiusd-user-group-when-rotating-logs.patch | 104
> +++++++++++++++++++++
>  .../freeradius/freeradius_3.0.19.bb                |   1 +
>  .../{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb}       |   4 +-
>  .../samba/{samba_4.10.8.bb => samba_4.10.10.bb}    |  20 ++--
>  .../recipes-protocols/quagga/files/bgpd.service    |   4 +-
>  .../recipes-protocols/quagga/files/ospf6d.service  |   4 +-
>  .../recipes-protocols/quagga/files/ospfd.service   |   4 +-
>  .../recipes-protocols/quagga/files/ripd.service    |   4 +-
>  .../recipes-protocols/quagga/files/ripngd.service  |   4 +-
>  .../recipes-protocols/quagga/files/zebra.service   |   4 +-
>  .../{wireshark_3.0.3.bb => wireshark_3.0.6.bb}     |   4 +-
>  meta-oe/classes/gitpkgv.bbclass                    |  15 ++-
>  meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb       |   5 +-
>  ...demmanager_1.10.6.bb => modemmanager_1.10.8.bb} |   4 +-
>  ...native_10.3.16.bb => mariadb-native_10.3.18.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
>  .../{mariadb_10.3.16.bb => mariadb_10.3.18.bb}     |   0
>  .../recipes-devtools/php/php/CVE-2019-11043.patch  |  38 ++++++++
>  meta-oe/recipes-devtools/php/php_7.3.9.bb          |   1 +
>  .../rsyslog/rsyslog/0001-Out-of-bounds-issue.patch |  31 ------
>  .../{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}   |   6 +-
>  .../python/python-more-itertools.inc               |   2 -
>  22 files changed, 188 insertions(+), 75 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/0001-su-to-
> radiusd-user-group-when-rotating-logs.patch
>  rename meta-networking/recipes-
> connectivity/mbedtls/{mbedtls_2.16.2.bb
> => mbedtls_2.16.3.bb} (92%)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb
> =>
> samba_4.10.10.bb} (95%)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb 
> =>
> wireshark_3.0.6.bb} (95%)
>  rename
> meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb =>
> modemmanager_1.10.8.bb} (92%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb =>
> mariadb-native_10.3.18.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb =>
> mariadb_10.3.18.bb} (100%)
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-
> 11043.patch
>  delete mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-
> issue.patch
>  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb =>
> rsyslog_8.1910.0.bb} (97%)
> 


