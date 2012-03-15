Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8EQI-0000oy-1E
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:25:10 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8EHV-0007oi-16
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 17:16:05 +0000
Message-ID: <4F6223D4.3020100@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 17:16:04 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
	<CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
	<4F622053.50202@dynamicdevices.co.uk>
	<20120315181021.56883348@eb-e6520>
In-Reply-To: <20120315181021.56883348@eb-e6520>
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 17:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


 >I think the first solution is better and that custom boards should be 
added to custom layers

Hmmm ok, thanks That being the case it may be better for me to migrate 
my recipes from
the oe-classic codebase into a new layer created from scratch. It'll be 
quicker and easier for
me that way but perhaps less generic.

(Although my understanding was that Freescale have no intention of 
providing Linux support related
  to OpenEmbedded at this time? Or at least that's what they are telling 
me :)

Alex/

On 15/03/2012 17:10, Eric Bénard wrote:
> Hi,
>
> Le Thu, 15 Mar 2012 17:01:07 +0000,
> Alex J Lennon<ajlennon@dynamicdevices.co.uk>  a écrit :
>> Is the the new machine target and associated recipes, kernel+patches
>> something that I should expect to be able to merge back into
>> meta-fsl-arm at some point?
>>
> that depends if meta-fsl-arm is considered as the layer for supporting
> evaluation boards from Freescale of the layer which can host any board
> using a Freescale i.MX.
> I think the first solution is better and that custom boards should
> be added to custom layers (maybe on top of meta-fsl-arm if these custom
> boards need recipes included in the reference layer).
>
> Eric



