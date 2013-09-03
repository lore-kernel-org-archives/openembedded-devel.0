Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 490116BF08
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 03:55:14 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id xa7so5426894pbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 20:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=N2YLSQMMpk4kdPZKg/7l4SpgeDu7db9bI6OhMRG2UNQ=;
	b=bBQCX+IvM5w7GG5BOj3TT+IwSl6TSgi94xnpYhMu2P+oGa+SQWxT3Dk+n3i0WndjXt
	xuQPJR+D+f2uSckTDpZsrPgPRixEFJcfD+sd3iFzauhGZKg+iaQB2zO60DKnO5YWFKe5
	wX7bafrttLPLBN5ylqGZn3PRJoYtnGPpVkBPmd6BSpVwV//aLFumC2rOQJBwD2qDfVxj
	rgRqScz4quO16431YIeJJZYSOmW1/wy00JuqfC4XTucci/8y+vKl7Dy8xVT2cyEYCh8k
	+b5px2tnYnxj4TYkvcUReEvC/1yGRqvG63S1UfHJV2kwsb6RBNbiblmz9k4NhtJyIzXz
	3xTQ==
X-Gm-Message-State: ALoCoQkX4KtVOlFuZ0UHpZ2PvGYxsbk6dLHU5xC3gAoX5cRxnsy2YZ5k/s/uiJAzW/xGMwS8iCno
MIME-Version: 1.0
X-Received: by 10.66.142.42 with SMTP id rt10mr29393776pab.1.1378180515016;
	Mon, 02 Sep 2013 20:55:15 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Mon, 2 Sep 2013 20:55:14 -0700 (PDT)
In-Reply-To: <CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
Date: Tue, 3 Sep 2013 04:55:14 +0100
X-Google-Sender-Auth: D_3mBTg1uiiFG6xNZyKAm_6pAsg
Message-ID: <CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Tue, 03 Sep 2013 03:55:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > 1) The version in meta-virtualization is quite old. It is basically from
> 2009,
> > and a lot of things has changed since then.
>
> And that was on purpose, there are some tight bindings to SDN and hence why
> it is in meta-virtualization, and not a valid reason to not contact the
> layer
> maintainers directly, have a discussion and not set the update to the
> current
> layer.
>

I do not understand why I would need to contact a foo layer maintainer when
I think a recipe has not much to do with foo.


> If you would have asked, you would have been told that updates are pending
> with bindings that need to stay in lock step with other parts of meta-virt.
>

Sorry, but how is this relevant? It is an extremely old recipe, and should
not be used. Moreover, this should not block the non-ancient users at all,
which is probably the majority.


> > 2) More importantly, this software is more like for networking rather
> than
> > virtualization, so I think it was misplaced.
>
> I disagree, so for now meta-virt is going to keep it's variants of the
> recipes and
> we need to have an actual discussion to figure out the best way forward.
>

,,, and I disagree with you. Read the specification for openflow, please. I
fail to understand how it has anything to do with virtualization.
Seriously, this is a software for networking devices. That is, exactly the
main purpose what meta-networking is trying to achieve: aiding the
development for networking devices. As for me, it is totally
non-comprehensive why a networking specification and the relevant
implementation would be in meta-virtualization rather than meta-networking.

Not to mention, I do not understand why you are trying to set a straw man
in here. The discussion you are "requesting" is exactly what this thread is
meant to be. So, I think you are simply incorrect IMHO. :-)

Cheers,
Laszlo

