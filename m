Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvwQr-00005A-7c
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 20:10:09 +0200
Received: by gxk10 with SMTP id 10so164911gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=RXoR9DCT7hO2itunEjjPsOH4OkgSmebdZhvDP2PN4fA=;
	b=mqPe+JZKLih6YO/BQQ0oE4/266JCdNHjGhGDfQmZZCqvi5pRZ6qfvevPWL+dGUedfL
	K+WptRgBIqX+xPNuE3pwre0ECuSgvijBbkTqq99zaP75P6uXjRjdLd2SV1jUZQIoprob
	JbZtl8UnllVapohxDvbtdJyAaYmASOPpJxcTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=v5UcH99WSVxvOKOFAGsitxjxCS5hFPnePgTblxE0xtZ3iF/G4GJvCVRPNtFrD25oob
	C+p7GOtu3/Y4Mfj1QsTjN5ERnC5hcX2wOV/gjTRtZgsE6oSlvuaKitC7xctxyKeUFllt
	umECfKVHr11burvBUdzd9N3Hivd+Ld2NgeXR8=
Received: by 10.151.133.6 with SMTP id k6mr2220999ybn.402.1284574158448; Wed,
	15 Sep 2010 11:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 11:08:58 -0700 (PDT)
In-Reply-To: <4C90B5E6.1070402@balister.org>
References: <4C90130C.3040303@gmail.com>
	<AANLkTi=ZF3uT1Y6=yy_+wAizh64KYv0nRjq9BoFZN6E2@mail.gmail.com>
	<4C90B5E6.1070402@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 11:08:58 -0700
Message-ID: <AANLkTim9Tt1rqMPkz2YFYEr296_XNwT7GMfBCBLCmV5f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] p4: remove broken and 4 years old recipes.
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
X-List-Received-Date: Wed, 15 Sep 2010 18:10:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 15, 2010 at 5:02 AM, Philip Balister <philip@balister.org> wrote:
> On 09/15/2010 02:32 AM, Frans Meulenbroeks wrote:
>>
>> 2010/9/15 Graham Gower<graham.gower@gmail.com>:
>>>
>>> Recipes are broken for all architectures except one (probably arm)
>>> because the files in the SRC_URI depend on TARGET_ARCH and the md5/sha256
>>> are presumably valid only for one of these.
>>>
>>> Anyone wanting perforce should submit new recipes for new perforce
>>> versions.
>>>
>>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>>
>> Agree with the reasoning of Graham, so:
>>
>> Acked-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>>
>> Actually I am not too keen on having recipes that just "install" an
>> externally downloaded binary blob
>> (and functionally speaking this does not seem to be something for an
>> embedded system either)
>
> I will have a need for a recipe to install binary blobs (fpga bin files)
> into a file system at some point. So this class recipes are needed.
>

do you need these m4 recipes ?

> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
-Khem


