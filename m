Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NelDm-0001nk-Or for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:13:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NelBL-0006ky-Ic for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:10:51 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 09:10:51 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 09:10:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Feb 2010 09:10:30 +0100
Message-ID: <hkr59l$a2u$1@ger.gmane.org>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 05/12] no need to set LD nowadays
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
X-List-Received-Date: Tue, 09 Feb 2010 08:13:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-02-10 22:14, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/busybox/busybox.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 7f67f47..c80b3bd 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -66,7 +66,7 @@ RDEPENDS_${PN}-syslog += "${PN}"
>  RDEPENDS_${PN}-udhcpd += "${PN}"
>  
>  # Use gcc for linking so LDFLAGS actually makes sense
> -LD = "${CC} -nostdlib"
> +#LD = "${CC} -nostdlib"

We have an scm, so you can just delete both the statement and comment.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLcRh2MkyGM64RGpERApVjAJ0X74dRU/v8yAyQvqhcqrCz9v1LwgCfZ52X
tRQfra5kwqse4cUBbK04+60=
=q9ca
-----END PGP SIGNATURE-----



