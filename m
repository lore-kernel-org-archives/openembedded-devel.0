Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id B9C5B65D07
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 21:47:01 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so5129321obc.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ah51XGLqBHRVztxIuzSwrO2FT3GyZ55ruTC7I3apF/k=;
	b=O8+bt2VxhKIz5wceH/t3vblG9NVwIDBjQnfd4v7uM8uMH7qgCdpl5LPCLoSKsLEM4p
	Z8XWI611ZWaripdJ7UpITGaGlJAFN6UP2hTwbOFiWXW9yFIJFleK793ZAr3VXYCHgUWY
	0hlSHsU0MmMZ2q/I9dv8iBFjJH9jtMxl2uAGl2jc/ItnIYugrgB9BI+DJHD82AHeT7fK
	hqB9xWrb9Rcvm3eLWpImoyb+Ar68L9TCzIBXmR/vfNvEV3Y17z7aCIcBQSHwxR527JHA
	hOuixpZz6ZGzacZVteUk3ZYYN7CCHrWEBI0hjSZ2i2IhV7wuW65WrrUIjuqCnhdDH/rl
	n4lg==
MIME-Version: 1.0
X-Received: by 10.182.24.69 with SMTP id s5mr16167355obf.35.1397166422688;
	Thu, 10 Apr 2014 14:47:02 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Thu, 10 Apr 2014 14:47:02 -0700 (PDT)
In-Reply-To: <CAFZh4h_HaC=rRfgZ_8ibN2XrQdah2y1VWwpj6nqaGVd-_mfuCg@mail.gmail.com>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
	<CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
	<li6b0g$9m6$1@ger.gmane.org>
	<CAFZh4h8oAnNZfswMF+6tf5Byxxc+B0weLLNMQeudLpcdRtmyUg@mail.gmail.com>
	<20140410165626.GQ3370@denix.org>
	<CAFZh4h_HaC=rRfgZ_8ibN2XrQdah2y1VWwpj6nqaGVd-_mfuCg@mail.gmail.com>
Date: Thu, 10 Apr 2014 17:47:02 -0400
Message-ID: <CAFZh4h-B=DZmVrh83EVanO7Xmub07=8NqGSek3xhhwwuLx8Jug@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Apr 2014 21:47:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 10, 2014 at 2:00 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> On Thu, Apr 10, 2014 at 12:56 PM, Denys Dmytriyenko <denis@denix.org>wrote:
>
>> Brian,
>>
>> Be careful, with your eUSB storage device cold-plugged (available on boot)
>> you may run into a race condition, if you initially mount your rootfs in
>> read-only mode and then re-mount in read-write mode during boot. One of
>> the
>> proposed solutions:
>>
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/50124
>>
>> --
>> Denys
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
> At the moment the rootfs is rw in NOR.  In the future I plan for it to be
> squashfs (ro) with a union overlay that is rw ubifs for persistent stuff.
> This is to help protect the rootfs from getting corrupted or accidentally
> hosed up during an update etc.
>
> So I could see where the race condition you mentioned could happen maybe
> in that case but I'm not quite following (yet) how it could happen
> currently in rw mode.  I guess you're saying there is a point where the
> rootfs could be ro and so the udev rule has no mount point to hang the eUSB
> on ... If I'm picking up what you're laying down ('if' being the key word
> :) )
>
> This eUSB is intended to stay on the board at all times and not be hot
> plugged ... but it is socketed (but board is buried in an enclosure) so it
> could be replaced if needed by a technician.
>
> I'll study that patch you mentioned more when I get some time (in SCRUM
> meeting at the time ... joy).
>
> Regards,
>
> Brian
>
>
Hi Denys,

OK, I see what you are talking about now.  In my /etc/fstab I do have sixth
column of root set to 1 so if I'm understanding things right
/etc/rcS.d/S10checkroot.sh could be off checking root mounted ro while udev
sees my eUSB and is in the process of doing RUN mount.sh and trying to
mount /media/sda1 (in my case) before rootfs is remounted back rw.

Ah, I also see that /forcefsck only checks root ... for some reason I was
thinking it would cause fsck to look at fstab and scan all filesystems in
order of sixth column but that doesn't appear to be the case ... so that
answers one of my questions.

I still don't know why my eUSB wasn't checked when I stubbed out udev
automount script and instead added it to fstab with a 2 in the sixth column
... I thought that should of worked but it didn't.  It did in fact mount my
eUSB but it did not check it.  The answer to that too is probably in one of
these rcS scripts that I just haven't seen yet.

So the patch you mentioned is making more sense now.

Let me know if I'm tracking now or still off in the weeds.

Regards,

Brian

