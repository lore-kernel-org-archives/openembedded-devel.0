Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 885F0731BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 17:48:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l65so55105560wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s6kZOZz32JGe4ErAJgsDe1vR9KYE4jBhr6oEJCqbFjA=;
	b=E01bHphy4yvh5KpACHBszbnUoliPjyhqnxpHAN5hFw9nYGk8IaTeWoC7n1CS23w7mf
	pEAOjxCxOjwqCs61MWU3eBayF9jzFO3Nj25jHKo9ffyyVM4ROYYco/4J90p9FtM44JLI
	HYU+EKizRGTn/FojBPLmOZUiTtF6S5PsmUFuvYJJrDDVYckwnz53pUg/kHXl47GrywlX
	dWMVcmudEnlF1ugy6LIpTIE0ivxeWl/Aej1Gyr3noS95tuXibzpUtXb4xjRYbC070rro
	ppvCaeMWeF//hCEbLC40JgnjxgRkq3iLBWOP4mv8JDB6BwyNGVmut+87pa87nhp6Mnfu
	nE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=s6kZOZz32JGe4ErAJgsDe1vR9KYE4jBhr6oEJCqbFjA=;
	b=IF7YzppviCC02GY2M2UYtsevoJ8YRoAn9uKC/EKrM0rFPg9oXhpfDh/9dNmCAzoKN4
	RQtxidm1Qn5vS+2U2/96G8euNog6XYav/cIBJxw+C010r5wHSLV0Rb0BYl0AlwBYSYkj
	TO0NA9sxivoi3P0/mVcEZZ8vMyiFV0n8C+O1kRCdmFu9Ta5Z2IRtr4adMNJ/RpNC3pBV
	y3Vv66grDYJHgIveV18yUbiIPAgoSM8lsKZKArWM917Ujh+fod7wZ1EFPj/eKtFSdDm8
	2B9q2KmbkMjIJsG0es/T7Zlb0+IIuyxwwC5jbjXJqSatiJyF1v0qPZCbKNYaVrbXh9Km
	+kAA==
X-Gm-Message-State: AG10YORH0dLSxD7TzDglS5J9BVb+dMAoLllVL59bZiWygFTQm1ab24WiCN5l0Fb+EfMfva8VxIfMolad6k3GdQ==
MIME-Version: 1.0
X-Received: by 10.28.6.201 with SMTP id 192mr5070502wmg.0.1452966538018; Sat,
	16 Jan 2016 09:48:58 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Sat, 16 Jan 2016 09:48:57 -0800 (PST)
In-Reply-To: <CA+chaQfnzojovC0NkpMLrqnHcvM4VfOYTXQsD9x2awhJ4Se8Gg@mail.gmail.com>
References: <1452955272.835129245@apps.rackspace.com>
	<CA+chaQfnzojovC0NkpMLrqnHcvM4VfOYTXQsD9x2awhJ4Se8Gg@mail.gmail.com>
Date: Sat, 16 Jan 2016 18:48:57 +0100
Message-ID: <CA+chaQc+79FLvBwBqGO96PSrpSyhP05TjYPv6AQ=9kYB_yrAtw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] [coreutils]: Add xattr PACKAGECONFIG
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
X-List-Received-Date: Sat, 16 Jan 2016 17:48:59 -0000
Content-Type: text/plain; charset=UTF-8

And coreutils should be in commit summary line, not as [coreutils] which is
removed when applied with git am.

On Sat, Jan 16, 2016 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This belongs to openembedded-core ML. Please resend.
>
> On Sat, Jan 16, 2016 at 3:41 PM, Scott Ellis <scott@jumpnowtek.com> wrote:
>
>> From Yocto poky where it also stops this warning
>>
>> WARNING: QA Issue: coreutils rdepends on libattr, but it isn't a build
>> dependency? [build-deps]
>>
>> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
>> ---
>>  meta/recipes-core/coreutils/coreutils_8.24.bb | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb
>> b/meta/recipes-core/coreutils/coreutils_8.24.bb
>> index f042346..6a09c59 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.24.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
>> @@ -28,14 +28,19 @@ SRC_URI[manpages.sha256sum] =
>> "cf0333b5f134a331e0b46e2ddf90666f8bdc3281c1ca2c7cc
>>  EXTRA_OECONF_class-native = "--without-gmp"
>>  EXTRA_OECONF_class-target = "--enable-install-program=arch
>> --libexecdir=${libdir}"
>>
>> -# acl is not a default feature
>> +# acl and xattr are not default features
>>  #
>> -PACKAGECONFIG_class-target ??= "${@bb.utils.contains('DISTRO_FEATURES',
>> 'acl', 'acl', '', d)}"
>> +PACKAGECONFIG_class-target ??= "\
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
>> +"
>> +
>>  PACKAGECONFIG_class-native ??= ""
>>
>>  # with, without, depends, rdepends
>>  #
>>  PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>> +PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
>>
>>  # [ df mktemp base64 gets a special treatment and is not included in this
>>  bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors
>> dirname du \
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

