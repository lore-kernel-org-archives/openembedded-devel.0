Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2Rje-0008M6-Hd for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 16:43:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2Rid-0000AE-B6
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 16:42:51 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:42:51 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:42:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Oct 2009 16:42:28 +0100
Message-ID: <hc4g14$tpm$1@ger.gmane.org>
References: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_KERNEL_PR issue
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
X-List-Received-Date: Mon, 26 Oct 2009 15:43:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-10-09 16:37, Frans Meulenbroeks wrote:
> Hi,
>
> While creating a recipe which generates a module I bumped into the
> following issue.
> If I do
> inherit module
> the package name uses MACHINE_KERNEL_PR and not PR.
> I understand the reason for this: if the kernel is modified you want
> the proper modules.
> However in a recipe this means that if the recipe changes for whatever
> reason that technically one should increase all MACHINE_KERNEL_PR
> values (as otherwise the new version is not used).
> In my eyes this is not very desirable.
>
> Any opinions how we should fix this?

koen@dominion:/OE/org.openembedded.dev$ grep PR_append recipes/ti/*
recipes/ti/ti-cmem-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
recipes/ti/ti-dm355mm-module_1.13.bb:MACHINE_KERNEL_PR_append = "a"
recipes/ti/ti-dmai_svn.bb:MACHINE_KERNEL_PR_append = "c"
recipes/ti/ti-dsplink-module_1.61.3.bb:MACHINE_KERNEL_PR_append = "a" 

recipes/ti/ti-lpm-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
recipes/ti/ti-sdma-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"



