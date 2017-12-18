Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49CD271D79
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 16:15:20 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id k2so11429184ybd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MzGwOEuZyJSrIE4/Ug/RDORzqq/Boig1JZ1mcI8Kyl0=;
	b=X5W6aLNlhsnOi9mmfwaQnuCsR+NHjMYw1g88jDe5hyKYW31n5CFatb/DegBqoUQTw3
	cyT0ETQCQeGofU8xmdDKIokGvZOJLIevWdcZXT05PFCRELDsasLq3HAmK0jhLypDmJgr
	z9QJixDYVdKi+oYeQiuCfoORB0EVER+9KCv9Ce06qIJpvuSCZqSXQQ2MwerErBzQV1Kj
	8IJDu9y9l6OLdOVRlX7jqwnLWtGfJMfuFdMTTLBgAH8/2LFxCZxIMMdCxzJ851buOmAJ
	TYuPoL18RcSxJpTqK/NKPeAAEmrGtR0+qo9h332gno7Jjqm5MipnOOjvzFBAyr1hBZ2l
	rRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=MzGwOEuZyJSrIE4/Ug/RDORzqq/Boig1JZ1mcI8Kyl0=;
	b=tUQVYJMNcW/psQbgrbh4Uc0BG8dz6PffWDMm1wXgiyLBU8O4XGy749zGLyuT5e5bpN
	Qe++02OTfpuz2NeSPLXacbwASYodSm39Ltt95wC5kxW6arNO2CZgXs+TQOHYDL20AFxO
	N4pLwqKRHlqKsbUCeUeMLziJj3d9mqLB1ts5XR+F5FAoUUNMa8CK+fhiqDr42ekfrZrJ
	kl7syjoSLPWZWjQFmXHSzEqG/kj0c9vOh8FZo8if4i5ENTrv9dlV88XT+VCyMHBqDFa3
	koaAW+tFHRFu+ildiOCsl78HSd7uhyUOTZcBQcWHEF4J5dqriH7H8rpLAf3AEUKFekbs
	Xs6w==
X-Gm-Message-State: AKGB3mJjZJJc+nN5b9MRV9RVn4MUsn9ojzUUUUeTAJlcpCpDgkWS3A/O
	2FbNyQyFABXzaH9cilUvn5L4RVY+3oAX3syUBdw=
X-Google-Smtp-Source: ACJfBovrW4fcpaCTWMLQV29NsC7QZB5uRRRReY3H/y5zuYaLtClntkpQLvYCoOyULYUoN9ME9Bztiispz8Ek1UhqwJQ=
X-Received: by 10.13.236.203 with SMTP id v194mr182162ywe.339.1513613721877;
	Mon, 18 Dec 2017 08:15:21 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Mon, 18 Dec 2017 08:15:21 -0800 (PST)
In-Reply-To: <CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Dec 2017 11:15:21 -0500
X-Google-Sender-Auth: QgFLAnYW6POYNwu7jqthV4bnOkE
Message-ID: <CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 16:15:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com> wrote:
> All our python recipes should be explicitly listing the python module
> packages they require. No python module recipes should be depending on
> python-modules or python3-modules, but explicitly what they require.

This is a giant PITA for little gain in my opinion. The typical python
'vehicles' to define dependencies, things like setup.py, requires.txt,
requirements.txt..., never bother to list stdlibs. These are standard
libs that are just expected to be there. If a system is being
installed with only select python modules it will behave differently
than python found on any other system violating the rule of least
surprise. On top of this most of these modules are ~40K in size and
there are roughly 60 in the stdlib so the size gain in installing a
few vs. all of them is extremely negligible. All of this seems to add
way more work and churn that outweighs any real benefit.

Mark


>
> On Mon, Dec 18, 2017 at 8:33 AM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
>> On Sat, Dec 16, 2017 at 4:58 PM, Derek Straka <derek@asterius.io> wrote:
>> > On Mon, Dec 4, 2017 at 2:00 PM, Mark Asselstine <
>> > mark.asselstine@windriver.com> wrote:
>> >
>> >> Drop the json<-->simplejson patch instead opting to depend on
>> >> python-json (part of core python libs). Beyond this the uprev is
>> >> straightforward.
>> >>
>> >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> >> ---
>> >>  .../recipes-devtools/python/python-pyroute2.inc    | 23
>> >> +++++--------------
>> >>  .../import-simplejson-as-json.patch                | 26
>> >> ----------------------
>> >>  ...yroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} |  0
>> >>  ...route2_0.3.22.bb => python3-pyroute2_0.4.21.bb} |  0
>> >>  4 files changed, 6 insertions(+), 43 deletions(-)
>> >>  delete mode 100644 meta-python/recipes-devtools/
>> >> python/python-pyroute2/import-simplejson-as-json.patch
>> >>  rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.22.bb
>> =>
>> >> python-pyroute2_0.4.21.bb} (100%)
>> >>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.3.22.bb
>> >> => python3-pyroute2_0.4.21.bb} (100%)
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc
>> >> b/meta-python/recipes-devtools/python/python-pyroute2.inc
>> >> index da1d4cd..521162c 100644
>> >> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
>> >> +++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
>> >> @@ -1,26 +1,15 @@
>> >>  SUMMARY = "A pure Python netlink and Linux network configuration
>> library"
>> >>  LICENSE = "GPLv2 & Apache-2.0"
>> >>  LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=
>> >> b234ee4d69f5fce4486a80fdaf4a4263 \
>> >> -                    file://LICENSE.Apache.v2;md5=
>> >> 3b83ef96387f14655fc854ddc3c6bd57"
>> >> +                    file://LICENSE.Apache.v2;md5=
>> >> 34281e312165f843a2b7d1f114fe65ce"
>> >>
>> >> -SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
>> >> -SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14
>> >> a1a50ebdffbd50d4e30ffda62c0a05d7b3"
>> >> -
>> >> -SRC_URI += "file://import-simplejson-as-json.patch"
>> >> +SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
>> >> +SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d0
>> >> 0560ed9910203e93f107833b6e8d151171"
>> >>
>> >>
>> > Can we remove the extra path prepend now?
>> >
>> >>  FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
>>
>> Sure. I will send a V2 once we get agreement on the RDEPENDS.
>>
>> >>
>> >>  inherit pypi
>> >>
>> >> -RDEPENDS_${PN} += "\
>> >> -  ${PYTHON_PN}-distutils \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-simplejson \
>>
>> per the commit log, use json instead to match upstream expectations.
>>
>> >> -  ${PYTHON_PN}-multiprocessing \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-io ${PYTHON_PN}-pprint \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-pickle \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-logging \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-threading \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-textutils \
>>
>> No reference in this version of pyroute2
>>
>> >> -  ${PYTHON_PN}-subprocess \
>>
>> stdlib
>>
>> >> -  ${PYTHON_PN}-netclient \
>>
>> No reference in this version of pyroute2
>>
>> >> -"
>> >>
>> > None of these other dependencies are needed for a minimal python install?
>>
>> Sorry, I should have covered this in my commit log. This was a mistake on
>> my
>> part but was intentional since these are all stdlib modules as I have show
>> above and as is described in the the pyroute2 README:
>> "Pyroute2 is a pure Python **netlink** library. It requires only Python
>> stdlib"
>>
>> All stdlib modules are listed as RDEPENDS in python[3]-modules so we are
>> only making work for ourselves breaking these out here. I will put them
>> back
>> but if we go this route, of listed stdlib RDEPENDS, then there is a lot of
>> work
>> to ensure this is consistent across all our python recipes.
>>
>>
>> Mark
>>
>>
>> >
>> >> +RDEPENDS_${PN} += " \
>> >> +    ${PYTHON_PN}-json \
>> >> +    "
>> >> diff --git a/meta-python/recipes-devtools/python/python-
>> >> pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-
>> >> devtools/python/python-pyroute2/import-simplejson-as-json.patch
>> >> deleted file mode 100644
>> >> index d73da07..0000000
>> >> --- a/meta-python/recipes-devtools/python/python-
>> >> pyroute2/import-simplejson-as-json.patch
>> >> +++ /dev/null
>> >> @@ -1,26 +0,0 @@
>> >> -Upstream-Status: Inappropriate [wrong dependency]
>> >> -
>> >> -Subject: [PATCH] import simplejson as json
>> >> -
>> >> -At runtime python-pyroute2 tries to import json, but the module is not
>> >> -available, import simplejson as json solve the issue.
>> >> -
>> >> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> >> ----
>> >> - pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
>> >> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> >> -
>> >> -diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py
>> b/pyroute2/netlink/rtnl/
>> >> ifinfmsg.py
>> >> -index 4f14f25..55643eb 100644
>> >> ---- a/pyroute2/netlink/rtnl/ifinfmsg.py
>> >> -+++ b/pyroute2/netlink/rtnl/ifinfmsg.py
>> >> -@@ -1,5 +1,5 @@
>> >> - import os
>> >> --import json
>> >> -+import simplejson as json
>> >> - import errno
>> >> - import select
>> >> - import struct
>> >> ---
>> >> -2.1.4
>> >> -
>> >> diff --git a/meta-python/recipes-devtools/python/python-
>> pyroute2_0.3.22.bb
>> >> b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
>> >> similarity index 100%
>> >> rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.22.
>> bb
>> >> rename to meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
>> >> diff --git a/meta-python/recipes-devtools/python/python3-
>> >> pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-
>> >> pyroute2_0.4.21.bb
>> >> similarity index 100%
>> >> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.3.
>> 22.bb
>> >> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.4.
>> 21.bb
>> >> --
>> >> 2.7.4
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

