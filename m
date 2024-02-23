Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD23C47DD9
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 03:08:34 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.2947.1708657710372710788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 19:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvvqxX2C;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-21e63b586fcso233371fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 19:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708657709; x=1709262509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeczRNbxHpddUGnisYRPlYUnff2ehmQAx+6sKXxJdwQ=;
        b=IvvqxX2CHeiDWtb4jUk9xyFHspqWbh2w8qN4K2VQDlgNpR0vbJ/amaqWMwdU7FSccR
         54WyrjiwOfGnxT8iyjcl+9Q3R/5Uucht4N2TLNCws24ZJKfqG8nOjjmwjRLkshmWyqdl
         meXaIAz69u4bEukozb1W4m/BMddjWK0sZsSGuRvdfsCy57NfQf0u4hIrzY7YEgOqVzEj
         rtO6JaR2xduYl1FRaC25jFIzvueEgDnm6UsXzdnEUIergrEeWRZmkSGGVMqBSzmWq3ji
         +dZGwlaPpf9YqB77TeDIUDSu0QCH13qRlRTzAVjtC6XNVkFz8d5USSR7NmolaaDLx5h9
         Ei4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708657709; x=1709262509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeczRNbxHpddUGnisYRPlYUnff2ehmQAx+6sKXxJdwQ=;
        b=M29fnfW2CHuiGF4/nOu0n0yny74BPTP8YwC159rV77gaWq0NcFrfvGsisadwRd2RI+
         ORxCZUnRJ7Pg8OaPMhJX41Cid+BU9mf6W8xPYhM9MAlh+8qoxW9T1jBkwjawT6gWmwyw
         8s4pdE11LagN98Vz68igQSOjZoKw1pk9tBA4hByvMhAig0mmpxfqaqCuJOPucvkPkI45
         JyokwPpRZZu/qnoKIZdWyj3+6s7afHHVYP0RZHiI5wNL9q5SyR2uiUa6uV8JbLisKAg3
         oiTn6MXsLTLaFTbRJYmW6bYrK87wWicF1fybVqxej5dLoAdRX+nXHqU8mi7qKlXzuYP4
         nAfQ==
X-Gm-Message-State: AOJu0YyQSxDqgAO0ottkezC/8+WhV7ZJIc9nTcaXlkhFlhtWXi8Opu0C
	+O7FuXfmhd8sB9Xkjev8PxEPyco0QwgzUbT8Buk7+ynCSZKSuJTDV7vuSLwjV6WvukU40X2hyJ+
	wEaB5V7n+grjyfYrY/nRKJUiPZ9c=
X-Google-Smtp-Source: AGHT+IFfpSJut5+xJ1eLlA8M2rIbng3CK9mGZ1I/F/G+bzCI66Hdc2nZF0hQSNrT5BJINV4pyRBda3inq55lVlCAlnA=
X-Received: by 2002:a05:6870:9a87:b0:21e:8797:95ca with SMTP id
 hp7-20020a0568709a8700b0021e879795camr902421oab.23.1708657709371; Thu, 22 Feb
 2024 19:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com> <20240222205827.2813212-4-raj.khem@gmail.com>
 <17B65B4590A0B8D2.24621@lists.openembedded.org> <CANx9H-Dqu74yQ-jfG31h=EWoTqvGbfa2FXmtUHrznYTSpXWZrg@mail.gmail.com>
In-Reply-To: <CANx9H-Dqu74yQ-jfG31h=EWoTqvGbfa2FXmtUHrznYTSpXWZrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Feb 2024 19:08:02 -0800
Message-ID: <CAMKF1sqPDifLYvfc7J=qxVaxkNX4STO6tzNUDKO_n-8r72EUPQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 4/4] meta-filesystems: Add meta-filesystems-image-ptest
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 03:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109003

On Thu, Feb 22, 2024 at 6:25=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Thu, Feb 22, 2024 at 5:57=E2=80=AFPM Tim Orling via lists.openembedded=
.org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On Thu, Feb 22, 2024 at 12:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
>>>
>>> This will help in running ptests like core layer, right now there are
>>> just 3 but I hope to get more contributions now that infra is in place
>>>
>>> to run all ptests
>>>
>>> bitbake meta-filesystems-image-ptest-all
>>>
>>> to run a single recipe ptests
>>>
>>> bitbake meta-filesystems-image-ptest-fuse3
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  .../ptest-packagelists-meta-filesystems.inc   | 18 +++++++++
>>>  .../meta-filesystems-image-ptest-all.bb       | 25 ++++++++++++
>>>  .../meta-filesystems-image-ptest-fast.bb      |  5 +++
>>>  .../images/meta-filesystems-image-ptest.bb    | 40 +++++++++++++++++++
>>>  4 files changed, 88 insertions(+)
>>>  create mode 100644 meta-filesystems/conf/include/ptest-packagelists-me=
ta-filesystems.inc
>>>  create mode 100644 meta-filesystems/recipes-filesystems/images/meta-fi=
lesystems-image-ptest-all.bb
>>>  create mode 100644 meta-filesystems/recipes-filesystems/images/meta-fi=
lesystems-image-ptest-fast.bb
>>>  create mode 100644 meta-filesystems/recipes-filesystems/images/meta-fi=
lesystems-image-ptest.bb
>>>
>>> diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-file=
systems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesys=
tems.inc
>>> new file mode 100644
>>> index 0000000000..f57bbab930
>>> --- /dev/null
>>> +++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems=
.inc
>>> @@ -0,0 +1,18 @@
>>> +#
>>> +# Lists of the ptest in meta-filesystems, sorted into two sets by the =
time they take
>>> +# Please keep these sorted in alphabetical order
>>> +#
>>> +# A first pass at getting all meta-filesystems recipes which inherit p=
test
>>> +# meta_filesystems_ptest_recipes=3D$(bitbake-layers show-recipes --rec=
ipes-only --layer meta-filesystems --inherits ptest --bare | sed -e '1,/=3D=
=3D=3D Matching recipes: =3D=3D=3D/d')
>>> +# ptests which take less than ~30s each
>>> +
>>> +PTESTS_FAST_META_FILESYSTEMS =3D "\
>>> +    e2tools \
>>> +    fuse3 \
>>> +"
>>> +
>>> +PTESTS_SLOW_META_FILESYSTEMS =3D "\
>>> +"
>>> +PTESTS_PROBLEMS_META_FILESYSTEMS =3D "\
>>> +    sshfs-fuse \
>>> +"
>>> diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesyste=
ms-image-ptest-all.bb b/meta-filesystems/recipes-filesystems/images/meta-fi=
lesystems-image-ptest-all.bb
>>> new file mode 100644
>>> index 0000000000..ffbfa1a3f6
>>> --- /dev/null
>>> +++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-imag=
e-ptest-all.bb
>>> @@ -0,0 +1,25 @@
>>> +DESCRIPTION =3D "Recipe to trigger execution of all meta-filesystems p=
test images."
>>> +HOMEPAGE =3D "https://www.openembedded.org/"
>>> +
>>> +LICENSE =3D "MIT"
>>> +
>>> +inherit features_check nopackages
>>> +REQUIRED_DISTRO_FEATURES =3D "ptest"
>>> +
>>> +require conf/include/ptest-packagelists-meta-filesystems.inc
>>> +
>>> +# Include the full set of ptests
>>> +PTESTS_META_FILESYSTEMS =3D "${PTESTS_FAST_META_FILESYSTEMS} ${PTESTS_=
SLOW_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
>>> +
>>> +do_testimage[noexec] =3D "1"
>>> +do_testimage[depends] =3D "${@' '.join(['meta-filesystems-image-ptest-=
'+x+':do_testimage' for x in d.getVar('PTESTS_META_FILESYSTEMS').split()])}=
"
>>> +
>>> +do_build[depends] =3D "${@' '.join(['meta-filesystems-image-ptest-'+x+=
':do_build' for x in d.getVar('PTESTS_META_FILESYSTEMS').split()])}"
>>> +
>>> +# normally image.bbclass would do this
>>> +EXCLUDE_FROM_WORLD =3D "1"
>>> +
>>> +python () {
>>> +    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d)=
:
>>> +        bb.build.addtask("do_testimage", "", "", d)
>>> +}
>>> diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesyste=
ms-image-ptest-fast.bb b/meta-filesystems/recipes-filesystems/images/meta-f=
ilesystems-image-ptest-fast.bb
>>> new file mode 100644
>>> index 0000000000..0eb5344d9e
>>> --- /dev/null
>>> +++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-imag=
e-ptest-fast.bb
>>> @@ -0,0 +1,5 @@
>>> +require meta-filesystems-image-ptest-all.bb
>>> +
>>> +DESCRIPTION =3D "Recipe to trigger execution of all fast meta-filesyst=
ems ptest images."
>>> +
>>> +PTESTS_META_OE =3D "${PTESTS_FAST_META_FILESYSTEMS}"
>>
>> this should probably be PTESTS_META_FILESYSTEMS =3D
>> Unless we want to expand the scope.
>

yeah thanks for catching this. I have fixed it in master-next.

>
> Also, THANK YOU for taking the example of meta-oe, meta-perl and meta-pyt=
hon to another layer. I would love to see this extend to every layer.
>
>>>
>>> diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesyste=
ms-image-ptest.bb b/meta-filesystems/recipes-filesystems/images/meta-filesy=
stems-image-ptest.bb
>>> new file mode 100644
>>> index 0000000000..90d6a92c1b
>>> --- /dev/null
>>> +++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-imag=
e-ptest.bb
>>> @@ -0,0 +1,40 @@
>>> +inherit features_check
>>> +REQUIRED_DISTRO_FEATURES =3D "ptest"
>>> +
>>> +require recipes-core/images/core-image-minimal.bb
>>> +require conf/include/ptest-packagelists-meta-filesystems.inc
>>> +
>>> +SUMMARY =3D "meta-filesystems ptest test image"
>>> +
>>> +DESCRIPTION +=3D "Also including the ${MCNAME} ptest package."
>>> +HOMEPAGE =3D "https://www.openembedded.org/"
>>> +
>>> +PTESTS_META_FILESYSTEMS =3D "${PTESTS_SLOW_META_FILESYSTEMS} ${PTESTS_=
FAST_META_FILESYSTEMS} ${PTESTS_PROBLEMS_META_FILESYSTEMS}"
>>> +
>>> +IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
>>> +
>>> +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in d.getVar('PTEST=
S_META_FILESYSTEMS').split()])}"
>>> +
>>> +# The image can be sufficiently large (~1.8GB) that we need to be care=
ful that it fits in a live
>>> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x =
out of the
>>> +# box) and explicitly add up to 1500MB.
>>> +IMAGE_OVERHEAD_FACTOR =3D "1.0"
>>> +IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
>>> +# If a particular ptest needs more space, it can be customized:
>>> +#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
>>> +
>>> +# ptests need more memory than standard to avoid the OOM killer
>>> +QB_MEM =3D "-m 1024"
>>> +# If a particular ptest needs more memroy, it can be customized:
>>> +#QB_MEM:virtclass-mcextend-<pn> =3D "-m 4096"
>>> +
>>> +TEST_SUITES =3D "ping ssh parselogs ptest"
>>> +
>>> +# Sadly at the moment the full set of ptests is not robust enough and =
sporadically fails in random places
>>> +PTEST_EXPECT_FAILURE =3D "1"
>>> +
>>> +python () {
>>> +    if not d.getVar("MCNAME"):
>>> +        raise bb.parse.SkipRecipe("No class extension set")
>>> +}
>>> +
>>> --
>>> 2.43.2
>>>
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#108998): https://lists.openembedded.org/g/openembedd=
ed-devel/message/108998
>> Mute This Topic: https://lists.openembedded.org/mt/104516897/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

