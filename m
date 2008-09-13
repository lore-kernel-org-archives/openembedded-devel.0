Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeZsq-0003de-Pp
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 20:30:13 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1790559rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=dNdrOD4FDJzFUOLXSvL2GAFFek6oxnjIrimD4JePpyw=;
	b=kQj6hwSTSmGRO9pif8VAJsIKw/GLFwAKyJjua982HQN8DFgqgk45SuSzv9gLH5M33c
	F8DxLXS68aYYyry3McqjgAd30TwKjfJyaandxE9KeInBJKxe/NvBluBxMswktDn9+NMm
	O3QiatEI4D+jQ1juMMAz7JBVIEpyoGEcqXXI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=FCcfboLROHwHwQZSnGtttKieqkrdFvGaBxbuXIIkN/ONBGn20HL8MK8Bvh55fUa0Pw
	58DYdOnjEz4HuRvlzMELT00KY9bawAyZtIDI2Z4Qa4u2MvbsXEBmwCRU0OADJiR99Tjx
	6rPquAdsT1bRxc4TvELUJJSmq1qrodSDkRyqg=
Received: by 10.141.19.9 with SMTP id w9mr3533525rvi.202.1221330441947;
	Sat, 13 Sep 2008 11:27:21 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Sat, 13 Sep 2008 11:27:21 -0700 (PDT)
Message-ID: <94a0d4530809131127w5b0e71ebib885b2c71c65480@mail.gmail.com>
Date: Sat, 13 Sep 2008 21:27:21 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48CC03F9.6090505@klever.net>
MIME-Version: 1.0
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
	<48CBE436.9050500@laposte.net>
	<94a0d4530809130942n3a6c2095t7018ecbfff9387f4@mail.gmail.com>
	<48CBFBBC.7050102@klever.net>
	<94a0d4530809131053u7c2f2c1chb33e5da39c4450aa@mail.gmail.com>
	<48CC03F9.6090505@klever.net>
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 18:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 13, 2008 at 9:18 PM, Michael Krelin <hacker@klever.net> wrote:
>> On Sat, Sep 13, 2008 at 8:43 PM, Michael Krelin <hacker@klever.net> wrote:
>>>>
>>>> I did look at it, but there are some issues. For starters it seems to
>>>> be using extensively the manifest, which would probably make it very
>>>> slow. Also, it seems to be keeping the trees of all the revisions.
>>>
>>> Back when mtn2git script was on the early stages of development and I've
>>> had
>>> some time I've started doing my own mtn2git gateway in c++ (never
>>> finished
>>> it, though). For what I remember using manifest was the only way, because
>>> the changes information mtn automate returns was incomplete or simply
>>> wrong,
>>> I don't remember the details... Do check your results carefully if you're
>>> trying to go this way. Luckily, being slow due to use of manifest should
>>> only matter on initial import.
>>
>> It's complicated, but hopefully doable.
>>
>> That's why there are two methods; one that does a full checkout of the
>> revision and imports it into git, and the other one that uses mtn
>> automate and fast-import.
>>
>> I'm able to import about 60% of the Pidgin code correctly, but after
>> that there are issues. That's the benefit of having two modes... I can
>> compare the fast one with the exact one and improve the fast one.
>
> I ended up using some hybrid mode myself, but the point is - there's no way
> to avoid pulling manifests all the time and that doesn't imply complete
> checkout.

Do you remember the problem?

From what I can see it's doable.

-- 
Felipe Contreras


