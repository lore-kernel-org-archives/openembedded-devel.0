Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JjcYe-0003ik-BA
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Apr 2008 17:49:56 +0200
X-ASG-Debug-ID: 1207756193-72d3000d0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 5064B3CB41
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2008 10:49:53 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id MwYHImXoqJLMiAi2 for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2008 10:49:53 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] avr32-*-gdb requires modifying gdb.inc /
	gdb-cross.inc
Date: Wed, 9 Apr 2008 10:49:58 -0500
User-Agent: KMail/1.9.7
References: <200804090920.02871.geoffrey@pager.net>
	<1207753641.7368.20.camel@isis>
In-Reply-To: <1207753641.7368.20.camel@isis>
MIME-Version: 1.0
Message-Id: <200804091049.58718.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1207756193
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: avr32-*-gdb requires modifying gdb.inc / gdb-cross.inc
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
X-List-Received-Date: Wed, 09 Apr 2008 15:49:56 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 09 April 2008 10:07:21 am Khem Raj wrote:
> Hi Geoffrey
>
> I think it will be good to make this step arch specific to AVR only.
> and best is to identify what changes are done in configure that needs it
> to be regenerated. You can regenerate these and include them in the
> patch itself instead of doing it at compile time.

Here's Atmel's reasoning for not including all the generated source / 
autotools cruft in the patch:
"The reason why these changes aren't included with the patch is that it would 
have increased its size by several megabytes, and the actual AVR32 changes 
would have been lost in the noise."

Those are good points on their part, plus I don't want to have to create and 
maintain my own patch.  When Atmel comes out with their next gdb, I don't 
want to have to create a new patch based on theirs to include in OE.  I want 
to download their patch and copy it into the OE tree.

This leaves running these extra steps only for the AVR32.  What would I put 
around these extra steps in do_configure() and do_stage() so that they are 
only run when building for the AVR32.

---
Geoffrey


