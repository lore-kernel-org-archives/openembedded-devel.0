Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5fLV-0005sb-6k
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 12:47:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5fIU-0001Mv-6L
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 11:44:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 11:44:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 11:44:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 Nov 2008 12:44:24 +0100
Message-ID: <ggm16o$feq$1@ger.gmane.org>
References: <200811271142.31596.valentin.longchamp@epfl.ch>	<gglubl$651$1@ger.gmane.org>
	<1227785234.15027.53.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227785234.15027.53.camel@hammer.suse.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Thu, 27 Nov 2008 11:47:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-11-08 12:27, Stanislav Brabec wrote:
> Koen Kooi wrote:
>> On 27-11-08 11:42, Valentin Longchamp wrote:
>>> Hello,
>>>
>>> Sorry if it is a repost, but I have got not answer and have not seen my mail
>>> in the mailing-list archives, so I send it again
>> I know the problem exists for some people, but I have never been able to
>> reproduce it. People having this problem should debug why ncurses
>> suddenly decides to mess up its .la files. Or better, look at the .la
>> files to see what's triggering insane.bbclass
>
>>> I had read that this could have something to do with the fact that -tmp was in
>>> the name of the tmp build dir. However it is not the case
>
> I guess it may be the case. Somebody mentioned a theory, that it is
> caused by TMPDIR set in the local.conf. Your local.conf sets TMPDIR.
>
> Could you comment TMPDIR out and then rebuild your image from scratch?

That theory has already been debunked. Not setting TMPDIR opens up a 
whole other can of worms.

regards,

Koen



