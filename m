Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OE5tt-0001ZZ-81
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:22:54 +0200
Received: (qmail 6751 invoked by uid 503); 17 May 2010 19:23:22 -0000
Received: from b6.ovh.net (HELO mail27.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 17 May 2010 19:23:22 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 May 2010 19:18:55 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 17 May 2010 19:18:54 -0000
Message-ID: <4BF1969E.3020408@eukrea.com>
Date: Mon, 17 May 2010 21:18:54 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1273877583-31604-1-git-send-email-eric@eukrea.com>
	<hsp64i$r3s$2@dough.gmane.org>
In-Reply-To: <hsp64i$r3s$2@dough.gmane.org>
X-Ovh-Tracer-Id: 10853112153666792777
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.65
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Mon, 17 May 2010 19:22:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 16/05/2010 18:22, Koen Kooi a écrit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> I can confirm that 'meta-toolchain' builds against with this
> (angstrom/beagleboard), but I don't know what the effect of this is on
> cross recipes.

Who could confirm that this change may not introduce any unwanted 
behaviour ?

Thanks,
Eric
>
> On 15-05-10 00:53, Eric Benard wrote:
>> - without this bitbake meta-toolchain fails because it doesn't find who
>>   provides gdb-cross-sdk
>> - found thanks to a hint from Phil Blundell on IRC
>> - tested with Angstrom/ARMv5te
>>
>> Signed-off-by: Eric Benard<eric@eukrea.com>
>> ---
>>   classes/cross.bbclass |    2 --
>>   1 files changed, 0 insertions(+), 2 deletions(-)
>>
>> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
>> index 69f6511..5c2d5be 100644
>> --- a/classes/cross.bbclass
>> +++ b/classes/cross.bbclass
>> @@ -17,8 +17,6 @@ PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
>>   OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
>>   BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
>>
>> -PACKAGES = ""
>> -
>>   HOST_ARCH = "${BUILD_ARCH}"
>>   HOST_VENDOR = "${BUILD_VENDOR}"
>>   HOST_OS = "${BUILD_OS}"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL8BvSMkyGM64RGpERApFQAJ40WH4OOiFb0PZVfy/8gbQG4tFn4ACdFiHQ
> 9sEaKXsbeiDyzv/P/7+fQ4A=
> =14NR
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



