Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdOsq-0005On-Ba
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 16:14:40 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PdOsF-0005uY-A5 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 07:14:03 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 13 Jan 2011 07:14:03 -0800
Received: from [172.30.80.229] ([172.30.80.229]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 Jan 2011 08:14:02 -0700
Message-ID: <4D2F16B4.4090107@mentor.com>
Date: Thu, 13 Jan 2011 08:13:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>	<4D2E47AE.5060803@mentor.com>
	<4D2EAC19.6020203@eukrea.com>
In-Reply-To: <4D2EAC19.6020203@eukrea.com>
X-OriginalArrivalTime: 13 Jan 2011 15:14:02.0403 (UTC)
	FILETIME=[82C85730:01CBB334]
Subject: Re: [PATCH 1/3] strace: add patch allowing compilation with kernel	headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 15:14:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/13/2011 12:39 AM, Eric Bénard wrote:
> On 13/01/2011 01:30, Tom Rini wrote:
>> On 01/12/2011 02:20 PM, Eric Bénard wrote:
>>> tested with kernel headers 2.6.31& 2.6.37 : both compile fine.
>>
>> Is there a reason to not switch to 4.5.20, or even newer instead?
>>
> I would like to do that but I don't know if 4.5.20 needs patches.

I haven't tried .37, but it doesn't for .34 (when .14 does).  To be 
clear, I'm suggesting we look at removing the D_P = -1 from .20.  My 
assumption is that since .20 is the latest it probably doesn't need ARM 
EABI patches (and probably not the SH patches either).

-- 
Tom Rini
Mentor Graphics Corporation


