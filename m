Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGcPJ-0005xg-QZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 20:29:46 +0200
Received: by pvc30 with SMTP id 30so218520pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=QKSg3Vp/NTqfnNOs2T8y3kvk5eDO+56Hih5658X7H4Y=;
	b=Q72mw2r2AcSKpqCpP8w7cZqdxG+JWMu6wQn0X2ACwpbF1YEJMQLtA2vDrpdtnyr4BD
	s9A1RUgpNZ/UAOIHZC+cIIVVcyKDULGOoWeuAetZIY3YU5U4uiflEtgCYkC3YEPoXJoI
	OlNQQQ+qqrLXqh2oP8xQoT/qKDRiAep9R3hwo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ps7+WQr9BKoDqdIW6zNNNt3wrDZoTEL/s29hu+H4YqF7xqnaXl+WrfzXx0jYL5cbZT
	oMQuGBa6Z8cKkKsjWi7OKWJoN2YvGIJ/3ICE7MTyVXY6xo4KAOSuOMj+ZU376YWnCqov
	fYSmb5QqgweSw8fUP8346zPXxgtcl2RbsQ9tM=
Received: by 10.115.134.32 with SMTP id l32mr5207266wan.44.1274725538687;
	Mon, 24 May 2010 11:25:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c1sm40386362wam.7.2010.05.24.11.25.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 May 2010 11:25:37 -0700 (PDT)
Date: Mon, 24 May 2010 11:25:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100524182529.GA28464@gmail.com>
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
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1005241813190.5274@asterix.crazy-teaparty.dyndns.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 24 May 2010 18:29:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/10 18:36), Vitus Jensen wrote:
> 
> Well, it generates the call to __floatdidf from inside cast() but
> that function is never called from main but replaced with the
> precomputed result.  See attached assembler output, there is no call
> to _Z4castx.

yeah I see, its inlining the function.
> 
> Hmm, I'm using angstrom with glibc.  And I'm testing on the real
> device and saw that -mhard-float is implied by mcpu=603e.  Using the
> FPU would certainly explain differences between qemu and the real
> thing.  But __floatdidf is hard to understand, all macro.  Is it
> really using the FPU?

Yeah that could be something to look at. In general if gcc is using 
fp instruction to schedule then it might be using them. 

You should try to find which libgcc is it linking to when using g++
and gcc. It could be that its linking in two different libgcc versions

secondly try to compile program statically and then run it.

Also try to generate the linker map file in faulty and good case.

try ldd on the binary on target and see if there is any difference
in libraries it is wanting 

> 
> Vitus
> 
> PS, to crosscheck: is there a HOWTO for qemu and oe/ppc?  And
> qemu_0.12.4 doesn't build here.

You could use qemu-native from OE if thats not the one failing.
there is a script in contrib/qemu/run-qemu.sh thus far. Although one day I should
do a write-up on wiki about various qemu machines in OE

Thx
-Khem



