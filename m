Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Py24F-0005BX-Ce for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 14:07:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Py225-0007ac-S6 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 14:05:29 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:05:29 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:05:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 11 Mar 2011 14:05:14 +0100
Message-ID: <ild6ma$ton$1@dough.gmane.org>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] net-snmp: disable libnl use
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
X-List-Received-Date: Fri, 11 Mar 2011 13:07:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-03-11 12:04, Steffen Sledz wrote:
> Fixes compile error
> 
> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destroy'
> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc'
> 
> which occurred sometimes depending on build order (not in clean package
> only builds).

What features do we loose when disabling netlink support? I'd rather get
the libnl recipe fixed (e.g. static lib only) instead of hacking the
dependants.

regards,

Koen

> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/net-snmp/net-snmp_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/net-snmp/net-snmp_svn.bb b/recipes/net-snmp/net-snmp_svn.bb
> index 2a75722..c53c91f 100644
> --- a/recipes/net-snmp/net-snmp_svn.bb
> +++ b/recipes/net-snmp/net-snmp_svn.bb
> @@ -1,7 +1,7 @@
>  require net-snmp.inc
>  DEPENDS += "libtool libtool-native libtool-cross"
>  SRCREV = "20069"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  S = "${WORKDIR}/net-snmp"
>  
> @@ -10,7 +10,7 @@ SRC_URI = "svn://net-snmp.svn.sourceforge.net/svnroot/net-snmp/trunk;module=net-
>          file://snmpd.conf \
>          file://snmptrapd.conf"
>  
> -EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no GREP=/bin/grep SED=/bin/sed"
> +EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no --without-nl GREP=/bin/grep SED=/bin/sed"
>  EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
>  
>  CCACHE = ""

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNeh4JMkyGM64RGpERAoHZAJ9qMCGgy94d0SRjWn8BYytVOgRTxwCgj+GR
tioY8TZybHS74EH8FMVubQ0=
=euaE
-----END PGP SIGNATURE-----



