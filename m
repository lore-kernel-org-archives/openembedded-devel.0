Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LDGM4-0005fq-E0
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 11:43:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LDGHc-0003yE-Ph
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 10:39:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 10:39:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 10:39:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Dec 2008 11:39:00 +0100
Message-ID: <gid985$9k8$1@ger.gmane.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>	<gid3jt$nr2$1@ger.gmane.org>
	<20081218101127.GF2135@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <20081218101127.GF2135@buddha.tw.openmoko.com>
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
X-List-Received-Date: Thu, 18 Dec 2008 10:43:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-12-08 11:11, John Lee wrote:
> On Thu, Dec 18, 2008 at 10:02:53AM +0100, Koen Kooi wrote:
>> On 18-12-08 08:19, John Lee wrote:

 > As mentioned before, what's in /etc/init.d/ , rcS and different
 > runlevels varies from distro to distro, machine to machine...  Would
 > it be better if I remove as many overrides as possible, we merge it to
 > oe.dev and fix problems there?  I don't think I can test all these
 > combinations alone.

My proposal would be:

* move it to seperate branch
* remove nearly all overrides (putting them back is easier than removing 
them a few months later when everybody has forgotten why it was there)
* review it

When the review comes out ok send a mail stating "this branch will get 
merged in 2 weeks unless serious bugs emerge, please test". I don't 
think anyone can rightfully complain after that :)


>> I suspect review and merging would be easier if you 'collapse' the
>> patches per recipe or per directory. Reviewing all the seperate commits
>> will take too much time :(
>
> Maybe it will be easier if people just review it by rebase first then
> diff the content instead of read though commits, so one can clearly
> see what will be changed, while still keeping the development process
> recorded in the commit messages.

It's too big to get reviewed, plain and simple. For OE we agreed (see 
the RFC sent yesterday) that changes should be in small topic branches. 
If you put the changes in topic branches (e.g. fast-boot, bug-fixes, 
openmoko-misc) we could keep the precioussssssss development process if 
the branches are small. Small branches is the key thing.

Oh, and with 'review' I mean a real review *process* where change are 
made to the proposed patches and if needed get a few iterations of the 
commit-fix-comment-fix cycle.

regards,

Koen



