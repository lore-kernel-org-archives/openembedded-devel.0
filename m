Received: from mail-pz0-f176.google.com ([209.85.222.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NYba9-00015j-HR
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 09:43:06 +0100
Received: by pzk6 with SMTP id 6so116271pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TiuLdPcHvGCKsv2Ft6lZnx5Eb4a17SW+N0J35IQnjw4=;
	b=MffeZLLUyrR+7eWtLQRWWWGWzWqbNTcUyYylsTncAuFJRXxzji6PBBkO8QbkfcFnHg
	N6tannhGg7L6oIAFGDVozWTT/CSTKJ6OuLZ3JwiGQyZXzI8nd1Lw5X4yf36k1Rw+yFk+
	VOUBOA0mmfSzpQncBmIJyV2y/MGx4qHNaFGDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ht9QgSQ2G8OcEK+Lgh4sMeu+f2vhdpMTlNI/RDawWuedoLF94cgLVQ8BQqY22+nBnx
	ATKdou9Wjt3re/KbQjvStJD6LZMvK4paHYlvDU2GgcV/AWQl5m3oa1kN9JdlGA4SWzOu
	k4nUBLyNcvyWVGXX9ClWeckEDkqCvcDaa4pUs=
MIME-Version: 1.0
Received: by 10.141.13.10 with SMTP id q10mr980849rvi.50.1264236042331; Sat, 
	23 Jan 2010 00:40:42 -0800 (PST)
In-Reply-To: <1264151160.457.1101.camel@lenovo.internal.reciva.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
	<19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
	<ec1f3d401001210353j1802eb6am9d931438e3db1302@mail.gmail.com>
	<1264075631.9743.178.camel@mill.internal.reciva.com>
	<ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
	<1264151160.457.1101.camel@lenovo.internal.reciva.com>
Date: Sat, 23 Jan 2010 14:10:42 +0530
Message-ID: <ec1f3d401001230040p6e160fcna71f9feb337728b5@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.176
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Sat, 23 Jan 2010 08:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> You're right, 0x4000673c does look like a shared library address, and is
> not particularly illuminating unless you have access to the binary for
> the library in question (which, obviously, I don't in this case).
>
> However, the next line of your crash dump contains the opcode sequence
> around that address:
>
> Code: 1a000002 e594e060 e35e0000 1a0001d0 (ed5b0b23)
>
> The instruction in brackets is the actual one at which the fault
> occurred.  So, armed with that opcode 0xed5b0b23, you can then just feed
> it into the disassembler and see what happens.
>
> The GNU tools don't actually have a direct equivalent to the ADS
> "disass" program, so the easiest way to convert the opcode into an
> instruction is along the lines of:
>
> $ arm-linux-as
> .word 0xed5b0b23
> ^D
> $ arm-linux-objdump -d a.out
>
>

Great. got it !

Thanks Khem and Phil for your great support.

--RK

