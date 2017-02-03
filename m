Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2FD71DDA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 12:42:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so4137417wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 04:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Hz6WjRyHGciZtHr8clMs6M3ev0zX2EuFnLLQMIjGE0M=;
	b=Ac0ZEI1r31XSycMyRtz5+vn5KUCatpSxYd3C6D9Bob++9ZWCEmxliM6qK6irOmkoI8
	qO2REirKF0qvRUCN0Qe3sb/rsNJBf27kZv3W0cNKJ2P/qnzGbW7okQZBvsLBaYT7NFvA
	B4LUsMjDSjukUDZTKEZ1+IjhyUBs1nXk+EZibLkOrXKx9At8fGzTKHoe+ywo8qr/d3dq
	iqyET48tjJQCtVOF4w7JJHyELGigBqE8R+QxqnGEp2otMP8kVEopE11OqVCQv9mtog85
	+vneqmehgYlf2Kwz2ex4kf8xxOg9JcILAwIVDflWuv0FlzTZjvDkxpejeqsqYZfcioY6
	cacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Hz6WjRyHGciZtHr8clMs6M3ev0zX2EuFnLLQMIjGE0M=;
	b=L8PNtxuIbHmk4u7jhuW4qtgqqaDSG5se9iDj6JdbxtR46VcUKmSWsg6GXeC5alBZ+R
	SPQeUM0NZP5IkErEz8TmbMQiivmsXxY2iofHsHsnuexvJ1w+KL0+AgyyWnEibfKcPJOy
	3Ky5xdH17wSwZJ574vLb3mMaWpMDKtvOH4pW9kjFEB7BV0fEQcJYagnOINKwMf1IsJu0
	Ocriu8RT+ltle8Y+VU/1sjPBeN4W9GnCiGDp4KjmZ54nDocB7Y3JdyUx2NKT1M7/ctE2
	fVYSiVIRq4jWJcPe/lOIgetLy9Yd9kDxECurGGUBWxRGsVkKKbL2jrGakTf1rWS5d9w2
	w1DA==
X-Gm-Message-State: AMke39n1+ZxB3OiB6YT6LEVBftwCTN82mgix+RaEpK3rN7DN92mpZ0iiQnDmqtntt03Jft1JktXGzMLdolOglw==
X-Received: by 10.28.46.74 with SMTP id u71mr1208740wmu.136.1486125740354;
	Fri, 03 Feb 2017 04:42:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.150.194 with HTTP; Fri, 3 Feb 2017 04:42:19 -0800 (PST)
In-Reply-To: <CAE-gg=78meVcZ7Z7YdHS5_LZ5OojpWxyvBTAaMPR052_E2C7CA@mail.gmail.com>
References: <20170202134911.23234-1-andreas.kling@gmail.com>
	<20170202134911.23234-2-andreas.kling@gmail.com>
	<CADNbA1pRhAGixv0xkf1+08f7FvFOdfhYwjeCmZ3B5mgQeHG+3g@mail.gmail.com>
	<CAE-gg=78meVcZ7Z7YdHS5_LZ5OojpWxyvBTAaMPR052_E2C7CA@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Fri, 3 Feb 2017 13:42:19 +0100
Message-ID: <CAE-gg=5NPK7RRHktwd3Q4Mt=vNQO9PCeW+aDJ=T_KDu0ash6PQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 2/2] m2crypto: depend on typing
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
X-List-Received-Date: Fri, 03 Feb 2017 12:42:23 -0000
Content-Type: text/plain; charset=UTF-8

sorry for bothering the list again with this question which for sure
was answered a hundred times in the past, but the increasing amount of
browser tabs shows that my search does not lead in the right
direction. Also I was not able to find a sophisticated grep expression
for the mailing list archives. If someone can point me to an earlier
thread or another link that clarifies things I would be very happy.

I'm working with bitbake for some years now but I'm still struggling
at this point since the beginning. How to define runtime dependencies
for a native recipe required by a target recipe. what I thought I had
learned in the past:

DEPENDS is for build time, do_configure -> do_populate_sysroot.
RDEPENDS for runtime, expressing dependencies for package manager and
do_build -> do_package_write. Native class allows to build the recipe
for the build machine, native recipes do not create packages.

I see many recipes setting RDEPENDS_${PN}_class-native = "", which
makes sense to me if native versions of things mentioned in RDEPENDS
do not exist as native.bbclass automatically adds '-native' to each
RDEPENDS. Also many recipes set RDEPENDS_${PN}_class-native to meaning
full values mapping to RDEPENDS or not. Why should values already
present in RDEPENDS_${PN} be added to RDEPENDS_${PN}_class-native? Why
does the native class handle rdepends if packaging is not part of the
native build? I see I'm missing an important part here :/

DEPENDS_class-native also makes sense to me if additional/other build
dependencies are required for the build machine.

So what can I do to get the dependency chain build?

1) add all native dependencies on the top level (in my case crda)
DEPENDS = "python-m2crypto-native python-typing ....". This does not
feel right as it has to be done for every top level recipe and I think
there must be a fancy way to do this.

2) add the dependency to the middle layer(in my case python-m2crypto)
but only for the native build DEPENDS_class-native =
"python-typing-native". feels much better, but seems to not reflect
the idea of DEPENDS.

3) add the dependency to the middle layer with DEPENDS. This is wrong
for sure ;)

4) rtfm section x.x.x

So in my case I have to add RDEPENDS_${PN}="python-typing" to
python-m2crypto to get the target packaging right. But what to do with
the native build. Using RDEPENDS only, leads to a build error in crda
as expected.

bitbake -f -c cleansstate python-m2crypto python-m2crypto-native
python-typing python-typing-native crda
bitbake crda
...
ERROR: crda-3.18-r0 do_compile: oe_runmake failed
...
| ERROR: Failed to import the "M2Crypto" module: No module named typing
....

-Andy

2017-02-02 15:09 GMT+01:00 Andy <andreas.kling@gmail.com>:
> you are right, this was a dependency during runtime of native, my
> build of crda failed with
> ERROR: Failed to import the "M2Crypto" module: No module named typing
> How should the the RDPENDS look like? Obviously I was to stupid to
> write it down correctly.
>
> 2017-02-02 15:00 GMT+01:00 Derek Straka <derek@asterius.io>:
>> Is this meant to be a build time dependency?  If it were required to build,
>> I would have expected to see a build failure.
>>
>> -Derek
>>
>> On Thu, Feb 2, 2017 at 8:49 AM, <andreas.kling@gmail.com> wrote:
>>
>>> From: Andy Kling <andreas.kling@peiker-cee.de>
>>>
>>>   m2crypto requires typing since 0.24.0-38-g8bbd0ec
>>> ---
>>>  meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>>> b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>>> index 5a9594f07..ca462229e 100644
>>> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>>> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
>>> @@ -12,7 +12,7 @@ SRC_URI += "file://0001-setup.py-link-in-
>>> sysroot-not-in-host-directories.patch "
>>>  PYPI_PACKAGE = "M2Crypto"
>>>  inherit pypi setuptools siteinfo
>>>
>>> -DEPENDS += "openssl swig-native"
>>> +DEPENDS += "openssl swig-native python-typing"
>>>
>>>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
>>> -I${STAGING_INCDIR}"
>>>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

