Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqqyB-00031N-4a
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 17:10:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kqqy2-0005AB-MZ
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 15:10:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 17 Oct 2008 15:10:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Oct 2008 15:10:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 17 Oct 2008 17:10:08 +0200
Message-ID: <gda9sg$cnb$1@ger.gmane.org>
References: <1223989999.29816.56.camel@polaris>	<1223990240.29816.58.camel@polaris>
	<1224062879.5189.49.camel@ted>	<1224078120.3653.40.camel@localhost>
	<1224084046.5189.75.camel@ted>	<1224145911.31453.44.camel@localhost>
	<1224149995.1603.8.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <1224149995.1603.8.camel@ted>
Sender: news <news@ger.gmane.org>
Subject: Re: please check BK&MTN to GIT conversion dry-run repository
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
X-List-Received-Date: Fri, 17 Oct 2008 15:10:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16-10-2008 11:39, Richard Purdie wrote:
> On Thu, 2008-10-16 at 10:31 +0200, Jan Lübbe wrote:
>> Oh, this is new to me :/ When i talked about importing BK history with
>> Holger he didn't seem to have any doubts.
>
> I thought I'd made the idea of using a graft for this clear but
> obviously not :(.
>
>> > From what i just read about grafts, it will replace the parent
>> information for the specified commit. So we could still replace the
>> current BK import with the correct one.
>>
>> Grafts are local only though.
>
> They won't get passed through a git clone? I guess that isn't a problem
> as long as we do this on the master repository and document it.
>
>>>> and
>>>> still allows to find ot where the files come from. If someone figures
>>>> out how to do a better conversion, we can still rebase, it that is
>>>> desired.
>>> No, we don't want to ever rebase. I'd much prefer we had a graft for
>>> that point in time so we can just replace the history as and when we
>>> come up with a better version.
>> We could import BK again (correctly) into a separate branch and then
>> document how to graft it to instead of the current stuff.
>
> It is now too late to rebuild the tree without the BKCVS information?
> I'd prefer not to have the wrong information hanging around if at all
> possible.

Let's just leave it as it is. It currently gives up a much better 
history than we had in mtn and peope will stop claiming I'm responsible 
for all their bugs when their bisect turns up the bk import.
The downside is that I can't claim that I wrote OE in one day anymore ;)

regards,

Koen



