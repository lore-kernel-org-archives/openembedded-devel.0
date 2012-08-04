Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxlUf-00087y-Px
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 23:02:41 +0200
Received: by eaad12 with SMTP id d12so488485eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=clU59DiTKX/Tfj0LZCvlAyxHPKsj3y+CceoJtf2pcfA=;
	b=x9wum7fxc9/c86Dw4eJlXALvdkc7aa02GB0NJn3HHGJTV9gYTRDfsQBlYZr3cqIjHj
	P3E8Ei+gSgIItvf/K5+6GmvEpJjVm9c1h3FFQzHJASYHzCJg1PrNUP0I/XRYWkhK5vAf
	jnbcFOEx4udT3yu1kXdoWFppqJclGTDO6jt4XBkdwlTlCbEYf+Ft+/P0YWK6sxUQKPz2
	xYEWQ1O2KvjJIyMND/eSHZpF76IHU/WP4ysaJRhO2sJQUrlO8YWul5Yk1mWM2UePCP0T
	qLU2Al5NC4BwXgT7+zhq+p/KngYQTlST79erCRTRXpiFicBLM1+AvET6/Ft8+u36upQt
	FILg==
Received: by 10.14.214.197 with SMTP id c45mr7189193eep.37.1344113459423; Sat,
	04 Aug 2012 13:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sat, 4 Aug 2012 13:50:29 -0700 (PDT)
In-Reply-To: <jvk125$nh$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
	<jvk125$nh$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Aug 2012 13:50:29 -0700
Message-ID: <CAMKF1srqhPKJfmGG+5uvkHnv18U9Ye5TM56V1C3tWKHwKHhWbA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Sat, 04 Aug 2012 21:02:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 4, 2012 at 1:35 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> On Fri, Aug 3, 2012 at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> Move gitpkgv into oe-core
>>
>> OK until I fight moving it into OE-Core :) , I have sent a V4 of patchset
>> which creates a copy of gitpkgv.bbclass in meta-systemd. I believe it
>> will be short lived. Please take a look at them and install if ok
>
> Can't you just symlink it from meta-oe? It will be in the same git repo
> anyway. That would avoid having 2 copies

we dont have synlinks in repo I didnt want to create first one and its
reaching across layers
moreover this calss seldom changes. If you prefer symlink I can redo that bit


