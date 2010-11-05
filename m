Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEPzA-0000IE-9I
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 18:21:58 +0100
Received: by yxe42 with SMTP id 42so2398563yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zjZNRCvErZAb7rQLcozFnCD6Vl3dz8XrvF13iEykREk=;
	b=m2WZs2fuc/LpVF6YSZDPXPMlqGs8bpssT3yIg0e6TYRIZ6u9gYdQfbnHmnxuzAXj+v
	g8QaZghN9dW0+XZkQ3SODaPzNwU+sxoCdv3CrS6XJqQjXXIkaopOPBGNqcu0/hUamWq0
	tUZ1hfM/09vmyAzRAHwcAki2QuI71Cujkin1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YQKr8uHKDo8aFWc1qDiDl5ed70cSfzyS7BuP7T4u/bGYUYOSxTojtmOnxpXnPKu7qI
	kKA5eKLC1eZc2HLpKIuhKEnp6W8SuY2pXj11Piefi+6eweazyV3sJeMDTcACLVmtLjOw
	6n5qRDQOrFr5W3NFfCaAsx8J7jW0ERrtkn+fQ=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr2134131icb.134.1288977662163; Fri,
	05 Nov 2010 10:21:02 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 10:21:01 -0700 (PDT)
In-Reply-To: <AANLkTinianh_SAT_yuiw_2N6S7qhK-kS9f_SRjrq4Tfp@mail.gmail.com>
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
	<AANLkTinianh_SAT_yuiw_2N6S7qhK-kS9f_SRjrq4Tfp@mail.gmail.com>
Date: Fri, 5 Nov 2010 18:21:01 +0100
Message-ID: <AANLkTimdf2XqdVdROH2+L6CJSFstbNEAKYk5PswO4++7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Fri, 05 Nov 2010 17:21:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/5 Khem Raj <raj.khem@gmail.com>:
> On Fri, Nov 5, 2010 at 12:51 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>>> On Wed, Nov 3, 2010 at 1:21 PM, Frans Meulenbroeks
>>> <fransmeulenbroeks@gmail.com> wrote:
>>>> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>>>>> On Wed, Nov 3, 2010 at 12:04 PM, Frans Meulenbroeks
>>>>> <fransmeulenbroeks@gmail.com> wrote:
>>>>>> 2010/11/3 Khem Raj <raj.khem@gmail.com>:
>>>>>>
>>>>>>>
>>>>>>> yes a more detailed solution is better. you have to go through the
>>>>>>> configure of every
>>>>>>> package and understand the behavior then act upon. As I said before
>>>>>>> its a tedious task
>>>>>>>
>>>>>> I'm well aware of this. That is also why in the infrastructure thread
>>>>>> I suggested using automated testing to find misbehaving packages.
>>>>>>
>>>>>> Btw there are 355 .inc files that contain the word autotools and 1899 .bb files.
>>>>>> Of course there are lots of dups in there.
>>>>>> And maybe for the base recipes we can convince the yocto people that
>>>>>> this is a serious QA issue (and they have some people employed to work
>>>>>> on this if I understood properly).
>>>>>>
>>>>>
>>>>> numbers means not so much when it comes down to this. I don't know if
>>>>> any distribution that even does that
>>>>> so I take comfort in everyone being wrong.
>>>>>
>>>>
>>>> I agree that numbers don't mean that much. Just wanted to give an
>>>> indication of the possible effort needed.
>>>> Also no idea how debian does this.
>>>
>>> Does it do it in first place ?
>>
>> I peeked briefly at the sources.
>> Debian seems to resolve the problem by going for the max dependencies
>> so autotools can pick up everything.
>> E.g. for gphoto2, lenny has a depends on both libexif and libreadline
>> (see http://packages.debian.org/lenny/gphoto2)
>> So basically they go for the max config.
>>
>> We could do the same. Then again for deeply embedded systems it might
>> be desirable to allow more finegrained tuning.
>> (did I hear someone say USE flags ? )
>>
>
> which is good for things that dont care about size. Not so good for
> embedded systems I think.
> and there are some packages I know which have catch-22 situation so
> adding max depends is
> also not a wholesome solution.
>

Catch22 situations seem mostly to appear because one packag exports
both a lib and a (sample) program.
One example that I saw recently was libcdio and libcddb.

Probably the only other way of catch 22 situations are triple or
quadruple staged builds.(build A, build B rebuild A maybe rebuild B)

Frans


