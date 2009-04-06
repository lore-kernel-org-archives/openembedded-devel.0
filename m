Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lqj6o-0002u5-7C
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 09:19:10 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lqj42-0006kv-Do
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 07:16:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 07:16:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 07:16:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 09:16:00 +0200
Message-ID: <grca7g$gk6$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<1238971382.5343.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238971382.5343.10.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 06 Apr 2009 07:19:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-04-09 00:43, Richard Purdie wrote:
> On Sat, 2009-04-04 at 15:31 +0200, Koen Kooi wrote:
>> For beagleboard I have a few things I need to rebuild everytime the
>> kernel changes:
>>
>> * powervr kerneldrivers
>> * sdma kernel module
>> * dmai kernel module
>> * codec-engine
>>
>> And I have roughly two kinds of kernel changes:
>>
>> 1) version upgrade (e.g. 2.6.29 ->  2.6.29)
>> 2) config changes (e.g. enable ethernet bridging)
>>
>> The first type of change could be solved by putting KERNEL_VERSION in PV
>> or PR, but that needs a non-trivial amount of python since the
>> information isn't available at parsing time (exactly like debian.bbclass).
>> The second kind of change is a lot harder to detect, unless we start
>> storing md5sums for kernel defconfigs.
>>
>> I have a lowtech proposal for this:
>
> The thing is if we start doing this for kernels, we'll probably end up
> having to do it for other things and the end result will be a mess.
>
> A better fix for this is BB_STAMP_POLICY = "whitelist" which will at
> least cause the right things to rebuild.
>
> No, this doesn't bump the PR when packages change but I'd actually like
> to see some new code to fix this problem and several others once and for
> all. The idea would be to "compare" the current build with any previous
> ones and error if bad differences are detected. In this case if PR = X
> had already built that would be an "error" which the system may work
> around by using PR = "X-Z1" in the output packages. You could teach that
> code interesting (even distribution specific) logic e.g. to ignore
> changes in system libraries like libc.
>
> This would imply this comparison data would have to come from a shared
> source for multiple build machines for a distribution like Angstrom.
>
> No, this solution isn't simple but hacking around the problem just
> builds a house on top of quicksand ;-).

The problems with a default OE/angstrom setup are:

1) No automatic rebuild of dependant packages
  - Already solved with BB_STAMP_POLICY = "whitelist"

2) No automatic way to increase PR of dependant packages

3) No distributed way to record increase of PR of dependant packages

4) No way to inject kernelversion and PR into external modules
  - Can be solved with code similar to debian.bbclass

if someone can tackle 4) we're further along with making things saner.


regards,

Koen



