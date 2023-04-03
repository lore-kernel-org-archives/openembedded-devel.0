Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA2CC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 04:14:02 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.62611.1680495232782463758
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 21:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WYUhVd2R;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id r14so15126316oiw.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 21:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680495232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykmW96dMl57Ds4IWr9u2e49DYrouHxrWEbvhTPFT9AQ=;
        b=WYUhVd2RKzKBrYccVoTY642PULjrzYbf2Df4ncf6cXyrGVG4A42y07Rpvf1YBr/I01
         Z3aPPt3Bh1V8p2s8gUo65T8Oa08D7EBV//RJrzlxlQS72qQrCyo6tLTMLoTOiNUysQNa
         Rj9WfCy+AaSdjl1xQj/vC6w5JbqYS3eWMq92VtECv6zzUn/HMNUSQC1YYgindUChzaXP
         jelfJejBZR8MBfbaLpz3X/3qWlf4yGymH1FLD1MtyHEcGoUhPI3//zV76VVN6GGvN0uD
         zLPmiUVLDoNNNruzj/BDLfcHFYrq68nUpebqQH560qT5uIjk4mKVBBmciMK9TMIK+KsB
         162Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680495232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykmW96dMl57Ds4IWr9u2e49DYrouHxrWEbvhTPFT9AQ=;
        b=sWOCkBGd8ylL4Q8kXP4K078fLGI0lBQtUHh6USZkaqLfwj9yaIjdhKlL91ksqSnPJO
         Mb67CzXy6YxIctdVqx90NXzkKKZWRaki8HPZAclzf5B0Iw2KBvhMOIzEcHEUuOWO4Bw0
         NjEdvTXk7kAIb6E2b5mfKs8tew4isGSpZOZl1SuC2z5YV9xYP0ju5pcpDYFrZM3wTNQ9
         +1hsOIbjy6bSceGHyMUgiguLJzyb+ktyjhY0g+bKhs0eAycyh3UxfkJJdOOL2McwNTdH
         QxRIFgzH4DVECdeRLyALdfwR0z4mCPLDaobmO2qzPBGZeJ6fPnJC/QE7qTpvXvCnvIH+
         x68Q==
X-Gm-Message-State: AO0yUKVuW1l+ztPSO644XseSqJjRUdqBbXiGRrJkCCHrhDbMPDzyc7iy
	EZMnawEiMeh9TfNFmw4W2ic3id1FUpcCJjjgAD0=
X-Google-Smtp-Source: AK7set+ZLkSpHj0DPlAleg43u1PYBXZULOiGzTcddDrXqgCpKGYBbogER0XPUF/i3EExfAD/48PRBqGsP2dL56stirE=
X-Received: by 2002:a54:4d84:0:b0:387:251b:71fa with SMTP id
 y4-20020a544d84000000b00387251b71famr10889484oix.4.1680495231834; Sun, 02 Apr
 2023 21:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680473253.git.tim.orling@konsulko.com> <040cff75f5cc2f926c6ab489c0a4b1776ce7d17d.1680473253.git.tim.orling@konsulko.com>
In-Reply-To: <040cff75f5cc2f926c6ab489c0a4b1776ce7d17d.1680473253.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Apr 2023 21:13:25 -0700
Message-ID: <CAMKF1sqVHAb9gzjaW96OLtJGr4ALAZU6NZKTFaxXX4RYnBPYBg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 04/11] meta-oe-ptest*-image: enable
 BBCLASSEXTEND parallel execution
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101890

Thanks for this patchset Tim, really appreciate it. I have few comments.

On Sun, Apr 2, 2023 at 3:30=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
> Similar to "core-image-ptest: Switch to BBCLASSEXTEND parallel execution"
>
> Refactor meta-oe-ptest-image.bb for an image per ptest in the form of
> meta-oe-ptest-image-XXX using class extensions.
>
> * Add meta-oe-ptest-all-image.bb depends on ALL meta-oe-ptest-image-XXX i=
n meta-oe
> * Add meta-oe-ptest-fast-image.bb depends on meta-oe ptests which take le=
ss than ~30s
>
> This allows parallel execution of the tests.
>
> The downside to this approach is the parsing time of an image generating
> this number of class extensions is slow but making it easier to execute
> and collect test data should outweigh that.
>
> A useful advantage is that the dependencies of each ptest package are
> checked/tested individually.
>
> Add to local.conf:
> IMAGE_CLASSES +=3D "testimage"
>
> All the meta-oe-ptest-image-XXX can be built with:
> $ bitbake meta-oe-ptest-all-image
>
> Subsequently, all the ptest images can be run with:
> $ bitbake -c testimage meta-oe-ptest-all-image
>
> You will likely want to limit the number of parallel image tests:
>
> BB_NUMBER_THREADS =3D "4"
>
> based on the number of TAP devices you have defined or the number of simu=
ltaneous
> QEMU sessions your server can support.
>
> Results can be summarized with:
>
> $ resulttool report tmp/log/oeqa/testresult.json
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../images/meta-oe-ptest-all-image.bb         | 25 ++++++++++++
>  .../images/meta-oe-ptest-fast-image.bb        |  6 +++
>  .../images/meta-oe-ptest-image.bb             | 38 ++++++++++++++++++-
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-all-image.b=
b
>  create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-fast-image.=
bb

I think these images also need ( and also the ones in meta-python and
meta-perl too I think )

IMAGE_FEATURES +=3D "debug-tweaks"

since some of them add ssh and it will be helpful to be able to do
passwordless access. and I was also wondering
if meta-oe-image-base.bb is really needed. We could simply include
core-image-base.bb here. This change also makes
meta-oe-image.bb and packagegroup-meta-oe.bb also questionable. Since
build part can be taken care by bitbake world.
but we can address that later.

>
> diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb b/met=
a-oe/recipes-core/images/meta-oe-ptest-all-image.bb
> new file mode 100644
> index 000000000..0ea03dd2e
> --- /dev/null
> +++ b/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Recipe to trigger execution of all meta-oe ptest images=
."
> +HOMEPAGE =3D "https://www.openembedded.org/"
> +
> +LICENSE =3D "MIT"
> +
> +inherit features_check nopackages
> +REQUIRED_DISTRO_FEATURES =3D "ptest"
> +
> +require conf/include/ptest-packagelists-meta-oe.inc
> +
> +# Include the full set of ptests
> +PTESTS_META_OE =3D "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
> +
> +do_testimage[noexec] =3D "1"
> +do_testimage[depends] =3D "${@' '.join(['meta-oe-ptest-image-'+x+':do_te=
stimage' for x in d.getVar('PTESTS_META_OE').split()])}"
> +
> +do_build[depends] =3D "${@' '.join(['meta-oe-ptest-image-'+x+':do_build'=
 for x in d.getVar('PTESTS_META_OE').split()])}"
> +
> +# normally image.bbclass would do this
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +python () {
> +    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
> +        bb.build.addtask("do_testimage", "", "", d)
> +}
> diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb b/me=
ta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
> new file mode 100644
> index 000000000..f56e841ff
> --- /dev/null
> +++ b/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
> @@ -0,0 +1,6 @@
> +require meta-oe-ptest-all-image.bb
> +
> +DESCRIPTION =3D "Recipe to trigger execution of all fast meta-oe ptest i=
mages."
> +
> +PTESTS_META_OE =3D "${PTESTS_FAST_META_OE}"
> +
> diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe=
/recipes-core/images/meta-oe-ptest-image.bb
> index 0166b9c41..951d91f82 100644
> --- a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> +++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> @@ -1,5 +1,41 @@
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES =3D "ptest"
> +
> +require conf/include/ptest-packagelists-meta-oe.inc
> +
>  require  meta-oe-image-base.bb
>
>  SUMMARY =3D "meta-oe ptest test image"
>
> -IMAGE_INSTALL +=3D "packagegroup-meta-oe"
> +DESCRIPTION +=3D "Also including the ${MCNAME} ptest package."
> +HOMEPAGE =3D "https://www.openembedded.org/"
> +
> +PTESTS_META_OE =3D "${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE}"
> +
> +IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
> +
> +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_=
META_OE').split()])}"
> +
> +# The image can be sufficiently large (~1.8GB) that we need to be carefu=
l that it fits in a live
> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x ou=
t of the
> +# box) and explicitly add up to 1500MB.
> +IMAGE_OVERHEAD_FACTOR =3D "1.0"
> +IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
> +# If a particular ptest needs more space, it can be customized:
> +#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
> +
> +# ptests need more memory than standard to avoid the OOM killer
> +QB_MEM =3D "-m 1024"
> +# If a particular ptest needs more memroy, it can be customized:
> +#QB_MEM:virtclass-mcextend-<pn> =3D "-m 4096"
> +
> +TEST_SUITES =3D "ping ssh parselogs ptest"
> +
> +# Sadly at the moment the full set of ptests is not robust enough and sp=
oradically fails in random places
> +PTEST_EXPECT_FAILURE =3D "1"
> +
> +python () {
> +    if not d.getVar("MCNAME"):
> +        raise bb.parse.SkipRecipe("No class extension set")
> +}
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101882): https://lists.openembedded.org/g/openembedde=
d-devel/message/101882
> Mute This Topic: https://lists.openembedded.org/mt/98023314/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

