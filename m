Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXbFH-0005wP-Is
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 16:13:54 +0100
Received: by iyj18 with SMTP id 18so8655406iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 07:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=hBuoY/jW5djHGkaoSKHVwhRW58vYYNsgpgP0gucQKnM=;
	b=DRq8dYWfYvjiuydM/cL9rv1T0VO4+irWzXs/1g/yPvWLGpZeEMk0TMzSFadBAhCLSO
	BzlQj/0FtbM6VR+yht/aM7KB1+Wn/GsQh3jocYBobtGh6gTG3SS7QfiXkhTrnINWLiyh
	ThBdL8TUeyfG+DWrd0f1TLOsJy64tvntHvmeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=mOWtGVchqVmU8lgIjdljW+PqUN8RTlcW7XxFBSeZbbAJOucbGWDVrfjnHnZkA/iMBM
	fSGcYV1fMAf3H/gA2mi9btByi0LW7zQ7Pf7sQHTMSZJ8kCd7Si+b3l8FMqrq4+2Qe89g
	jek5ZrJNZBxRnWlb9/B/G7VFhWDjfsSFBwT/o=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr13641053ibc.7.1293548733140; Tue, 28
	Dec 2010 07:05:33 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 07:05:33 -0800 (PST)
In-Reply-To: <87oc862bu8.fsf@gmail.com>
References: <1293492484-13523-1-git-send-email-bgamari.foss@gmail.com>
	<AANLkTin-A9NjN_heXGtk1k=9WTrKPoaAa0i=bP5B41zU@mail.gmail.com>
	<87oc862bu8.fsf@gmail.com>
Date: Tue, 28 Dec 2010 16:05:33 +0100
Message-ID: <AANLkTimwEVLLciba85rY4NOiLOdW3veFtHao7BJ9SjYN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Ben Gamari <bgamari@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Boost 1.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Dec 2010 15:13:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/28 Ben Gamari <bgamari@gmail.com>:
> On Tue, 28 Dec 2010 09:12:51 +0100, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> 2010/12/28 Ben Gamari <bgamari.foss@gmail.com>:
>>
>> [...]
>>
>> > After quite a few exchanges with the boost folks and many hours of frustration,
>> > I think I finally have a working recipe. I'd appreciate it if people could try
>> > this and perhaps give some feedback. I can successfully build the package, but
>> > given the quirky nature of the build system it seems likely someone will find
>> > some configuration-specific issues.
>>
>> Ben,
>>
>> Thanks for your email, but....
>>
>> If you do not attach or inline your recipe it is highly unlikely that
>> you will get any feedback.
>>
> Well, this is odd. I actually did use git-send-email yet somehow it
> seems like the patch never made it. There must have been an error I
> missed.
>

Actually the patch made it, after I replied to you.

From the headers: trimmed some irrelevant fields

Received: by 10.231.200.140 with SMTP id ew12cs183342ibb;
        Tue, 28 Dec 2010 02:29:25 -0800 (PST)
Received: by 10.150.92.21 with SMTP id p21mr5378669ybb.9.1293532164220;
        Tue, 28 Dec 2010 02:29:24 -0800 (PST)
Return-Path: <openembedded-devel-bounces@lists.openembedded.org>
Received: from linuxtogo.org (linuxtogo.org [188.40.83.200])
        by mx.google.com with ESMTPS id q34si33260779ybk.61.2010.12.28.02.21.52
        (version=TLSv1/SSLv3 cipher=RC4-MD5);
        Tue, 28 Dec 2010 02:29:24 -0800 (PST)
Received: from localhost ([127.0.0.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-devel-bounces@lists.openembedded.org>)
	id 1PXQv7-0008CO-JK; Tue, 28 Dec 2010 05:12:21 +0100
Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PXMVU-0004pO-Lp
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 00:30:54 +0100
Received: by qwg5 with SMTP id 5so8578239qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 15:28:11 -0800 (PST)
Received: by 10.229.95.19 with SMTP id b19mr11363730qcn.179.1293492490412;
	Mon, 27 Dec 2010 15:28:10 -0800 (PST)
Received: from ben-laptop (c-24-61-223-13.hsd1.nh.comcast.net [24.61.223.13])
	by mx.google.com with ESMTPS id t7sm6133841qcs.40.2010.12.27.15.28.09
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 15:28:10 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 18:28:04 -0500


Seems it took 11 hrs to get from you to me (if I interpret the data properly).
your python post did not make it at all to here, but it did get to the
gmane archive.

Frans


