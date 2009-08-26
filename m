Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MgK0G-0004Jj-Ds for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 17:01:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MgJin-0005ey-9D
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 16:43:33 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 16:43:33 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 16:43:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Aug 2009 16:43:10 +0200
Message-ID: <h73hlu$fls$1@ger.gmane.org>
References: <4A95468A.9080109@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4A95468A.9080109@dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Parsing errors in current dev branch :(
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
X-List-Received-Date: Wed, 26 Aug 2009 15:01:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-08-09 16:28, Steffen Sledz wrote:
>> git branch
> * org.openembedded.dev
>> git log | head -n 1
> commit 73b0cf99f965eeb5a08daf614b98fa6e23c1c848
>
> NOTE: Handling BitBake files: - (1265/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.08.bb
> NOTE: Handling BitBake files: \ (1267/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.06.bb
> ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.01.bb
> ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.05.bb
> NOTE: Handling BitBake files: \ (1271/7083) [17 %]ERROR: Could not include required file ../dvsdk/ti-dspbios.inc while parsing /home/DRESEARCH/sledz/work/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.09.bb
> NOTE: Handling BitBake files: \ (7083/7083) [100 %]
> NOTE: Parsing finished. 6789 cached, 1 parsed, 288 skipped, 0 masked.
> ERROR: Parsing errors found, exiting...

That should be fixed now, sorry for the breakage. Note to self: to not 
try to merge branches that move files around before drinking coffee.



