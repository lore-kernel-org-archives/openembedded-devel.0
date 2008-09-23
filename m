Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ki5jn-0001DK-Bs
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 13:07:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ki5gL-0007xO-CN
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 11:03:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:03:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:03:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 13:03:41 +0200
Message-ID: <gbaied$pgl$1@ger.gmane.org>
References: <20080922205525.GA23908@rhein.zuhause.netz>
	<48D8B75D.7030302@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <48D8B75D.7030302@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Finer granularity for RSUGGEST
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
X-List-Received-Date: Tue, 23 Sep 2008 11:07:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Henning Heinold schrieb:
>> Hi,
>>
>> after fiddling with a filesystem kernel modul and his tools I noticed
>> in package_ipk.bbclass that if we set RSUGGESTS Variable the suggest field
>> in the ipk is set for all packages even -doc -dbg -dev and self defined
>> packages.  I personal
>> think is not a good choice and way. In my example the kernel module only needs
>> to suggest the tools package. And with the old method the tools package suggest
>> it self.
>>
>> I have prepared a patch for ipk and deb that let us set:
>>
>> ${PN}_RSUGGESTS = mooo
> I do not think this is a good idea. You can have the same effect just
> now by doing
>
> RSUGGEST_${PN} = "mooo"
>
> Currently if you set a variable that affects the binary package you know
> it will end up in all of the binary packages declared in PACKAGES. E.g.
> MAINTAINER, DESCRIPTION, LICENSE and so on.
>
> You can easily prevent this by doing:
>
> PACKAGES = "${PN} ${PN}-data"

Not related to Hennings point, put overwriting PACKAGES the way pictured 
about will break out nice -dev and -dbg dependency changing (among other 
things). Only overwrite PACKAGES if you fully understand the 
consequences, which I think no OE developer that isn't called 'RP" does :)

regards,

Koen


>
> LICENSE = "GPLv2"
> LICENSE_${PN}-data = "CC-BY-SA"
>
> Or am I missing an important point here?
>
> Regards
> Robert
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




