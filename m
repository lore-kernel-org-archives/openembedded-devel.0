Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LeDMT-0003Bo-SN
	for openembedded-devel@openembedded.org; Mon, 02 Mar 2009 19:59:39 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090302185535.CGE15318.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Mar 2009 13:55:35 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id NJvb1b0054dMFYL03JvbfX; Mon, 02 Mar 2009 13:55:35 -0500
X-Authority-Analysis: v=1.0 c=1 a=w2fQQtqhE8cA:10 a=fsJ8Y90igy4A:10
	a=uuKfwfJQGl4AgY8pkvIA:9 a=aRXI_RPuRXKDCJy6KA9FaguOAB8A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 2 Mar 2009 11:55:35 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090302185535.GD26343@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
	<ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
	<20090228155335.GJ5420@smtp.west.cox.net>
	<ac9c93b10902281007h3e063b81u63bbad13419c5d6c@mail.gmail.com>
	<20090228182919.GK5420@smtp.west.cox.net>
	<goeffr$gm2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <goeffr$gm2$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Mon, 02 Mar 2009 19:00:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 01, 2009 at 06:09:14PM +0100, Koen Kooi wrote:
> On 28-02-09 19:29, Tom Rini wrote:
>
>> Tangentally, packaged staging _can_ help here, but it's not I believe,
>> relocatible (unless you assume-provided some -native packages and
>> possibly we've fixed what we're doing wrong with gcc configure args).
>> IOW, if you build in, /OE/tmp you can't re-use the packaged staging
>> packages in /home/me/OE/tmp
>
> You can, packaged staging has 2 dirs: one for relocatable packages and  
> one for non-relocatable packages. That's how I understand it.

Compiled for target packages and runs-on-host packages.  To me, that's a
non-relocatible solution.

-- 
Tom Rini


