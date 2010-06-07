Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLjiM-0001Ah-Ns
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 23:18:35 +0200
Received: by fxm9 with SMTP id 9so2578927fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6o319ogU0REbTPBEHct1r2M6T7zAXZk0okUDc9xi+R0=;
	b=FZ/a9kMhL7wtS4mY5Fkce59R6FY46VdyhMUyxlcwMJ5EWtrcG3o5b4Ipsbu3Q5jB/D
	qH2qQxQlJ0OVYVi5CCYXrRHegetAYBn8KRLqDnn8OxBR/a3be7UmMwYeSYXGNAJujsB4
	HhZkF57MnM7a8umX1CHAgaBZg13b6e0c8Ocfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IBx1Hq1OXWX/i8OGuhvZ3zrwjBlhQKH4NjOTRMyOsAIXC20PbhOq9ZKDnB8KhhytWa
	MoGftjrZD4mJn/WgTAd6a3jRQ/N6H2TnaHMsTWIbzxgrEzHlmJ3Wyfj5CvJs0CjaCCbO
	TPV0dMWJI+GdMLcZYXzfWo1xKErpPwn6uMb+0=
MIME-Version: 1.0
Received: by 10.223.20.73 with SMTP id e9mr15627700fab.103.1275945254698; Mon, 
	07 Jun 2010 14:14:14 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Mon, 7 Jun 2010 14:14:14 -0700 (PDT)
In-Reply-To: <20100605204019.GA1403@jama>
References: <20100605204019.GA1403@jama>
Date: Mon, 7 Jun 2010 23:14:14 +0200
Message-ID: <AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Mon, 07 Jun 2010 21:18:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> FYI:
>
> If you run into issue
> ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid bfd ta=
rget
>
> Like I did in:
> http://tinderbox.openembedded.net/packages/601631/
>
> Then here is what I used as workarround/hack:
> enabled multitarget USE

This is not needed and results to broken debian.bbclass (SONAME used
to change package name), because of:
bitbake@jama ~/build.dev.ang.spitz $ objdump -p
/OE/tmpdir-dev/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.5-r0+svnr160=
043/packages-split/libgcc/lib/libgcc_s.so.1
objdump: /OE/tmpdir-dev/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.5-r=
0+svnr160043/packages-split/libgcc/lib/libgcc_s.so.1:
File format is ambiguous
objdump: Matching formats: elf32-littlearm elf32-littlearm-symbian
elf32-littlearm-vxworks

instead of expected objdump output.

I'll send patch for debian.bbclass changing calling objdump from host
to objdump from binutils-cross (as suggested by khem on IRC).

> Regards,
> --
> Jansa 'JaMa' Martin =A0 =A0 jabber: Martin.Jansa@gmail.com
>


