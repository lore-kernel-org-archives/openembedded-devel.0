Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pakqc-0003Yq-CT for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 09:05:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PakqF-0002HU-GY for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 09:05:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 09:05:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 09:05:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 Jan 2011 09:03:10 +0100
Message-ID: <ig3svu$g6s$2@dough.gmane.org>
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
	<1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] mysql5-native: put make install to do_install after autotools_stage_all was removed with do_stage in eaf0fc03acfb262bcd614a14086a1b28ec850f46
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
X-List-Received-Date: Thu, 06 Jan 2011 08:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-01-11 16:33, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/mysql/mysql5-native_5.1.40.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/mysql/mysql5-native_5.1.40.bb b/recipes/mysql/mysql5-native_5.1.40.bb
> index 40d07ec..8001783 100644
> --- a/recipes/mysql/mysql5-native_5.1.40.bb
> +++ b/recipes/mysql/mysql5-native_5.1.40.bb
> @@ -12,6 +12,10 @@ EXTRA_OEMAKE = ""
>  EXTRA_OECONF = " --with-embedded-server "
>  
>  do_install() {
> +        oe_runmake 'DESTDIR=${D}' install
> +        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
> +        rmdir ${D}${libdir}/mysql
> +
>          install -d ${D}${bindir}
>          install -m 0755 sql/gen_lex_hash ${D}${bindir}/
>  }

Weird, I saw no build errors with my builds from scratch, but I guess my
builds only needed gen_lex_hash and target headers.

Which recipes actually need the native libs and headers?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJXc9MkyGM64RGpERAgMXAJ9ckZii9ViSichd3Whc8G8VuoHJ/wCeKkxo
ueOBrSWg2ghV2Z7IiXSlF3U=
=uit1
-----END PGP SIGNATURE-----



