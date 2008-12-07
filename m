Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9OnP-0001X4-4u
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 19:55:59 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207185207.QYLC2948.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 13:52:07 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id oJs41a00N1E665w04Js5ra; Sun, 07 Dec 2008 13:52:08 -0500
X-Authority-Analysis: v=1.0 c=1 a=9EahC8dWb_8V6ZCq50sA:9
	a=rRf6jWf-LZhA_97W9i_zLgZCr7YA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 11:52:14 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207185213.GA15204@smtp.west.cox.net>
References: <20081207021144.GL16628@smtp.west.cox.net>
	<ghgcbq$9of$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ghgcbq$9of$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Sun, 07 Dec 2008 18:55:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 12:34:17PM +0100, Koen Kooi wrote:
> On 07-12-08 03:11, Tom Rini wrote:
>> Hello,
>>
>> As part of testing meta-toolchain-sbox builds on different arches, I
>> found that sbrsh, on ARM, brings in both the 2.6 kernel for the MACHINE
>> in question, as well as a 2.4 kernel.  In the case of the 2.4 kernel, it
>> first picks up poodle-kernel-2.4-embedix.bb on nokia800, which doesn't
>> work as it wants gcc-2.95, which doesn't exist.  Can I move the
>> following support to packages/obsolete/linux/ ?
>> corgi-kernel-2.4-embedix.bb
>> husky-kernel-2.4-embedix.bb
>> openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb
>> poodle255-kernel-2.4-embedix.bb
>> poodle-kernel-2.4-embedix.bb
>> shepherd-kernel-2.4-embedix.bb
>> openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
>> openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb
>
> IMO kernel recipes should set COMPATIBLE_MACHINE to the machines they  
> support and in the case of ARM 2.4 kernels also COMPATIBLE_HOST to stop  
> them being selected for EABI targets.

In the case of MACHINE=nokia800 and me getting
poodle-kernel-2.4-embedix.bb, that should be the case already?
$ grep COMPAT poodle-kernel-2.4-embedix.bb
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc
poodle-kernel-2.4-embedix.bb:COMPATIBLE_HOST = "arm.*-linux"
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc:COMPATIBLE_MACHINE =
"(poodle|corgi|shepherd|husky|poodle255|tosa)"
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc:COMPATIBLE_HOST =
"arm.*-linux"
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc:COMPATIBLE_MACHINE =
'(c7x0|corgi|husky|shepherd|poodle|poodle255)'

> Also bitbake trunk and bitbake-1.8 should have some fixes for  
> tryaltconfig, but the kernel recipes need to get fixed first.

Can you explain a little more here or point to an example of fixing this
elsewhere?  Thanks!

-- 
Tom Rini


