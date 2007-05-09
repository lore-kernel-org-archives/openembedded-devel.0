Received: from [157.27.6.133] (helo=mailgw2.univr.it)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <cailotto@sci.univr.it>) id 1HloaK-0006u6-Oy
	for openembedded-devel@openembedded.org; Wed, 09 May 2007 18:00:14 +0200
Received: (qmail 52586 invoked by uid 1010); 9 May 2007 15:59:38 -0000
Received: from cailotto@sci.univr.it by mailgw2.univr.it by uid 1003 with
	qmail-scanner-1.22-st-qms 
	(spamassassin: 2.63.  Clear:RC:1(157.27.252.10):. 
	Processed in 0.062066 secs); 09 May 2007 15:59:38 -0000
X-Antivirus-UNIVR-Mail-From: cailotto@sci.univr.it via mailgw2.univr.it
X-Antivirus-UNIVR: 1.22-st-qms (Clear:RC:1(157.27.252.10):. Processed in
	0.062066 secs Process 52580)
Received: from profs.sci.univr.it (157.27.252.10)
	by mailgw2.univr.it with SMTP; 9 May 2007 15:59:38 -0000
Received: from kai (kai.sci.univr.it [157.27.242.56])
	by profs.sci.univr.it (Postfix) with ESMTP id 9CBD58001A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2007 17:59:37 +0200 (CEST)
From: "Stefano Cailotto" <cailotto@sci.univr.it>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 May 2007 17:59:38 +0200
Message-ID: <001f01c79253$0bf2c970$38f21b9d@kai>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AceSUwvWMfzNWlXjSCmXOPmALoxaKg==
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Subject: OE on Kontron eb425
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
X-List-Received-Date: Wed, 09 May 2007 16:00:20 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Leon, 
I've extracted kontron modifications with a diff between their shipped
kernel and a fresh one.
I don't know if it is possible to flash even the bootloader...
Looking a bit into source code, there are several kontron patches both for
drivers and kernel boot.
I'm trying to KOntron kernel into OE using Kontron toolchain, but without
success..

Hello Stefano,

On 5/4/07, Stefano Cailotto <cailotto at sci.univr.it> wrote:
> Hi all,
> I'm trying to build something usable for a kontron eb425 board, based on
an
> intel ixp425.
> I tried to compile using a generic ixp4xxbe, but when loading, the kernel
> stops after uncompressing reporting a CRC error.
> It seems that Kontron EmbeddedLinux development kit performs something on
> the kernel before making zImage in order to load it in a specifed memory
> location.
>
There are some IXP42x users on OE, mostly for the NSLU device from
Linksys/Cisco, the Intel dev board (IXDP425) and some custom boards,
but I have not see the Kontron board yet.

With the reported problem, it would help if you understand or at least
could tell where to find the details on the boot loader.

Ideally, you would want to boot loader to be buildable from source
instead of relying on some binary on flash.

Regards,

Leon.

---------------------------------------------------------------------------
  Stefano Cailotto - Research Consultant
---------------------------------------------------------------------------
  EDALab - Networked Embedded Systems
  c/o  Dipartimento di Informatica - Universita` di Verona
  Strada le Grazie, 15 - 37134 Verona (Italy)
---------------------------------------------------------------------------
  email: cailotto@sci.univr.it stefano.cailotto@edalab.it      
  web:  http://www.edalab.it
  tel: +39-045-802-7062 fax: +39-045-802-7068
---------------------------------------------------------------------------



