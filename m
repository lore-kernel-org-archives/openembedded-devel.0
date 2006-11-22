Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1Gmzb0-00056y-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 22:25:30 +0100
Received: by ug-out-1314.google.com with SMTP id e2so264429ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 13:22:33 -0800 (PST)
Received: by 10.78.201.2 with SMTP id y2mr8279236huf.1164230553562;
	Wed, 22 Nov 2006 13:22:33 -0800 (PST)
Received: by 10.78.164.9 with HTTP; Wed, 22 Nov 2006 13:22:33 -0800 (PST)
Message-ID: <f96d234e0611221322o3ee95965hb5e2a1d4f19a6cda@mail.gmail.com>
Date: Wed, 22 Nov 2006 16:22:33 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"Andrew Paulsen" <andrew.paulsen@gmail.com>
In-Reply-To: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
Subject: Re: Angstrom, compulab-pxa270, and gpe-image
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
X-List-Received-Date: Wed, 22 Nov 2006 21:25:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/22/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> I'm trying to "bitbake gpe-image" using the Angstrom distribution and
> the computlab-pxa270 machine.

> drivers/block/cl_flash/CL_FlashDrv uses FPA instructions, whereas
> drivers/block/cl_flash/fdrv.o does not

The compulab kernel includes a NAND driver that has a binary component
-- downloaded from the compulab website.  I suspect that this binary
component was compiled with a non-eabi toolchain and can't be used
with a EABI toolchain.  Argh!  I was planning to switch to
Anstrom/EABI in the near future.  Perhaps I can get them to rebuild
this module with a EABI toolchain.  The best solution would be to get
the JFFS2/NAND patches integrated into OE.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


