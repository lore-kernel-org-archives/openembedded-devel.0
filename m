Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Nztmt-0002u5-IP
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 17:37:03 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 4B763EAE84
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 11:33:38 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 08 Apr 2010 11:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=RuML+0sGBb9eubZ3nfUSi4AzSms=;
	b=EvjcXvE/QVWtHIGjnpYE561Oqw91CEktve8/CyTTQLwakAKTOkB+gygu8uiSYpRmd/2z401zAxKoGlwPiCCi2gwjkyXLWzoCqPcrKoqTUmkfP0euBN8IkVyoN1v+jqNjP+PS9XyScfsy5g90WbizgJW4z4jBwOJ52AcUeyQOPAk=
X-Sasl-enc: X00WOR7b5ojxNeJSOILOFJUzSt7VlHTn2q3fowiuAYLf 1270740817
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B5B654A8421
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 11:33:37 -0400 (EDT)
Date: Thu, 8 Apr 2010 17:33:34 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100408083514.GA27376@excalibur.local>
Message-ID: <alpine.DEB.1.10.1004081729380.3264@vitus.devnet.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<20100408083514.GA27376@excalibur.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
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
Subject: Re: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 15:37:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hej!

On Thu, 8 Apr 2010, Stefan Schmidt wrote:
> On Thu, 2010-04-08 at 10:19, Vitus Jensen wrote:
>>
>> Add recipes for version 0.5.2 and for the head of the SVN repository.
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>> ---
...
>> +
>> +SRC_URI = "http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-${PV}.tar.gz"
>> +
>> +inherit autotools
>> +
>> +do_stage() {
>> +	autotools_stage_all
>> +}
>
> For what is this needed?

This proved unnecessary.  See patch v2.  I've kept checksums.ini as this 
allows the same recipe in both trees.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


