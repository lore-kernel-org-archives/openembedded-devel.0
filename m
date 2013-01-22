Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Txfe6-0001Xq-2C for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:20:31 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TxfPL-0004H7-LR for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:05:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 16:05:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 16:05:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 22 Jan 2013 16:04:36 +0100
Message-ID: <kdm9q1$hk5$1@ger.gmane.org>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
	<1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH][meta-oe][meta-networking][meta-xfce 4/4] autofs: fix QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 15:21:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-01-13 13:20, Martin Jansa schreef:
> autofs-5.0.7: autofs: Files/directories were installed but not shipped 
> /run
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 4 ++++ 1 file
> changed, 4 insertions(+)
> 
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb index
> bf679b4..2bf03f1 100644 ---
> a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb +++
> b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb @@ -60,4 +60,8
> @@ do_configure_prepend () { fi }
> 
> +do_install_append () { +	test -d ${D}/run && rmdir ${D}/run +} + 
> INSANE_SKIP_${PN} = "dev-so"

Missing PR bump

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQ/qqEMkyGM64RGpERAuF8AJ9kNFy6oQXbe1cySl2hM0SuRUk7iACePGXu
A/vSJ0gXV94w4hKLsTVgBLc=
=G2ge
-----END PGP SIGNATURE-----



