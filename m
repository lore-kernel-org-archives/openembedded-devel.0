Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PKRvy-0000qF-CJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:39:37 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id CF7801B40D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:39:39 +0100 (CET)
Message-ID: <4CEA2BFF.5090707@sensortherm.de>
Date: Mon, 22 Nov 2010 09:38:23 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de>	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>	<4CE7D1F2.7010305@sensortherm.de>
	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
In-Reply-To: <AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 08:39:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 21.11.2010 19:08, schrieb Chris Larson:
> On Sat, Nov 20, 2010 at 6:49 AM, Klaus Schwarzkopf<
> schwarzkopf@sensortherm.de>  wrote:
>
>>
>>   Other good idea is to have sanity checker running once per day too. It
>>> may do next things:
>>> - check recipes syntax
>>> - check thath recipes SRC_URI can be fetched
>>>
>>
>> I think, bitbake can easily integrate this two features.
>>
>> For example the new options:
>>
>> --download-only                 only download the source files for the
>> given recipe
>>
>> --download-only-with-depencies  only download the source files for the
>> given recipe and its depencies
>>
>> --check-syntax                  check recipes syntax
>
>
>
> This seems pretty foolish and unnecessary to me.  This can be easily done in
> the metadata -- there's no need to modify bitbake for this at all.


Hi Chris,

you are right! I don't see this function.

I wrote some commands, to download the source files:


export MACHINE=dm355-evm # can be for all machines

find /home/klaus/development/oe/openembedded/ -name '*.bb' -type f -exec 
  bitbake  -c fetch -b '{}'  2>&1 > fetch.log \;

egrep -n 'ERROR.*bb..failed' fetch.log


It is not perfect, but it shows some errors.

Can somebody test it?

Greetings

Klaus






