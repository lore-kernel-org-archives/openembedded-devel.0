Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LDoz9-0003Oy-Uv
	for openembedded-devel@openembedded.org; Sat, 20 Dec 2008 00:42:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LDoub-0006Z1-Ap
	for openembedded-devel@openembedded.org; Fri, 19 Dec 2008 23:37:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 19 Dec 2008 23:37:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Dec 2008 23:37:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 20 Dec 2008 00:37:30 +0100
Message-ID: <gihb7q$2ji$1@ger.gmane.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>	<20081218150517.GI2135@buddha.tw.openmoko.com>	<gidpuk$29d$1@ger.gmane.org>	<1229619255.9166.66.camel@mill.internal.reciva.com>	<gie3e0$6th$1@ger.gmane.org>	<20081219053858.GQ2135@buddha.tw.openmoko.com>	<494B7C10.8090407@xora.org.uk>	<ae9c9a1c0812191146w57c68982vbdaf345e833a0710@mail.gmail.com>
	<20081219200318.GZ4287@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <20081219200318.GZ4287@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: openmoko-merges
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
X-List-Received-Date: Fri, 19 Dec 2008 23:42:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-12-08 21:03, Tom Rini wrote:
> On Fri, Dec 19, 2008 at 04:46:03PM -0300, Ricardo Salveti de Araujo wrote:
>> On Fri, Dec 19, 2008 at 7:48 AM, Graeme Gregory<dp@xora.org.uk>  wrote:
>>> John Lee wrote:
>>>> I'll keep working on the fastboot branch (need the help of original
>>>> author on this one.  since this will become general changes, it's not
>>>> going to be easy), and reorganize the om-merge branch a bit.  Is this
>>>> the first time of such a big merge ?  I think Graeme and I both did
>>>> some merge back before, but this one seems to be bigger...
>>>>
>>> I used to use a process similar to what koen suggested where I would
>>> only merge back into OE the final changes to a .bb not all the
>>> mistakes/fuckups/typos that got us to that result. Then evaluate each
>>> change on its own to judge its level of controversy.
>> Yep, this is something I was thinking about this week, where I decided
>> to reorganize the Mamona patches to merge it back to OE.
>>
>> Merging related modifications in just one patch helps a lot to review
>> the code and also to merge it upstream, the bad part is that we lose
>> all the history behind those patches. Adding a message telling that
>> the patch came from Mamona helps this issue, as the user could see it
>> at the Mamona own repository, but still don't know what's the
>> preferred way.
>>
>> What are your suggestions? Should I create branches and rebase Mamona
>> repo to do the merge with all the history or just merging related
>> commits in one is enough (also with branches and review)?
>
> IMHO, a lot of history is worthless sometimes.  The important things to
> encapsulate from a big history are the tricky things that you should
> comment on, or elaborate on in the final commit message (We had to do
> ... because ...).  So long as the hard to get right / complex / etc bits
> are explained, you don't need 10 commits showing how it was almost
> right, you just need the correct solution explained.

Comments in the code (i.e. recipes, patches) itself would be even 
better, since we might even to monthly tarballs snapshots of the 
upcomining stablebrach where people would lack a bit of history.

regards,

Koen



