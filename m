Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 52B0072F6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:23:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m70so1323669wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=soIm8kD1pVMG670hOsQRjSiLmRPI6HXs/w22LqY0kxA=;
	b=UotAAoI5ftJsbUcdpiL5NHsY9KFKUo29gFN95QCN9OmOI6AApkIdM8To068Kp49/Si
	REcLvwMqmiXXJ0tL/qSMg/7qe3L9xPry+h9/aWK2UQiBu8no2+mvf+arKd8mPcf0QbMi
	9ha1k6y5KbQzUV1v5mCINizHbz+FEuGQbGYEXJojW4TDP5sh4tAfs3gZleMkgMryK6gj
	k377w7m8SCwYFFg54BT7qX+UuO8vHf4P7apt6E92XB98mrzZqWwXgeIR65LT5jlzOe/A
	j/fUQRITxIL9McsQOB5fwfFYiLpJeG07bx4ufKFIyUI2huIFjQNv0kjGkg2gQS34Awzl
	gPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=soIm8kD1pVMG670hOsQRjSiLmRPI6HXs/w22LqY0kxA=;
	b=M5zboC7dxijyTeehhm9Gm4NtuRPzBkhRtDKbzWNi2Gd7J2LVjMJtg/E8CImuzhoLPz
	s6vd8vCXLLJGeOqZSGu4oBAFNk7M7HfMq+pGJLGFaFYBHF6ay6WqqjLVQVZCXdmTk7ED
	O4j/imUQJ6F+yDjxYeJx5m5XdcwMwOtj2d7kvMRhR9nZpRCO5/hxXaSJq6MTXrir5FQW
	frniIKjY88z1IH1opGGmJ1UYsxuPcBle+/cMUONVHyijSJmUCDHttkX58yGxJ2WY0X/+
	lXqlYW/kD6UW247O1lWh9hNaHcjtcs+MbMxLylR9BVa1KUh3T229yZ43PNApwM4rXcOS
	XRSw==
X-Gm-Message-State: AMke39mWYar+NAIevDU7udFdE6+FLAAjAz+BvDzcmsouW/yEFZZWh7SBfb8gZ1gEoZ1CMHg6qyn1I4x8DLKejQ==
X-Received: by 10.28.74.69 with SMTP id x66mr1420142wma.124.1488273835053;
	Tue, 28 Feb 2017 01:23:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 01:23:54 -0800 (PST)
In-Reply-To: <1487973264-29272-1-git-send-email-derek@asterius.io>
References: <1487973264-29272-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 10:23:54 +0100
Message-ID: <CA+chaQdjpaUPga2h0rN8BFdjsubgrc8M+LxQhJ0K0cQ6FXJaog@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] syslog-ng: update inherit to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 09:23:54 -0000
Content-Type: text/plain; charset=UTF-8

Now it complains about libtool version :/

http://errors.yoctoproject.org/Errors/Details/134288/

On Fri, Feb 24, 2017 at 10:54 PM, Derek Straka <derek@asterius.io> wrote:

> Resolves build issue exposed by RSS
> http://errors.yoctoproject.org/Errors/Details/130631/
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 2 +-
>  meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 21d1748..0dbcc6e 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/
> downloads/files/syslog-ng/sources/${PV}/source
>             file://configure.ac-add-option-enable-thread-tls-to-manage-.patch
> \
>  "
>
> -inherit autotools systemd pkgconfig update-rc.d
> +inherit autotools gettext systemd pkgconfig update-rc.d
>
>  EXTRA_OECONF = " \
>      --enable-dynamic-linking \
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> index bee1e19..73609af 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> @@ -13,5 +13,3 @@ SRC_URI += " \
>
>  SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
>  SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8
> e2049edd633a41b223776a853d9106f4e7"
> -
> -PNBLACKLIST[syslog-ng] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130631/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

