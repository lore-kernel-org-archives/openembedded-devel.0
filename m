Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKvy5-00066l-P8
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:43:46 +0100
Received: by gxk2 with SMTP id 2so5232383gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=2JsS5iABsHzF7E8MNsVwB8xlV20TaI05mAetSi0TGTQ=;
	b=xPREKCBgDGiovsMU1cjF6kya3RMQeFAp32l7CAwPjNlQc8YtX0at9hWyTkadSXI60R
	vPUF5/gs1ldQedbbejFA5Uh79Vtjkg8qHX4hFsQkGzDgqX+Vo9Pr7CJuto5gXXS3u09V
	7VvG8gZiq+J3TekL8eTIrXK6/Qzq4D933abdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=kXRRE5w6nUV+dqzW+/CtkZNby2AD84NHC3nBR6FnPPeGGc3gBnlBQ4nbwCTSNUeyeF
	ELCnxwDIicKNxP3j5lo10wNvrzuSS/ZzKR0kvGp2lBcjm7C2eMvzrKD30jgVpdd7txc6
	espUzEUnkNfnKG8aJhQ/JnVN+aeGnivFhDHvI=
Received: by 10.91.51.19 with SMTP id d19mr8897599agk.183.1290530552368; Tue,
	23 Nov 2010 08:42:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 08:42:12 -0800 (PST)
In-Reply-To: <AANLkTike5K3is8FUg9CiBD4t-3FDQRveH00Y1UAxW479@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<4CEBDFF0.2070001@cbnco.com>
	<AANLkTike5K3is8FUg9CiBD4t-3FDQRveH00Y1UAxW479@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 08:42:12 -0800
Message-ID: <AANLkTimLGvrnr+XERhzMtktHN9Mm9MMBj6AQiAeki7Ri@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 16:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 7:41 AM, Robert Foerster <robert@erafx.com> wrote:
> Yea, in testing again, I am getting the same results now with num_cpu or
> 2*num_cpu. =C2=A0All 4 cores are pegged at 100% either way.
>
> Not sure what causes the hiccup in the number before, must have been
> something else consuming CPU.
>
> On Tue, Nov 23, 2010 at 10:38 AM, Michael Smith <msmith@cbnco.com> wrote:
>
>> Chris Larson wrote:
>>
>>> Thanks for your time, and do let me know what you think, either of the
>>> code, performance in general, or the new progress bar (shows an ETA),
>>> or anything else :)
>>>
>>
FWIW I have been using it full time for past few days
and it has been delivering the results. So I am quite happy with
it. my parsing on a dual core p4 went down from 12min to 5mins


>> On a Xen VM with 3 vcpus, this is just brilliant. I used the default num=
ber
>> of parse threads (i.e. 3). The CPUs are pretty much pegged.
>>
>> Mike
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


