Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1Rabew-00060P-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:21:18 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 67445E304
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 00:14:22 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Al4cAF/b505T4znVPGdsb2JhbAAMN4UHpjABAQEBN4IkAQEBAQMBAQEgFTYKEQsVAwICBRYLAgIJAwIBAgEVARsUEwYCAQGIAKRokU+BL4caggSBFgSSTIIlkio
X-IronPort-AV: E=Sophos;i="4.71,349,1320620400"; d="scan'208";a="236208447"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.57.213])
	by ipb1.telenor.se with ESMTP; 14 Dec 2011 00:14:22 +0100
Message-ID: <4EE7DC4F.4070703@telia.com>
Date: Wed, 14 Dec 2011 00:14:23 +0100
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323789098-6941-1-git-send-email-ulf@emagii.com>	<4EE7A9CA.2050904@linux.intel.com>
	<CAMKF1soZMLXz2_0OU9-4HmEyYDK-h40=940cCTqf8O53AkR7-Q@mail.gmail.com>
In-Reply-To: <CAMKF1soZMLXz2_0OU9-4HmEyYDK-h40=940cCTqf8O53AkR7-Q@mail.gmail.com>
Subject: Re: [meta-oe] tz*: download location has moved
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
X-List-Received-Date: Tue, 13 Dec 2011 23:21:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-13 21:15, Khem Raj wrote:
> On Tue, Dec 13, 2011 at 11:38 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>> On 12/13/2011 07:11 AM, ulf@emagii.com wrote:
>>> From: Ulf Samuelsson<ulf@emagii.com>
>>>
>>> Signed-off-by: Ulf Samuelsson<ulf@emagii.com>
>>> ---
>>>   meta-oe/recipes-extended/tzcode/tzcode-native.inc |    6 +++---
>>>   meta-oe/recipes-extended/tzdata/tzdata.inc        |    4 ++--
>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>> This was fixed in oe-core, What's the reason that a tz* set is needed in
>> meta-oe?  Can we remove them from meta-oe or is the older version needed by
>> someone?
>>
> there are some differences e.g. met-oe it installs a sane default for timezone
> may be if those differences can be merged then it would make it go away
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Angstrom has meta-openembedded/meta-oe before openembedded-core in the 
layer list,
so this is needed to build Angstrom.
A merged recipe would be better of course.

-- 
Best Regards
Ulf Samuelsson



