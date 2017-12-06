Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id C2759783C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:13:57 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 1so60648pla.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 18:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=HBjBjv9cfKAlZ1fAgJSalJckrkjjaZAsXlKhxoRvmWw=;
	b=O4mvPDlsNyyjz39dDlyOmDKFS0PWuEzzuB+u0S2pqNOuQ2wvXWnfELKQ38qjb7A/r2
	Q5bUO6aRhT2J0wogVYAZYZNW5vLrag9fFxyfZ4/+d9hKje8E4KHDjAUQVq8io9rcmdDn
	1ryLLrdWCqBrwlmKVniszR9BtK0M8p2PTVfd0BOWRNoWHc3FaL2JTF9cvNDAaRopAQHo
	xEKfJw8zFrZhia2ThvLlKEVdheIGdLNrpmwSY4REIxI+uTWDgpG1GyBr2cYu3bQ8AZk/
	Y1uBx9YFTPzT9WV61f7IRtkS9NqO2zj6hdO+NbIXRR/La8AvqQcdzE/7vvluK0KLdrpc
	VI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HBjBjv9cfKAlZ1fAgJSalJckrkjjaZAsXlKhxoRvmWw=;
	b=ez3UoxbT+RRJnnvaLNgc7kIF9AY0pGg4gAD2aXu4s9kE0oFAUjjym8Le8ryNDFj0oF
	8C8Qii3bM0UeUg2FDlkdnE5Qf0wJD5HU+dQ2TwA2oWe5m1tcPr/oLTf4MjRkSaDaaI0j
	eLa1DaHPfQy1L3N/CltKZAdRp1ALen/UkpljBME96UDnJcTjqMFg27xY0YO7WXZSH7Tp
	FbUrAA8Go2vUSrkHnavew8tlTrId8TO1YWdsedZ6KyPY87OYPsFG1Hx+bnjBDEbFZ59T
	AoxVSmm0tZCkypadlRQ2fWEnmsCTuLdqQ7QI/3Zsy9rfu91i9TRNF8YkoPmkY0tnvBqh
	gBCA==
X-Gm-Message-State: AJaThX7LOo9OZuD8QtQItmV4PcRfHN4VlUB30DtaFaLMQeAYrTpEv+vM
	zpH9we9XBQJJrfwInST6obI=
X-Google-Smtp-Source: AGs4zMbh+O+Jqr992ChaMncr1igIRdWCnsRbUwzOxfw2Da70YlRWVRCDJ4YOKWkZs1+GAEYF2D8rtA==
X-Received: by 10.159.203.202 with SMTP id r10mr20378225plo.431.1512526438773; 
	Tue, 05 Dec 2017 18:13:58 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:94bc:1c6f:280d:e35e?
	([2601:202:4001:9ea0:94bc:1c6f:280d:e35e])
	by smtp.gmail.com with ESMTPSA id l5sm1595598pgo.24.2017.12.05.18.13.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 18:13:58 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
	<1512191576-2302-4-git-send-email-bill.randle@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <dca337bb-7a95-8161-f238-e4afa7113c10@gmail.com>
Date: Tue, 5 Dec 2017 18:13:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512191576-2302-4-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: Re: [meta-python][PATCH 03/13] python[3]-fask-migrate: new recipes
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
X-List-Received-Date: Wed, 06 Dec 2017 02:13:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/01/2017 09:12 PM, Bill Randle wrote:
> Signed-off-by: Bill Randle <bill.randle@gmail.com>
> ---
>  .../recipes-devtools/python/python-flask-migrate.inc       | 14 ++++++++++++++
>  .../recipes-devtools/python/python-flask-migrate_2.1.1.bb  |  2 ++
>  .../recipes-devtools/python/python3-flask-migrate_2.1.1.bb |  2 ++
>  3 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
> new file mode 100644
> index 0000000..7af4fe1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
> +
> +SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
> +SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
> +
> +PYPI_PACKAGE = "Flask-Migrate"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-flask-sqlalchemy \
> +    ${PYTHON_PN}-alembic \
> +    ${PYTHON_PN}-flask \
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
> new file mode 100644
> index 0000000..af79997
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools
> +require python-flask-migrate
> diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
> new file mode 100644
> index 0000000..94abbf3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
Found issue
> +require python-flask-migrate  <<<-- missing .inc

- armin


