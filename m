Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 447B660556
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:30:17 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so432569pdb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pyUAdy2RRbJQhmjSyvS3KCPbuHHDXWmwTDnByWQMgQw=;
	b=bBOSiW32xk6aLELwZ94IuwKDEHE487h+O2Fhb7y091he26B0/fYLiWHlX37hqFqaE/
	Cdra21ZmkcsSBXygXRp3dCvk+k8OraFmSPB0atFasMqgRG2cs+zmF6oYQN0HyebiXe5x
	1XL3ns2eiVoRERA0YPJKCJWEy487hITauH4rcGfRe9yYv7jNIELieoZSGO5jOaoxrgsV
	iwKk/2eogr5fGzKKlNtkz2zj7C7RUmJz35an1f9DSeaN0IWLO/yA0m7XvPm41FU+bggG
	RqERDfrB0Mnfi0CWYdQrtudvDuXRvPzyeFlnqktbJfojYBHP2RLGD9Uc+QRXYkU57na7
	8CEg==
MIME-Version: 1.0
X-Received: by 10.68.136.7 with SMTP id pw7mr8502560pbb.168.1424359818025;
	Thu, 19 Feb 2015 07:30:18 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Thu, 19 Feb 2015 07:30:17 -0800 (PST)
In-Reply-To: <20150219144746.GB2311@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
	<20150218160919.GB2276@jama>
	<CALbNGRSSk=gNtvn=nwkLqO=BwPF7+WmL6hpQFdvSRXn5u_kJoA@mail.gmail.com>
	<20150219144746.GB2311@jama>
Date: Thu, 19 Feb 2015 16:30:17 +0100
Message-ID: <CALbNGRRMOfs+b8EwGNjU7cP_ifBR2xbNW=5jrVntC9A5TVfGmA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/5] qtbase: remove patches required for native(-sdk) only
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
X-List-Received-Date: Thu, 19 Feb 2015 15:30:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 3:47 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 18, 2015 at 06:35:33PM +0100, Andreas M=C3=BCller wrote:
>> On Wed, Feb 18, 2015 at 5:09 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Tue, Jan 27, 2015 at 06:53:49AM +0100, Andreas M=C3=BCller wrote:
>> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >
>> > Are you sure these are useful only for native(sdk) only?
>> >
>> > FYI: I'm updating your patches for latest revision in 5.4 branch, I'll
>> > update them together with 5.4.1 recipes (when 5.4.1 is released).
>> >
>> > Regards,
>> >
>> >> ---
>> >>  recipes-qt/qt5/qtbase.inc    | 2 --
>> >>  recipes-qt/qt5/qtbase_git.bb | 2 --
>> >>  2 files changed, 4 deletions(-)
>> >>
>> >> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> >> index 5b2c08c..a8748ef 100644
>> >> --- a/recipes-qt/qt5/qtbase.inc
>> >> +++ b/recipes-qt/qt5/qtbase.inc
>> >> @@ -5,8 +5,6 @@ SRC_URI +=3D "\
>> >>      file://0001-Add-linux-oe-g-platform.patch \
>> >>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u=
.patch \
>> >>      file://0003-Add-external-hostbindir-option.patch \
>> >> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with=
.patch \
>> >> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.pat=
ch \
>> >>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.p=
atch \
>> >>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X.=
.patch \
>> >>      file://0008-configure-bump-path-length-from-256-to-512-character=
.patch \
>> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git=
.bb
>> >> index f67ea16..611e19a 100644
>> >> --- a/recipes-qt/qt5/qtbase_git.bb
>> >> +++ b/recipes-qt/qt5/qtbase_git.bb
>> >> @@ -10,8 +10,6 @@ SRC_URI +=3D "\
>> >>      file://0001-Add-linux-oe-g-platform.patch \
>> >>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u=
.patch \
>> >>      file://0003-Add-external-hostbindir-option.patch \
>> >> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with=
.patch \
>> >> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.pat=
ch \
>> >>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.p=
atch \
>> >>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X.=
.patch \
>> >>      file://0008-configure-bump-path-length-from-256-to-512-character=
.patch \
>> >> --
>> >> 1.8.3.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> First of all thanks for doing this: I have these patches on my TODO
>> but have other issues of higher priorities (ask my boss) to fix.
>
> In the end the fix was simple..
> 0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
> wasn't refreshed in qtbase-git directory, now it builds fine, I'll push
> it to master soon.
>
>> Answering your question frankly: No I am not 100% sure these patches
>> can be removed from target build..
>>
>> * 0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch: If
>> I don't go wrong here configureapp is the windows-replacement for
>> configure script -> this patch is not needed AT ALL (except we build
>> for windows which we usually don't).
>
> Ah right, it was looking a bit different at 5.0.0 version and now after
> many rebases it really looks useless, will drop with 5.4.1 (and now in
> git recipe).
>
>> * 0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch:
>> Intention here was to keep target sysroot clean of host paths - as
>> this patch was part qt-creator series. Raphael Philipe reported
>> failures for -L/usr/lib when building qt5-creator I'd suggest to keep
>> this patch in.
>
> OK, thanks.
>
> I've refreshed b5.4-shared b5.4-native b5.4-nativesdk b5.4-target
> branches at https://github.com/meta-qt5/qtbase this will be used to
> refresh patches for 5.4.1 recipes.
>
> --
Ehm - I checked at github but I don't really look though the branch
systematics. As 5.4.1 is near and I have tons of KDE/Hawai/LxQt stuff
around for build test: Which branch should I use (qt/git-versions
enabled)?

Andreas

