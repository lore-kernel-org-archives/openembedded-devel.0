Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JcK8m-0008NX-6O
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 13:45:06 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 09DB76280B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 13:45:04 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1205992995.25920.1243400709@webmail.messagingengine.com>
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
Date: Thu, 20 Mar 2008 13:46:15 +0100
Message-Id: <1206017175.4700.8.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwmmxt optimization and soft float in OE on PXA270
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2008 12:45:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hasjim Williams wrote:

> You won't be able to use iwmmxt with everything.  The unwind / exception
> support for iwxmmt isn't there in gcc.  Anything using C++ exceptions
> won't work correctly.

So plain C binaries (e. g. kernel) are OK? And
c++ -march=iwmmxt -fno-exceptions as well?

> infocenter.arm.com/help/topic/com.arm.doc.ihi0038a/IHI0038A_ehabi.pdf
> explains about the unwind / exceptions.
> 
> This is also one of the issues that Cirrus's MaverickCrunch currently
> has.
> 
> The only ARM coprocessor that is fully supported (by gcc) is VFP.  
> 
> In summary, we'd have to modify:
> gcc/config/arm/pr-support.c
> gcc/config/arm/unwind-arm.h
> gcc/config/arm/unwind-arm.c
> 
> for proper iwmmxt Unwind_VRS_Pop support.
> 
> NB, I'm the guy that has done the MaverickCrunch gcc patches...
> 
> I could write/test these patches, I guess, but the only PXA270 machine
> that I have access to is a HTC Magician (XDA Mini).

It would be very nice. I could test them on my Zaurus, if you send me
some C++ testcase (or name of application to test it on).

The last missing thing - iwmmxt support in qemu - was already written by
Andrzej Zaborowski.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



