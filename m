Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id EF488605BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 06:31:32 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id m17-v6so3830864lfj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S0F57lZAFwGzDhzpZtFFEBA+g9q20x2WlHxCrdMkmOI=;
	b=LLopwvJkDbpDGflZMhVUf+lDr+Ccx0EMjfoSENrEBX3Vqpo9YolzNOYqtEltjXD6XR
	cTmVpBl4I19oZdgy+omVTupE2iBkth02phfI+dDiXdJlgYK1GtAqrZPXTTxE9rU/2S1J
	WKzPJwRy4OaYbtLJqDgkbZ4jEk5bGMSsIy9E1WocI3wIui8hY1W2e8ywTHT9s4X4Y1Kx
	3f61n2Nz0a9ZMX7mgsLXv1RtEtoOp6brS1HXWrhVqWXvUjvXSlFlWvJay9wUDgH6nTpV
	Hqg5TsXBYh78kYtJEcxBCinRDTZCNeIh033jGf0V4MPm+EHo1+4S0mVqZUwDhO9NLSc8
	RMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S0F57lZAFwGzDhzpZtFFEBA+g9q20x2WlHxCrdMkmOI=;
	b=I5NJCHRhVAOaHjw3iQjdwfu1ONeXz97PkOwdAuqp/BDgj9Aa1EvWNgbGuxORCvgdiQ
	iM5tZmnGH9F0X+j831eI/LRgGdHjj8gkmTCgQp3BhgR4o3WN8dtwGhXquSDUkwLBVst/
	x9MJ+3xwITUlGX6I9OtQ7UAjXBEBP1wCW26EqHIENGr6j9ElI6ls+iKpbGdMvev6qXpy
	9AP6W5pCBxC9lutf60Gq1vcvSgO0E+lJhDNf17E8E9YVkksloidDnVvJVeskNGhRx78/
	+MJd5WHjcWCYQVCUzJ9/32/TtT3/cUL0cd5fEcquUkHO0gAB5HqAbPclQhlgiER00i3b
	TfRA==
X-Gm-Message-State: ALKqPwc4vgNjmI5k2YGDUtWQfw7KxkFkZYtOB/WPGtTnGStU9hyCzdG1
	xMnIe56lnnPViBOQZJ9OwuJITTbC3qIU4RHMrsQ=
X-Google-Smtp-Source: AB8JxZrGyX7A3+KaLOzKh6PRYaM0NOCr3pJfYTvo6b/gpdEMUSc8y+TCVXnD2sRDAlOhViQJmbWfGKrOqWX9XgrMR9E=
X-Received: by 2002:a19:a2c2:: with SMTP id
	l185-v6mr11846007lfe.135.1526452292409; 
	Tue, 15 May 2018 23:31:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:17a1:0:0:0:0:0 with HTTP; Tue, 15 May 2018 23:31:31
	-0700 (PDT)
In-Reply-To: <2d40764a-ff2e-06c1-898b-1f4f99fbda29@gmail.com>
References: <20180510004908.26947-1-twoerner@gmail.com>
	<2d40764a-ff2e-06c1-898b-1f4f99fbda29@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 16 May 2018 02:31:31 -0400
Message-ID: <CAHUNapT0E0S-7Dv51hcfkYbr0kBCq8RHTrkhucJzHtmkTfdDzg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 06:31:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 15, 2018 at 10:45 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/09/2018 05:49 PM, Trevor Woerner wrote:
> > Since we know that github archives which are automatically generated
> have a
> > tendency to change their checksums[1], switch to using a git clone.
> >
> > [1] http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-September/114916.html
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >
> > Changes since v1:
> >  - replace the frankenstein local variable name OPENHBRANCH with simply
> BRANCH
> >    to hold the name of the branch to use
> This fails to build: please see
> http://errors.yoctoproject.org/Errors/Details/178572/


As it turns out, even without this patch, building the existing openh264
recipe in master for qemux86 fails exactly the same way. The really odd
thing is, I don't see any indication of this failure in any of the "state
of the world" build reports. Do the "state of the world" builds not build
against MACHINE="qemux86"? Or maybe openh264 is skipped (perhaps due to
LICENSE_FLAGS = "commercial")?

I'm not entirely surprised this patch doesn't introduce a new problem, its
only difference against the original is to fetch from git rather that an
automatically generated github archive. If the auto-generated archive
succeeded but a git clone of the exact same SHA failed, that would be news
indeed!

I assume that although my patches aren't introducing a new build failure, I
should probably investigate fixing it anyway?

The existing recipe has provisions for i386. If I understand correctly,
qemux86 is i586 (?), and meta-intel's intel-core2-32 is i686 (?). Do I
duplicate the i386 provisions for i586 and i686? Is there an easier way to
specify all 32-bit IA systems? Otherwise I guess another option is to
disable 32-bit IA COMPATIBLE_MACHINEs?

