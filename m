Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LmVrv-0006j4-Pz
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 17:22:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LmVqO-0005dH-5Z
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 16:20:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 16:20:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 16:20:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Mar 2009 17:20:25 +0100
Message-ID: <gqdlka$cbd$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>
	<49CA5638.1050000@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <49CA5638.1050000@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 16:22:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-03-09 17:05, Mike (mwester) wrote:
> Koen Kooi wrote:
>> On 25-03-09 09:51, Frans Meulenbroeks wrote:
>>
>>> and a last last thing: about the vetting: not sure whether I fully
>>> understand the idea, but is a lot of this info on what builds on what
>>> not already present in tinderbox?
>>
>> The tinderbox data is purged periodically, so don't depend on it.
>
> In addition, you cannot determine which builds in tinderbox were done
> with an empty TMPDIR -- and unless you have an empty TMPDIR, there's
> really no complete test.

Empty TMPDIR is only once case we should test for, I've seen many times 
that a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon 
to mention a recent one. So 'always build from empty TMPDIR' will leave 
serious and harder to trackdown bugs unnoticed.
Another example: building qt/e for ppc405 will OOM[1] if you have a 
populated TMPDIR, it will work fine from scratch.
We should certainly do builds from scratch to track down dependency and 
process bugs, but let's not forget about non-empty TMPDIR bugs.

regards,

Koen

[1] It took me a while to track that one down, since the OOM would 
either take sshd down as well, or just lock up the box.



