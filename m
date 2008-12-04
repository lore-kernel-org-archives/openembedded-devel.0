Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L8L49-0003Hk-Hq
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 21:44:53 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081204204116.MPG8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 4 Dec 2008 15:41:16 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id n8hF1a00E1E665w048hF7X; Thu, 04 Dec 2008 15:41:15 -0500
X-Authority-Analysis: v=1.0 c=1 a=loYtTps6ikIA:10 a=MDJ8jmkWOw8A:10
	a=b2ZvGRdsAAAA:8 a=fxJcL_dCAAAA:8 a=n6Lx5QQAx_qtUuRMMbAA:9
	a=ta5TkPQPnMHQMF6F62IA:7 a=OuRZP2FgKfR_XkHxo2Zt0LGcYRQA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 4 Dec 2008 13:41:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081204204124.GZ16628@smtp.west.cox.net>
References: <20081204080249.GR16628@smtp.west.cox.net>
	<gh92ls$ip9$2@ger.gmane.org>
	<20081204192759.GY16628@smtp.west.cox.net>
	<gh9erh$10o$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gh9erh$10o$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: gdb-cross-sdk hacking around gcc-4.3 warnings?
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
X-List-Received-Date: Thu, 04 Dec 2008 20:44:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 04, 2008 at 09:33:51PM +0100, Koen Kooi wrote:
> On 04-12-08 20:28, Tom Rini wrote:
>> On Thu, Dec 04, 2008 at 06:06:03PM +0100, Koen Kooi wrote:
>>> On 04-12-08 09:02, Tom Rini wrote:
>>>> Hello, I see that in
>>>> http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=6348b3baf7a61fc07626a3ecb29b539d438cfb4f
>>>> we dropped -Werror from gdb-cross-sdk.  Was this for gcc-4.3 support?
>>>> If so, could we replace that by importing
>>>> http://patches.ubuntu.com/g/gdb/extracted/gcc-4.3-build-error.patch
>>>> instead?  I'll do the work, just don't want to step on anyones toes if
>>>> there was a different reason behind the change, thanks!
>>> I'm not fond of enabling -Werror in crossbuilders, since simple,
>>> harmless warnings will break your build.
>>> If you are *completely* sure your patch removes *all* -Werror related
>>> problems, then go ahead.
>>
>> Checked with an ARM and x86 build now, so yes, I'm pretty confident.
>> Tangentally, what're a powerpc / avr32 target that should build (I'll fix
>> db1200 / MIPS if that's broken, again) ?
>
> Which arm? IIRC it broke on an armv7 build.

I saw it break, then fixed it, on v6

-- 
Tom Rini


