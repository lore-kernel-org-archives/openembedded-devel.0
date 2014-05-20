Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (unknown [209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7457265DA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 19:28:29 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl10so5280968igb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=93paK2TqV1m2VxqsuSgeCSiUO5rYp03HO7U3gH0Dpn8=;
	b=QiOqOBAup+baxVhAGeW6beGaPPIUs84j2PecdQPkw3X44CWLS7wzsCl8y7SaqRsT2F
	OowJEFxz0teFjfkBjnqsWAErY+3bifbnReRnxAF/EydGWeEqKQ/eRMpsi3ml5Rz8AwZL
	se8J4iqh7iXDEAJMidSWbJXQoP3ttTZt8avy1UjP4w5NDNvxkY9csozhyiZGXeIYPMVf
	1a8OW6+jUXH2xt4v0SXWC/LnkxJj3zTUKQj0CtUuGZVHc260v8dkexuE51l0OeZvt7qg
	2cSEFD2e26W8z0HyLjPyoYJBKL0v4QMqFlDF5DR6gNpEI2aGvqH60Yrr6YOBX1fWinmo
	cY9w==
X-Received: by 10.43.62.204 with SMTP id xb12mr42307751icb.51.1400614110484;
	Tue, 20 May 2014 12:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Tue, 20 May 2014 12:28:00 -0700 (PDT)
In-Reply-To: <20140520190315.GA32657@windriver.com>
References: <20140520190315.GA32657@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2014 12:28:00 -0700
Message-ID: <CAMKF1soVNe6OpNDX3C74awa1=vzP=wQpvcGYZ9y3=8FJVbzM3Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] nodejs needs python-native
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
X-List-Received-Date: Tue, 20 May 2014 19:28:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 20, 2014 at 12:03 PM, Amy Fong <amy.fong@windriver.com> wrote:
> -DEPENDS = "openssl"
> +DEPENDS = "openssl python-native"
>

may be it should inherit pythonnative

>  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>             file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
> @@ -28,6 +28,7 @@ do_configure () {
>
>  do_compile () {
>      export LD="${CXX}"
> +    export PATH=${STAGING_BINDIR_NATIVE}/python-native:$PATH
>      make BUILDTYPE=Release
>  }
>
> @@ -40,3 +41,5 @@ RDEPENDS_${PN}_class-native = ""
>
>  FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
>  BBCLASSEXTEND = "native"
> +
> +FILES_${PN} += "/usr/lib/*"

make it ${libdir}/* here

