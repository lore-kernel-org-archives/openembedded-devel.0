Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9un1-0005wy-2u
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 11:23:51 +0200
Received: from localhost ([127.0.0.1]:48864 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9uaz-0002WP-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 09:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=5cqcQ3kSo4tS6LMJNS7BCcqYrN4=; b=O2+pTL4lPZAv+IH+fatVobhHXBi6
	1TTfshmnDJoRJcdZUEG3IkvdsH1KRidiCz+u3ncE4S+n4lAUHr9dhRFfEpmoKbt9
	tl0qcK1A2/CSWMP1y7Vmba1HFh30C24buSZ2trxFO2PlpegWZWFiZIkvJfIKnQoN
	uqYB3e85+SvdqgA=
Received: from [195.171.99.130] (port=43147 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9uaz-0002WM-F1
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 09:11:25 +0000
Message-ID: <5049BA7B.1000605@communistcode.co.uk>
Date: Fri, 07 Sep 2012 10:12:27 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50476BCC.1090801@communistcode.co.uk>
	<5049B4DF.7060806@communistcode.co.uk>
	<20120907090243.GA22658@mi.fu-berlin.de>
In-Reply-To: <20120907090243.GA22658@mi.fu-berlin.de>
Subject: Re: XBMC build for Raspberry Pi
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
X-List-Received-Date: Fri, 07 Sep 2012 09:23:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/12 10:02, Henning Heinold wrote:
> On Fri, Sep 07, 2012 at 09:48:31AM +0100, Jack Mitchell wrote:
>> Some more on this is that it seems to be picking up the host paths,
>> rather than OE's.
>>
>> My config.log is here: http://pastebin.com/7Um2J1kv
>>
>> as you can see the PYTHON variables are all wrong. I tried adding:
>>
>> PYTHON = "${libdir}${PYTHON_DIR}"
>> PYTHON_SITE_PACKAGE= "${PYTHON_SITEPACKAGES_DIR}"
>> PYTHON_LDFLAGS = "-L${libdir} -l${PYTHON_DIR}"
>>
>> To the recipe but it didn't help. Has anyone any experience in this?
>>
>> Cheers,
> Did you inherit the right python class?
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

The recipe is the one currently in 
meta-oe/meta-multimedia/recipe-multimedia/xbmc, it inherits python-dir, 
is that the right class?

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



