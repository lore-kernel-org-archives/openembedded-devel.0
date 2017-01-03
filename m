Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 270DB6079F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 12:33:58 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id t196so25686214lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 04:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=lfiiA0wsANp+e0mVKWSmOzMr1nea3GUVJda/YljK+fo=;
	b=glhXCYcd/5+RdWEvIXdujeoj59oGQ4XVQ0eKzWLeVTOANio0EKLRE+M8u1VoknF0OE
	aujv7YgI1a/RjaPfP9qL/XC/3YeDe/6yIv2Xa6NYgP4mf4uuViClGevGht28HpGZEdIY
	Gp71seymYCPbRt8irZiYeFkTCXZrFhflfGHyGF+6fzMpbcFWsTl9zbDy0JEkk1vXb+Ob
	ak2dGnp6/hnbAinBEBJu2n22PYFo/JFj8ObSbu42QcX/ImzEBcWI2CCAU0gHJyGOabzX
	XIgMZekuuQDZSL9scPh/mFoZm7Dskh8McgsKmQdcqNFtnjSoVNFDOxCdrBWRGUpO3Xh9
	rV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=lfiiA0wsANp+e0mVKWSmOzMr1nea3GUVJda/YljK+fo=;
	b=t0EETu3O9vOMaQjJwuSl7X9Phd6YvDXfwUl2dEymKMUIUcCSKsyW3EGO8/Rzb/cUvF
	5izmcnfQ1i4J8LbKqE1JpdlHL0UNrLhaIMyR4ei+Aax3SYP4sqMyR/eEByvJyaEof2yh
	KIHex57RxvR4xIbyCtDn4qA96TIcEtDuqNm8wx2P/EwDoHVWAlM82iYwHT75as61bXwx
	Z8os1gaJuHXfvfxviRCC/YhLhMxu9h2Qgw7bN7z6UhkfLK3MaEF4IAHsg6NNPcIkfJhg
	Fjwd+kMRWScaPcXFfNOcXvI0l0lxydkugeHqqP5ljIhPxexWxJ9w7Jq1vG407SEWpo1r
	DDbw==
X-Gm-Message-State: AIkVDXKsNQmd3kb0PcY5zoSOCpjyngShfNVvcNv+abAtY72+5hc0J+Lw0loqYYfrf+Ze3K2C1LBTMPqMpgxnIQ==
X-Received: by 10.46.72.1 with SMTP id v1mr22844231lja.49.1483446837942; Tue,
	03 Jan 2017 04:33:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.166.65 with HTTP; Tue, 3 Jan 2017 04:33:57 -0800 (PST)
In-Reply-To: <20170102184751.GC3954@jama>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
	<bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
	<20170102184751.GC3954@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 3 Jan 2017 14:33:57 +0200
Message-ID: <CABXoSoUXF7y7w76bH7pWZa6oPwXzOtcSKeyRhoy-dHWQqb+ikQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Tue, 03 Jan 2017 12:33:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 2, 2017 at 8:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Dec 20, 2016 at 05:30:11PM +0200, Samuli Piippo wrote:
>> On 20.12.2016 17:05, Martin Jansa wrote:
>> > On Tue, Dec 20, 2016 at 04:58:49PM +0200, Samuli Piippo wrote:
>> >> On 20.12.2016 16:30, Martin Jansa wrote:
>> >>> On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
>> >>>> Changes from v3 patch:
>> >>>> - sha1s updated to expected RC content
>> >>>> - fixed the qt3d assimp build-deps issue
>> >>>> - the new Qt configuration system taken into use where applicable
>> >>>>
>> >>>> webengine build problem with x86_64 host and x86 target is still there.
>> >>>
>> >>> This version seems to fail in qtwayland:
>> >>>
>> >>> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20161218_140914.log//2_max/failed/qtwayland.log
>> >>>
>> >>> | ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
>> >>> 'features.wayland-client && features.opengl && !features.opengles2 &&
>> >>> libs.xcomposite && libs.glx' failed.
>> >>
>> >> What kind of configuration is used for qtbase?
>> >> To me it seems that one of these checks fail: features.opengl &&
>> >> !features.opengles2
>> >
>> > The same as when building previous version of this patch.
>> >
>> > on top of meta-qt5 default there is:
>> >
>> > PACKAGECONFIG_GL = "gles2 eglfs"
>>
>> The gles2 here causes the failure, since xcomposite-glx checks for
>> "!features.opengles2"
>> This makes sense since you want to have desktop opengl enabled together
>> with wayland GLX.
>
> Then is it correct to enable both xcomposite-egl and xcomposite-glx for
> x11 in DISTRO_FEATUREs?
>
> Without this change in qtwayland_git.bb:
>
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcomposite-egl xcomposite-glx', '', d)} \
>
> I can build again with that configuration.

It kind of depends what we expect the default to be.
If you have x11+opengl in DISTRO_FEATURES, then I think expectation is
to build xcb-glx plugin in qtbase and xcomposite-glx plugin in
qtwayland, which work together.
If you configure qtbase with gles2, xcb-glx won't be built and
qtwayland cannot be configured with xcomposite-glx.

Just noticed that we are missing PACKAGECONFIG[egl] in qtbase.
If that's added and if that's not used in the default PACKAGECONFIG_GL
list, we then have to remove xcomposite-egl and wayland-egl from
qtwayland defaults.
so it's also question how far we want to go with the PACKAGECONFIGs.

>
>> > PACKAGECONFIG_DISTRO = "sql-sqlite icu glib accessibility mtdev examples
>> > fontconfig"
>> >
>> > QT_CONFIG_FLAGS += "-qpa wayland-egl"
>> >
>> > from meta-luneui/recipes-qt/qt5/qtbase_git.bbappend
>> >
>> > and
>> > PACKAGECONFIG_append_pn-qtbase = " freetype fontconfig"
>> > from world_fixes.inc
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20161217_135213.log/world_fixes.inc
>> >>
>> >>>
>> >>> Is the configure more strict in new version or do we need to change the
>> >>> default config for qtwayland builds?
>> >>>
>> >>>>
>> >>>> -samuli
>> >>>>
>> >>>> On 15.12.2016 15:48, Samuli Piippo wrote:
>> >>>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>> >>>>> the contents of an environment value when qmake is run instead of when
>> >>>>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>> >>>>> for qmake to find them. configure's setBootstrapVariable function needs
>> >>>>> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>> >>>>>
>> >>>>> qt.conf generation for qtbase recipes is not needed, as configure will
>> >>>>> generate its own version based on configure arguments. Skip running
>> >>>>> qmake, since configure is now automatically invoked when it's run in
>> >>>>> qtbase's root folder.
>> >>>>>
>> >>>>> Update PACKAGECONFIGs for qtbase to match current configure options.
>> >>>>>
>> >>>>> The new Qt configuration system [1] can be used with a new variable
>> >>>>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>> >>>>> arguments.
>> >>>>>
>> >>>>> Merge the two qtwayland recipes to one that supports all three targets
>> >>>>> (target, native, nativesdk) without need for additional patch.
>> >>>>>
>> >>>>> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>> >>>>>
>> >>>> --
>> >>>> _______________________________________________
>> >>>> Openembedded-devel mailing list
>> >>>> Openembedded-devel@lists.openembedded.org
>> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >>>
>> >>>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

