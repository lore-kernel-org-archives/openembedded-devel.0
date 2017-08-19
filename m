Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D0C997836A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 17:38:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r62so874044pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Swk1XEBtw1S9CQ09O+0ukrycO/rgGk0WO6mtRAm5EoM=;
	b=Fi2+upEl6G07ynLCJ6YjxDy9/1zX8im5R4NKqBglhVjQShtaruaEmkAfC37MSB7zri
	NOe5NVFu2Te68sqLya8EfedSKoV7YTNFMsBicqWdqvds78I3S/AT6EI+IppNh+Ti4m7n
	wEbH5x37rKI7ZtZd066rxVh5VCSJHkWi/8D92ydtOcYMP0tSD7BVbdY6+QMKlLLim0zn
	K9jsmWwI7z8TEq91sTavdhFoMv9lIn7cxXbqGgV0HcZyvQ4qoqG9o/xbWpXPWDsfYdzW
	aU+fggFakeDYf9FsyS42HWgsVVtP6bHyhh40e/BiDsvZg1tc7LsJoiR2BqR2UnqG9Nd+
	Mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Swk1XEBtw1S9CQ09O+0ukrycO/rgGk0WO6mtRAm5EoM=;
	b=Bnk1RUBXrGZP/3GmcgYKgnMlMragBL9+CPafANQqVptCN9OGpOhRcKgun/FWpC3llE
	ICHEKlqJ6sVA56onT9DlcxnU29K6wiI2IjHg5lEe6x9o5JToLDuahwnTu1jUJQBZj1UU
	y75DoQTjFQiF0K7r2aDvdYS5Mk3JH/YwkpTb5NFQJZ8y8edC6JXyEGS3+v/riYnahM4x
	ZA+n/k24wUpEkCNX7Stjkpyes/E1GUyYvbWsaI2qJjMn8UBAc466YVVlokk1BtAs/tmx
	BRcHVMbBOZdkC4gBhB5GhCQ0kASidc2qKlpkeJ5mOlbm89ZONOYJtAAXDWrKV8zwEsal
	CVEg==
X-Gm-Message-State: AHYfb5hYXuEc3C1E6cdzYXSpuzhdP/AkpTWLE2OuIUsCZEbkZD1JDPSx
	ctQzsnjYBKBl+cz8v9p9YWrrSgJjkw==
X-Received: by 10.84.133.14 with SMTP id 14mr13782915plf.440.1503164293944;
	Sat, 19 Aug 2017 10:38:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sat, 19 Aug 2017 10:37:43 -0700 (PDT)
In-Reply-To: <CA+chaQcOp=F=F0B=HzEO=Qfyk2Ai-_i5QGK1YF+Eqg2mfLZDew@mail.gmail.com>
References: <20170819103325.16967-1-Martin.Jansa@gmail.com>
	<CAMKF1srJyq2L8eqUUaGCJ+ZUZChOPAniS0OJF-hAuF+s3sQHZA@mail.gmail.com>
	<CA+chaQcOp=F=F0B=HzEO=Qfyk2Ai-_i5QGK1YF+Eqg2mfLZDew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2017 10:37:43 -0700
Message-ID: <CAMKF1srNZMwXWV_SH4+v-9_0V+QApwFjt3To1S7912LH=5qwQA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
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
X-List-Received-Date: Sat, 19 Aug 2017 17:38:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 19, 2017 at 10:34 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> The -Wno-format is added for whole openh264 directory (I haven't checked
> why), so at least this whole directory shouldn't use -Wformat-security or
> -Wno-format should be removed/restricted to some files from gyp files for
> 5.8 and from gn files for 5.9.

OK. I guess in this case if you added to gyp files along with -Wno-format
would be nicer but then order of SECURITY_FLAGS might be problematic
you might have to check they come before the gyp files specified flags

>
> On Sat, Aug 19, 2017 at 6:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, Aug 19, 2017 at 3:33 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > * meta/conf/distro/include/security_flags.inc adds -Wformat and
>> >   -Wformat-security, but openh264 adds -Wno-format after that causing
>> >   build to fail
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  recipes-qt/qt5/qtwebengine_git.bb | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb
>> > b/recipes-qt/qt5/qtwebengine_git.bb
>> > index 45b885c..830e640 100644
>> > --- a/recipes-qt/qt5/qtwebengine_git.bb
>> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
>> > @@ -34,6 +34,14 @@ EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
>> >  "
>> >  EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja
>> > -no-feature-system-gn"
>> >
>> > +# chromium/third_party/openh264/openh264.gyp adds
>> > +# -Wno-format to openh264_cflags_add
>> > +# similarly chromium/third_party/openh264/BUILD.gn for newer
>> > qtwebengine
>> > +# causing following error, because -Wformat-security cannot be used
>> > together with -Wno-format
>> > +# cc1plus: error: -Wformat-security ignored without -Wformat
>> > [-Werror=format-security]
>> > +# http://errors.yoctoproject.org/Errors/Details/150333/
>> > +SECURITY_STRINGFORMAT = ""
>> > +
>>
>> If its not happening in lot of files may be doing something like
>>
>>  QT_WARNING_PUSH
>>  QT_WARNING_DISABLE_GCC("-Wformat-security")
>> #ifdef __clang__
>> QT_WARNING_DISABLE_CLANG("-Wformat-security")
>> #endif
>> ....
>>
>> QT_WARNING_POP
>>
>> is more targeted as it can be done per file.
>>
>> >  # To use system ffmpeg you need to enable also libwebp, opus, vpx
>> >  # Only depenedencies available in oe-core are enabled by default
>> >  PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
>> > --
>> > 2.14.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

