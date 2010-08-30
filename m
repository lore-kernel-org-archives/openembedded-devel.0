Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OqA9Q-0003sa-Au
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:36:17 +0200
Received: by wyg36 with SMTP id 36so6410830wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JhitPVm0eCno0wOXAHjE+C5yUc4Eps8PoTnRy34Sq48=;
	b=o3Xlcm8wf3UZLZE3M6Ev1LFNqYssTj0UxQ0vGNbgFAMouWsB6Mc6dzvdPcEesamuhY
	hI3J5uACjtPugv3wgzXoSVu8XwIt+7YVekDpa2UEgUFAKehN+L3Lznr+ML1fPf/XieLm
	27eoXbpswdOGW4zIo0oXue7T3mxInPimNTg7M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZxJryAX2mX5Vz/SQgtm8hrNbJNTtIiqfeGz0RuLKAdDgNixZNOOuiwuEEIHb0/Oomh
	kSqdWuCnKbSp5HF7jdOqPgtThQlEvxWEr/N004Yk0CBJjnv0LofwPiWUrC3ZdZBCrne/
	4B5tbUv2qm50sdvcazryFpQH5zy2yFdPBSYIo=
MIME-Version: 1.0
Received: by 10.227.142.208 with SMTP id r16mr5312303wbu.140.1283196943494;
	Mon, 30 Aug 2010 12:35:43 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Mon, 30 Aug 2010 12:35:43 -0700 (PDT)
In-Reply-To: <4C7C0548.5030803@balister.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<4C7BF64A.6080408@balister.org>
	<AANLkTikfDN6d8X+OgR0AYRyPM78GXwN_RqFAxp48e9d0@mail.gmail.com>
	<4C7BFB14.2010009@balister.org>
	<AANLkTi=OfvXtUvPcTjSvA=v=jXWWdjixgPQp9201jUpH@mail.gmail.com>
	<4C7C0548.5030803@balister.org>
Date: Mon, 30 Aug 2010 12:35:43 -0700
Message-ID: <AANLkTimJhajnpT1vZyW_RetV_1oLgpbGsYeVfmGyzvkA@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 19:36:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Got ya thanks for taking the time to explain it.

On Mon, Aug 30, 2010 at 12:23 PM, Philip Balister <philip@balister.org> wro=
te:
> On 08/30/2010 02:49 PM, J. L. wrote:
>>
>> Why is it bad to expect all packages build for all the machine/distro
>> ? I would think that would be a more "ideal" situation especially if
>> its a supported machine and distro
>
> It is not bad. But we have a lot of packages and the people maintaining
> stuff have limited time. Hopefully the TI kernel guys can find a way to f=
ix
> the issue Frans pointed out.
>
> Philip
>
>>
>>
>>
>> On Mon, Aug 30, 2010 at 11:40 AM, Philip Balister<philip@balister.org>
>> =A0wrote:
>>>
>>> On 08/30/2010 02:35 PM, Frans Meulenbroeks wrote:
>>>>
>>>> 2010/8/30 Philip Balister<philip@balister.org>:
>>>>>
>>>>> On 08/30/2010 01:47 PM, Frans Meulenbroeks wrote:
>>>>>>
>>>>>> The current beagleboard angstrom and minimal distro's (and maybe
>>>>>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>>>>>
>>>>> What is iscsi and why would I need it on the Beagleboard?
>>>>
>>>> http://stgt.sourceforge.net/
>>>>
>>>> the pacakge is from
>>>> http://iscsitarget.sourceforge.net/
>>>> It is used by tgt (http://stgt.sourceforge.net/)
>>>>
>>>> with it you can e.g. mount an iscsi disk.
>>>> iscsi is for instance also supported by windows 7 and by various NAS-e=
s.
>>>> Its throughput is better than Samba or NFS.
>>>>
>>>> So for beagle it could act as mechanism to e.g. retrieve content from =
a
>>>> NAS.
>>>
>>> So the trade off is a kernel that has the best chance of fully supporti=
ng
>>> the OMAP3 peripherals, or attaching to a NAS that is windows centric.
>>>
>>> The point I am trying to make is we can't expect all packages to build
>>> for
>>> every MACHINE/DISTRO combination. People have to make tradeoffs.
>>>
>>> Philip
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


