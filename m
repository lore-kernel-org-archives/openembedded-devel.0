Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A6AE17182C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 17:35:32 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so2538971pdj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qB5i0RcePq8rKHjbmFx4thx2FmFERuAqui9TDvWsX/8=;
	b=ePM5FANDzkTUFekoVFaQOTaLAoV4/pU5zE5OnBD/cVP3r1dipfpHDsEO4YFQnvUHuw
	n+VaG9iHXepPtWOK/mWpAgIIWovd9gBrnA6XaugrQod+2C8pzJtiJYpxjCVW2IzwDUjw
	4PmNdUs8bkSuVujmteaqIlq8L01Yzq/jYgxU3ZiAlutVbYZ6w3ik+E/Wd+E+bHQW+ejE
	25tOmYOpPxvAVSC0IvWGsJNCErylBQGbHSE134xbgg2LUl8XMnaDybTxKlQK7bWcAs+S
	HOvzz4S8taM4RV8lOxd8gcsU/tuLGjMGt2WX7mrOtRcfUfiyMO5UDL3RoqqV2ooKb7Nk
	Ph+A==
MIME-Version: 1.0
X-Received: by 10.67.6.225 with SMTP id cx1mr552751pad.1.1424280933601; Wed,
	18 Feb 2015 09:35:33 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Wed, 18 Feb 2015 09:35:33 -0800 (PST)
In-Reply-To: <20150218160919.GB2276@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
	<20150218160919.GB2276@jama>
Date: Wed, 18 Feb 2015 18:35:33 +0100
Message-ID: <CALbNGRSSk=gNtvn=nwkLqO=BwPF7+WmL6hpQFdvSRXn5u_kJoA@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Feb 2015 17:35:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 5:09 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Jan 27, 2015 at 06:53:49AM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Are you sure these are useful only for native(sdk) only?
>
> FYI: I'm updating your patches for latest revision in 5.4 branch, I'll
> update them together with 5.4.1 recipes (when 5.4.1 is released).
>
> Regards,
>
>> ---
>>  recipes-qt/qt5/qtbase.inc    | 2 --
>>  recipes-qt/qt5/qtbase_git.bb | 2 --
>>  2 files changed, 4 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> index 5b2c08c..a8748ef 100644
>> --- a/recipes-qt/qt5/qtbase.inc
>> +++ b/recipes-qt/qt5/qtbase.inc
>> @@ -5,8 +5,6 @@ SRC_URI +=3D "\
>>      file://0001-Add-linux-oe-g-platform.patch \
>>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pa=
tch \
>>      file://0003-Add-external-hostbindir-option.patch \
>> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.pa=
tch \
>> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch =
\
>>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patc=
h \
>>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..pa=
tch \
>>      file://0008-configure-bump-path-length-from-256-to-512-character.pa=
tch \
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index f67ea16..611e19a 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -10,8 +10,6 @@ SRC_URI +=3D "\
>>      file://0001-Add-linux-oe-g-platform.patch \
>>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pa=
tch \
>>      file://0003-Add-external-hostbindir-option.patch \
>> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.pa=
tch \
>> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch =
\
>>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patc=
h \
>>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..pa=
tch \
>>      file://0008-configure-bump-path-length-from-256-to-512-character.pa=
tch \
>> --
>> 1.8.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
First of all thanks for doing this: I have these patches on my TODO
but have other issues of higher priorities (ask my boss) to fix.

Answering your question frankly: No I am not 100% sure these patches
can be removed from target build..

* 0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch: If
I don't go wrong here configureapp is the windows-replacement for
configure script -> this patch is not needed AT ALL (except we build
for windows which we usually don't).
* 0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch:
Intention here was to keep target sysroot clean of host paths - as
this patch was part qt-creator series. Raphael Philipe reported
failures for -L/usr/lib when building qt5-creator I'd suggest to keep
this patch in.

Andreas

