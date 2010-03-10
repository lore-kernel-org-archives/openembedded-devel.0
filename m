Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NpUXy-0001nb-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 23:38:39 +0100
Received: by iwn4 with SMTP id 4so8258838iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 14:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E5qMuGy2/9Kxm/Lu932ldsfGQS8/HqnhhSX7BXPMIL4=;
	b=QPGxIQloHXHGZMx731g8HQVQ1Wy8T4uzDTdQjaRrtDX9s48rdzH2GOx43vyDvhXf/N
	og0FZjSTrOBdDvwklQrVKWlPPbUODL5c4nKJxO095cDrJWO+QwLEMSuXArRsIsgGM8V5
	+1JjoLSL0YXyiHMiv48W89GqSaT0gbFvptk8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=soOOddDPFNdOKHR6vqv2ygv+DPeYUhuvaczdUAeg0uWxLUyZg7U8ozGs0z+9slIx6E
	OK0Q4GzHyWqA2M5bs8We18v7zH2PSdf/nsIboM1XFSiIAd/o4DclFOSYUWH9EOhok4py
	GTTdjwNoJT3aIUNfzh0VL5PyEOx0KV6QaBaPo=
MIME-Version: 1.0
Received: by 10.231.147.149 with SMTP id l21mr280151ibv.0.1268260535450; Wed, 
	10 Mar 2010 14:35:35 -0800 (PST)
In-Reply-To: <201003101030.17054.roman@khimov.ru>
References: <201003082201.30147.roman@khimov.ru>
	<201003092200.18460.roman@khimov.ru>
	<19c1b8a91003091426j2d226a43yc2e3635d1af3706@mail.gmail.com>
	<201003101030.17054.roman@khimov.ru>
Date: Wed, 10 Mar 2010 14:35:35 -0800
Message-ID: <19c1b8a91003101435h30acb0d1w384248b07f4fc2ae@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Wed, 10 Mar 2010 22:38:39 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/3/9 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 10 =CD=C1=D2=D4=C1=
 2010 01:26:34 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
>> 2010/3/9 Roman I Khimov <roman@khimov.ru>:
>> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 09 =CD=C1=
=D2=D4=C1 2010 21:50:35 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
>> >> sanity: remove /proc/sys/vm/mmap_min_addr check
>> >> will older kernels like 2.6.21 etc. work well with newer qemu and won=
t
>> >> require this check?
>> >
>> > Well, as commit message says, 2.6.26 was also tested and worked fine w=
ith
>> > qemu 0.12.3 with three different mmap_min_addr-es.
>>
>> well I have boxes with 2.6.21 but I can know by doing :)
>
> I think it should be fine, but try it out, of course.

seems to work ok AFAICT
>
> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


