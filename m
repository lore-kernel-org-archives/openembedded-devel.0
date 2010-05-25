Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OGvu8-0002gE-Kz
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 17:18:54 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 36C18F8600
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 11:14:40 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 25 May 2010 11:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=SRnwh74ufmmheBU5F4Ozj9G7xXM=;
	b=aTmdNaG+2QBOs66F0Ow8GzGn3pOyFuqACVpBLqu1xLGfw+fJ8nbZUm41kbFvYBPZMy5E5mzRzZP3OI1C1PiZ+N1NduD2G/oRGbeXk+VPQuZQZG4tLzBA3kIfRyzbupeD0KqSofpUuhPQLARy/pqhBgLtDN0gruNicr1yQQkW520=
X-Sasl-enc: 063w01jMGsxfqwa/f22B/mfD2J8ucgoh/z5cNOT7Sz9m 1274800461
Received: from [192.168.1.35] (hnvr-4d07b6da.pool.mediaWays.net [77.7.182.218])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3EA274E10EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 11:14:21 -0400 (EDT)
Date: Tue, 25 May 2010 17:15:49 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100524182529.GA28464@gmail.com>
Message-ID: <alpine.LNX.2.00.1005251636150.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
	<ht14oq$ok6$1@dough.gmane.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
	<alpine.LNX.2.00.1005241813190.5274@asterix.crazy-teaparty.dyndns.org>
	<20100524182529.GA28464@gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Tue, 25 May 2010 15:18:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Mon, 24 May 2010, Khem Raj wrote:
> On (24/05/10 18:36), Vitus Jensen wrote:


>> Hmm, I'm using angstrom with glibc.  And I'm testing on the real
>> device and saw that -mhard-float is implied by mcpu=603e.  Using the
>> FPU would certainly explain differences between qemu and the real
>> thing.  But __floatdidf is hard to understand, all macro.  Is it
>> really using the FPU?
>
> Yeah that could be something to look at. In general if gcc is using
> fp instruction to schedule then it might be using them.
>
> You should try to find which libgcc is it linking to when using g++
> and gcc. It could be that its linking in two different libgcc versions
>
> secondly try to compile program statically and then run it.


Using -static-libgcc and -shared-libgcc was interesting, it just affects 
the gcc support code.  static is default for C, shared for C++ and forcing 
static for C++ produced correct output.  When comparing implementations:

* static uses inline fpu code, source 
work/i686-ppc603e-sdk-angstrom-linux/gcc-cross-sdk-4.4.4-r2.1/gcc-4.4.4/gcc/libgcc2.c

* shared calls into libgcc_s.so.1 which uses software, excerpt:
Dump of assembler code for function __floatdidf:
=> 0x0fe12878 <+0>:	stwu    r1,-32(r1)
    0x0fe1287c <+4>:	mflr    r0
    0x0fe12880 <+8>:	stmw    r26,8(r1)
    0x0fe12884 <+12>:	mr      r27,r4
    0x0fe12888 <+16>:	mr      r26,r3
    0x0fe1288c <+20>:	srawi   r9,r26,31
    0x0fe12890 <+24>:	srawi   r10,r26,0
    0x0fe12894 <+28>:	stw     r0,36(r1)
    0x0fe12898 <+32>:	mr      r3,r10
    0x0fe1289c <+36>:	bl      0xfe31244 <__floatsidf@plt>
    0x0fe128a0 <+40>:	lis     r5,16880


[STABLE/2009] There are 2 libgcc_s.so.1 versions in TMPDIR/cross, the 
bigger ./ppc603e/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1 matches the 
installed version, if one copies the smaller version (uses fpu code) to 
target:/lib/ the results of -shared-libgcc applications are OK.

So, hard-fpu and soft-fpu are incompatible?  The incorrect version matches 
(strip; cmp -l) several paths in TMPDIR/work:

./ppc603e-angstrom-linux/gcc-4.2.4-r3/image/lib/libgcc_s.so.1
./ppc603e-angstrom-linux/gcc-4.2.4-r3/gcc-4.2.4/build.powerpc-angstrom-linux.powerpc-angstrom-linux/gcc/nof/libgcc_s.so.1
./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/install/libgcc/lib/libgcc_s.so.1
./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.1
./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/staging-pkg/cross/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1
./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/build.i686-linux.powerpc-angstrom-linux/gcc/nof/libgcc_s.so.1

But there are 4 other smaller versions of that library, the good one 
coming from gcc-4.2.4. or gcc-cross-4.2.4.  Which recipes decides which 
version to copy into the image?  For now it seems enough to copy a 
fpu-version by hand into the image but this is hardly an universal 
solution.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


