Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SCz2g-0001OJ-Pe
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 22:00:27 +0200
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SCytK-0007gI-AY
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 19:50:46 +0000
Message-ID: <4F736B9F.9050304@dynamicdevices.co.uk>
Date: Wed, 28 Mar 2012 20:50:55 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
	<2372633.2CZh3kKOpL@helios>
In-Reply-To: <2372633.2CZh3kKOpL@helios>
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 20:00:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul,

>FYI, I'm pretty sure that fetch2 from the version of bitbake we use with OE-

I thought it might. Does it still do that if the checksum fails though?

>Of course that's assuming there is a mirror available.

I'm happy to host a 2nd copy and mod the .bb to add another source if 
that helps (the
libpng repo seems to have a history of deleting versions from what I saw 
of the patch
history so it might be a good idea?). Is that ok for everybody?

Cheers,

Alex

On 28/03/2012 20:45, Paul Eggleton wrote:
> On Wednesday 28 March 2012 10:34:16 Frans Meulenbroeks wrote:
>> PS: thinking of it: we might be able to resolve the latter issue by
>> forcing the removal of a file from downloads (and trigger a refetch)
>> if the .md5 does not match the md5 in the recipe.
> FYI, I'm pretty sure that fetch2 from the version of bitbake we use with OE-
> Core will skip to the next available option (mirror) if the downloaded file
> doesn't match the SRC_URI checksum. Of course that's assuming there is a
> mirror available.
>
> Cheers,
> Paul
>



