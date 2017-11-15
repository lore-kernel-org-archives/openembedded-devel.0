Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAC0D7851F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:38:10 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b189so2706591wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 04:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JprtrZfil/07MRF2cBBVV2nLoPEC/y1KDgupDyCJChc=;
	b=Q5h8QQo0VAydXsavhqV3RMcbRtH6DhlQ9QwMYpfGdWh2XUEXDeedeuK9Qhkp2Q+8CF
	8ACBGqXRCmdvpp7ouXh4VEYNpOxMUYY9gc+qLJdU2MQzbW0DJA9VTalqR/IHxNWMWsjq
	j4/Zm0LGO9QK77RbUVxf7jh2e8U1njfl2TrWZdrqfFbOSHT6EO4NMuNhsCLUell419eM
	AcnAMuCeivFHELLq9htxS2lb6IOIzYE6tprjmM2qV/kRfc35i2JgIuOvU8kFPaytBINJ
	FViG73UnUHro04V5YlvcZJUetQscC/PS7iwvLTa02E9fBgC03+bZ8sg97rDLavSATFHS
	ugBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JprtrZfil/07MRF2cBBVV2nLoPEC/y1KDgupDyCJChc=;
	b=S42skkxErZIlmhaiqF4h8aPVEYvwoQ7k9ewldgnpdzrZaYSOz6HEosp6N8zzIWUlMN
	6/lRRWQv8x6yM0RahIlIi9VenUojtGuP8GQJkEts8f44MXyEjIK0Re8vdubOcKo4EHPe
	UkHcskZOkqpsaA6AHnve2oK1MMpGCEeHOXptxJD1QB5DEe3BakkvR7rSLkQlZ4nuxGzU
	OFMU/C5rDzcyZ1ujjzCEQF4VLYoY+KNKuPTXW7w0BffV7pX2eNurL9leEMBy6FQaXsgV
	sObImk8HQnbahxYMQVIuYm24XI9VlgesxlEjrLlZ6cOdXq41Y92Pne8cFdoL9w0ylSKn
	CzVg==
X-Gm-Message-State: AJaThX6BJdXE0N/0G4a1BI99pKkt5wduwBkdLadyTpyBARePUVfmXE4S
	bF/ebjpBfnOuKh9vI0myjHkxCMt8svGAIqnpaEo=
X-Google-Smtp-Source: AGs4zMauLaA5NWXVU6q9AW/1uNxRn0CI7Csncml43q2a5TQxmx4UYjzkw3AjJJ6odRqBNb6OWvW5iCwsN5CWCoLFzrA=
X-Received: by 10.28.235.18 with SMTP id j18mr11427457wmh.50.1510749491282;
	Wed, 15 Nov 2017 04:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Wed, 15 Nov 2017 04:38:10 -0800 (PST)
In-Reply-To: <87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2017 13:38:10 +0100
Message-ID: <CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Wed, 15 Nov 2017 12:38:11 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for very good changes.

Yesterday I've tried to build this on "bitbake world" servers and the build
for qemuarm64 failed with:

| [30609/30609] python "../../build/toolchain/gcc_link_wrapper.py"
--output="./chrome" -- aarch64-oe-linux-g++  -fstack-protector-strong
-D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
--sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/work/aarch64-oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot
-pie -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack
-Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread
-Wl,--as-needed -fuse-ld=gold -B -Wl,--icf=all -Wl,-O1 -Wl,--gc-sections
-Wl,-rpath-link=. -Wl,--disable-new-dtags -Wl,--export-dynamic -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z,relro,-z,now -o "./chrome" -Wl,--start-group @"./chrome.rsp"
-Wl,--end-group   -ldl -lpthread -lrt -lpangocairo-1.0 -lpango-1.0
-lgobject-2.0 -lglib-2.0 -lcairo -lX11 -lX11-xcb -lxcb -lXcomposite
-lXcursor -lXdamage -lXext -lXfixes -lXi -lXrender -lXtst -lgmodule-2.0
-lgthread-2.0 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3 -lplds4 -lplc4 -lnspr4
-lxml2 -lexpat -lfontconfig -ldbus-1 -latomic -lXss -lfreetype -ljpeg
-lwebp -lwebpdemux -lwebpmux -lXrandr -lresolv -lgio-2.0 -lpci -lasound -lm
-lz -latk-1.0 -lFLAC -lgtk-3 -lgdk-3 -lcairo-gobject -lgdk_pixbuf-2.0 -lxslt
| FAILED: chrome
| python "../../build/toolchain/gcc_link_wrapper.py" --output="./chrome" --
aarch64-oe-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security
--sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/work/aarch64-oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot
-pie -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack
-Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread
-Wl,--as-needed -fuse-ld=gold -B -Wl,--icf=all -Wl,-O1 -Wl,--gc-sections
-Wl,-rpath-link=. -Wl,--disable-new-dtags -Wl,--export-dynamic -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z,relro,-z,now -o "./chrome" -Wl,--start-group @"./chrome.rsp"
-Wl,--end-group   -ldl -lpthread -lrt -lpangocairo-1.0 -lpango-1.0
-lgobject-2.0 -lglib-2.0 -lcairo -lX11 -lX11-xcb -lxcb -lXcomposite
-lXcursor -lXdamage -lXext -lXfixes -lXi -lXrender -lXtst -lgmodule-2.0
-lgthread-2.0 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3 -lplds4 -lplc4 -lnspr4
-lxml2 -lexpat -lfontconfig -ldbus-1 -latomic -lXss -lfreetype -ljpeg
-lwebp -lwebpdemux -lwebpmux -lXrandr -lresolv -lgio-2.0 -lpci -lasound -lm
-lz -latk-1.0 -lFLAC -lgtk-3 -lgdk-3 -lcairo-gobject -lgdk_pixbuf-2.0 -lxslt
|
/home/jenkins/oe/world/shr-core/tmp-glibc/work/aarch64-oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/7.2.0/ld.gold:
out of memory
| collect2: error: ld returned 1 exit status
| ninja: build stopped: subcommand failed.

longer log in http://errors.yoctoproject.org/Errors/Details/158898/

I know what linking needs *a lot* of memory, but this server has 219GB
available and "only" 128GB from it can be taken by tmpfs, so there should
be still plenty RAM for successful linkage.

Build for x86_64 (on similar server) was successful.

Build for x86 + musl failed even before start, because there is missing
space in the append:
recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86 =
"yasm-native"
recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86-64 =
"yasm-native"

and unlike x86_64 it doesn't have trailing space in previous DEPENDS,
because of:
recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_libc-musl
= " libexecinfo"

Causing:
ERROR: Nothing PROVIDES 'libexecinfoyasm-native' (but
/home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/
chromium_62.0.3202.89.bb DEPENDS on or otherwise requires it). Close
matches:
  libxinerama-native
  texinfo-native
  libyaml-native

I'll fix that missing space, but any other ideas why it might fail with out
of memory? Are you building for aarch64 as well?

Regards,



On Wed, Nov 15, 2017 at 1:04 PM, Raphael Kubo da Costa <
raphael.kubo.da.costa@intel.com> wrote:

> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
> > I believe this has finally reached a stage where it's ready for public
> > consumption, hence the CFT:
> >
> >     https://github.com/rakuco/meta-browser/tree/chromium62
> >
> > I'd like people to look at my commits and let me know if there's any big
> > issue that would prevent those changes from landing into meta-browser.
> > If everything's OK, I'd then start sending the patches to the list (or
> > pull requests on GitHub, whichever is preferred).
>
> Thanks to everyone who chimed in on GitHub and Otavio for merging my
> pull requests.
>
> We now have Chromium 62 in meta-browser, and I intend to keep the recipe
> up-to-date from now on.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

