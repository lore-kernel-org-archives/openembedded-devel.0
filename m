Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1272360116;
	Thu, 12 Jan 2017 01:52:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so642926wmi.1;
	Wed, 11 Jan 2017 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1pC+BUC5Mapp7/5UiN6XaVH/k8ilccNJbnQXOJySRDs=;
	b=AaIuixVtsLJzQqsp4MQfRiylVtUx6kmVe83yyo5/mQT0lzWSGi+PLt/vwS8OAYQI+f
	hA7zPO3XSCGxDEQG/wQ+D0m1hd8Cx+RELdh85IMWMP4t0RUVFRExG6age7iqxmuvNDJ6
	aESDGonbtxIlfI9LutYU9JAZvlPT7ocEDzXSqXGND9Z5np325qG0fnK0w5BPVciGJCut
	XmLPMprY8hJoV2Sprc9C61n4CMdsupqkQGn0/VkYewExeL0BK5RsJf/3HN8uuJrsNYXl
	aJMmLWyoBnMeH3yG0u6+bELIHzy52Lj6togCkn71wEZBgpArU1J3Ix3dH5erX9oL57dn
	CD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1pC+BUC5Mapp7/5UiN6XaVH/k8ilccNJbnQXOJySRDs=;
	b=AZJcb7LzXn04wtRgJn9zPf3amvtmtsyoQpfbCe0kvW8R2289DaN1D9uMrWd5aOUCFb
	9hFJ1YCUiRVfi2rbTzh7v6MvoPVOwH9y2YxxniS0E0X/Vc0Oa3TiUi2Zh0TlVfa20BI1
	XVs1S0HS0o8SbcVd39kpp0cCQ9s40V0yKfb4lWbhK50YDQs0xnsCcojimL4ID2+6awLE
	sNln1G2BmMz06ZuG7SuokkGjmRI4aq2AOtJYvompIpmsmiqQN8tLrw2Dx3KSmqqDkj6M
	juELSg8vJ4Ert5sMdfH27dXi5IzYpMWycITddGFFQCUgLNNoi1qUCRyDv+WxMGpBTm/h
	+8lw==
X-Gm-Message-State: AIkVDXIARvzS9hFi4M/d2jkWBDaMiwlpPSuiU7oE1JakEc+V9Fg29XKRNlFeuLDzXDQKEBvdy9f3qtaA3tmgDQ==
X-Received: by 10.223.150.118 with SMTP id c51mr6506263wra.190.1484185961760; 
	Wed, 11 Jan 2017 17:52:41 -0800 (PST)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.194.186.232 with HTTP; Wed, 11 Jan 2017 17:52:21 -0800 (PST)
In-Reply-To: <2377449.YFeu6CDXkj@peggleto-mobl.ger.corp.intel.com>
References: <c93f2baf-e05d-fc8a-0789-9651dc5a1fd4@balister.org>
	<2377449.YFeu6CDXkj@peggleto-mobl.ger.corp.intel.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 11 Jan 2017 17:52:21 -0800
X-Google-Sender-Auth: BO5c1Zs7funFtqhIdUqfrXXFdrI
Message-ID: <CA+YB3rZi0p1LgNzVi-o9n+-ZDaZCar-18oTbuUS5iq-x-D0JrQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] OpenEmbedded Developers Meeting in Portland before ELC
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
X-List-Received-Date: Thu, 12 Jan 2017 01:52:42 -0000
Content-Type: text/plain; charset=UTF-8

That is an excellent question. The main issue is that the room usually
contains 20-25 people who are spread too far apart for many solutions to
hear effectively. This is compounded by normally not having any access to
the room until the morning of the event, so it is always a mad scramble.

This year I am focusing on using a regular conference phone rather than a
fancy solution, so there will be no video but hopefully there will be good
audio. I wish I had a permanent solution, but the room is completely
different at every event. I will keep working on it.

Stay tuned for dialup info (no, it won't be google hangout).

On Wed, Jan 11, 2017 at 5:47 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Mon, 09 Jan 2017 16:04:57 Philip Balister wrote:
> > As we do around each Embedded Linux Conference, OpenEmbedded will host a
> > developer meeting to discuss the state of OpenEmbedded and what efforts
> > we should focus on over the next six months or so.
> >
> > All developers and users are welcome to attend. We like to hear feedback
> > from a variety of people over what works, doesn't work, and is useful to
> > people using OpenEmbedded for all sort of applications.
> >
> > The meeting will be held Monday, Feb 20 at a location we can almost
> > announce. Based on prior years, the meeting will run from 9AM to 5PM.
> >
> > If you are going to attend add your name to:
> >
> > http://openembedded.org/wiki/OEDAM_2017
> >
> > Also, go ahead and add ideas for the agenda. We'll organize them better
> > just before the actual meeting.
>
> So it's great that this is happening, but unfortunately I'm not going to be
> able to make it to this one, and I suspect there will be many others who
> would
> like to participate but can't be present in person. In previous meetings we
> have really struggled with practical means for remote participation. I
> don't
> expect effective real-time two-way communication, but last time the audio
> was
> so poor I wasn't even able to hear what was being said.
>
> Is there a chance that given advance notice we will be able to set
> something
> up that could improve this?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

