Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PdpCZ-0002Xy-5p for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 20:20:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PdpC1-0000Us-Cg for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 20:20:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 20:20:13 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 20:20:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 14 Jan 2011 20:20:02 +0100
Message-ID: <igq7l2$a8s$1@dough.gmane.org>
References: <1294996238.3578.1.camel@mattotaupa> <igq6d1$36s$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <igq6d1$36s$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
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
X-List-Received-Date: Fri, 14 Jan 2011 19:20:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-11 19:58, Koen Kooi wrote:
> On 14-01-11 10:10, Paul Menzel wrote:
>> From b2e249702a0f6b5e36a4b095f5a4c495aa5ec14f Mon Sep 17 00:00:00 2001
>> From: Paul Menzel <paulepanter@users.sourceforge.net>
>> Date: Fri, 14 Jan 2011 09:48:08 +0100
>> Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
> 
>> Since commit d729d14d [1] task `configure` for `python_2.6.5` and `python_2.7.1` fails with the following error message when compiling with `angstrom_2008.1` for `MACHINE = "beagleboard"`.
> 
>> 	checking for major... yes
>> 	checking for getaddrinfo... yes
>> 	checking getaddrinfo bug... buggy
>> 	Fatal: You must get working getaddrinfo() function.
>> 		     or you can specify "--disable-ipv6".
>> 	ERROR: Function do_configure failed
> 
>> Disable IPv6 for now in Python unconditionally until a better solution is found. 
> 
> I don't think disabling ipv6 is the way to go, I'm comparing the eglibc
> before and after d729d14d to see if that reveals a clue. If it doesn't,
> let's put in your patch for the time being.

.... and the difference is that options-group.config is empty before d72
and fully populated after it. OPTION_EGLIBC_ADVANCED_INET6 is set to Y
in both cases it seems.

Khem, help!

This feels like the broken wide getaddrinfo test in ruby all over again :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNMKHiMkyGM64RGpERAuFJAJ0XtYegAEgZ6wpVswCCGPb6a3YcQQCdGbhc
gwL/7gtHyRYXX+oiAEtgx/c=
=XyNb
-----END PGP SIGNATURE-----



