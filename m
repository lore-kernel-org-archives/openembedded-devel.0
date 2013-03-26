Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKNI8-0002Ju-ME
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 07:23:38 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so4562522pbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 23:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=BMjPRqx0ro/61aP9dkmOGSCOWGhCNoUt7zYyLpz4qaQ=;
	b=p35Uu/p2r8yIInLam1cwtfdjlTlDcZREp8W71Fx1MChxfDha0U9m+nrjUnoxJTkmXx
	RDBCs2UAd/h5++Ud6aXSPQw4y6egDrE9U+WsDood1KIjxcoW1x19GaLKDKQT5hlAoWy+
	YywRrSWqdq3YHPspTqYuSY6PY8qzHTeqLc2+zxXlh+/xArvnuoK0omkqRiInJMmbd0CD
	gL2gEgNacYf6JwnwYZqbHfvY7pKpbY8xZcPnXGKcHjJGBR4N1bGNQ4t1PZt/kspcWqwd
	aN1wZbOqQXSXeSEiJ88Zx+OfQTO5wpAb47MXffSrkg/+3wERLYEw0DtOjk3CWLWaGRRm
	Bj2Q==
X-Received: by 10.68.190.99 with SMTP id gp3mr21871646pbc.117.1364277988858;
	Mon, 25 Mar 2013 23:06:28 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id yr10sm17834346pab.6.2013.03.25.23.06.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 23:06:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364219168-27880-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 25 Mar 2013 23:06:26 -0700
Message-Id: <F7146556-015E-4D6A-9F58-38284AFCF988@gmail.com>
References: <1364219168-27880-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-oe][PATCH] libmcrypt: add 2.5.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 06:23:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 25, 2013, at 6:46 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> +do_configure() {
> +	gnu-configize --force
> +#	libtoolize --force --copy
> +	autoconf
> +	oe_runconf
> +}


can we avoid above ?=


