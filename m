Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N0d4t-0004Vt-D4 for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 17:26:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N0d3k-0001I5-Go
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 17:25:08 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 17:25:08 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 17:25:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Oct 2009 17:24:25 +0200
Message-ID: <hbn939$a3k$1@ger.gmane.org>
References: <afb7987a0910200214v11b56177w400fac16a87a09f7@mail.gmail.com>	<20091020110625.GA25350@mi.fu-berlin.de>
	<hbk60j$m83$2@ger.gmane.org>	<70c9a9110910210114y6a907cb3qc69564fea9c3b565@mail.gmail.com>	<hbmoep$f72$1@ger.gmane.org>
	<afb7987a0910210653rec4e371s4601e16bdf70168@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <afb7987a0910210653rec4e371s4601e16bdf70168@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: IGEPv2 with TI DSP codecs and GStreamer
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
X-List-Received-Date: Wed, 21 Oct 2009 15:26:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-10-09 15:53, Andrea wrote:
> Hi Koen,
>
>>
>> I have them queued on a local branch together with some fixed I need to test
>> before pushing them out.
>> You might have noticed the patchwork status of your patches has been updated
>> :)
>>
>
> Could you add support for IGEPv2 in dmai?
> I patched /recipes/ti/ti-dmai/touchbook-support.patch, but I don't
> think is the right place!

I had the same diff locally :) I've also alerted upstream about it and 
both touchbook and igep should be in soon.

regards,

Koen

>
> --- /tmp/Cpu.c  2009-09-25 12:41:08.000000000 +0200
> +++ davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/Cpu.c
>       2009-09-25 12:41:36.000000000 +0200
> @@ -107,6 +107,8 @@
>       }
>       else if ((strcmp(valBuf,"OMAP3EVM Board") == 0) ||
>               (strcmp(valBuf, "OMAP3 EVM") == 0) ||
> +            (strcmp(valBuf, "IGEP v2.x board") == 0) ||
> +            (strcmp(valBuf, "OMAP3 Touch Book") == 0) ||
>               (strcmp(valBuf, "OMAP3 Beagle Board") == 0)) {
>               *device = Cpu_Device_OMAP3530;
>       }
>
> Regards,
> Andrea




