Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E34060017
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 15:10:32 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u34-v6so43547666qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h+EueaaqHdmpZF8BT0AW3NVQfqCAUdygyRcUsmZvfug=;
	b=IAZ2rK5idzFGUaqyEKBHIIy+If8WUxfwoS89yjv2zmKTKh2hz/DTQxD+ZzuHu11I6j
	Vd52kKgieT0gHXW+t7fbIa/aL8MvDKY+ZapryMBSrgFTZyokoQ5ShM0sZKgJhzKI+Q1w
	Kvo65rfncSA5ghGF7d6+JxqC7OxSkUFZPPzVoQz8coHu/3u5NaSJe4N6x/OxhMscfaiu
	usbm3LBcuNOyltrPKK+7n4ZzVY6Y7F4HC8zLtc4+8Dm3ce/xAeR5uB6hown9I7P2rOxa
	xxTJhe+iKbbWNjMODOn1iTNV/tP3qdoxyIxSKLpL2fbrVI/u1nn+KV61ibcDx/1krvZ9
	gwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h+EueaaqHdmpZF8BT0AW3NVQfqCAUdygyRcUsmZvfug=;
	b=RyaUEOGH6VD8gjB2WwjqwAoMdVUwvp/oH9eYgdxyxqgWkKX/Z7LE5wKs6K/BRb7u5Z
	8YNHhlAE/wcfXOWyAXWQ3lDGu7+5O+yVoNlKe04PGNSXhr77xOlUHRZ444OirDfEclj9
	09UFdMTZpOo3ush1XWZBg1/JQYo4YCArzzlJPgibIkTaIZDe9VKOStc8MIa7VnH8ppD+
	/WZhGEANOvXpgYdA9Wsl1yzZe18ZCaaqu3wTVCGcwvWZu262H/w3aXkobBiuEAIkFWFE
	XaZK900ekva77a7cZUfy3dyG2uxxszWfY/9caQviiaP5MdPTH5bbf1MLxWtYKZMmGLjF
	3Vew==
X-Gm-Message-State: ABuFfoieJoFSpl9CZbAGl3ZPUgVzvPmGP3QTvnUxmjGznuGvbDcZt3/s
	+3J9f97olpNFjTmrpbLCslNLIadOd1rF5UFTLVA=
X-Google-Smtp-Source: ACcGV628XsuvFAqh8C2nvaRMWf5zP4CgoAtIBJ+PPcSDmNkQan4/BLHRzH07tqfi41kAfF4Bnf6oduMAaB/t5mMBnik=
X-Received: by 2002:ac8:36bd:: with SMTP id
	a58-v6mr39614592qtc.236.1540134633680; 
	Sun, 21 Oct 2018 08:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20181019145416.8021-1-anders.roxell@linaro.org>
	<407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
In-Reply-To: <407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Oct 2018 16:10:07 +0100
Message-ID: <CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] add a storage I/O benchmark test suite
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
X-List-Received-Date: Sun, 21 Oct 2018 15:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 21, 2018 at 12:29 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 10/19/18 10:54 AM, Anders Roxell wrote:
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >   .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 +++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> >   create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >
> > diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > new file mode 100644
> > index 000000000000..77d172814065
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "Small collection of benchmarks for storage I/O"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> > +
> > +SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> > +PV = "0.0+git${SRCPV}"
> > +SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +# installing in /opt/S-suite since the package has
> > +# dependencies to the directory structure.
> > +do_install() {
> > +    install -d ${D}/opt/S-suite
> > +    for i in $(find ${S}/* -type d); do
> > +        install -d ${D}/opt/S-suite/$(basename $i)
> > +        install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
> > +    done
> > +
> > +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
> > +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> > +}
> > +
> > +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> > +
> > +FILES_${PN} = "/opt/S-suite/"
> > +
> > +# added to INSANE_SKIP since s-suite have an runtime
> > +# dependency (RDEPENDS) on libaio-dev.
> > +INSANE_SKIP_${PN} += "dev-deps"
> >
>
> Thanks for the submission but from:
>
>     https://github.com/Algodev-github/S
>
>     "These benchmarks have been written just for internal use,
>      and are more a yard than a well-finished work."
>
>
> That doesn't lead to a lot of confidence that these suite will
> be maintained for years. What's the value to meta-oe users to add
> this recipe compared to something that has been around for years
> if not decades such as Bonnie++:
>     https://layers.openembedded.org/layerindex/recipe/864/
>

how I read this is that they have not made proper installation
targets and its dependencies or letting user know of the dependencies
which actually is not a problem with OE since both
of these would be taken care of in the recipe with
do_install and DEPENDS


>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

