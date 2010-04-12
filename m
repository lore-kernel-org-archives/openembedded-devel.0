Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O1Bqw-0007JC-7a
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 07:06:31 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9C071EAC6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 01:03:05 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 12 Apr 2010 01:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=MRELW3SjisMPmOvl3Src29dnp/M=;
	b=optfz42GndAlSxwrx2zQHqwbTe4XvgMdnO9b2XPlqewaYrs+Y9JpPjWwuUf/o427CWSMYEckSOJ1eL4C/CHKlJoaL6sxEZYzLccK1FB9RgRV6EM03t+rUDEMiklfYeemp3NjpWF/q2WZtRl9d3LUVQzL0hhjjFGHIb+/scYg+aE=
X-Sasl-enc: pSIqbV7ZuNnVOmtG4q34b9yjR5X4glljASzHU7JGdVkt 1271048585
Received: from [192.168.1.34] (hnvr-4d07af8a.pool.mediaWays.net [77.7.175.138])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D6F9A4B3FD9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 01:03:04 -0400 (EDT)
Date: Mon, 12 Apr 2010 07:04:19 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100408172953.GG3269@jama>
Message-ID: <alpine.LNX.2.00.1004120658370.5400@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
	<20100408172953.GG3269@jama>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Mon, 12 Apr 2010 05:06:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Thu, 8 Apr 2010, Martin Jansa wrote:

> On Thu, Apr 08, 2010 at 05:37:41PM +0200, Vitus Jensen wrote:
>> Add recipes for version 0.5.2 and the current head of the subversion
>> repository.  dfu-programmer is DFU utility supporting Atmel chips
>> with a USB bootloader (which aren't supported by dfu-util).
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 3c6f712..73f5901 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -5258,6 +5258,10 @@ sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
>>  md5=be12c0132a1ae118cbf5e79d98427c1d
>>  sha256=ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191
>>
>> +[http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-0.5.2.tar.gz]
>> +md5=ce882d37383df698a1c530080724b191
>> +sha256=e3c8bc1429fe1681c56ddc14fb05d29a7933aac566d13f894dca6fd916829cb9
>> +
>>  [http://pknet.com/~joe/dgen-sdl-1.23.tar.gz]
>>  md5=b1896c1b21ddb152626aec2e8a157a3a
>>  sha256=44396b3b324433187cf7082d1059cd9f519f02accddd667e627a57ff8514d436

...
> Please send separate patch for org.openembedded.dev with SRCREV as well
> as checksums in recipes and for stable/2009 (you can put SRCREV to
> recipe as long as it's sane SRCREV not AUTOREV).

In this case I propose that support for inline checksums is backported to 
stable/2009, so that identical recipes may be used.  It's only a single 
commit, I'm currently testing it's effects with stable and will send a 
patch to the list.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


