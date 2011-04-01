Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5ZVC-0005KL-W4 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 10:14:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5ZTG-0001XJ-RB for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 10:12:42 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 10:12:42 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 10:12:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Apr 2011 10:12:28 +0200
Message-ID: <in41dc$a8h$1@dough.gmane.org>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
	<1301637327-26825-2-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301637327-26825-2-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/7] siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 08:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-04-11 07:55, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Could you explain why this was changed?

As for the complete set: could you make it a pull request so it can be
pulled in with git merge? And use [meta-oe] as subject prefix?

regards,

Koen


> ---
>  meta-oe/classes/siteinfo.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/classes/siteinfo.bbclass b/meta-oe/classes/siteinfo.bbclass
> index c0db539..f1db913 100644
> --- a/meta-oe/classes/siteinfo.bbclass
> +++ b/meta-oe/classes/siteinfo.bbclass
> @@ -109,13 +109,13 @@ def get_siteinfo_list(d):
>                 "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
>                 "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
>                 "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
> -               "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
> +               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
>                 "arm-darwin":              "endian-little bit-32 common-darwin",\
>                 "arm-darwin8":              "endian-little bit-32 common-darwin",\
>                 "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
>                 "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
>                 "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
> -               "arm-linux-uclibcgnueabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
> +               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
>                 "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
>                 "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
>                 "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNlYjsMkyGM64RGpERAo6rAKCTF1LNMYS/qSOf/bacYeJBOquASgCeO4nA
6+fmbv3RfnguZYazTZatXJU=
=uGZa
-----END PGP SIGNATURE-----



