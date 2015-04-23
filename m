Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id EA3166AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:16:05 +0000 (UTC)
Received: by widdi4 with SMTP id di4so219798903wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=sWc4aOu6J8YfSo81wmubRA0VYTLd7Uv/hwVjfQc5H9g=;
	b=TgLjn0YXH0W5HafHAFrs8WIRRNjXZVRFeIpWNgBn2P4qtEljFt6lK5oH25je9fWQYX
	dfQLK3SmC6T4yaFRlobERPuYu27caus4/nw75W3DYD6tZaKrkSj6/es/JHdVOwAjZXSh
	JDj5KigevMKiN0tsR667baLR911ZdeF6sjLt8M7OQCpQnwBCt+SHJWuVvoCt0LSYJKhA
	A+us8GNaOZS/nV3BlAhR+KaoFCT4XOCZqm/MTZkpp0NMP3eixFtpZtfAFB/O1L1X94rZ
	ZXSYbbHMtxlcMcgV9jEwkUoMb7Q3yypSBKiz+Eax8rYp14vMIoIpOhn7jz4TTi6YsKph
	739Q==
X-Received: by 10.180.91.76 with SMTP id cc12mr16634019wib.67.1429802166553;
	Thu, 23 Apr 2015 08:16:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id b10sm29647804wiz.9.2015.04.23.08.16.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 08:16:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2015 17:16:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150423151619.GB2336@jama>
References: <1429799251-14057-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1429799251-14057-1-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-systemd][PATCH] bluez4_4.101.bbappend: update according to bluez4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 15:16:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 05:27:31PM +0300, Cristian Iorga wrote:
> bluez4 recipe has been updated with proper systemd
> support, so update meta-systemd append accordingly.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend         | 5=
 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101=
=2Ebbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> index da01b05..260c02e 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
> +++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd

It should be either moved from oe-core to meta-oe directory or better
merged into bluez4 recipe and removed from meta-systemd.

> @@ -1,9 +1,4 @@
> -inherit systemd
> -
> -EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> -
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

