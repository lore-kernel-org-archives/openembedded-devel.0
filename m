Received: from drewtech.com ([66.36.241.150] helo=server.drewtech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joravec@drewtech.com>) id 1Pnfrf-0006nK-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 00:23:56 +0100
Received: (qmail 25644 invoked from network); 10 Feb 2011 18:26:24 -0500
Received: from adsl-75-58-206-177.dsl.sfldmi.sbcglobal.net (HELO
	?192.168.0.152?) (75.58.206.177)
	by j2534-2.com with SMTP; 10 Feb 2011 18:26:24 -0500
Message-ID: <4D54734B.7060705@drewtech.com>
Date: Thu, 10 Feb 2011 18:22:51 -0500
From: Joey Oravec <joravec@drewtech.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110123 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D544976.6010800@drewtech.com> <4D545173.8080904@mentor.com>
In-Reply-To: <4D545173.8080904@mentor.com>
Subject: Re: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Thu, 10 Feb 2011 23:23:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/2011 3:58 PM, Tom Rini wrote:
> We talked about this a little on IRC and I provided the example of how 
> to use the CodeSourcery recipes that exist today.  The marvell 
> toolchain however will need it's own special love.

Yes! Much appreciated!

> Now what you'll want to do is make an external-toolchain-marvell.bb 
> and set TOOLCHAIN_BRAND to "marvell" and tweak TOOLCHAIN_VENDOR such 
> that we go from what OE normally says TARGET_SYS is to what your tools 
> actually say it is.  Then it's a matter of tweaking the contents of 
> external-toolchain-marvell.bb to copy the right things out of the 
> marvell install and into where OE wants them.  In this regard, the 
> -csl recipe may be more instructive than the -generic recipe as the 
> -generic recipe (along with external-toolchain.bb) are targeted at 
> toolchains exported by OE and thus require little mangling to work.

Both the -csl.bb and -generic.bb copy a bunch of stuff to STAGING_DIR in 
do_stage(). Of course in the long-run I need for the recipe to copy C 
libraries, but for now I should be able to leave the body blank. At 
least it'll use my compiler and run to completion. Right?

That's what I did and it seems to be ok. The "bitbake nano" example 
failed, looks like it wasn't linking ncurses. Another attempt with 
"bitbake busybox" worked and I saw some packages in the output folder. 
Looks good so far!

-joey



