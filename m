Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAhCC-0005f2-Go
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:32:48 +0100
Received: by lbbgi4 with SMTP id gi4so1568963lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1wnfZz6jbYwAsHXccO7Nb2+xafOe97Y8FC2TFFmT62A=;
	b=sZ3cs94Unl2cfJAJbFiaFhrr8Q62LXxxocW0XGB/N/5WwSIu2oaRtouU9RJu0/XUgm
	GZA0vlFaoNXUl7NozUe4aOvI1/uivqevRXM8Atyztsjkk27PLMePLA+iAIThs3uURbS9
	1mK2o9ZkfGHqNOxIL6fW7kqy7Paxj4JKLQSJIQ8QXtilIiajT/XiwYaNdiVCcyxwulzp
	xdQuusGgA+iJ9daEtdEtyh3tQEaN0sMaSpGD95PLBgjXkVFmuDBrQ77KO5KSa3pNKtJR
	qLnYd4tgNlfJgcNOFtEAiICvyXOGJFkAN9ZbGPHB9IxgaBSXkNWYSTrbCSif9b2a1h4B
	DZww==
Received: by 10.112.37.73 with SMTP id w9mr2783523lbj.22.1332419030639; Thu,
	22 Mar 2012 05:23:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 05:23:20 -0700 (PDT)
In-Reply-To: <jkeurg$cb8$1@dough.gmane.org>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
	<FD67157F-A373-42D4-93CE-3FF8A142CA56@dominion.thruhere.net>
	<jkeurg$cb8$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 05:23:20 -0700
Message-ID: <CAMKF1sqXOfFU+qG-8xzP0TqGTYVADxf44rHW112eLiVHzJH=NQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 12:32:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 22, 2012 at 3:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-03-12 11:15, Koen Kooi schreef:
>>
>> Op 22 mrt. 2012, om 11:07 heeft Martin Jansa het volgende geschreven:
>>
>>> On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>
>>> Why not move them?
>>
>> This was done to have people test it in the oe-core + meta-toolchain
>> setup. And to avoid bblayers.conf conflicts
>>
>>> Or create stub of meta-toolchain in 1st patch for people to add it to
>>> bblayers and then move it in 2nd.
>>
>> That sounds like a better way to do it. Maybe Eric will do that in his
>> patchset :)
>
> I don't have a strong opinion on this and if Eric wants me to respin the RFC
> I'll gladly do that. But I would prefer that I can be lazy and just merge
> other peoples patches :)

yes git move should be better since then we can do git log --follow I
dont know if that works with copied files too or not.

meta-toolchain may not be the best name since we already have
meta-toolchain as a target for sdk generation. that should actually
have been called sdk but here we will create a confusion. but may be
target in OE-Core should ve renamed too

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPav6tAAoJEHZqAkdh1vT6zcYP/2CHId7lbxYDDC2sMa8fb7Nt
> +FIRDOIDyF+laMlAwuMMuN0NN6228mxnxmCD0tkrcq6wJnaBJ5+LKkHmwYAUnjrY
> q4ayrZTWGGTIkcYVpeizZCh15AomFLuBzTKP/XdOUESQscheV/zdWgT26hqVRQrS
> 3spk1oS2kzevvmmSqjxBxUUmFMGi85ZcjcsN0aIUpf11+dkU1SpIrGIr7BnybGr/
> FEXzWFCHRtSsmI9J6n6dhrDrm3d2fMxV+9AbqeE1SQbaGV+lA+vag5aDhYdfpbOF
> S+aPYCCm0rrDsFvNqYTq/IU5Fx2/WUa6zHZlnWoUd1iyvPOaiRezGS7diQfV0R3v
> OxCy/75j2cq2ofPebJWG5zGhDvDk9TWW6BqC791WAm9VJjD4ztFhvtE12nXYqIoC
> 9TDAoURNPNX4FBnLQkX0p6Luo4P5c9hgo6BBwQZR2fwmov4R1nq91AFsMrKJRyxh
> VCAqSbzaTJq1zJhh5UZNwRB0SyvDgLbi58NFVOGItX/DUUCUbjC+/aXyIV4Czf75
> OeQ29f8vPvzed9wryg8rdogccbuJ2QY9MGaBfEkUOwBNt/HzhYFY4WpcGvvpqsqA
> VzPe0wst0+ncGdB2/MewNETXPGy3Mp8xvUTvlabaXnOzRmZqUxkqONVnSZkQqGOy
> BCepRNuESem5ktLHCKQS
> =5mMh
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


