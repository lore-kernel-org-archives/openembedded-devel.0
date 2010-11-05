Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PEOPJ-0007Z4-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 16:40:50 +0100
Received: by yxe42 with SMTP id 42so2309127yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=vXIu2Ihv5QNShkulz2JZmwl6CSJtYCQ0rJSJipkfqzI=;
	b=hlsGaJqRcB7IRxDykwnYaV1nkbAUcade3bPDs8Y2Y5GXL2mqMGqXKg704De2Wur9Lt
	QE+WFdojSB846dymUl+KVXhJkTvi5XE1ZyIXXtlY1cY5EmnGG7Y5o89m2zsnpcN1yQOW
	Al1S9lkmGy7JjBAXrp3gn3nRyQ22ad94rJdbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=MePfcYZGeO8/KMwXIi0q9reKqIP8w6mxbRRQAy7Hhv203AH28VwRbQw2KE6/JPQBNe
	4arAUdMd/40khs/mIRi7XYm0r1yCheTz5ocaakAKBIt/glG13BXpujYfqxmD144tsOj9
	gY5EzswfSquoHCfTYEKcsMrfmyI64ajUj5LKg=
Received: by 10.42.170.71 with SMTP id e7mr1515951icz.91.1288971595636; Fri,
	05 Nov 2010 08:39:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.246.4 with HTTP; Fri, 5 Nov 2010 08:39:34 -0700 (PDT)
In-Reply-To: <AANLkTimKNoeH7LWFgC0zaj7Rp045mMw_CKtJn5D+pVkz@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
	<20101103154735.GE3440@jama>
	<AANLkTi=d_G9A0Mf2zMzG-9zmec06vYNaB1pLrkDQnyvE@mail.gmail.com>
	<AANLkTikcC1DKQ8ADas78qPZRMeGF09MXY8ph7qoZT=1Y@mail.gmail.com>
	<AANLkTimcum78VPKqr9YiFYUdYf84Hnifs9Phs9uUAQt4@mail.gmail.com>
	<AANLkTinbqMqinR7jaaV_rMqA8nU6D2EZ_G_Ppe6XW41f@mail.gmail.com>
	<AANLkTin7K8vW2E0_MhMp+B_9YKCKpG+fCff4WmGmLnwf@mail.gmail.com>
	<AANLkTimKNoeH7LWFgC0zaj7Rp045mMw_CKtJn5D+pVkz@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 08:39:34 -0700
Message-ID: <AANLkTinianh_SAT_yuiw_2N6S7qhK-kS9f_SRjrq4Tfp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Fri, 05 Nov 2010 15:40:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 5, 2010 at 12:51 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>> On Wed, Nov 3, 2010 at 1:21 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>>>> On Wed, Nov 3, 2010 at 12:04 PM, Frans Meulenbroeks
>>>> <fransmeulenbroeks@gmail.com> wrote:
>>>>> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>>>>>
>>>>>>
>>>>>> yes a more detailed solution is better. you have to go through the
>>>>>> configure of every
>>>>>> package and understand the behavior then act upon. As I said before
>>>>>> its a tedious task
>>>>>>
>>>>> I'm well aware of this. That is also why in the infrastructure thread
>>>>> I suggested using automated testing to find misbehaving packages.
>>>>>
>>>>> Btw there are 355 .inc files that contain the word autotools and 1899 .bb files.
>>>>> Of course there are lots of dups in there.
>>>>> And maybe for the base recipes we can convince the yocto people that
>>>>> this is a serious QA issue (and they have some people employed to work
>>>>> on this if I understood properly).
>>>>>
>>>>
>>>> numbers means not so much when it comes down to this. I don't know if
>>>> any distribution that even does that
>>>> so I take comfort in everyone being wrong.
>>>>
>>>
>>> I agree that numbers don't mean that much. Just wanted to give an
>>> indication of the possible effort needed.
>>> Also no idea how debian does this.
>>
>> Does it do it in first place ?
>
> I peeked briefly at the sources.
> Debian seems to resolve the problem by going for the max dependencies
> so autotools can pick up everything.
> E.g. for gphoto2, lenny has a depends on both libexif and libreadline
> (see http://packages.debian.org/lenny/gphoto2)
> So basically they go for the max config.
>
> We could do the same. Then again for deeply embedded systems it might
> be desirable to allow more finegrained tuning.
> (did I hear someone say USE flags ? )
>

which is good for things that dont care about size. Not so good for
embedded systems I think.
and there are some packages I know which have catch-22 situation so
adding max depends is
also not a wholesome solution.

> Enjoy! Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


