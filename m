Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (unknown [209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2C684601A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 19:22:57 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so5000352qga.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 12:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZwQ4m/9n4M9aQ+ARiE7ItycNiBCWhT3YKR1EV9ZOHXQ=;
	b=Yv6AdYbTqFRMw2X8jT9vmM6AiFx+YjF7AqOGyIKkqZ8gQPjHMnB42kSttaMaK0zS06
	KBIvRo4v7r9X507xE+w7OLoayvhRj75okQIQwxdHXln+6KDdya+AJ6kjTtJNoR6pr/ul
	zSZtV/PYSRIMtHpgdbp2PCytroQPcx5IINEXKf23FSQP2U+b0+ZGEZCgIpEQSEpOmlu/
	6wZKf2D8dlWxsDg2gmGdJMRUuypMFBXRmE8fnblilnmGnrsnSDTbDpnGrVbhvbxudWT7
	dZT0/5QU5d6ddFZVSm69PcqHY0pP/MGFZO1onQCXLsXcZob9drdC3EinHgpp3UHYOe5y
	YfhQ==
X-Gm-Message-State: ALoCoQmftqgLA5rmG3Mwlm98zUWmQDnXm+jejd930kdkutwei4P/UFq2rVAYs6TpYQY8Y6wQ85f2
X-Received: by 10.140.48.161 with SMTP id o30mr16953829qga.68.1399663368341;
	Fri, 09 May 2014 12:22:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 12:22:27 -0700 (PDT)
In-Reply-To: <536CF208.3000400@gmx.de>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
	<536CF208.3000400@gmx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 20:22:27 +0100
Message-ID: <CAJTo0LZJ-cLjvGH5YZA1Tu-Wz6biKn=A2mVp5rrkwzkFB-ggTg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] GStreamer 0.10's future
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
X-List-Received-Date: Fri, 09 May 2014 19:22:58 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 16:19, Neuer User <auslands-kv@gmx.de> wrote:
> Yes, it does, as long as you need QtMultimedia. Same applies to Qt5.
> There was a discussion on the Qt mailing list about moving to
> gstreamer1.0, but this seems to be rather some time in the future was my
> impression.

So Qt 5.3 won't have GStreamer 1.0 support.  The port is being done in
a branch so it's possible that it will land in Qt 5.4, which is due to
be released in the September/October timeframe.

One option would be to move GStreamer 0.10 into another layer, give
Qt4/Qt5 disabled-by-default GStreamer 0.10 options and hope that by
the time Yocto 1.7 is released, Qt5.4 with GStreamer 1.0 is also
released.  Even as someone who's rather keen on removing cruft from
oe-core that's a bit too eager for my liking.

Revised plan unless anyone has a better idea: in 1.7 we'll move
everything possible away from GStreamer 0.10 but keep 0.10 around
until the 1.8 cycle, and then revisit the Qt situation.

Ross

