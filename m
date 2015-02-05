Return-Path: <ka6sox@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2554060169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:04:00 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v63so2533013oia.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PWS+nUdkhYeMYUvHU2W8s8tW+jJ//Y0wLc4LQ9XaU8U=;
	b=u6LraWd3OJq/+n3PE+KAhlCGZmndIyqfTj6A/qtMXNkAboorNJE/uKmYr0pvBifv/r
	/tBBDMqgxew3yIWPlQNgF3UbAQVPZmcf8cqCd6x0xyQXSUqQt8/goFQc5SrN8D5HWAXV
	R93Ar8nHnog+GKmZaky9FzG+4pYsLpPR+Pn0pcRjlyMswotx7H3bvNdZKb7fdXV3p+UD
	kU3ytzwtLXj+CBZ54CE1pXFb5EY6V7NnVgiYRQVIaxQvGUajkTYm0ECZSXxifqbwJVSG
	tMm1FO3FFBwj1XquV7+l0IXFdJsBWRT3jQDxhpxO2INbuN0aZDFHA29+PtuewhtdVBkz
	or9A==
MIME-Version: 1.0
X-Received: by 10.182.126.115 with SMTP id mx19mr3133366obb.31.1423159441819; 
	Thu, 05 Feb 2015 10:04:01 -0800 (PST)
Received: by 10.76.88.42 with HTTP; Thu, 5 Feb 2015 10:04:01 -0800 (PST)
In-Reply-To: <C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
Date: Thu, 5 Feb 2015 10:04:01 -0800
Message-ID: <CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Thu, 05 Feb 2015 18:04:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

We have the BW, Jenkins can do the rsync from the World Builds (if we
 clean the downloads directory) and I'll have to add some space to the
Mirror Server but thats doable.

Tom

On Thu, Feb 5, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Feb 5, 2015, at 8:49 AM, Paul Eggleton <paul.eggleton@linux.intel.co=
m>
> wrote:
> >
> > On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> >>> -----Original Message-----
> >>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> >>>
> >>> I agree, #2 is the best option to take care of the older branches.
> >>>
> >>> Tom, can you please fetch the following files and add them to the OE
> >>> source
> >>>
> >>> mirror:
> >>>  http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> >>>  http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> >>>
> >>> I've verified the md5sums match the recipe:
> >>>  29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> >>>  e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> >>
> >> Good to know we agree on the best option.
> >>
> >> Could I make a humble request to speed up the copy of the packages to =
OE
> >> source mirror?
> >>
> >> We have a BSP layer that depends on this and currently our build is
> broken
> >> fetching crda.
> >
> > I've been thinking about this, and this is getting ridiculous. Instead =
of
> > manually adding files to the OE source mirror, I think it's time we
> simply had
> > a populated fallback source mirror that has all the sources for at leas=
t
> the
> > recipes in layers hosted on openembedded.org (if not other commonly use=
d
> > layers) aside from OE-Core which is already handled by the
> yoctoproject.org
> > mirrors. This issue keeps coming up far too often.
> >
> > Is there a possibility we can set this up?
>
> We can infact setup a rsync from download directory of Martin=E2=80=99s w=
orld
> build jobs
> looking at Tom for help

