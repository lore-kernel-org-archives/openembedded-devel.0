Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4iDl-0001jq-L1
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 01:25:41 +0100
Received: by lagw12 with SMTP id w12so5557213lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 16:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.147.1 as permitted sender)
	client-ip=10.152.147.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.147.1 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr20636267lab.22.1330993026532
	(num_hops = 1); Mon, 05 Mar 2012 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HIxrTE1euJtzftoFYvOflFB8DVALClvgiWgftDRWAsM=;
	b=GTh3cQpA4gMojOEkEUzHg7Kq6XmsdOQ7gnnkWCze9p3bZwl3ZK/a2FTY8O3bAPDQ4X
	Kuzi8/TloVVjLQccvUsP3zZKeX941RN5+wkEk0dVVr5guR+0jqz+Udbw4TE3Fw+Z0o9P
	sfceCYt6nlhoBMO6t44p3hZN0WkT6GKr/XxwnuK+768E7iHxz9GcP/ccw6M+kpGD2xcg
	Ni2+zR63E3Yod1Nn9d8OH8jYBJxWK1z517t9ghzK6timf8mk9poH4o+jA9XTpkdkq5N3
	BJIwEd5QLvI0iXv4lNUPtDAchfetTRI57Vs9nysSTJ1Pqn6tTQdRZHyzgQXCggn2fCgb
	iApw==
MIME-Version: 1.0
Received: by 10.152.147.1 with SMTP id tg1mr16854375lab.22.1330993026415; Mon,
	05 Mar 2012 16:17:06 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Mon, 5 Mar 2012 16:17:06 -0800 (PST)
In-Reply-To: <4F5540E8.7030305@mlbassoc.com>
References: <4F54C8C2.5020003@mlbassoc.com>
	<CALbNGRRNwFXh0Ppwr1JrUWp4TwsJXELVM74OxfpVY=X5NpVU2Q@mail.gmail.com>
	<4F54CEF0.70902@mlbassoc.com>
	<CALbNGRQk__t-U0VmHpQ=sXeoCXrjA7vbREFbBYjy-+v2F97a_Q@mail.gmail.com>
	<4F54D902.90304@mlbassoc.com> <4F5540E8.7030305@mlbassoc.com>
Date: Tue, 6 Mar 2012 00:17:06 +0000
Message-ID: <CALbNGRQ_SF91y1uQ4HC70ObrMrn4yHW-LmGkE3Pgw4TSn=JDTA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla] Can't access any HTTPS page
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
X-List-Received-Date: Tue, 06 Mar 2012 00:25:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 10:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-03-05 08:17, Gary Thomas wrote:
>>
>> On 2012-03-05 08:04, Andreas M=FCller wrote:
>>>
>>> On Mon, Mar 5, 2012 at 3:34 PM, Gary Thomas<gary@mlbassoc.com> wrote:
>>>>
>>>> On 2012-03-05 07:18, Andreas M=FCller wrote:
>>>>>
>>>>>
>>>>> On Mon, Mar 5, 2012 at 3:08 PM, Gary Thomas<gary@mlbassoc.com> wrote:
>>>>>>
>>>>>>
>>>>>> I've added firefox to my platform by adding the meta-mozilla layer
>>>>>> (and it's requirements). To include firefox, all I did was
>>>>>> CORE_EXTRA_IMAGE_INSTALL +=3D "firefox"
>>>>>>
>>>>>> With this setup, firefox works, but not with any SSL page,
>>>>>> e.g. trying to access https://google.com/mail gives me this
>>>>>> error screen:
>>>>>>
>>>>>> Secure Connection Failed
>>>>>> An error occurred during a connection to accounts.google.com.
>>>>>> security library: memory allocation failure.
>>>>>> (Error code: sec_error_no_memory)
>>>>>>
>>>>>> The page you are trying to view can not be shown because the
>>>>>> authenticity
>>>>>> of the received data could not be verified.
>>>>>> Please contact the website owners to inform them of this problem.
>>>>>> Alternatively, use the command found in the help menu to report this
>>>>>> broken
>>>>>> site.
>>>>>>
>>>>>> Did I miss something? Has anyone else tried this?
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>> Is the time of your system valid ( if I remember right I had similar
>>>>> when system time was unbuffered initial at 01.01.2000 )?
>>>>
>>>>
>>>>
>>>> Yes, the time is set correctly.
>>>>
>>> AArgh - the system time caused trouble on cookies - other issue sorry.
>>>
>>> In midori it helped to install glib-networking ( see meta-oe commit
>>> a56bff13b9d22b608352501fbb3ef124e7147bda ). Maybe this helps for
>>> firefox too?
>>
>>
>> Sorry, no change.
>>
>
> The real question though is "does firefox HTTPS built from meta-mozilla
> actually work for anyone?" =A0If so, what configuration (target platform,
> etc) works?
>
Yes it works fine for me - this email is written on my overo. Maybe
you want to take a look at the image I use [1]

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/reci=
pes-image/xfce-base-image.bb


