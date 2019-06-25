Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3FF27D5C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 09:06:04 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x25so15478604ljh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 02:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=czjvLrGcwQZO9qGeJeT036HFGAQ7ZvjnFCOcoLD53KY=;
	b=A/1SCN82PJxKi+op5pBYvDPSOptIWfw2zWdpPfUkMnkaoamjsbiWhDYXERvVzuhMha
	1BV0NPTenF+pjj5BskdH8Aap6kOEuboX4u5x4vUBfZD+6uS7RR1GnyqIsVJ0Y/n4dksw
	qpomvQ6oHmHhdRv19g7wcSbZ+qEqTlPbJIbQOo11CqqIkgOVm/CrBW64G924yqWzLUn9
	uUJ0s3r3cVnxJUmjZWRY8ISFicaPcLhViwFU4PIiSqm7OPqvBwTnus1++Yt4NUreSz7W
	wn9UQyJf2yQBumLHox+agExfxsk8LnyGhc80VAuPV7j5yo0dHwPWcIyv4IUY4nMmbaal
	nZNA==
X-Gm-Message-State: APjAAAWEGopvvE0Ool6fjnwPP7m6PsaShdFt4jIR8GpAAro0TW04wOrk
	qvl3jesMidtDhPBAsukqSr+EDMYwFZo7w1agZUU=
X-Google-Smtp-Source: APXvYqzinENQN5s9Kj4bB9b0AZx8HCa7XjvWlpgOM0koqk5qYsIj34dwfoXIPBn4qd5jNqECvo81qvFTa737uCtru6A=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr13620719lja.94.1561453565376; 
	Tue, 25 Jun 2019 02:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190625075223.13585-1-ricardo@ribalda.com>
	<20190625075223.13585-2-ricardo@ribalda.com>
	<3f5e60b7-c850-f052-88e7-cd41d1d4d65c@mikrodidakt.se>
	<CAPybu_0Kpt2mTGBWpWC_7ZnNoM3gLEYn9S3kJnrshMBmqkurTA@mail.gmail.com>
	<CAPybu_0XSbxwpbiUvCSf=fGfc7VpadRPNSZ9v-jSMi6wcHn-EQ@mail.gmail.com>
	<11924260-4718-e57b-9684-728e5ded0a4f@mikrodidakt.se>
In-Reply-To: <11924260-4718-e57b-9684-728e5ded0a4f@mikrodidakt.se>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Tue, 25 Jun 2019 11:05:48 +0200
Message-ID: <CAPybu_1h3RqMjQ-B=4PzToLYTaaooP+RBAwLS6AK__tHmXkSBA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 01/23] icedtea7: Add x11 as default pkgconfig
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
X-List-Received-Date: Tue, 25 Jun 2019 09:06:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 25, 2019 at 11:04 AM Jacob Kroon <jacob.kroon@mikrodidakt.se> w=
rote:
>
> Hi Ricardo,
>
> FYI, I notice that we have gone off-list.

Sorry, not on purpose :S

Will try also with that

thanks

>
> You probably need to add more dependencies as you iterate the builds.
>
> It looks like "libx11-native" is missing now.
>
> /Jacob
>
> On 6/25/19 10:57 AM, Ricardo Ribalda Delgado wrote:
> > Hi Jacob
> >
> > Unfortunately it crashes at do_compile: :(
> >
> > build-boot/tmp/sun/sun.awt/awt/obj64/Disposer.o
> > ../../../src/share/native/sun/awt/../java2d/Disposer.c
> > | In file included from
> > ../../../src/share/native/sun/awt/../java2d/pipe/Region.h:34:0,
> > |                  from
> > ../../../src/share/native/sun/awt/../java2d/pipe/Region.c:30:
> > | ../../../src/solaris/native/sun/awt/utility/rect.h:31:22: fatal
> > error: X11/Xlib.h: No such file or directory
> > |  #include <X11/Xlib.h>
> > |                       ^
> > | compilation terminated.
> > | make[6]: *** [/workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.=
1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/common/internal/NativeCo=
mpileRules.gmk:75:
> > /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea=
-2.1.3/build/openjdk.build-boot/tmp/sun/sun.awt/awt/obj64/Region.o]
> > Error 1
> > | make[6]: *** Waiting for unfinished jobs....
> >
> > So the initial proposal stays. Unless you want to fix it :P
> >
> > Cheers!
> >
> > On Tue, Jun 25, 2019 at 10:44 AM Ricardo Ribalda Delgado
> > <ricardo@ribalda.com> wrote:
> >>
> >> Hi Jacob
> >>
> >>
> >> On Tue, Jun 25, 2019 at 10:35 AM Jacob Kroon <jacob.kroon@mikrodidakt.=
se> wrote:
> >>>
> >>> Hi Ricardo,
> >>>
> >>> On 6/25/19 9:52 AM, Ricardo Ribalda Delgado wrote:
> >>>> Seems to be a basic dependency, not optional.
> >>>>
> >>>> Fixes:
> >>>> | checking X11/X.h usability... no
> >>>> | checking X11/X.h presence... no
> >>>> | checking for X11/X.h... no
> >>>> | configure: error: "xorg headers were not found -
> >>>> | try installing xorg-x11-proto-devel."
> >>>> | NOTE: The following config.log files may provide further informati=
on.
> >>>> | NOTE: /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r=
1.0/icedtea-2.1.3/build/config.log
> >>>> | ERROR: configure failed
> >>>> | WARNING: exit code 1 from a shell command.
> >>>> | ERROR: Function failed: do_configure (log file is located at /work=
dir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_conf=
igure.29594)
> >>>> ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/icedtea/ic=
edtea7-native_2.1.3.bb:do_configure) failed with exit code '1'
> >>>>
> >>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> >>>> ---
> >>>>    recipes-core/icedtea/icedtea7-native.inc | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core=
/icedtea/icedtea7-native.inc
> >>>> index 69f5d25..747bb72 100644
> >>>> --- a/recipes-core/icedtea/icedtea7-native.inc
> >>>> +++ b/recipes-core/icedtea/icedtea7-native.inc
> >>>> @@ -11,7 +11,7 @@ DEPENDS =3D "virtual/javac-native virtual/java-nat=
ive classpath-native \
> >>>>       unzip-native make-native util-linux-native\
> >>>>              "
> >>>>
> >>>> -PACKAGECONFIG ??=3D ""
> >>>> +PACKAGECONFIG ??=3D "x11"
> >>>>    PACKAGECONFIG[x11] =3D ",--disable-headful,libx11-native xorgprot=
o-native libxt-native libxext-native libxrender-native"
> >>>>
> >>>>    OEMAKE_BUILD_HEADLESS_ONLY =3D "${@bb.utils.contains('PACKAGECONF=
IG', 'x11', '', 'BUILD_HEADLESS_ONLY=3D1', d)}"
> >>>>
> >>>
> >>> I have run into this as well; instead of turning on x11 by default,
> >>> wouldn't it be better to add "xorgproto-native" to DEPENDS ? I doubt =
the
> >>> native build needs x11 support in most cases.
> >>
> >> That is definitely better. I have fixed the patch on
> >> https://github.com/ribalda/meta-java/commit/1f48e7d72ac9eeb45b5d9c872e=
95e3b32fd74f8d
> >>
> >> I will resend the set when I get more comments
> >>
> >> Thanks!
> >>
> >>>
> >>> /Jacob
> >>>
> >>>
> >>> [mikrodidakt]
> >>> Jacob Kroon =E2=80=A2 +46 46325040
> >>>
> >>> mikrodidakt.se =E2=80=A2 Skifferv=C3=A4gen 48, SE-224 78 LUND, Sweden
> >>>
> >>> Consultans since 1980 =E2=80=A2 SW, HW, Embedded Systems, Linux
> >>>
> >>>
> >>
> >>
> >> --
> >> Ricardo Ribalda
> >
> >
> >
>
>
> [mikrodidakt]
> Jacob Kroon =E2=80=A2 +46 46325040
>
> mikrodidakt.se =E2=80=A2 Skifferv=C3=A4gen 48, SE-224 78 LUND, Sweden
>
> Consultans since 1980 =E2=80=A2 SW, HW, Embedded Systems, Linux
>
>


--=20
Ricardo Ribalda

