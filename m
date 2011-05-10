Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJkg1-0004dv-M5 for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:00:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJkdO-00060i-AS for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 12:57:46 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 12:57:46 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 12:57:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 12:57:34 +0200
Message-ID: <iqb5mu$c44$1@dough.gmane.org>
References: <1305024190-24481-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305024190-24481-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] gnome-desktop-2.32.1: disable desktop docs
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
X-List-Received-Date: Tue, 10 May 2011 11:00:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 12:43, Martin Jansa wrote:
> * we don't have gnome-doc-utils-native in DEPENDS to provide xml2po and it calls
>   `which xml2po` -m docbook -e -t "${mo}"
>   which doesnt work on host without xml2po
> * if we add gnome-doc-utils-native to DEPENDS then it still fails:
>   | xsltproc -o fdl-C.omf --stringparam db2omf.basename fdl --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in "/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/gnome-desktop-2.32.1-r0/gnome-desktop-2.32.1/desktop-docs/fdl/fdl.omf.in"  `/OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` C/fdl.xml || { rm -f "fdl-C.omf"; exit 1; }
>   | warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
>   because pkg-config returns xsl path without sysroot prefix
>   /OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils
>   /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> * feel free to fix gnome-doc-utils-native/gnome-doc-utils if you care about desktop docs
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/gnome/gnome-desktop_2.32.1.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/gnome/gnome-desktop_2.32.1.bb b/recipes/gnome/gnome-desktop_2.32.1.bb
> index be055c9..e2f5c57 100644
> --- a/recipes/gnome/gnome-desktop_2.32.1.bb
> +++ b/recipes/gnome/gnome-desktop_2.32.1.bb
> @@ -8,6 +8,8 @@ inherit gnome pkgconfig
>  SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
>  SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
>  
> +EXTRA_OECONF += " --disable-desktop-docs"
> +
>  do_install_append() {
>  	sed  -i 's:#!.*/usr/bin/python:#!/usr/bin/python:' ${D}${bindir}/gnome-about
>  }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyRoeMkyGM64RGpERAon5AKCoeo+JjoqNnsJQE8SwAPOts0O/cACfT0pz
mGeRoZ2pH7larXtg5Jybvpk=
=1VfH
-----END PGP SIGNATURE-----



