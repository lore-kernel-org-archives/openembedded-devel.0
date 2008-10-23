Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kt1zI-0000Mc-HS
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 17:20:36 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Kt1yk-0007oA-VF
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 15:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 15:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 15:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Oct 2008 17:16:16 +0200
Message-ID: <gdq4g0$sff$2@ger.gmane.org>
References: <20081023124116.GA15082@datenfreihafen.org>	<gdpu80$25g$1@ger.gmane.org>
	<20081023135504.GA16216@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081022 Shredder/3.0b1pre
In-Reply-To: <20081023135504.GA16216@datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Pidgin needs to RDEPENDS on pidgin-data?
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
X-List-Received-Date: Thu, 23 Oct 2008 15:20:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-2008 15:55, Stefan Schmidt wrote:
> Hello.
>
> On Thu, 2008-10-23 at 15:29, Koen Kooi wrote:
>> On 23-10-2008 14:41, Stefan Schmidt wrote:
>>> I have a user bug report here that pidgin segfaults without pidgin-data
>>> installed:
>>> http://trac.freesmartphone.org/ticket/170
>>>
>>> In pidgin.inc it only RRECOMMANDS pidgin-data, but not RDEPENDS on it.
>>> Patch below is what I would push if nobody objects.
>> That patch is no good. The real fix is to move the 2 files pidgin needs
>> from -data to the main package.
>
> As you already know that two files are missing, can you name them so I can
> cookup a patch?

iirc it's the .desktop and some other file, I straced a few weeks ago, 
but I'm fuzzy on the details

>
>> Also: if pidgin-data is not getting installed when installing pidgin
>> something is wrong with your feeds.
>
> Hmm, It seems I need a better understanding then. From where comes the dep from
> pidgin on pidgin-data? Do I miss some OE magic here?
>
> Besides that it could good be that the feed is broken in that regard. Time to
> fix it.
>
> regards
> Stefan Schmidt




