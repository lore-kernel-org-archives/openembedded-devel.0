Return-Path: <ticotimo@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 740B6780ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:42:39 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j32so7232517iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LiIsddEUBokH5l6GKBkfga32Fg3zhC/8oaZy/NFgvQg=;
	b=PgtIcCTNONVRi01lmbn+QZ9BP+WgRAXpDC4F05Nx03o4VMSq8gwB3hVUrNimU/jZnJ
	sHQLyoMFZzgb46aw4o5xaLsgPaDHNGimvesUyubGYc4ECGySVhdM7p2GmaxHOby3UvPG
	ajEBnwD1OP/9YNERP8V0ZPlUWOl2kztrAEa7N5MjGosjEZpvgAMRnWJsLGHlMq1DxoiF
	SHrr5Jio9UtnKDdGJQ6605LEMrxfxufike8HLNICsOREbN+nXOhDzXcm5x39R9Z6jGCp
	fCRTJXQ0pemqzcHCDvDiXq2W94v8nAGjDLgV3uOUlmxsIm7tZGECx8R0uaFJfDhhQfv2
	n+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LiIsddEUBokH5l6GKBkfga32Fg3zhC/8oaZy/NFgvQg=;
	b=MUFpZCL8x+4+WXfwB79Ne/pAQWrmfuABQjl3odrvCbVvNHvsWuh5PronQ9lRuH0yM+
	deNDc5IrCow5ACHd0Tt7mp1SQKghL+TuShVMBongeES/t0+fek7no39kh2ODAszo6YUj
	vX+/ivzgY4GW3DmGBsxHhawhFLfCi8DZrFAFNb5wBlJvtBvjB+QdDDrfnEZkRdrD+M9s
	PDby6iU5p++Ni1LgfuVJsSNqOr8oEEEuZcirctkzz9cRxZZ7AeVnqfncOEyvA9gictTz
	RtGVNwM+Kw/jQ6JCuSW5JtUT7r1t6eRQwQoDpQ6UO0qXZv0ZBahdjARueav5Vh8jzPyj
	Ulpg==
X-Gm-Message-State: AIVw113jnTGF6f2g0ndg3Z7yK8FKef8jk3NL2tgL2Okkky1OvPwaQ5wA
	jFtz5tMRIKnoWw6EKv9b+W4W6FzqwqO9
X-Received: by 10.107.12.70 with SMTP id w67mr10135836ioi.295.1502354560619;
	Thu, 10 Aug 2017 01:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
	<CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
In-Reply-To: <CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 10 Aug 2017 08:42:30 +0000
Message-ID: <CANx9H-D3NL4ikmCGQ5NS5b+70-3drcYr=5Pp1dhpVOdcm=Sm+g@mail.gmail.com>
To: Behan Webster <behanw@converseincode.com>, 
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 08:42:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, I recommend a method of linking the checker script with the
documentation. And run unit tests to prove nothing has changed on distro X,
Y or Z. And I want a pony, with wings and a single horn.

On Thu, Aug 10, 2017 at 1:38 AM Tim Orling <ticotimo@gmail.com> wrote:

> So where does it live? It ends up being: run shell script from
> "somewhere". I know what you mean about git and other requirements, but
> still it must be sourced from "somewhere". If you add a desire to be
> version controlled, it then logically lands in a git repo. Or subversion,
> bazaar or mercurial.
>
> Thinking outside the box, we could make it a python (humor me) module
> installed from pypi and document how to run it...
>
> I tend to use shell scripts as my first draft and then translate to
> python. This usually means a lot of "subprocess" calls and is by no means=
 a
> silver bullet.
>
> Alternatively, it becomes a clickable link on a website. That means
> nodejs. Or perl. Or...
> On Wed, Aug 9, 2017 at 9:40 PM Behan Webster <behanw@converseincode.com>
> wrote:
>
>> > On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval <
>> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> >
>> > in my opinion, this fits nicely into the oe-core, into the
>> > scripts/contrib folder.
>>
>> Keeping it in script/contrib seems odd to me (horse before the cart). On=
e
>> of the requirements for OE is git (or tar) to actually get OE in the fir=
st
>> place.
>>
>> I see this as more something some one would run before cloning OE or
>> Poky. It=E2=80=99s a replacement for needing to read a long HOWTO on a w=
ebpage to
>> get started with OE or YP.
>>
>> Behan
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

