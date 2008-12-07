Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9Hxv-0001rX-9v
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 12:38:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9HuG-0000j1-49
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 11:34:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 11:34:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 11:34:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Dec 2008 12:34:17 +0100
Message-ID: <ghgcbq$9of$1@ger.gmane.org>
References: <20081207021144.GL16628@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <20081207021144.GL16628@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Broken kernel recipes
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
X-List-Received-Date: Sun, 07 Dec 2008 11:38:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-12-08 03:11, Tom Rini wrote:
> Hello,
>
> As part of testing meta-toolchain-sbox builds on different arches, I
> found that sbrsh, on ARM, brings in both the 2.6 kernel for the MACHINE
> in question, as well as a 2.4 kernel.  In the case of the 2.4 kernel, it
> first picks up poodle-kernel-2.4-embedix.bb on nokia800, which doesn't
> work as it wants gcc-2.95, which doesn't exist.  Can I move the
> following support to packages/obsolete/linux/ ?
> corgi-kernel-2.4-embedix.bb
> husky-kernel-2.4-embedix.bb
> openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb
> poodle255-kernel-2.4-embedix.bb
> poodle-kernel-2.4-embedix.bb
> shepherd-kernel-2.4-embedix.bb
> openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
> openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb

IMO kernel recipes should set COMPATIBLE_MACHINE to the machines they 
support and in the case of ARM 2.4 kernels also COMPATIBLE_HOST to stop 
them being selected for EABI targets.

Also bitbake trunk and bitbake-1.8 should have some fixes for 
tryaltconfig, but the kernel recipes need to get fixed first.

regards,

Koen





