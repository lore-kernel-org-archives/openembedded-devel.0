Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6H2W-00052W-6r for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:16:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6GxQ-0001v0-6V for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 09:11:00 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:11:00 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 09:11:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Sep 2011 09:10:43 +0200
Message-ID: <j5c2lj$nn1$1@dough.gmane.org>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
	<1316585520-18605-2-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316585520-18605-2-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-xfce 01/11] xfce4-dev-tools: add native support
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
X-List-Received-Date: Wed, 21 Sep 2011 07:16:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-09-11 08:11, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- 
> .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    7 ++++++-

> +# inherited SRC_URI does not work for native +SRC_URI =
> "http://archive.xfce.org/src/xfce/xfce4-dev-tools/${@'${PV}'[0:3]}/xfce4-dev-tools-${PV}.tar.bz2"
>
> 
+

Could give this patch a try?

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index a5a35bb..5b12cba 100644
- --- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://www.xfce.org"
- -SRC_URI =
"http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
+SRC_URI =
"http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeY3zMkyGM64RGpERAqVIAJ9dfSvnib4GMDVIYN56r7LAmHnagACfe+J4
8IrtEAkO2ytHnJ1PdYK/tWg=
=X5tl
-----END PGP SIGNATURE-----



