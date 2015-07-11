Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id BB8CB6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 23:29:54 +0000 (UTC)
Received: by igpy18 with SMTP id y18so35498817igp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 16:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cQeESkitdx5Jp39FmnNjYnWJsCo4OBfvg16NJHHActw=;
	b=YOBSDOfQGTGFY9o4Ut9lRbEsJ1EYoEYmjZgXtOaovII9XPw2wK75Uw0TOxVIQhmTDS
	Ll0aA0bznMFRcDsvVuu0GRS1OJ0Gb3SNCilO31ixMN22mkoBZRDmptWLbiBw5l3MkcLo
	rmE+O6e0RX3DrnjBPKEGPWjydHHgxzBsDFuSgGKcW0FlcQmJcP7pZwqCIqJpOoKmE+Q3
	9FFQX1YvCwi+Hydc3hzx1hIiPJmCHvG4Ggy5oEigzyzDQa4jsETiRZtlfHe54mDiKQv0
	27Gm7uzVN/ljNIFXkvccgJ6yaCvNipQRiuXzGDibAUXqHV6idoG8FXXOkgZekqNb3evB
	3qvA==
X-Received: by 10.50.137.6 with SMTP id qe6mr5623261igb.61.1436657394818; Sat,
	11 Jul 2015 16:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sat, 11 Jul 2015 16:29:25 -0700 (PDT)
In-Reply-To: <1436537875-665-3-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1436537875-665-3-git-send-email-maciej.borzecki@open-rnd.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jul 2015 16:29:25 -0700
Message-ID: <CAMKF1sohksCVnoZByExAudVpktExT9-tcZ-OjssZU6ah8wmLqg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Brendan Le Foll <brendan.le.foll@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-python][PATCH 2/3] python-sparts: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jul 2015 23:29:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 10, 2015 at 7:17 AM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Adding recipe for python-sparts, a library for rapid service
> prototyping.
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  .../recipes-devtools/python/python-sparts_0.7.2.bb | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb b/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..d11b0b486aad3d8bd5429f00824df71f969fc7c5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Library for rapid service prototyping with minimal boilerplate"
> +LICENSE = "BSD"

Looking at the license it really is BSD 3-Clause License
would be better if it was reflected above in SPDX format.

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0c1554636a564da3baf037ac652fc831"
> +SRCNAME = "sparts"
> +
> +SRC_URI = "git://github.com/facebook/sparts.git"
> +SRCREV = "128cf9c2f82b00cb2d8648033970870c73641f02"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} = "\
> +               python-subprocess \
> +               python-six \
> +               python-argparse \
> +               python-re \
> +               python-shell \
> +               python-threading \
> +               python-logging \
> +               python-unixadmin \
> +               python-distutils \
> +               python-daemonize \
> +               python-futures \
> +"
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

