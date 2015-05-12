Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2F21660138
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:27:28 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so93420586igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 22:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=trRmf3pSJghP90D9aMxyVzZb5j4rO7ZcQ0RW98o45Y8=;
	b=l+Fx/YV4V61RHvq+Vv5Uweu+BaoTbKBalWbnSXQXPeBJJk7S8JIStd+M11Aj9s18Mm
	7J+ZI/O6HsVtzRxjKiDGZ8f3pbCirEX2TAx8YIwSschtYeRgDd6o2Xmh06OiLdaUiW0n
	0OtFifxdD5k9an98FT7pPmDeyA+dTBLjbAToO67ldIODiJsisYHkgdrKPwSe6NmKLISf
	TxeYYY/F16FyfDvlCCQZQqyNo+EL3lOotWT0XXegiVGsmOgIwT2PU4ks75kLf/dZh5E2
	FQ991+DpAHhAtjXhtuAhHvfGRZdbJ82umtW7lCS/5nWx97I32i4Ye6gfQ7rw3+YSCi0k
	Clcw==
X-Received: by 10.107.18.170 with SMTP id 42mr17969125ios.38.1431408450067;
	Mon, 11 May 2015 22:27:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 22:26:59 -0700 (PDT)
In-Reply-To: <1431402605-31587-1-git-send-email-armccurdy@gmail.com>
References: <1431402605-31587-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 22:26:59 -0700
Message-ID: <CAMKF1sr0kBtGH4ZGVxLpYL=Fw5ovbjL1KLDKm=Bfc1jpHd4gKg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Qt 5.4.1 loading libGLESv2.so directly and ignoring soname
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
X-List-Received-Date: Tue, 12 May 2015 05:27:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 8:50 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> +
> +# ------------------------------------------------------------------------------
> +# Move the /usr/lib/libGLESv2.so symlink into the runtime package as workaround
> +# for issues seem with Qt 5.4.1, which seems to try to dlopen libGLESv2.so using
> +# a hardcoded filename (instead of relying on the dynamic linker and therefore
> +# loading libGLESv2.so via it's soname).
> +# ------------------------------------------------------------------------------
> +FILES_libgles2-mesa = "${libdir}/libGLESv2.so.* ${libdir}/libGLESv2.so"
> +FILES_SOLIBSDEV_libgles2-mesa = ""
> +INSANE_SKIP_libgles2-mesa += "dev-so"
> +

Yes they now load it as plugin for ES3 compiled libraries to be able
to run on ES2 only systems

you could just empty out

SOLIBSDEV = ""

and set

SOLIBS = ".so*"

I see that dev-so QA check hardcodes .so check it would be nicer if it
checked for SOLIBDEV extentions instead
may be you should file a bug for that or even better send a fix

