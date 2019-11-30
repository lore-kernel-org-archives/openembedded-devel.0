Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id EFEE27F821
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:22:44 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id d124so13381803qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eUHlUjKSD8YQ/Vp7w/vQhsOOskHHatoO0itFHe/taU4=;
	b=ALkq3ObUFKAL5LpdAkQOn3m/g5klxy70QErZ6+W3cVlrvwXIqTgs142E5+EsJnOHxf
	xjfcvAiK1hDvXaHnaBtPwf1IOfcEwKtpxaiXezYh7qCUQqYKESDMoTRwVqocEk1HFaM9
	QP126me3s35q4cO6En8HnCxC19VD0M5Yerjdldn0gIeteyQQ46H4U8I21jdWrT8Hdlyb
	9ft9Xh0fBIXPvo1HGvutn7Es5zyalaV1WnKS3g2yUohaUh8zDQGZ9JyA8iyQ2+9x6u3/
	8+K2I8podtrHqCWyh49ozC8c7pGgrH0OwckImOw8RMtodbuA8YdbhHPKbfSiSf62Q2bz
	HTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eUHlUjKSD8YQ/Vp7w/vQhsOOskHHatoO0itFHe/taU4=;
	b=F7vqRZlxpNZtDgYp0zVKzW+h6DvNk2ghAI5DnDbBQJTOr5+YwpESDai8NhTmf/uosd
	lVC7+rNHdZmudTorgroIohU+MMwWecavhArKV6+us9BIW4rE8AUG1jae3VMeglBcUdj0
	XiYOYQNatEavIEHMbUunxuy7K7enrUSBlXkGdyffPRKA3rwgd6RdJHro1dlSODQvnlgF
	lf7IH+v6iJILYycd9ql/6ae5g2+jMz0orFspuUuVSQEi+G1MibzIMhDt331uHSoWg6b6
	8IPIPWkcuVMFEiujTIOtCQcMk47Q6VLgd6pg8KN1shzvApUbO8nFyFbDdtAr8RdY8Cdc
	zj9g==
X-Gm-Message-State: APjAAAUBZo7M6PRkArcW0gbY311ruI699uDJd1486mEDFAWL2kSE9w3+
	85MU6jTzleKqEcpvDuhkDOmjAj2jq6f8ORLkgtk=
X-Google-Smtp-Source: APXvYqyQmtANlOoTJxNVCdUpxSz8DfXZ7EpYghBnkfjAd3jA9M6oPuq7YIRW0VlF7Sw3eKOGohtuNwtO5sQ7XhIkQDk=
X-Received: by 2002:a37:a348:: with SMTP id m69mr21551797qke.474.1575138165323;
	Sat, 30 Nov 2019 10:22:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575137343.git.akuster808@gmail.com>
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Nov 2019 10:22:18 -0800
Message-ID: <CAMKF1spELhX7gHHXJd88bS9n9ezCrsh+b7ZM+pn+5zcjXBDkvQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Zeus patch review
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
X-List-Received-Date: Sat, 30 Nov 2019 18:22:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 30, 2019 at 10:11 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Please have comments back by Tuesday
>
> The following changes since commit aad5b3d070cd8c58828b0975cf861d8ebc90f460:
>
>   README: updated Maintainers list for Zeus (2019-10-30 14:16:04 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>
> Andreas Oberritter (1):
>   samba: fix installation for minimal build
>
> Hongxu Jia (1):
>   python-more-itertools.inc: fix python2 package not incorrectly
>     generated
>
> Khem Raj (1):
>   rsyslog: Dont force enable atomic builtins on mips
>
> Michael Scott (1):
>   modemmanager: Upgrade 1.10.6 -> 1.10.8
>
> Slater, Joseph (1):
>   php: fix CVE-2019-11043
>
> Stefan Wiehler (1):
>   nvme-cli: defer host ID generation to post installation
>
> Trevor Gamblin (3):
>   rsyslog: fix CVE-2019-17041
>   rsyslog: upgrade from v8.1908.0 to v8.1910.0
>   quagga: fix PIDFile path for service files
>
> Yi Zhao (2):
>   samba: upgrade 4.10.8 -> 4.10.10
>   freeradius: fix CVE-2019-10143
>
> Zheng Ruoqin (2):
>   mariadb: upgrade 10.3.16 -> 10.3.18
>   wireshark: upgrade 3.0.3 -> 3.0.6
>
> niko.mauno@vaisala.com (2):
>   gitpkgv.bbclass: Use --git-dir option
>   gitpkgv.bbclass: Support also lightweight tags
>

this list looks good to me.

>  ...-to-radiusd-user-group-when-rotating-logs.patch | 104 +++++++++++++++++++++
>  .../freeradius/freeradius_3.0.19.bb                |   1 +
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
>  21 files changed, 186 insertions(+), 73 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb} (95%)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb} (95%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
>  delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
>  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (97%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

