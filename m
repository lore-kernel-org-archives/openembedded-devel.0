Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4105E605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2016 17:20:50 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id i129so182927053vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2016 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fUJ2QS0xtnl6c6sCmPJuBv9HEYWVd95p4VeKL3FfmNo=;
	b=xsq3pT6dBTJcX/nUvNmsN0GtLjCB3DQjGfQTkOll9KPg65ZbTWHa7llUr2rHXebBFl
	P6HKo0/AzxhkOwSttpVxyDmb+QVmT3DTe6M721dL8Me9iLUwSQzVKR4X+WpSxAHoZrGN
	RKTKgsQkzJelarSMmN5iDpgy7/ozBxzesklgQVuC/D7uVwNBga6nZ3iy/DS+60AK2xmn
	LQOuSHVCd/u5hCMIZmN340uJJ7iG4nIsyXcME8+XDRbf43rw5d75w/LOWANw79J6YWnM
	XhE9FIort0FAu892RYA6D415dS75AG9dsuWqiINvSSZmFnaq4rAvni+4dE2PuwIdH9nr
	hagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=fUJ2QS0xtnl6c6sCmPJuBv9HEYWVd95p4VeKL3FfmNo=;
	b=J2xNX+WTAjoehjLFsbKu5rrOOtI4EWKjbgA269gc8ByhCXHj5WNnHGT4Y8XU5NqY9M
	z9EZfBZ2XfhZJ/Vfi8UZ3FqQSYMaiU5Pxly6c4arf1PCw1v+3DYykaH1Qe5UV9Puwwl6
	AMNpBkBu+hyny1jBNl2gd1qEkTa9PQMMH51ehnS+Q8Gi0aASJ/2TYuAo6b5wLWQkK9jG
	cKlXG6ifni43+dXPTvwXb90RKJHriFcXC4k2wp17BjOmy8oaI0sI5kM8h/ccjsRYMXFZ
	jin865KIp+g4P54X8oYbwC8818fnQApgGpyFUyUiacY8q12kT9wZwo6hlXsM+/6ni1rs
	Fnpw==
X-Gm-Message-State: ALoCoQmvdTaF62/zuhK1zlEKI5Ftrlj5ea1DtDUBmCDKCymBgXKvIKYcLU0Ph3kfzn7i/Gu6agdyjyNCnHTuwSolrLnZs3V9TA==
MIME-Version: 1.0
X-Received: by 10.31.48.132 with SMTP id w126mr14977662vkw.5.1453051251410;
	Sun, 17 Jan 2016 09:20:51 -0800 (PST)
Received: by 10.31.166.146 with HTTP; Sun, 17 Jan 2016 09:20:51 -0800 (PST)
Received: by 10.31.166.146 with HTTP; Sun, 17 Jan 2016 09:20:51 -0800 (PST)
In-Reply-To: <CADySD0G98pOstzxVuxQjoBZM+McXT1o7fKBdCmdOFrTPjJg3ZA@mail.gmail.com>
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
	<CADySD0G98pOstzxVuxQjoBZM+McXT1o7fKBdCmdOFrTPjJg3ZA@mail.gmail.com>
Date: Mon, 18 Jan 2016 06:20:51 +1300
Message-ID: <CADySD0G3frF_pnmxXhPMEc4DsW-CUN1pk6t-XRwnksB=Hi=oog@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
X-List-Received-Date: Sun, 17 Jan 2016 17:20:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Shall I start a new thread for this error ?

On 16-Jan-2016 7:49 am, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:
>
> In the last step, I am getting this error now:
>
>
> Collected errors:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for packagegroup-core-standalone-sdk-target:
>  *     libgcov-dev *
>  * opkg_install_cmd: Cannot install package
packagegroup-core-standalone-sdk-target.
>
> ERROR: Function failed: do_populate_sdk
> ERROR: Logfile of failure stored in:
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8hf-vfp-neon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp=
/log.do_populate_sdk.65427
> ERROR: Task 8
(/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'
>
> Complete log @ http://pastebin.com/CNuJk2i2
>
> I have tried removing previous build tmp/work but still get this error on
fresh builds.
>
> thanks
>
>
> On Fri, Jan 15, 2016 at 7:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> > On Jan 14, 2016, at 1:08 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:
>> >
>> > that fixed the problem, thanks for the help.
>> >
>> > Any reason why this patch is not accepted ?
>>
>> it=E2=80=99d s link to an upstreamed patch. If its missing in OE then pr=
opose it
>> to OE recipe
>>
>> >
>> > On Thu, Jan 14, 2016 at 8:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> issue seems to be typeof usage when using c99
>> >> especially this from bluetooth.h
>> >>
>> >> #define bt_put_unaligned(val,ptr) do { struct __attribute__((packed))
{
>> >> typeof(*(ptr)) __v; } *__p =3D (typeof(__p)) (ptr); __p->__v =3D (val=
); }
>> >> while(0)
>> >>
>> >> change typeof with __typeof__ in above macro.
>> >>
>> >> or back port
>> >>
>> >>
>> >>
http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d20=
ccca22a7a1f53e46ef8abfca8
>> >>
>> >> into your version of bluez
>> >>
>> >>
>> >>
>> >>> On Jan 13, 2016, at 1:59 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >> wrote:
>> >>>
>> >>> here is the full log file
>> >>> https://gist.github.com/anonymous/d6db184bff49736e1121
>> >>>
>> >>> In case log file above is truncated:
>> >>>
>> >>
https://gist.githubusercontent.com/anonymous/d6db184bff49736e1121/raw/b6dd8=
7cf3745c91d958e253c3332cc22772a1f0a/qnetworkinfo_linux.cpp
>> >>>
>> >>>
>> >>> On Tue, Jan 12, 2016 at 5:50 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
>> >>>
>> >>>> No. you need to use complete cmdline that is used while compiling i=
t
>> >>>> originally to produce the error
>> >>>>
>> >>>>> On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >>>> wrote:
>> >>>>>
>> >>>>> I posted the complete log file.
>> >>>>>
>> >>>>> I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
>> >>>>> Maybe it is not enough. I'll try with complete command having
include
>> >>>> paths
>> >>>>> and see if it improves anything.
>> >>>>>
>> >>>>> On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com>
wrote:
>> >>>>>
>> >>>>>>
>> >>>>
>> >>
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+057=
7ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
>> >>>>>> fatal error: qnetworkinfo.h: No such file or directory
>> >>>>>>
>> >>>>>>
>> >>>>>> Please post complete file
>> >>>>>>
>> >>>>>>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.co=
m
>
>> >>>>>> wrote:
>> >>>>>>>
>> >>>>>>> thanks
>> >>>>>>>
>> >>>>>>> here it is..
https://gist.github.com/anonymous/a03e9fb2203e45a4b033
>> >>>>>>>
>> >>>>>>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com>
>> >> wrote:
>> >>>>>>>
>> >>>>>>>>
>> >>>>>>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <
ankur.tyagi85@gmail.com>
>> >>>>>>>> wrote:
>> >>>>>>>>>
>> >>>>>>>>> sorry it took me a while to reply.
>> >>>>>>>>>
>> >>>>>>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>> >>>>>>>>>
>> >>>>>>>>> I have preprocess
>> >>>>>>>>> =E2=80=8B =E2=80=8B
>> >>>>>>>>> =E2=80=8B=E2=80=8B
>> >>>>>>>>> log but looks like pastebin is down. Ok to send the log as
>> >>>> attachment ?
>> >>>>>>>>
>> >>>>>>>> http://alternativeto.net/software/pastebin/
>> >>>>>>>>
>> >>>>>>>>>
>> >>>>>>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com>
>> >>>> wrote:
>> >>>>>>>>>
>> >>>>>>>>>>
>> >>>>>>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <
>> >> ankur.tyagi85@gmail.com
>> >>>>>
>> >>>>>>>>>> wrote:
>> >>>>>>>>>>>
>> >>>>>>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still
getting the
>> >>>>>> same
>> >>>>>>>>>> error
>> >>>>>>>>>>
>> >>>>>>>>>> what version of gcc are you using and can you preprocess the
file
>> >>>>>> under
>> >>>>>>>>>> error with -E -dD and pastebin it ?
>> >>>>>>>>>>
>> >>>>>>>>>>>
>> >>>>>>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <
raj.khem@gmail.com>
>> >>>>>> wrote:
>> >>>>>>>>>>>
>> >>>>>>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
>> >>>>>>>> ankur.tyagi85@gmail.com>
>> >>>>>>>>>>>> wrote:
>> >>>>>>>>>>>>>
>> >>>>>>>>>>>>
>> >>>>>>>>>>
>> >>>>>>>>
>> >>>>>>
>> >>>>
>> >>
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>> >>>>>>>>>>>>> error: expected identifier before '*' token
>> >>>>>>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>> >>>>>>>>>>>>
>> >>>>>>>>>>>> this means that stdint.h is missing from includes.
>> >>>>>>>>>>>> --
>> >>>>>>>>>>>> _______________________________________________
>> >>>>>>>>>>>> Openembedded-devel mailing list
>> >>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>>>>>>>
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>>>>>>>
>> >>>>>>>>>>> --
>> >>>>>>>>>>> _______________________________________________
>> >>>>>>>>>>> Openembedded-devel mailing list
>> >>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>>>>>>
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>>>>>
>> >>>>>>>>>>
>> >>>>>>>>>> --
>> >>>>>>>>>> _______________________________________________
>> >>>>>>>>>> Openembedded-devel mailing list
>> >>>>>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>>>>>
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>>>>>
>> >>>>>>>>>>
>> >>>>>>>>> --
>> >>>>>>>>> _______________________________________________
>> >>>>>>>>> Openembedded-devel mailing list
>> >>>>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>>>>
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>>>
>> >>>>>>>>
>> >>>>>>>> --
>> >>>>>>>> _______________________________________________
>> >>>>>>>> Openembedded-devel mailing list
>> >>>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>>>
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>>>
>> >>>>>>>>
>> >>>>>>> --
>> >>>>>>> _______________________________________________
>> >>>>>>> Openembedded-devel mailing list
>> >>>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
>> >>>>>>
>> >>>>>>
>> >>>>>> --
>> >>>>>> _______________________________________________
>> >>>>>> Openembedded-devel mailing list
>> >>>>>> Openembedded-devel@lists.openembedded.org
>> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>>>
>> >>>>>>
>> >>>>> --
>> >>>>> _______________________________________________
>> >>>>> Openembedded-devel mailing list
>> >>>>> Openembedded-devel@lists.openembedded.org
>> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>
>> >>>>
>> >>>> --
>> >>>> _______________________________________________
>> >>>> Openembedded-devel mailing list
>> >>>> Openembedded-devel@lists.openembedded.org
>> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>>
>> >>>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

