Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKEx1-0008JU-54
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 19:47:47 +0100
Received: (qmail 10293 invoked by uid 503); 21 Nov 2010 19:09:53 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 21 Nov 2010 19:09:53 -0000
Received: (qmail 19588 invoked by uid 503); 21 Nov 2010 19:18:30 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Nov 2010 19:18:30 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Nov 2010 20:46:38 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 21 Nov 2010 20:46:37 +0200
Message-ID: <4CE9690D.2030307@eukrea.com>
Date: Sun, 21 Nov 2010 19:46:37 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE56C6B.1050009@eukrea.com>	<1290352792-2563-1-git-send-email-eric@eukrea.com>
	<AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
In-Reply-To: <AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
X-Ovh-Tracer-Id: 7569706548923247945
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 7962645616841960777
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Sun, 21 Nov 2010 18:47:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/2010 18:53, Chris Larson wrote:
> 2010/11/21 Eric Bénard<eric@eukrea.com>
>
>> +    #
>> +    # We always try to scan SRC_URI for urls with machine overrides
>> +    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
>> +    #
>> +    override = bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', d, 1)
>> +    if override != '0' and is_machine_specific(d):
>> +        bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
>> +        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
>> +        return
>> +
>> +    multiarch = pkg_arch
>> +
>> +    packages = bb.data.getVar('PACKAGES', d, 1).split()
>> +    for pkg in packages:
>> +        pkgarch = bb.data.getVar("PACKAGE_ARCH_%s" % pkg, d, 1)
>> +
>> +        # We could look for != PACKAGE_ARCH here but how to choose
>> +        # if multiple differences are present?
>> +        # Look through PACKAGE_ARCHS for the priority order?
>> +        if pkgarch and pkgarch == mach_arch:
>> +            multiarch = mach_arch
>> +            break
>> +
>>
>
> This is wrong.  You do the loop here, set multiarch = mach_arch, and then
> never do anything with multiarch.  If this function is really supposed to be
> setting MULTIMACH_ARCH, then you need to do so here as well.
>   bb.data.setVar("MULTIMACH_ARCH", multiarch, d)

you're right, I forget the last line when moving the block to set_multimach_arch .

Eric


