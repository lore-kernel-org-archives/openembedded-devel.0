Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87A7465D65
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 18:00:19 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id i7so4848599oag.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=evQT4VThYYP0JHgMfsxS2plSzTsL2fxFjzai2M1DwF0=;
	b=C7NYYqy/kk+CDFfCb+Nu1oaOZMIaqizWTTghFVXS+jkYt/XzT9YAfAQw68yqsMPS6s
	0731oI2skmy+UBzzPcGtILlPx2Qu7vtTIZkjsTv+2YTg4+Z1PEbIV1CLkPdi8zl8ry9Y
	TiQiIoXgd1Ni8j+EU9MURtNsUN87/erBjb9KeINjtYLIulqmrDg8AW8DcIiM4jTZyHZL
	AsvPL4EdH+yAK1SPEeK1ojMDO4bViJEBFEE4DsUUpWOEsTUChIet82POxN73SKax7Q2K
	4UZcNCJmzoSR4I5ZumiIvfK9k2+bDQtSNC3Stfze8jBLUJ+0UvfF91RLDHo8e8MAvJVs
	2Y1A==
MIME-Version: 1.0
X-Received: by 10.60.135.226 with SMTP id pv2mr2753584oeb.62.1397152819304;
	Thu, 10 Apr 2014 11:00:19 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Thu, 10 Apr 2014 11:00:19 -0700 (PDT)
In-Reply-To: <20140410165626.GQ3370@denix.org>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
	<CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
	<li6b0g$9m6$1@ger.gmane.org>
	<CAFZh4h8oAnNZfswMF+6tf5Byxxc+B0weLLNMQeudLpcdRtmyUg@mail.gmail.com>
	<20140410165626.GQ3370@denix.org>
Date: Thu, 10 Apr 2014 14:00:19 -0400
Message-ID: <CAFZh4h_HaC=rRfgZ_8ibN2XrQdah2y1VWwpj6nqaGVd-_mfuCg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: udev auto-mount not doing fsck
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
X-List-Received-Date: Thu, 10 Apr 2014 18:00:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 10, 2014 at 12:56 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Brian,
>
> Be careful, with your eUSB storage device cold-plugged (available on boot)
> you may run into a race condition, if you initially mount your rootfs in
> read-only mode and then re-mount in read-write mode during boot. One of the
> proposed solutions:
>
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/50124
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

At the moment the rootfs is rw in NOR.  In the future I plan for it to be
squashfs (ro) with a union overlay that is rw ubifs for persistent stuff.
This is to help protect the rootfs from getting corrupted or accidentally
hosed up during an update etc.

So I could see where the race condition you mentioned could happen maybe in
that case but I'm not quite following (yet) how it could happen currently
in rw mode.  I guess you're saying there is a point where the rootfs could
be ro and so the udev rule has no mount point to hang the eUSB on ... If
I'm picking up what you're laying down ('if' being the key word :) )

This eUSB is intended to stay on the board at all times and not be hot
plugged ... but it is socketed (but board is buried in an enclosure) so it
could be replaced if needed by a technician.

I'll study that patch you mentioned more when I get some time (in SCRUM
meeting at the time ... joy).

Regards,

Brian

