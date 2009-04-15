Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lu2Xy-0003wC-VP
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 12:40:53 +0200
Received: by an-out-0708.google.com with SMTP id b2so5414100ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 03:37:04 -0700 (PDT)
Received: by 10.100.252.18 with SMTP id z18mr65246anh.111.1239791824210;
	Wed, 15 Apr 2009 03:37:04 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id c29sm2679788anc.10.2009.04.15.03.37.02
	(version=SSLv3 cipher=RC4-MD5); Wed, 15 Apr 2009 03:37:03 -0700 (PDT)
Message-ID: <49E5B8C2.2020709@xora.org.uk>
Date: Wed, 15 Apr 2009 11:36:50 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
	<gs4al7$76r$1@ger.gmane.org>
In-Reply-To: <gs4al7$76r$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.132.250
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: kexec-tools-static build failue for zaurus collie
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
X-List-Received-Date: Wed, 15 Apr 2009 10:40:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2009 10:50 AM, Koen Kooi wrote:
> On 15-04-09 11:35, Chris Sykes wrote:
>> Hi,
>>
>> I'm currently failing in my attempts to get OE built for my Zaurus
>> collie.  I'm using an up-to-date git checkout on the stable 2009 branch.
>>
>> OE Build Configuration:
>> BB_VERSION        = "1.8.12"
>> METADATA_BRANCH   = "stable2009"
>> METADATA_REVISION = "272ae318b03bcd062f8b43258ce54a2cd96b9f45"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux"
>> MACHINE           = "collie"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2009.X-test-20090415"
>> TARGET_FPU        = "soft"
>>
>> Interestingly (or perhaps not), the kexec-tools build seems to go just
>> fine, it's just kexec-tools-static that has a problem.
>>
>> It seems to be an include path problem as 'mach/memory.h' is not found.
>
> Looks like kexectools-static doesn't account for the big arm header 
> move in the kernel yet.
>
Its actually klibc which is broken, this was discussed a couple of weeks 
ago.

Graeme



