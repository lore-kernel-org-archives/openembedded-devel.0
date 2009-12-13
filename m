Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NJrRA-0000Ky-4m for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 17:36:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NJrPU-0008A3-Mq
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 17:35:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 17:35:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 17:35:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 13 Dec 2009 17:34:11 +0100
Message-ID: <hg3523$2lg$3@ger.gmane.org>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091201 Shredder/3.0.1pre
In-Reply-To: <1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sun, 13 Dec 2009 16:36:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-12-09 14:46, Paul Menzel wrote:
> Am Samstag, den 12.12.2009, 18:33 +0100 schrieb Henning Heinold:
>> On Sat, Dec 12, 2009 at 12:48:40PM +0100, Paul Menzel wrote:
>>> I am trying to write a recipe for The Video Disc Recorder (VDR) [1] and
>>> get it into OE.
>>>
>>> Unfortunately I have never done this and I also do not know much about
>>> things related to compiling.
>>>
>>> I tried to follow [2] and [3] and came up with the following which is
>>> not much as you can see and in addition does not work yet.
>>>
>>> The problem I am facing is, that in the Makefile of VDR [4] there is
>>>
>>>          […]
>>>          LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype
>>>          -lfontconfig
>>>          INCLUDES = -I/usr/include/freetype
>>>          […]
>>>
>>> so that the path `/usr/include/freetype/` is passed to the make command
>>> which of course fails trying to cross compile the program.
>>>
>>>          CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/freetype2
>>>          cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>>>
>>> Now, if I understand it correctly by looking at other recipes there is
>>> EXTRA_OEMAKE = "" where I should be able to set the INCLUDEPATH to the
>>> OE build environment. Is that correct.
>>>
>>> Could you please also tell me what the recipe variable name is for libs?
>>
>> What buildsystem is vdr using autotools or handmade Makefiles?
>
> VDR uses a handmade Makefile.
>
> […]
>
>> for handmade Makefiles
>>
>> make a Patch which patches the Makefile and sets the include path to
>> our staginginclude-Path
>
> Thank you! I tried this
>
>          +-INCLUDES = -I/usr/include/freetype2
>          ++INCLUDES = -I${STAGING_INCDIR}/freetype2
>
> but the `${STAGING_INCDIR}` was not expanded. The result is the
> following.
>
>          INCLUDES = -I${STAGING_INCDIR}freetype2
>
> Using an absolute path worked.
>
> Could you please point out my mistake?

AFAIK Makefiles don't use accolades but parens for variables.

regards,

Koen



