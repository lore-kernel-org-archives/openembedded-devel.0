Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6461E60809
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 19:04:30 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id nu7so2631330obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 12:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=I/y1RguUiiQhO3iPGhRmouVPfkUox4JZ9PpKo80qhhQ=;
	b=I3wV+8cuttiQ7W+wNcEdj4XJF+0UACyJ7sH1wjeXvsAz6/Ye6ymsbfRVhEu5ap7AVG
	f/W6Z+eJY80k+MkZe7Tj2H7Q7UvmODVUm/8pCxmV+qmm72ZopBIxrUwEcxsm7R5uVz3P
	jY5gYKWd8Ht+FdEQZoBjqewlfbVM+JRB1JuGjFSjlpLoESYebmjmX6BT+T4z/5B22YGP
	J+Ebg+Cjr4/rotKZTlYc+9zf4GTbsUZOJBCmh2zK7rMeERztB1aK06NUPoU+BgXGNm0P
	LVkvLsoXUBJI2YFzQsdM/fYFTrpwot4F0Op3lSBTGTdtqY81v9gRvP1hwXYdjryjQdkK
	jTrQ==
MIME-Version: 1.0
X-Received: by 10.60.129.161 with SMTP id nx1mr10295578oeb.28.1403723071241;
	Wed, 25 Jun 2014 12:04:31 -0700 (PDT)
Received: by 10.60.155.209 with HTTP; Wed, 25 Jun 2014 12:04:31 -0700 (PDT)
In-Reply-To: <53AB1718.7000608@balister.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org>
Date: Wed, 25 Jun 2014 15:04:31 -0400
Message-ID: <CAFZh4h80FCq=6u-enoDTzreQhBRB+Sgko+8hRzWRrk1EoS00nw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 19:04:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 25, 2014 at 2:38 PM, Philip Balister <philip@balister.org> wrote:
> On 06/25/2014 03:07 AM, Paul Eggleton wrote:
>> On Tuesday 24 June 2014 16:14:58 Philip Balister wrote:
>>> What's the best available solution for creating an image you can dd to
>>> an SD card? It seems like this wheel has been invented several times and
>>> I am wondering if people are converging on one approach.
>>>
>>> Bonus points for resizing the linux partition.
>>>
>>> How are people doing this today?
>>
>> I think wic has seen some uptake and enhancement since its introduction a
>> couple of releases ago. It has certainly worked for me in writing SD cards for
>> Galileo. We seem to be a bit short on documentation for it though...
>
> Googling for "wic sd" doesn't help. I've seen some commits, so I'll take
> a look in the meta data.
>
> Philip

I think he's talking about:
http://patchwork.openembedded.org/patch/59059/
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847

B

