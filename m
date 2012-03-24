Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SBKmd-0008Au-Sf for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 07:49:03 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SBKdv-0002FH-OT for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 07:40:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 07:40:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 07:40:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 24 Mar 2012 07:37:07 +0100
Message-ID: <jkjq2i$2v5$2@dough.gmane.org>
References: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
In-Reply-To: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Sat, 24 Mar 2012 06:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-03-12 22:10, Henning Heinold schreef:
> Hi,
> 
> while building openjdk I discovered that relocatable.bbclass strips all
> PATHS with ORIGIN, that is problematic, when binaries like an jdk is
> installed not in the standard paths /lib or /usr/lib.
> 
> This patch let all exisiting ORIGIN stay in the binary. So far I only saw
> problems with some perl-native libs, where chrpath fails now, because the
> path is to long. But it seems they work anyway.
> 
> While letting the path stay in binary it occurs that whitespaces at the
> end of the last path sneaked some how in. So I made re.sub line to clean
> this up.
> 
> Bye Henning
> 
> Henning Heinold (1): relocatable.bbclass: do not erease already existing
> ORIGIN paths and sanity resulting rpath
> 
> meta/classes/relocatable.bbclass |    3 +++ 1 files changed, 3
> insertions(+), 0 deletions(-)
> 

Wrong list, oe-core maybe?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPbWuTAAoJEHZqAkdh1vT6SSoQAK777b8czi5A8JmbfhTT4xcI
2HpDE7yg/XWAwyRg9F6NnjTsPJqUf+2OfDIZILvnhk8Dvdw/bJEyrzxQPHcjS5+2
JijG4FeruIEL48M10Qbdh4WlLAow5KEhwspwcjDzRWJk+xTBAAVuLqyBCvqLeHfX
P8INXidK9GFxG1qEC5+9F53ym/SdO29AjkE3uATXWJc96s2n0H8wCzhUEyOcndvV
4LU1q5TihIvfWVijV6Ifbqjvs3cvCxt2G0chpGVcXpJFuocrYH+ft11bDcdCrLbu
CTJ3op5NoqyZ1/6iV+gzy8KrzY/a2KptTLYqqPdwBaDb476OoWv7kEr1p1aoOxJg
l2gK8vvDcvJwyPAPEQb44A1HPZgqkUCSUjZ0YSn5e0ejbT54YoUoLeaTxbDVxthE
aly97y6hxfh3Y9oEvkgnM7K94JbZjEQ9ayrs31SUxN8qGQKDULhjjlUGHYxVvyW0
IJljyDFKK9EbE9ihZumLcyX18p1tMy+OLVTLx56FujMxE6tVNzdYvkGaWyS3Yfum
IndqfTwZBfDN0FUScZKoSTLIrSiz9fQDR1Kfuw+/zfATDBCmRbZdKd/XvhwH8/w/
RLpR5XDLIE48/0nOimtaqq4xruVt7pjz/GB6ESuPwC+VJZnKzWL/qffStB6u3DgV
8W+YE/bKDbQhV+A0aKdQ
=gkbR
-----END PGP SIGNATURE-----



