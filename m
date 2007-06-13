Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HySAv-0001mK-E3
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2007 14:42:14 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 1B3D2F27E5;
	Wed, 13 Jun 2007 22:39:10 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07165-08; Wed, 13 Jun 2007 22:39:09 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 821F5D9CE6;
	Wed, 13 Jun 2007 22:39:09 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 541C4B70149; Wed, 13 Jun 2007 22:39:09 +1000 (EST)
Date: Wed, 13 Jun 2007 22:39:08 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070613123908.GA19284@twibble.org>
References: <7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Wed, 13 Jun 2007 12:42:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 08, 2007 at 08:53:49AM +1000, "Lu=EDs Cargnini" wrote:
> new problems:
> (BD06DC30:~/puc/instramed/openembedded) lvcargnini% bitbake task-base
> NOTE: Handling BitBake files: - (4588/4588) [100 %]
> NOTE: Parsing finished. 4373 cached, 0 parsed, 215 skipped, 0 masked.
> NOTE: build 200706071941: started
[...]
> SysV.xs:7:25: error: asm/page.h: No such file or directory
> make[1]: *** [SysV.o] Error 1
> make[1]: Leaving directory
> `/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-n=
ative-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
[...]

This is an issue with the version linux-headers not including
asm/page.h.

Creating an empty asm/page.h (in /usr/include) would get past this,
but could cause other issues.

Does the latest version of linux-headers for gentoo put this back or
is it gone for good? Checking the latest kernel here (not gentoo, I
don't use that) and it seems be getting installed as part of make
headers_install - so it looks like it's back. So you might want to
try the latest gentoo version of linux-headers before doing anything
else.

If you update your host to the latest version and it still has
problems then put a bug in the OE bug tracker and I can look at
fixing this. Perl is only including it in order to get the definition
of getpagesize which has been defined in unistd.h for a long time
now, so just removing that include for perl should (in theory) work
without any issues (unless you had a really old system?)

--=20
 Jamie Lenehan <lenehan@twibble.org>


