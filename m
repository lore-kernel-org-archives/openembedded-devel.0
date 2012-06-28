Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkIPI-0001py-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:21:30 +0200
Received: by pbbrq2 with SMTP id rq2so3208993pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LeIO/GjzDfYwdKbk9KN1oJSBZneWVLZ/9jRL9P+RR8Q=;
	b=a9h6IyMRMnd/FjxE8BLOAjY11DBJehWOOaiPxVc3fJJntTrHPiTB5uxw8BYhXmcZLw
	3uxQH139QLSrRw6Z8VALHzvJ01eaWmZPoqxmNkJVmXUpqTMZF42VDlRXuTE/StNX2HMl
	ZZkfEPlKxOgvhXT2TuxsrUWeZZ5TKXzwvbRClMurFVgURvCMUMnShzoV68nBa6k/tVEz
	y1MAwN+NjDeEFFDyfQJHEP8F22ASCd750Po3Rk3qATIlHh79FwVqdvCVODHv5zK1n4Bt
	7PMhFH/vvizdx0Y49GABy2i2blxK49EtYKsfs7dYVYdauojQ8vRUAYLsQxe9T68TFQPO
	1rMw==
Received: by 10.68.228.136 with SMTP id si8mr9787480pbc.159.1340903433175;
	Thu, 28 Jun 2012 10:10:33 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id rs4sm2652833pbc.0.2012.06.28.10.10.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:10:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <1340337171-10384-1-git-send-email-elvis.dowson@gmail.com>
Date: Thu, 28 Jun 2012 21:10:31 +0400
Message-Id: <8659D5A1-6EE3-4CB4-B714-AA15BD325A97@gmail.com>
References: <1340337171-10384-1-git-send-email-elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded] networkmanager: Set SYSTEMD_PACKAGES as networkmanager-systemd.
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
X-List-Received-Date: Thu, 28 Jun 2012 17:21:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Request to apply this patch to the meta-openembedded layer...

Elvis

On Jun 22, 2012, at 7:52 AM, Elvis Dowson wrote:

> This commit fixes WARNING:
> =
/tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/=
networkmanager_0.9.2.0.bb:
> it is recommended to set SYSTEMD_PACKAGES as =
<existing-package>-systemd
>=20
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> index 221dc2c..d681e0c 100644
> --- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> +++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> @@ -54,7 +54,7 @@ do_install_append () {
> 	install -d ${D}/etc/NetworkManager/VPN
> }
>=20
> -SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> SYSTEMD_SERVICE =3D "NetworkManager.service"
>=20
> PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests"=20
> --=20
> 1.7.9.5
>=20



