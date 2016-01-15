Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E64C73206
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 18:49:35 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id a123so273582934vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 10:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=t5sXXsZXJFaM7fjRQyOA5iStHhPjNjvDyjLHdyu2HtM=;
	b=nLqn6XBG9Y+3rklXIECA0V4eY9KpyQ3WMw71DlicHMU6zLllf9jrEHtBc+VZtMp3lT
	8GjnnzRV4UQ0gzfdoz5+AkESfV+uwHTm+YUwMx2S0r1SYMyyQ5qiMNN7165pf49N7NS8
	tp4HxfKf+XoqjfI9b42yodmxNBh5tFTKQ55DCHE6I4fYls3YqjoYj67j5RtWDWBrfLtP
	k8gtfvSJ6MZ+RCZiptyrzRYj9BujN1vh32Chx8F4wXz9XUrojBpiJiFuGRBTRjh5RjOX
	WbyFEf95mUIP4lThp7RtnVqmVDCjHSJ+MQ6P2nLMtk9kW6b2XhzamwjjcJqd9CMAWtGm
	11kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=t5sXXsZXJFaM7fjRQyOA5iStHhPjNjvDyjLHdyu2HtM=;
	b=bAxo/8ZOFphILD0+xHeikkS4r5isqNuuvZE95CoMfM3hLcAryWlDOTTRmizFiw/fHU
	oINZ1Rjb5GLccBU/nXJ9X9lg2DcJWtVHFE7g1pYvwFTUuxbmr2LFtvS07/bHT2rdcn0z
	4OSFdnKGhHSwLK/mPYnCU3iQ34UrdtyoP3rziJRLK63S3eLi8fxzL0Xh36QPnuVvaSZv
	J9fBkzjkLgtGgQUPa4v7fu8a6uHvRLg2yeT13mxynTxglAX46ZkFBEMh/cwum3C27VF3
	DZWNU3+3XyC9DXoCyS5TUEnIpnmRkQKovUxPuaHXMyCL/uHQiIEtESNY1tk5e6sX5mZW
	hiBA==
X-Gm-Message-State: ALoCoQnEEUxGXl8+v6Ecud1dOFtP4KSvrAVyC3ZuuVJ0auC0oWBJBfBcqXmV/zeLy3lJVds4sWRsuQeJgY1JfW8GoNwafvfjvA==
X-Received: by 10.31.48.132 with SMTP id w126mr9092799vkw.5.1452883775747;
	Fri, 15 Jan 2016 10:49:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Fri, 15 Jan 2016 10:49:16 -0800 (PST)
In-Reply-To: <553CB94E-A5FB-430B-B420-52147BD211BF@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
	<82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
	<CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
	<41A6B023-03C6-48E4-B3EC-E1BA1F073B70@gmail.com>
	<CADySD0G13gzng3be=EH6ZBefENDYF8467F3ugj72=AtskY8_XA@mail.gmail.com>
	<CB59531F-3C61-4F1E-867E-CA969B1874EE@gmail.com>
	<CADySD0E0zLEiyujLeXrQ226wPNMKVF4smGjG9U-zXRyVxqOL=A@mail.gmail.com>
	<553CB94E-A5FB-430B-B420-52147BD211BF@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 16 Jan 2016 07:49:16 +1300
Message-ID: <CADySD0G98pOstzxVuxQjoBZM+McXT1o7fKBdCmdOFrTPjJg3ZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Fri, 15 Jan 2016 18:49:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In the last step, I am getting this error now:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-core-standalone-sdk-target:
 *     libgcov-dev *
 * opkg_install_cmd: Cannot install package
packagegroup-core-standalone-sdk-target.

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in:
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8hf-vfp-neon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp=
/log.do_populate_sdk.65427
ERROR: Task 8
(/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'

Complete log @ http://pastebin.com/CNuJk2i2

I have tried removing previous build tmp/work but still get this error on
fresh builds.

thanks

On Fri, Jan 15, 2016 at 7:14 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 14, 2016, at 1:08 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > that fixed the problem, thanks for the help.
> >
> > Any reason why this patch is not accepted ?
>
> it=E2=80=99d s link to an upstreamed patch. If its missing in OE then pro=
pose it
> to OE recipe
>
> >
> > On Thu, Jan 14, 2016 at 8:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> issue seems to be typeof usage when using c99
> >> especially this from bluetooth.h
> >>
> >> #define bt_put_unaligned(val,ptr) do { struct __attribute__((packed)) =
{
> >> typeof(*(ptr)) __v; } *__p =3D (typeof(__p)) (ptr); __p->__v =3D (val)=
; }
> >> while(0)
> >>
> >> change typeof with __typeof__ in above macro.
> >>
> >> or back port
> >>
> >>
> >>
> http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d=
20ccca22a7a1f53e46ef8abfca8
> >>
> >> into your version of bluez
> >>
> >>
> >>
> >>> On Jan 13, 2016, at 1:59 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >>>
> >>> here is the full log file
> >>> https://gist.github.com/anonymous/d6db184bff49736e1121
> >>>
> >>> In case log file above is truncated:
> >>>
> >>
> https://gist.githubusercontent.com/anonymous/d6db184bff49736e1121/raw/b6d=
d87cf3745c91d958e253c3332cc22772a1f0a/qnetworkinfo_linux.cpp
> >>>
> >>>
> >>> On Tue, Jan 12, 2016 at 5:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>>> No. you need to use complete cmdline that is used while compiling it
> >>>> originally to produce the error
> >>>>
> >>>>> On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>> I posted the complete log file.
> >>>>>
> >>>>> I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
> >>>>> Maybe it is not enough. I'll try with complete command having inclu=
de
> >>>> paths
> >>>>> and see if it improves anything.
> >>>>>
> >>>>> On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >>>>>
> >>>>>>
> >>>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
> >>>>>> fatal error: qnetworkinfo.h: No such file or directory
> >>>>>>
> >>>>>>
> >>>>>> Please post complete file
> >>>>>>
> >>>>>>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com=
>
> >>>>>> wrote:
> >>>>>>>
> >>>>>>> thanks
> >>>>>>>
> >>>>>>> here it is..
> https://gist.github.com/anonymous/a03e9fb2203e45a4b033
> >>>>>>>
> >>>>>>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com>
> >> wrote:
> >>>>>>>
> >>>>>>>>
> >>>>>>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <
> ankur.tyagi85@gmail.com>
> >>>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>> sorry it took me a while to reply.
> >>>>>>>>>
> >>>>>>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
> >>>>>>>>>
> >>>>>>>>> I have preprocess
> >>>>>>>>> =E2=80=8B =E2=80=8B
> >>>>>>>>> =E2=80=8B=E2=80=8B
> >>>>>>>>> log but looks like pastebin is down. Ok to send the log as
> >>>> attachment ?
> >>>>>>>>
> >>>>>>>> http://alternativeto.net/software/pastebin/
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com>
> >>>> wrote:
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <
> >> ankur.tyagi85@gmail.com
> >>>>>
> >>>>>>>>>> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting
> the
> >>>>>> same
> >>>>>>>>>> error
> >>>>>>>>>>
> >>>>>>>>>> what version of gcc are you using and can you preprocess the
> file
> >>>>>> under
> >>>>>>>>>> error with -E -dD and pastebin it ?
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.co=
m
> >
> >>>>>> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
> >>>>>>>> ankur.tyagi85@gmail.com>
> >>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-to=
olchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> >>>>>>>>>>>>> error: expected identifier before '*' token
> >>>>>>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
> >>>>>>>>>>>>
> >>>>>>>>>>>> this means that stdint.h is missing from includes.
> >>>>>>>>>>>> --
> >>>>>>>>>>>> _______________________________________________
> >>>>>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>>>>>
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>>>>>>>
> >>>>>>>>>>> --
> >>>>>>>>>>> _______________________________________________
> >>>>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>>>>
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> --
> >>>>>>>>>> _______________________________________________
> >>>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>>>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> _______________________________________________
> >>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>> _______________________________________________
> >>>>>>>> Openembedded-devel mailing list
> >>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
> >>>>>>>>
> >>>>>>>>
> >>>>>>> --
> >>>>>>> _______________________________________________
> >>>>>>> Openembedded-devel mailing list
> >>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>>
> >>>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >>>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

