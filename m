Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7yym-0002E4-5w
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 01:51:12 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q7ywj-0001aJ-0N from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 16:49:05 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 7 Apr 2011 16:46:49 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 7 Apr 2011 16:49:04 -0700
Message-ID: <4D9E4D66.1000701@mentor.com>
Date: Thu, 7 Apr 2011 16:48:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>	<1302196981.14449.444.camel@phil-desktop>
	<BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
In-Reply-To: <BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 07 Apr 2011 23:46:49.0490 (UTC)
	FILETIME=[10183F20:01CBF57E]
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image	handling
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
X-List-Received-Date: Thu, 07 Apr 2011 23:51:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/07/2011 10:29 AM, Otavio Salvador wrote:
> On Thu, Apr 7, 2011 at 14:23, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
>>>  XZ_COMPRESSION_LEVEL ?= "-e -9"
>>>  LZMA_COMPRESSION_LEVEL ?= "-e -9"
>>> +GZIP_COMPRESSION_LEVEL ?= "-9"
>>> +BZIP2_COMPRESSION_LEVEL ?= "-9"
>>
>> It seems a bit sad to have to keep adding new vars to the global
>> configuration set (and hence parse them for every single recipe) every
>> time someone wants to tweak a new compression format.  Can we not just
>> have a single IMAGE_COMPRESSION_LEVEL that does for everything?
> 
> For me it doesn't matter; I can add it if preferred.

Why are we even tweaking gzip/bzip2?  XZ/LZMA can have serious tradeoffs
at higher levels but I thought for bzip2/gzip it was either do it or no
compression, not "turn it down a little bit".

-- 
Tom Rini
Mentor Graphics Corporation


