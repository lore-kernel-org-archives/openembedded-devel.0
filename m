Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5076E8B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:00:01 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id cz12so2980820veb.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WjqL1W1u2bpzg/u9kz4V9uenXqD0RbsXolpfaS713hk=;
	b=kIP25Jnxy0QCd3mcyB1OlPpmzji8d5gK4cNetAfPEI5oLFAN5sLcif/y2VVk8TBDoV
	gvS+esDJt+o7MeeE+xiqsWbIgeKAIpCojvloBjRVLP+//8MApaPx1LT8k4mf6bOpMEwO
	tqHBfWp9J6FPwT//2N/SkrCzJQaIJXfbqZe/K8cGzDqZikEXgsi9NWU9sq6/Zja9PaZV
	0LIH4EdVieFHCGiXYy+5F091nJedU62u3LIamyzMcThcd/LZCczbDeGTZZZ0p8Patqw/
	g65bFf19J/+nEqTQIJ8x1dBM5xc41AZhWqcr9bMJU87g4116vNiLHqIwDbVLQeJAri4F
	FLng==
MIME-Version: 1.0
X-Received: by 10.52.126.107 with SMTP id mx11mr140511vdb.41.1395867602987;
	Wed, 26 Mar 2014 14:00:02 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 14:00:02 -0700 (PDT)
In-Reply-To: <1395821266.24890.80.camel@ted>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
	<CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
	<CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
	<1395821266.24890.80.camel@ted>
Date: Wed, 26 Mar 2014 14:00:02 -0700
Message-ID: <CAFeBWL6621Uh34_s8soK39mNM56zRE1-+rKJ0ehRDTDSVdrHfw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: exo build fail on master and master-next
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
X-List-Received-Date: Wed, 26 Mar 2014 21:00:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard, thanks for the explanation. It helped me in understanding about
the commit.

intltool-native builds fine. This suggests me that I have the dependencies
requirement for intltool-native. Also I apt-get installed intltool on my
build server just in case. However, I still get exo-native build error.
Just letting you know, the recipes involved are all under the OE layer
(meta-xfce). I am building for Gumstix Overo, which is not the default
build target, but this error is not platform dependent. I still get the
same result on qemuarm.

At any rate, I now know it's a dependency issue, so that's where I will
start digging and report back.

Thank you,

Adam



On Wed, Mar 26, 2014 at 1:07 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2014-03-25 at 17:46 -0700, Adam Lee wrote:
> > exo-native (one of xfce4-taskmanager deps) was the point of failure.
> > More specifically, exo-native was failing during configuration time. I
> > discovered that, on master-next, exo-native build finishes by
> > reverting this commit in autoconf.bbclass. This commit was new this
> > year in Yocto Project 1.6. I have no idea how this commit breaks
> > exo-native build. So I can't discern if the commit has errors. This
> > still could very be a configuration issue in my build machine.
> >
> > Can anyone take a look at the commit one more time?
> >
> >On Mon, Mar 24, 2014 at 2:29 PM, Adam Lee <adam.yh.lee@gmail.com>
> wrote:
> >         The error is occurring on master-next (and master I presume)
> >         when building xfce4-taskmanager (as part of XFCE4 Extended
> >         package group). I confirmed it on both qemuarm and on Gumstix
> >         Overo as build targets. This tells me it's a bug, but there
> >         still might be something unique about my setup.
> >
> >         Can anyone verify if xfce4-taskmanager can be built
> >         successfully?
> >
> >         On Fri, Mar 21, 2014 at 2:08 PM, Adam Lee
> >         <adam.yh.lee@gmail.com> wrote:
> >                 Good day everyone,
> >                 On both master and master-next, I get build fail on
> >                 exo like below:
> >                         configure.ac:112: error: possibly undefined
> macro: AC_PROG_INTLTOOL
> >                               If this token and others are legitimate,
> please use m4_pattern_allow.
> >                               See the Autoconf documentation.
>
>
> That commit makes the system more strict about dependencies and they're
> probably incorrect in your recipe. The above error suggests you're
> missing a dependency on intltool-native.
>
> Cheers,
>
> Richard
>
>
>
>

