Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nao7F-0004lo-Ke for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 11:30:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nao4s-0003EE-SK for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 11:27:50 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 11:27:50 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 11:27:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 29 Jan 2010 11:27:31 +0100
Message-ID: <hjud6i$77n$1@ger.gmane.org>
References: <n> <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libdbd-sqlite-perl: New recipe for SQLite DBI interface driver
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
X-List-Received-Date: Fri, 29 Jan 2010 10:30:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-01-10 11:07, Michael Lippautz wrote:
> ---
>  recipes/perl/libdbd-sqlite-perl_1.29.bb |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/perl/libdbd-sqlite-perl_1.29.bb
> 
> diff --git a/recipes/perl/libdbd-sqlite-perl_1.29.bb b/recipes/perl/libdbd-sqlite-perl_1.29.bb
> new file mode 100644
> index 0000000..10fe73a
> --- /dev/null
> +++ b/recipes/perl/libdbd-sqlite-perl_1.29.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "PERL database interface driver for the SQLite database."
> +SECTION = "libs"
> +LICENSE = "Artistic|GPL"
> +DEPENDS = "libdbi-perl-native"
> +RDEPENDS = "libdbi-perl \

That should be RDEPENDS_${PN}

We did have a script somewhere to check for things like that, does
anyone know where that went?
And can someone more knowledgable about perl than me push these patches
(after fixups)?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLYrgTMkyGM64RGpERAnOEAJ0cVpWnavLn9ssl3Q6wKYXcPO2W1wCeKGwC
+s4lBh3sMT+RMl7dUgQrplo=
=BZHR
-----END PGP SIGNATURE-----



