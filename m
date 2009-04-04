Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqDEd-0006O5-BB
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 23:17:08 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LqDC3-0000cg-W5
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 21:14:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 21:14:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 21:14:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Apr 2009 23:14:07 +0200
Message-ID: <gr8ij0$954$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>	<ac9c93b10904040851q4d038367l7ac1d4e80a52dfc4@mail.gmail.com>	<gr82p7$2vd$1@ger.gmane.org>
	<ac9c93b10904041318hd16998cg77f19e0e9196f25f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <ac9c93b10904041318hd16998cg77f19e0e9196f25f@mail.gmail.com>
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
X-List-Received-Date: Sat, 04 Apr 2009 21:17:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-04-09 22:18, Frans Meulenbroeks wrote:
> 2009/4/4 Koen Kooi<k.kooi@student.utwente.nl>:
>> On 04-04-09 17:51, Frans Meulenbroeks wrote:
>>>
>>> Hm,
>>>
>>> I don't like that one needs to touch conf/machine/beagleboard.conf
>>> each time the kernel is updated.
>>> This is likely to be forgotten at some time.
>>> Can't we use something in the linux-omap-*.bb file ?
>>
>> You can't set global vars in recipes.
>
> Thinking of it the real issue is that we do have DEPENDS that takes
> care that if A needs B, B is build before A (and I guess that after
> updating B a bitbake of A will result in a recompile, even if A's PR
> is not changed.
>
> Maybe a solution could be to be able to rebuild a package plus all its
> dependencies (the information is there in the DEPENDS lines).

We can already do that with BB_STAMP_POLICY, the problem present is that 
it will generate packages with the same PV and PR, so it won't show up 
as upgrade, so users get a broken installation after the package manager 
upgrades the kernel, but not the modules since PV and PR didn't change 
for those.

regards,

Koen



