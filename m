Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LoIKN-0002LL-JJ
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 16:19:03 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LoIIL-00049S-BK
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 14:16:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 14:16:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 14:16:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 30 Mar 2009 16:16:43 +0200
Message-ID: <gqqk8b$2eb$1@ger.gmane.org>
References: <20090329131749.GA350@excalibur.local> <gqnvos$4qb$1@ger.gmane.org>
	<20090330124536.GD10473@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <20090330124536.GD10473@excalibur.local>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] connman: Package python test scripts into connman-test-utils
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
X-List-Received-Date: Mon, 30 Mar 2009 14:19:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-03-09 14:45, Stefan Schmidt wrote:
> Hello.
>
> On Sun, 2009-03-29 at 16:14, Koen Kooi wrote:
>> On 29-03-09 15:17, Stefan Schmidt wrote:
>>>
>>> I would like to get some feedback from other people using connman in OE. I did
>>> the following to package the test scripts which enables you to install them as
>>> separate package.
>>
>> The package is missing RDEPENDS on the necessary python interpreter and
>> modules.
>
> Good point. That reminds me of some other recipes that lack such things. Will
> have a look at them later.
>
> I'm wondering how I should handle this case as connman itself does not RDEPEND
> on python here. Is there a special trick for such FILE_${PN} packages and
> RDEPENDS?

Yes, overrides work on RDEPENDS as well, so RDEPENDS_${PN}-test-utils = 
"python-core python-dbus python-b0rk" will work.

regards,

Koen



