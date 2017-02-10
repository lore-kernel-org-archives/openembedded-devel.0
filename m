Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE8D86067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 23:14:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so9350856wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=3hYiR9UO9HshACgDEF5fWHlYFtlquJtO/MQx4v3g5hY=;
	b=Oxkzf7M+wdRM8RIncvBEDGoDD6qiHZNnQa7o1aURlePgnGVN7l5P4wZBV0aXX8xUgb
	L+9HuHcLrLUvxwlQ4YwbRzmQN3Gyc+4UNmGU2XP0R3W/3M1rVXyexXIjIB6yIyEC6iz0
	uTG34xCjeVU7o2S70K0vjQPDfwGpOKIIUUBMeeghILC1jRyEl+i8CwU/JgN41VN+T2rp
	kShlnuVt1drCSd2nZayXIOdn8zKMWk5hvKtAmQFzabxsyQJxJzGhdOcayb6ptzI+ez4e
	1vSptYzk8WkI6zJYMhjBPaiTDNSvCkSFDs6FXQIXzJRIg98aoCQVqDH79c+jRChj/e6R
	6GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=3hYiR9UO9HshACgDEF5fWHlYFtlquJtO/MQx4v3g5hY=;
	b=nNFnuRn4FLsy+zIAVEXXD/fioSuB3iT+kvLW07FWwPtYfM72++pGUnXpSuaG2TVpzF
	/KHd7AhqaMNZutucSNiNQsnPBwXt4n7XVmMmodIxMtcPYNQPfeDjYkizzdlXbPHn9z0N
	txV3tKtjqTG0WbXX0n837jY2grArQXn6LsSQA5UZDbk+UnkJND/9w97pX9cpSDCT8ZMF
	LsueE/kryeDXztVWkGlv+ZI2UWn0G4Ot/SUNUxcZWi/OyIOuIEGXTfQarWT9b93FuVto
	o5vMgHmswwm68uEsp8Q4msWei1+Ow6ZR1MkZXyxb4e0jXcMN11Nxfhr87JYLmgwvA069
	A/YQ==
X-Gm-Message-State: AMke39lYv1arZ118Gl55RSCaADTR6qq6y++mutO+nYLiX5kYLvhR0fJFdOZ1j7vmM6OlL1uX3bO8aAqFJN6a5w==
X-Received: by 10.28.74.69 with SMTP id x66mr9019058wma.124.1486768465156;
	Fri, 10 Feb 2017 15:14:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 10 Feb 2017 15:14:24 -0800 (PST)
In-Reply-To: <1486399036-28846-2-git-send-email-akuster808@gmail.com>
References: <1486399036-28846-1-git-send-email-akuster808@gmail.com>
	<1486399036-28846-2-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Feb 2017 00:14:24 +0100
Message-ID: <CA+chaQc2TgGJvYYzW3UZG3tOfpw3nKokdX6WYBkQ11fFeMtuBg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 2/2] python3-pycrypto: add python3 version of pycrypto
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
X-List-Received-Date: Fri, 10 Feb 2017 23:14:26 -0000
Content-Type: text/plain; charset=UTF-8

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
from the .inc file doesn't help to find cross-compiling.patch (because it
still poinst to python3-pycrypto not python-pycrypto

Parsing recipes...WARNING: meta-oe/meta-python/recipes-devtools/python/
python3-pycrypto_2.6.1.bb: Unable to get checksum for
nativesdk-python3-pycrypto SRC_URI entry cross-compiling.patch: file could
not be found
WARNING: meta-oe/meta-python/recipes-devtools/python/
python3-pycrypto_2.6.1.bb: Unable to get checksum for
python3-pycrypto-native SRC_URI entry cross-compiling.patch: file could not
be found
WARNING: meta-oe/meta-python/recipes-devtools/python/
python3-pycrypto_2.6.1.bb: Unable to get checksum for python3-pycrypto
SRC_URI entry cross-compiling.patch: file could not be found


On Mon, Feb 6, 2017 at 5:37 PM, Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 11
> +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pycrypto_2.6.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> new file mode 100644
> index 0000000..00ea5d0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> @@ -0,0 +1,11 @@
> +inherit distutils3
> +require python-pycrypto.inc
> +
> +SRC_URI += "file://cross-compiling.patch"
> +
> +# We explicitly call distutils_do_install, since we want it to run, but
> +# *don't* want the autotools install to run, since this package doesn't
> +# provide a "make install" target.
> +do_install() {
> +       distutils3_do_install
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

