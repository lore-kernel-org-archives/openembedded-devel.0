Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 499916017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 12:32:05 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i17so3695326qcy.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 04:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XuiZm7/GJPITSOcaLexLjPXEGzZoaj6bpjeTXIZMOu4=;
	b=Re85SyE4pVkEOGyCkpR8+KWXiSPZOO3J9X/GNRZBJ8Fv+oqh81qhVwytby5iSD0nHr
	wosvp3A985G/onK9XWj1NziBzYxITqJyLqTUyxWYrt8yglbGJaqo4TScboTK3xjdDylY
	wRz0YSmlUZNXAxF2r0kgZ9/4TP3st26neSw6IV4VsS6HI7W++xCMxnaHM1fNBzNOcvrf
	aMKIxMELAv+XXR1GgQuHzXZs+Qgv9YQ4uOfbzGXCmOFX8s47I56UQawSE9VFI8GpdJ5w
	YTQPj8HfnYi3n9dwfH4LFBPZiJA7FZfWEgTIuPGV83CqI6HYBg5YZw/zXJJx/Rw7Bws9
	p3mw==
X-Gm-Message-State: ALoCoQlZw4PsEWbSz/MegfvKjAfQc0NGlYCztmA/Zc+2dV1FakqKA3ORySB+pgReEaoMxhO0UIad
X-Received: by 10.224.3.137 with SMTP id 9mr19715141qan.64.1418301126274; Thu,
	11 Dec 2014 04:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 04:31:45 -0800 (PST)
In-Reply-To: <20141211121417.GB2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
	<20141211121417.GB2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 12:31:45 +0000
Message-ID: <CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 12:32:07 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 12:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> > > WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> > > gst-plugins-bad-rtmp, but it isn't a build dependency?
> > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when
> > > building with minimal dependencies?
> > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created
> > > when building with minimal dependencies?
> > >
> >
> > Coincidently last night my world run gave me warnings that
> > gst-plugins-bad-rtmp was depending on rtmpdump without a build depends,
> so
> > I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
> > gst-plugins-bad.  Presumably this will fix these errors, although that
> > warning seems odd.
>
> Why odd? It just means that gst-plugins-bad-rtmp* packages aren't
> created at all when rtmp isn't autodetected.


But gst-plugins-bad-meta won't depend on -rtmp when rtmp isn't detected as
the splitting is dynamically done.

Ross

