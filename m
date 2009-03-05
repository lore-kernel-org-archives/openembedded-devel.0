Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LfLKK-0003EK-IW
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 22:42:00 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LfLG5-0007DB-O7
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 21:37:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Mar 2009 21:37:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Mar 2009 21:37:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Mar 2009 22:37:27 +0100
Message-ID: <gopgmo$arp$1@ger.gmane.org>
References: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br>	<87eixc40oz.fsf@ucpel.tche.br>	<87skls2ihj.fsf@neumann.lab.ossystems.com.br>
	<87sklr3bdy.fsf@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <87sklr3bdy.fsf@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Thu, 05 Mar 2009 21:42:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for top-posting, but I can't find a good point to hook into.

I have a few general questions:

1) what happens when DLDIR and TMPDIR are empty (e.g. first build)
2) does it need a netconnections at any point?
3) do you have any examples how output looks before and after your patch?

I'd also like to hear RPs and zeckes opinion in this

regards,

Koen

On 05-03-09 22:31, Mario Domenech Goulart wrote:
> On Thu, 05 Mar 2009 10:43:04 -0300 Otavio Salvador<otavio@ossystems.com.br>  wrote:
>
>> Mario Domenech Goulart<mario@ossystems.com.br>  writes:
>>
>>> Index: lib/bb/fetch/git.py
>>> ===================================================================
>>> --- lib/bb/fetch/git.py	(revision 1152)
>>> +++ lib/bb/fetch/git.py	(working copy)
>>> @@ -42,11 +42,12 @@
>>>               ud.proto = ud.parm['protocol']
>>>
>>>           ud.branch = ud.parm.get("branch", "master")
>>> +        ud.tag = None
>>>
>>>           tag = Fetch.srcrev_internal_helper(ud, d)
>>>           if tag is True:
>>>               ud.tag = self.latest_revision(url, ud, d)	
>>> -        elif tag:
>>> +        elif tag and tag != "1":
>>>               ud.tag = tag
>>>
>>>           if not ud.tag or ud.tag == "master":
>> [...]
>>
>> Please drop this hook since it is our internal workaround for the lack
>> of the AUTOREV in our recipes.
>
> Sure.  Attached is the new patch.
>
> Best wishes.
> Mario
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




