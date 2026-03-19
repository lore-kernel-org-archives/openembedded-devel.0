Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B508910854D2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:29:09 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9798.1773923344763057074
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgrvZ0SL;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64937edbc9eso1030592d50.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773923344; cv=none;
        d=google.com; s=arc-20240605;
        b=Pb8ZW+UI7buAbRDTJXZB2Emfz7PHFmpDWITqywGBO/sf8Q3A/m/5owztPfr5fhqQDz
         GE+orK6Ydgt6EdJeUNKEOnZ9zxkEJDB7MP5hAgsIgxjHAoLOMgaDjSF/uGVTT/65sk4/
         2SNBKN08/c4cygNIuS7J9YknTxlf3FzMU2aka2Y4uAe+qQ8scI2FRD3GkzfTvtlLnQkc
         jXh5CvrS3OrpfW6nfm87ZUT/NTNnTa45+pkvEPBo5obkiOFXBedi8ZrxheVT+53MokDp
         PwPkFU7ZAbdiSNbIpw51WDIcQORwO/gMASXP9jfAAwNSjANwBEO26eHk/iOVlCoQzamr
         Aedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tLSGwfsLGB/kJQsRfaqVE/X6bpXEb24KBlp1kfVtVpc=;
        fh=2LQk0Gt2+x0e6j/k3+VRcd9lQY1zUNhc/tUuyK4mil4=;
        b=YMzJ+XLWmcURCockC0kHMbFs+LKocsELhmQF0KBhNKxgmES7RskG6ZMAxPa+PUIMPQ
         zOrmXIampoTsQaBEhQcft3jqo7dbpRruVPN1VYNGoT4IJ/3AF+VCugpv5J4cWbYswqoG
         DShPSMhSPym+6SWNcDr10miaj48bBPqPxLhp6WRG62Z0hXtwXwVjNl2T5stj+HyyYvL7
         NDCGHc6OeqSV3DkMdNoO2yHIsnCHCt17lLf0jkH5XzPd+voSfNECOoQ+KE3mu72U71P3
         /+fBuC/cyFOohsfgfkS3JVndLXCbW+im/m6oKVx0Bo/umGCpdCmCXTplYRppJEktL0gP
         gvKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773923344; x=1774528144; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLSGwfsLGB/kJQsRfaqVE/X6bpXEb24KBlp1kfVtVpc=;
        b=CgrvZ0SL6Pjjc9UA5Rxf3bWVEjVLfH+jE/46m8xXMFS+QO7ZnZ6XSpRys1teUyUYou
         OEGvTj+soYXVtNJy3wjBc5xz3HS9RUV+rc+fcFp9ePkcXDxZPrMPTz0yQnezZZOEzqll
         y1q14LaMksfgxl65cRWM4C9/vCtQyD1FxhC+k/186a2nCFplmlOKKAeFvWwBlWPfLktf
         bs7Uug5WaEoMlVGAiN/3jAGnn29+NZO+t45tNeqyYBZY2gBrw38Mb8Fil6k0sGdLOhtO
         AweBaHEfLLd/jc4KHDk+RlajqSWOzeAl43I3rR4seFWtTBno3to5Zm0Wz7q/bwRiwk8u
         DCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923344; x=1774528144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLSGwfsLGB/kJQsRfaqVE/X6bpXEb24KBlp1kfVtVpc=;
        b=fJQOt3S0qMtoFpYyoYHQvF+bdokUYnbOC6dpSuC2hRb43Q8Lse1IhrW/7LWkEOPd/y
         j7cCWO1vhdes8NCNtf1rUF6Lp7vVoAJShjII3+9YaOlmIU5xKH6VMw79P2H2Wim3ELOg
         mvhR/DEwiYsvE4zLyj5v6T/WVIZDlLDmr5LRQKp9NKmFbAd/NNwM5J4m1mIObhYGQW1V
         3jtHZwVwDhjIRfYhUN7yMIXW8oz78ZLEtj/hB3U341JczsntI0s76kB3btNAe725virM
         Mavk5QJe2g+mnO3NjSuDFadeBxOU4j336hIHas4rk0uY8TjdJg4o3SDHveTEoXSVkCdg
         dqgg==
X-Forwarded-Encrypted: i=1; AJvYcCUcsggHzMRqwizYnzkXRjbWbln0uJOAjGbMIBPAF5tCJdY1jlv75WO/TVTwDvjX7tGwM1WFKIt40j3wYkxVj4mWtI4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywn82jkU59G1dmjzprQ1Pp/3fGvZM09pOs5BQSfQRho8JOGEF94
	P6qDEXqh/hvfMK1Z/6Iag5yuaomjP5f0+i3qx3iEPe0nb4VVUfpB8y1qtrxqjwMyrJYfM+Y/lSC
	9o4SEJ1ylKHVjF+xiskGJz4ni6v0Xgd8=
X-Gm-Gg: ATEYQzwJ5e9pmgvf/WaeIOcOaEzolPlFmG6iVMZ7JDhHbsGAGvZ1FYSyUFd5T9JGwHb
	3E4R/R7aPxbD+RTaxRDxhw14m9rInBj6YVLenIoRGx69vt1OYKhbcS6anmbjE5DGQKsHfhC4Q0e
	y8knP+JHYIq2EIylVOWrN5pJhdLSmaTTthiSJ8ad7MGVeu5c52TQLCZGq4jnavpWAibNJvMKG8n
	lHzLBNcr8qGB0MOUgPAhzWWL+LPLFOKbiU8LjLmxVICP0e3mqE+4hW1s0lZ+p3saHM9UZ8nIdsx
	6nDeTZ9YlERHYLpLiAu/txcYv0jiBVPEq6b05ZSeqPCLkaVjQyiDPqxWg+RS0YswHkffIttvnWI
	sRtR/+vYSUgxXfGdvyubRmY/z
X-Received: by 2002:a53:cb92:0:b0:63f:9fcb:2050 with SMTP id
 956f58d0204a3-64e91472e15mr5055427d50.50.1773923343589; Thu, 19 Mar 2026
 05:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
 <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com>
 <CAMKF1srrHrDeCxJp1nnu1A_Uj8Qd8MyUhe6ZR78frYmFBajfAw@mail.gmail.com> <CA+s=J=zqQET=sUwGTPDt4GnJpRpi4c6NkVE9aUOvyJ4bs67erw@mail.gmail.com>
In-Reply-To: <CA+s=J=zqQET=sUwGTPDt4GnJpRpi4c6NkVE9aUOvyJ4bs67erw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Mar 2026 05:28:52 -0700
X-Gm-Features: AaiRm514RCOr6REF3BU4QyvanaatHDV39VINUigyyKwz7gGZGhn6YS0Y_bxY6cs
Message-ID: <CAMKF1srJJ5uE8Kqz5TM4SAnOF6ST6+esxCoBR4RxPmhJ=Xq32g@mail.gmail.com>
Subject: Re: [oe] Recipes needing build fixes after glibc 2.43 upgrade
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c0e608064d5fb60d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 12:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125400

--000000000000c0e608064d5fb60d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026, 2:15=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualcomm=
.com>
wrote:

> On Thu, Mar 19, 2026 at 1:53=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > remaining list
> >
> > Summary: 7 tasks failed:
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-kernel/minicoredumper/minicoredumper_2.0.7.bb:
> do_compile
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/minicoredumper/2.0.7/temp/log.do_compile.809159
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/canopenterm/canopenterm_1.0.14.bb:
> do_compile
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/canopenterm/1.0.14/temp/log.do_compile.790297
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-bsp/fwupd/fwupd-efi_1.8.bb:
> do_configure
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/fwupd-efi/1.8/temp/log.do_configure.882672
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/qad/qad_git.bb:
> do_compile
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/qad/0.0+git/temp/log.do_compile.886896
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ntopng/ntopng_5.2.1.bb:
> do_compile
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/ntopng/5.2.1/temp/log.do_compile.904879
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/netcf/netcf_0.2.8.bb:
> do_configure
>
> This seems to be because of a .gnulib-tool.py file in newer gnulib
> that isn't being copied. Even if that is fixed, it later fails because
> it uses an obsolete macro.
>
> The last release of netcf was 10 years ago and there have been no
> updates. I didn't find any recipe using it except libvirt. Perhaps it
> should be removed?
>

I am for it.

>
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/netcf/0.2.8+git/temp/log.do_configure.916449
> >
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
> do_compile
> >     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/open-vm-tools/13.0.10/temp/log.do_compile.953431
> >
> > On Wed, Mar 18, 2026 at 8:23=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> Awesome, thanks for the help
> >>
> >> On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
> >>>
> >>> I=E2=80=99ve sent a backport of a patch for liboauth2. Note that upst=
ream has
> made a mess. They first fixed the problem in commit
> 0dcba079907d559550ee8d9a201d26203bb8aebd (the commit I have backported),
> but then they reverted it in commit
> 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under the pretense of fixing the
> issue (https://github.com/OpenIDC/liboauth2/issues/70). I have reported
> the mistake as https://github.com/OpenIDC/liboauth2/issues/73...
> >>>
> >>>
> >>>
> >>> //Peter
> >>>
> >>>
> >>>
> >>> From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj via
> lists.openembedded.org
> >>> Sent: den 18 mars 2026 22:40
> >>> To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
> >>> Subject: [oe] Recipes needing build fixes after glibc 2.43 upgrade
> >>>
> >>>
> >>>
> >>> Hello All,
> >>>
> >>>
> >>>
> >>> There are few recipes currently broken on meta-openembedded layers,
> predominantly due to glibc upgrade. Help is needed in fixing them so we c=
an
> have world builds working again on AB
> >>>
> >>>
> >>>
> >>> Here is list
> >>>
> >>>
> >>>
> >>> Summary: 16 tasks failed:
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-kernel/minicoredumper/minicoredumper_2.0.7.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/minicoredumper/2.0.7/temp/log.do_compile.55019
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/canopenterm/canopenterm_1.0.14.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/canopenterm/1.0.14/temp/log.do_compile.38373
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/python3-xstatic-font-awesome/
> 6.2.1.1/temp/log.do_compile.107676
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/sysdig/sysdig_0.39.0.bb:
> do_configure
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/sysdig/0.39.0/temp/log.do_configure.124550
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-bsp/fwupd/fwupd-efi_1.8.bb:
> do_configure
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/fwupd-efi/1.8/temp/log.do_configure.145475
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/opensaf/opensaf_5.22.01.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/opensaf/5.22.01/temp/log.do_compile.161530
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ntopng/ntopng_5.2.1.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/ntopng/5.2.1/temp/log.do_compile.154712
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pychromecast_14.0.9.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/python3-pychromecast/14.0.9/temp/log.do_compile.175919
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/qad/qad_git.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/qad/0.0+git/temp/log.do_compile.176411
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-test/libfaketime/libfaketime_0.9.10.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/libfaketime/0.9.10/temp/log.do_compile.182340
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/luaposix/luaposix_36.2.1.bb:
> do_package
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/luaposix/36.2.1/temp/log.do_package.186406
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/liboauth2/liboauth2_2.2.0.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/liboauth2/2.2.0/temp/log.do_compile.199073
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/open-vm-tools/13.0.10/temp/log.do_compile.193667
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/netcf/netcf_0.2.8.bb:
> do_configure
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/netcf/0.2.8+git/temp/log.do_configure.208957
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/links/links-x11_2.26.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/links-x11/2.26/temp/log.do_compile.215047
> >>>
>  /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/links/links_2.29.bb:
> do_compile
> >>>     log:
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/links/2.29/temp/log.do_compile.218734
> >>> Summary: There were 26 ERROR messages, returning a non-zero exit code=
.
> >>>
> >>>
> >>>
> >>> and a build log with errors is here
> >>>
> >>>
> >>>
> >>>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inl=
ine
> >>>
> >>>
> >>>
> >>> Thanks
> >>>
> >>> -Khem
> >>>
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#125377):
> https://lists.openembedded.org/g/openembedded-devel/message/125377
> > Mute This Topic: https://lists.openembedded.org/mt/118391105/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000c0e608064d5fb60d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19, 2026, 2:15=E2=80=
=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.com">anuj.=
mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, Mar 19, 2026 at 1:53=E2=80=AFPM Khem Raj via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; remaining list<br>
&gt;<br>
&gt; Summary: 7 tasks failed:<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.80=
9159<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.7902=
97<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.882672<=
br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-oe/recipes-extended/qad/qad_git.bb:do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.886896<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.904879<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-networking/recipes-support/netcf/netcf_0.2.8.bb:do_configure<br>
<br>
This seems to be because of a .gnulib-tool.py file in newer gnulib<br>
that isn&#39;t being copied. Even if that is fixed, it later fails because<=
br>
it uses an obsolete macro.<br>
<br>
The last release of netcf was 10 years ago and there have been no<br>
updates. I didn&#39;t find any recipe using it except libvirt. Perhaps it<b=
r>
should be removed?<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I am for it.</div><div dir=3D"auto"><div class=3D"gmail_q=
uote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.91644=
9<br>
&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedde=
d/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do=
_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/build/buil=
d/tmp/work/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.9=
53431<br>
&gt;<br>
&gt; On Wed, Mar 18, 2026 at 8:23=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Awesome, thanks for the help<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt &lt;<a hr=
ef=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank" rel=3D"noreferr=
er">peter.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I=E2=80=99ve sent a backport of a patch for liboauth2. Note th=
at upstream has made a mess. They first fixed the problem in commit 0dcba07=
9907d559550ee8d9a201d26203bb8aebd (the commit I have backported), but then =
they reverted it in commit 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under t=
he pretense of fixing the issue (<a href=3D"https://github.com/OpenIDC/libo=
auth2/issues/70" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/OpenIDC/liboauth2/issues/70</a>). I have reported the mistake as <=
a href=3D"https://github.com/OpenIDC/liboauth2/issues/73." rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/OpenIDC/liboauth2/issues=
/73.</a>..<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; //Peter<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.=
org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembe=
dded.org</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.or=
g" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedd=
ed.org</a>&gt; On Behalf Of Khem Raj via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&gt;&gt;&gt; Sent: den 18 mars 2026 22:40<br>
&gt;&gt;&gt; To: openembeded-devel &lt;<a href=3D"mailto:Openembedded-devel=
@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">Openembedded-=
devel@lists.openembedded.org</a>&gt;<br>
&gt;&gt;&gt; Subject: [oe] Recipes needing build fixes after glibc 2.43 upg=
rade<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello All,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There are few recipes currently broken on meta-openembedded la=
yers, predominantly due to glibc upgrade. Help is needed in fixing them so =
we can have world builds working again on AB<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Here is list<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Summary: 16 tasks failed:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_=
compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_co=
mpile.55019<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb:do_com=
pile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/canopenterm/1.0.14/temp/log.do_comp=
ile.38373<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_=
6.2.1.1.bb:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/python3-xstatic-font-awesome/<a hre=
f=3D"http://6.2.1.1/temp/log.do_compile.107676" rel=3D"noreferrer noreferre=
r" target=3D"_blank">6.2.1.1/temp/log.do_compile.107676</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb:do_configure<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure=
.124550<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure=
.145475<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_com=
pile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile=
.161530<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.15=
4712<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pychromecast_14.0.9.b=
b:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/python3-pychromecast/14.0.9/temp/lo=
g.do_compile.175919<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-extended/qad/qad_git.bb:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176=
411<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/libfaketime/0.9.10/temp/log.do_comp=
ile.182340<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb:do_package<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/luaposix/36.2.1/temp/log.do_package=
.186406<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb:do_compile<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile=
.199073<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.=
10.bb:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_c=
ompile.193667<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-networking/recipes-support/netcf/netcf_0.2.8.bb:do_configure=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configu=
re.208957<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-support/links/links-x11_2.26.bb:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/links-x11/2.26/temp/log.do_compile.=
215047<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/srv/pokybuild/yocto-worker/meta-oe/build/meta-ope=
nembedded/meta-oe/recipes-support/links/links_2.29.bb:do_compile<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0log: /srv/pokybuild/yocto-worker/meta-oe/bu=
ild/build/tmp/work/x86-64-v3-poky-linux/links/2.29/temp/log.do_compile.2187=
34<br>
&gt;&gt;&gt; Summary: There were 26 ERROR messages, returning a non-zero ex=
it code.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; and a build log with errors is here<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v=
2/logs/5867932/raw_inline" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inlin=
e</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -Khem<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#125377): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/125377" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/125=
377</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11839110=
5/3616702" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/118391105/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mit=
tal@oss.qualcomm.com" target=3D"_blank" rel=3D"noreferrer">anuj.mittal@oss.=
qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000c0e608064d5fb60d--

