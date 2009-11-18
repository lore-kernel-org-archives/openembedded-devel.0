Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NAhru-000407-Ez for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:34:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NAhqa-00067D-Cr
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:33:12 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 11:33:12 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 11:33:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 18 Nov 2009 11:32:35 +0100
Message-ID: <he0ig4$kqa$1@ger.gmane.org>
References: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>	<1258409935-6345-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<1258539954.26517.91.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258539954.26517.91.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Reorganized kernel class to run 'menuconfig' after 'configure'.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:34:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-11-09 11:25, Phil Blundell wrote:
> On Mon, 2009-11-16 at 23:18 +0100, Przemyslaw Wesolek wrote:
>> Previously, 'menuconfig' task was being run just after 'patch' one. In
>> result, the most common path for unexperienced users:
>>
>> bitbake virtual/kernel -c menuconfig
>> bitbake virtual/kernel -c build
>>
>> didn't work, because the result of 'menuconfig' was later overwritten by
>> 'configure' on the chain of 'build'.
>>
>> With this patch, 'configure' is requirement for 'menuconfig',
>> so any manual changes to the kernel config is done just before
>> actual build and no overwrite occurs.
>
> Thanks for the patch.  That seems like a reasonable change and I think
> it's been proposed before without anybody speaking up in favour of the
> old behaviour.  I checked this in.

Could please use --author in the future when applying patches created by 
other people? We aren't using cvs anymore...

regards,

Koen



