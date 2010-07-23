Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcLeO-0001lU-HL
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:03:19 +0200
Received: by iwn34 with SMTP id 34so379895iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=tf/mwXw/W+NAYcx8/QSUvxaQVG+/Ri0m0kEfHHku5Z4=;
	b=uIGdR5MLdPKq7ElVqhiwPtjAIAZq/p836cf+20vyFlZBQF8zINo0Ra+myErLjZJWAZ
	2mjR7CNDJstxBqj1Gbz6LrVYqV3mX9Zstlukg4Zf2bKEWSdhs5K/gXNbhUc+V/ZMY6I3
	Aacvk+DG9b2MazaNEEgnbLdBxxW3K7D2z1BUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=un7n3tOOHSbsm37/2/Vx4HsPlWEBRJ/6w6i1U/yc7Q/FoEG1GQYz3QjN6EHX76oRLf
	hn0FQM0h7XyKzfBvi9QocXgd0x7IsaN12AokQfHX7H/JEJH7L3fbUdj8GX2UHv2PG49a
	ru+Z2k6GJrR6gGTSc+JNs8GJguCTayc7I+QCs=
Received: by 10.231.39.196 with SMTP id h4mr3781369ibe.64.1279904576445; Fri, 
	23 Jul 2010 10:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 10:02:35 -0700 (PDT)
In-Reply-To: <i2bf8b$joo$2@dough.gmane.org>
References: <i2bf8b$joo$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 10:02:35 -0700
Message-ID: <AANLkTi=HD8OXhMhyaXHLfGsOYESC4+1s5fBYjCZFzsUm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross problem with multimachine config after cross changes
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
X-List-Received-Date: Fri, 23 Jul 2010 17:03:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 23, 2010 at 12:10 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I was doing a multimachine build and the armv7a bits completed
> beautifully, but the armv5te bits break in binutils-cross:
>
> | /usr/bin/ld:
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a(cplus-dem.o):
> relocation R_X86_64_32
> used when making a shared object; recompile with -fPIC
> |
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a:
> could not read symbols: Bad value
> | collect2: ld returned 1 exit status

interesting. Does your native sysroot also have
sysroots/x86_64-linux/usr/lib/libiberty_pic.a ?
if not then its a problem. but that said I think different versions
for different machines of same arch
is not going to work if they share same canonical names for tools. For
different architectures it will work.

You can try to remove

>
> Does anyone have a quick fix for that? My tinderbox looks so said with
> all that red :(
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMSUBLMkyGM64RGpERAgopAJ96q9OiWD8Eywv0L/09b8wP92QfnwCgpt11
> EoOVgGxVY+MeWMPJcoF8pg8=
> =1cA2
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


