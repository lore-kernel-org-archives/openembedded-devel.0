Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tunhm-0004c6-0g
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 18:20:29 +0100
Received: by mail-vc0-f179.google.com with SMTP id p1so3699831vcq.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 09:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Bir2s/0PeunHAq+HUhU+k9XILu0pf2d3xvK+qXB2HpE=;
	b=j9ch1ty2GWoct6RLxc7OZ1dd9kvS9g4o8BeemvLJ0PLZIFTTv94ZXsk1v0lC98csIR
	V4s++Cfmuqw/gpsx73K1MYZqv+1lDPvacxwW/kfGWuEq8hBfPorAULvxMstFg1oFC96w
	0lWi3ZILze4eu+YUzcwSPylK0JJZKiYFZKu9Us/fj+uUg7T0upnOeyUNsk+0qbMFcZvv
	bTeR5pArQIw2ry9zFgr9lGZGpu9D98WCtTjBKeZlFRGvd2pP6N6DT9+RVwfvFX9lgKim
	ozdBf3dptKV4fILJSZQ34M1LTl4PDTAn0YGpV8+TNgGfrgWosECkNnj3ukvyJhVm6SG8
	2Reg==
MIME-Version: 1.0
Received: by 10.58.15.227 with SMTP id a3mr106188846ved.38.1358183094590; Mon,
	14 Jan 2013 09:04:54 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 14 Jan 2013 09:04:54 -0800 (PST)
In-Reply-To: <1877450.6sZ4HM91lS@helios>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
	<CAF6bG8ewV-MJArsCy799uW55nU7ftwJiYoga95rq5CeqEhY8EA@mail.gmail.com>
	<1877450.6sZ4HM91lS@helios>
Date: Mon, 14 Jan 2013 19:04:54 +0200
Message-ID: <CAF6bG8ft2NSeedD23FHet5izvUpRqT5G+gO6J88tSOGS72DL_w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 17:20:32 -0000
Content-Type: text/plain; charset=UTF-8

On 14 January 2013 18:49, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Monday 14 January 2013 16:36:05 Marko Lindqvist wrote:
>> On 14 January 2013 15:34, Paul Eggleton <paul.eggleton@linux.intel.com
>> wrote:
>> > There is a meta-games FYI, I think this is possibly where these recipes
>> > ought to have gone.
>>
>>  They actually are there at the moment. But as I have considered them
>> not games specific, they have been marked as something that lives
>> there only temporarily until they can be properly introduced to more
>> general layers. I guess Andreas has been working on that basis. My bad
>> for not checking from generic layers if they would be accepted.
>>  So, what's the concensus. Should they be removed from meta-games as
>> they are in general layer, or should they be moved from staging area
>> of meta-games to official game libraries area?
>
> I would have thought we should consider meta-games to be the canonical place
> for gaming-related recipes.

 Games and libraries that clearly are for games only (allegro at the
moment) belong to meta-games, but components that could be used by
non-game recipes are less clear. Keep them in meta-games until there
actually is some non-game recipe depending on them forcing their move
to general layers, or introduce them to general layers from the
beginning (or as I've done now, quick and dirty addition to meta-games
with TODO to make proper addition to general layer)?


 - ML


