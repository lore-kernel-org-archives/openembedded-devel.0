Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OReRB-0002SP-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 06:53:19 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 09ADA102B1D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 00:48:42 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 24 Jun 2010 00:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=ppX2VT8cWh9l7f2jo1g621FBk/0=;
	b=Z+lRlKbexDh8hITgDYmhIPDFnczGLU4QdNWVUc5kedBDtoE8FEAM8Ftg/ud/Ce69u6ENU17u8+ruZNVnLddPz7QqP5Dc1ZDjde1GLcwVkGHsMG8UqzLN57arYAqSdGiO2Q3JduuIbbysG6OtUANjS220ber083EpuWajEkND1Cw=
X-Sasl-enc: 6Ene6cAV3bakdiEcag1nbRo80gPZJSnTu0EVpsXQAMh1 1277354921
Received: from [192.168.1.34] (hnvr-4d07a327.pool.mediaWays.net [77.7.163.39])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 472FB4BB053
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 00:48:41 -0400 (EDT)
Date: Thu, 24 Jun 2010 06:50:13 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100623173828.GI5535@gmail.com>
Message-ID: <alpine.LNX.2.00.1006240646500.4844@asterix.crazy-teaparty.dyndns.org>
References: <1277307626-24691-1-git-send-email-vjensen@gmx.de>
	<20100623173828.GI5535@gmail.com>
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
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] kernel bbclass: switch to u-boot-mkimage-native
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
X-List-Received-Date: Thu, 24 Jun 2010 04:53:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 23 Jun 2010, Khem Raj wrote:

> On (23/06/10 17:40), Vitus Jensen wrote:
>> From: Koen Kooi <koen@openembedded.org>
>>
>> This is a long demanded change. The u-boot-mkimage is up to date to OE standards, while the openmoko one is not
>> (cherry picked from commit 7425e92b1c7918c8c3b609950dbdb44dd488f1fe)
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Thank you!  May I get a second ACK from someone (because of stable branch 
and class change)?

And 2 kernel recipes directly add u-boot-mkimage-native to their depends, 
should those dependencies be removed?  Same change in .dev and stable 
branch.


>> ---
>>  classes/kernel.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index 39a9af5..7279e00 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -14,7 +14,7 @@ python __anonymous () {
>>      kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
>>      if kerneltype == 'uImage':
>>      	depends = bb.data.getVar("DEPENDS", d, 1)
>> -    	depends = "%s u-boot-mkimage-openmoko-native" % depends
>> +    	depends = "%s u-boot-mkimage-native" % depends
>>      	bb.data.setVar("DEPENDS", depends, d)
>>
>>      image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>> --
>> 1.5.6.5
>>
>>


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


