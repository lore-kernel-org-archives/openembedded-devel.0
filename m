Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TtJjO-0001bd-8d
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 16:07:47 +0100
Received: by mail-oa0-f43.google.com with SMTP id k1so650595oag.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=q9Ao9fj/osp2yK6XAZt+yS0EcsSi5W1Il2cdRUf6pXE=;
	b=O1cMBfhgmYv6ZNtYucPn95N7N2ALUi2xGrd62WEwK27736khOcEPowpIXkf9Gg3hfa
	ikD9a8bOyS7Izf8cTWeY8PX3nRIgMpXJ0x/cuX+WoQ7MgXEIUv/EBNmcoNTB5KGuTjOW
	e5FuSrIrUXD9mK3UydILuZMQnX3u5tZN5eNiFxn1SRLH9+joHnfxmvMHbQB6l/2zifrw
	XzV7Ih5Y7wMPszU1ZC0QPP9cBhuMOJlY0xBVTSCja14mrf1RqrJ65xc702oS5XCZCj1+
	nOHm6J6lDIFMTyIfXELC0Cvm55Ax7RDgsxKp1w9UvW4li4iPGOtbfmsn1r8HbQRL64BC
	7/HQ==
MIME-Version: 1.0
Received: by 10.182.17.103 with SMTP id n7mr51433384obd.49.1357829552299; Thu,
	10 Jan 2013 06:52:32 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 10 Jan 2013 06:52:32 -0800 (PST)
In-Reply-To: <20130110110535.GW3722@jama.palm1.palmone.com>
References: <CAGiJk9d25RWg6UB-wO5Eg3M80MWjBhu6Kk=pVKbMzAaS440WKg@mail.gmail.com>
	<20130110110535.GW3722@jama.palm1.palmone.com>
Date: Thu, 10 Jan 2013 15:52:32 +0100
Message-ID: <CAGiJk9c5L=T4eia+bJeZtvr_KDRgpZOCoYKAAgPLxBxqKGb8tA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Disabling sstate cache generation
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
X-List-Received-Date: Thu, 10 Jan 2013 15:07:48 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/10 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Jan 10, 2013 at 11:59:53AM +0100, Samuel Stirtzel wrote:
>> Hi,
>>
>> what is the preferred way to disable sstate cache generation?
>>
>> In my use-case the build machine doesn't do incremental builds (e.g.
>> it only does builds from scratch)
>
> http://patchwork.openembedded.org/patch/17039/
>

Thanks,

this patch works good (saves ~20 minutes per build),
may I ask why it was rejected back then?



--
Regards
Samuel


