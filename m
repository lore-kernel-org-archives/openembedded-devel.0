Received: from jak.nl ([65.204.18.188]) by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <arjan@jak.nl>) id 1ORmJx-00039l-At
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 15:19:26 +0200
Received: (qmail 33663 invoked by uid 89); 24 Jun 2010 13:13:44 -0000
Received: from jak.nl (HELO ?128.79.129.1?) (65.204.18.188)
	by jak.nl with SMTP; 24 Jun 2010 13:13:44 -0000
Message-ID: <4C235A05.5070604@jak.nl>
Date: Thu, 24 Jun 2010 15:13:41 +0200
From: Arjan <arjan@jak.nl>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C221A64.1020002@jak.nl>	<AANLkTikxjC0tXsg2Tz0ilTykFtmhBN7qm5GHMl3HixVK@mail.gmail.com>
	<20100623173738.GH5535@gmail.com>
In-Reply-To: <20100623173738.GH5535@gmail.com>
X-SA-Exim-Connect-IP: 65.204.18.188
X-SA-Exim-Mail-From: arjan@jak.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DISTRO=Angstrom on i686-generic build failure on base-image
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
X-List-Received-Date: Thu, 24 Jun 2010 13:20:12 -0000
X-List-Received-Date: Thu, 24 Jun 2010 13:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23-6-2010 19:37, Khem Raj wrote:
> On (23/06/10 07:57), J. L.  wrote:
>    
>> I keep erroring out on the same thing currently.
>>
>>
>>
>> On Wed, Jun 23, 2010 at 7:29 AM, Arjan<arjan@jak.nl>  wrote:
>>
>>      
>>> Hello all,
>>>
>>> I'm new here, so maybe this is a known issue. But I couln't find the
>>> solution.
>>>
>>> Building  the 'base-image' using:
>>>
>>> DISTRO   = "angstrom-2008.1"
>>> MACHINE ?= "i686-generic"
>>> this error occurs:
>>>
>>>   | checking for cups-config... /usr/bin/cups-config
>>>        
> this is the problem. You have install libcups2-dev on your build machine
> and its picking that up I think if you remove it from host it should work.
>    
This indeed is the problem. After moving the /usr/bin/cups-config the 
build continues.
Makes me wonder, is it possible to execute bitbake in a (more) isolated 
environment to avoid such clashes?

Thanks,
Arjan


