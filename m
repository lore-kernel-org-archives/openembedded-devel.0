Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kt4RB-0001vp-T7
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 19:57:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kt4Qb-0006Xu-MT
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 17:56:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 17:56:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 17:56:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Oct 2008 19:56:49 +0200
Message-ID: <gdqdt1$3c2$1@ger.gmane.org>
References: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>	<gdnj3q$ei6$2@ger.gmane.org>
	<20081023173830.GA14304@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081022 Shredder/3.0b1pre
In-Reply-To: <20081023173830.GA14304@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Some review for the stefan/xo-support branch
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
X-List-Received-Date: Thu, 23 Oct 2008 17:57:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-2008 19:38, Stefan Schmidt wrote:
> Hello.
>
> On Wed, 2008-10-22 at 18:07, Koen Kooi wrote:
>> One comment:
>>
>> +PV = "2.6-olpc+git${SRCREV}"
>>
>> That should be:
>>
>> 2.6.34+gitr${SRCREV}
>
> Good point. The newest mainline tag I could find inside the repo was .22

The easiest way is to look at the top-level kernel makefile, that has 
the exact version.

> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=973295dbb4ab499c2c61972d0410ed8385d93447

Looks good!

> One of the next steps is to test out how good mainline support is nowadays for
> the XOs.

Some sugar people are working on expanding the sugar support in OE, you 
can track their work here: 
https://www.develer.com/gitweb/pub?p=users/bernie/beagle-sugar.git;a=summary

They plan to send us polished patches later on.

regards,

Koen



