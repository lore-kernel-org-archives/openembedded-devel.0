Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id F3C4F73A6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:07:54 +0000 (UTC)
Received: by ykq142 with SMTP id 142so988845ykq.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Ct8ho5ihWVBjSbUVsJ1vlfia4o6E9+axfBOVtJvlIaQ=;
	b=u5jGI1kuDN3W8QIm2VzdRj0Q1Z/+pIzLk443KvUOxieavjROyEC+aOzTTNbNqenIOY
	I5YFQgqUjHok3oCPdUFfYUPFtJtzAUFCPzqDMH08u0Nx3lz25G3neekDWsrXMsBfWFlt
	GM68Go6ZCCT57EHN4Yepsf0Om9UdexUtcB9517/yVHbS0FoTegILkWYqaRaNyneBla/X
	+GWhGkxE1D6bl5cyHUHp0koQh9x8H0BiPWKi1rV62vniFH2mAO3BWDRHrLPJ3v0NXc8K
	YA1B7RxuvG9vkTKKCWfIvTOP7KjOPVGu5V13xzFJ3Y30RgNza/Fnw6Kn9IBl/At4Utjn
	cczw==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr28283801yhb.136.1426000075650;
	Tue, 10 Mar 2015 08:07:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Tue, 10 Mar 2015 08:07:55 -0700 (PDT)
In-Reply-To: <3cca049f035271caa753ba240c184793.squirrel@lightmail.glesys.com>
References: <1425989994-22071-1-git-send-email-magnus@minimum.se>
	<CAP9ODKpy9HsOfQF+Shy7HON7k34+RJ97d=azmGt=hrvkhE50jw@mail.gmail.com>
	<3cca049f035271caa753ba240c184793.squirrel@lightmail.glesys.com>
Date: Tue, 10 Mar 2015 12:07:55 -0300
X-Google-Sender-Auth: sb_RZXnoAXrnumcTu25NAuKB67M
Message-ID: <CAP9ODKomzc2k9OJPd1Nj7WZ036fraAgO0yKdqRzm9subYu2soQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] initials: silence "populate_sysroot manifest not found" warnings
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
X-List-Received-Date: Tue, 10 Mar 2015 15:07:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 11:54 AM,  <magnus@minimum.se> wrote:
>> On Tue, Mar 10, 2015 at 9:19 AM, Magnus Olsson <magnus@minimum.se> wrote:
>>> A number of recipes in meta-java use autotools.bbclass for building;
>>> internally
>>> it uses the sstate-control populate_sysroot manifests to locate and copy
>>> aslocals for configure dependencies as part of the do_configure step.
>>> The manifest path differs depending on if it's a native package or not
>>> so
>>> autotools.bbclass looks at the package name to determine if its native
>>> or not
>>> (it's native if it ends with "-native").
>>>
>>> The warnings are emitted because a few (native) recipes in meta-java
>>> (such as
>>> cacao-initial, classpath-initial and more) are incorrectly being
>>> classified as
>>> non-native by autotools.bbclass, which makes it look for the manifest in
>>> the
>>> wrong place and finally gives up with the warning:
>>>
>>> WARNING:
>>> /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot
>>> not found
>>>
>>> This happens for cacao-initial, classpath-initial, ecj-initial,
>>> libecj-boostrap,
>>> jamvm-initial and jikes-initial since they are all native and rely on
>>> autotools.
>>>
>>> This patch renames the recipes so they end with -native, e.g
>>> ecj-initial-native.
>>> It also updates the recipes so they DEPEND on the corresponding new
>>> name. This
>>> helps autotools.bbclass to properly classify the recipes are native and
>>> silence
>>> the warnings.
>>>
>>> Signed-off-by: Magnus Olsson <magnus@minimum.se>
>>
>> What about the target packages? instead a class extend could be used.
>
> autotools.bbclass will assume it's a target package if the name doesn't
> end with -native or starts with -nativesdk (kind of a catch-all), so
> target packages should be fine.
>
> I think autotools.bbclass::autotools_copy_aclocals() can be patched to use
> bb.data.inherits_class() to detect native and nativesdk packages (and so
> will not need to look at the package name), but I still feel like this is
> a good patch for meta-java since a -native prefix seem to be more or less
> package name convention.

You've renamed the recipes. Has the corresponding target ones been
preserved? I will check more carefully the patch today or tomorrow ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

