Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNTfm-0004t6-48 for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 19:11:54 +0100
Received: from f053042081.adsl.alicedsl.de ([78.53.42.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNTZo-0004OI-Ed for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 18:05:44 +0000
Message-ID: <1320689136.4727.11.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 07 Nov 2011 19:05:36 +0100
In-Reply-To: <c910d23fec8138319d3ff83ad37ba89469267b86.1320676389.git.otavio@ossystems.com.br>
References: <cover.1320676389.git.otavio@ossystems.com.br>
	<c910d23fec8138319d3ff83ad37ba89469267b86.1320676389.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] dhcp: add system support to dhcp-server
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
X-List-Received-Date: Mon, 07 Nov 2011 18:11:54 -0000
X-Groupsio-MsgNum: 35245
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-KgsdQRPVsMgYdBibQPtl"

--=-KgsdQRPVsMgYdBibQPtl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Otavio,


thank you for the patch. system*d* in the commit summary.

Am Montag, den 07.11.2011, 14:33 +0000 schrieb Otavio Salvador:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   19 ++++++++++++++=
+++++
>  .../recipes-connectivity/dhcp/files/dhcpd.service  |   12 ++++++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
>  create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcpd.service

[=E2=80=A6]

> diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service b/meta=
-oe/recipes-connectivity/dhcp/files/dhcpd.service
> new file mode 100644
> index 0000000..70beee9
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DDynamic Host Configuration Protocol (DHCP)
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +Type=3Dforking
> +PIDFile=3D/var/run/dhcpd.pid
> +EnvironmentFile=3D-/etc/default/dhcp-server
> +ExecStart=3D/usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -q $INTERFACES
> +
> +[Install]
> +WantedBy=3Dmulti-user.target

Did you write this yourself or did you get it from somewhere? Is
upstream aware of this?


Thanks,

Paul

--=-KgsdQRPVsMgYdBibQPtl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk64HfAACgkQPX1aK2wOHVgDZQCdE87tn/TScFyX5dWyGAHzac/9
ZOcAn0HPmlcFGSVoUj4tsDYkua5YCPXt
=ejsh
-----END PGP SIGNATURE-----

--=-KgsdQRPVsMgYdBibQPtl--
