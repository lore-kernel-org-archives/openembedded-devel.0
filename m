Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 01462606BF
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:26:03 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f51so48458948qge.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fSoDQ5P6XGJQIb9tl/oNhweVDEGLKO+C1YRHP3eYrzo=;
	b=DufQrXnMC1cMFWyAKnc4GBIRt1eq9utpLDXSfubPzE8CVQxevuU+hUVgI34pouaN06
	9/Mv3O4TRn51gLRVaGxitQCoPY2vO0SNDqL/cC22sTmQ/62UAVBGQDGOOXiM4CZvqgYX
	qxbr9W4+bq5zARudsANKrMshcyDWcz39zWbFyBaxaGgSIr3mTp7QXqvfb7sl9v5+U3ji
	xuR2y18SS69PmXCVLYo2SA5QKz8Y7pBdo/Hv2q7F0jzesBI2SajcrOltZnQw0I+9dQE3
	0nvREPW4w6kBxNqMaiiQxx1R9WKFpSuAy9NFK0vK0ult0ovcpcpwpcLSIA+/X9E1obVw
	x1SA==
X-Gm-Message-State: ALoCoQlGKMCq2Dvu9V1DRpMhN48W+Ua6Q6UjSqUPyzvQ8n8l2AT0R7fNOsKwnVO+ia7p75Qq1mO3
X-Received: by 10.224.103.129 with SMTP id k1mr43596598qao.93.1422897964838;
	Mon, 02 Feb 2015 09:26:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:25:44 -0800 (PST)
In-Reply-To: <CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:25:44 +0000
Message-ID: <CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:26:11 -0000
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 10:54, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 2, 2015 at 2:40 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > cross-localdef-native:
> >
> > | In file included from glibc/locale/programs/locarchive.c:696:0:
> > | glibc/locale/programs/../../intl/l10nflist.c: In function
> > '_nl_normalize_codeset':
> > | glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
> binary
> > operator before token "("
> > | glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
> > '_nl_C_locobj_ptr' undeclared (first use in this function)
> > | glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each
> undeclared
> > identifier is reported only once for each function it appears in
>
>
> gcc would work with latest tree but I did not run into this error. So
> wait a while until I get to it.


I can confirm that the current branch builds gcc (and everything else in a
minimal image) apart from cross-localdef-native, with a long set of errors
for me now:

| In file included from glibc/locale/programs/locarchive.c:696:0:
| glibc/locale/programs/../../intl/l10nflist.c: In function
'_nl_normalize_codeset':
| glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
binary operator before token "("
| glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
'_nl_C_locobj_ptr' undeclared (first use in this function)
| glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
identifier is reported only once for each function it appears in
| glibc/locale/programs/locarchive.c: In function 'add_locales_to_archive':
| glibc/locale/programs/locarchive.c:1517:7: warning: passing argument 1 of
'__xpg_basename' discards 'const' qualifier from pointer target type
[enabled by default]
| In file included from
/data/poky-master/tmp/work/x86_64-linux/cross-localedef-native/2.21-r0/git/localedef/include/string.h:4:0,
|                  from glibc/locale/programs/locarchive.c:34:
| /usr/include/libgen.h:35:14: note: expected 'char *' but argument is of
type 'const char *'
| glibc/locale/programs/ld-ctype.c: In function 'set_class_defaults':
| glibc/locale/programs/ld-ctype.c:3012:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3012:7: note: use option -std=c99 or
-std=gnu99 to compile your code
| glibc/locale/programs/ld-ctype.c:3016:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3012:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3016:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3034:5: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3038:17: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3034:17: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3038:5: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3250:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3254:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3250:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3254:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3272:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3276:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3272:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3276:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3383:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3389:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3383:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3389:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3401:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c: In function 'allocate_arrays':
| glibc/locale/programs/ld-ctype.c:3887:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:4039:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:4062:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:4039:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:4062:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| make: *** [locarchive.o] Error 1

Ross

