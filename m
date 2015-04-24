Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A92AF605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 12:37:09 +0000 (UTC)
Received: by widdi4 with SMTP id di4so18635943wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 05:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=8hB1OrA1fipZW5P8mNJDsE1uPM9DuwDpAXZA9x6gDIw=;
	b=Vg7ewamzhcAmycV288AXs2Q7PxlCy8wq8bbF5zvPqZn3y2cccqDJg+RpsdJYG+EvVB
	3PX/JDgL82mK/6xUhtRz0whxhzV9JEehj8wbR9r4HrbQ0urRuJ/XJX0PyAijTp63r0ik
	9iuFkTfkznoBjlnr2MhMJlW23RTHnzODepyd9IqUf+Tr5GZuNdvZwafvOr4ANmfuC9VO
	jc8NbhFr7yuDk+p9a/8fiOyChHJ3qkQ9deMVq3yeCkwJ1IyNx/o+rgPZ58aplekY0jnn
	kLMYZRWMm71mY1iRrCJIdsSjRf5KdHpojC7k2Dpm8zoZM4KACUwWiAvkDqBlbRPPcS/x
	mUTw==
X-Received: by 10.180.105.74 with SMTP id gk10mr2045875wib.29.1429879030240;
	Fri, 24 Apr 2015 05:37:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	z12sm16743945wjq.12.2015.04.24.05.37.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 05:37:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Apr 2015 14:37:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150424123743.GA2353@jama>
References: <1429878122-23715-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1429878122-23715-1-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Fri, 24 Apr 2015 12:37:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2015 at 03:22:02PM +0300, Cristian Iorga wrote:
> bluez4 recipe has been updated with proper systemd
> support, so update meta-systemd append accordingly.
> Also update to the right directory structure.

You need to update BBFILES in layer.conf, see:
commit 8b465f791a5ef3d9ef138a206c6fb9c3bbcb55b1
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sat Apr 13 14:16:51 2013 +0200

    layer.conf: remove detection of other layers, now there are only
oe-core bbappends

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5=
 -----
>  1 file changed, 5 deletions(-)
>  rename meta-systemd/{oe-core =3D> meta-oe}/recipes-connectivity/bluez/bl=
uez4_4.101.bbappend (51%)
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101=
=2Ebbappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> similarity index 51%
> rename from meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> rename to meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb=
append
> index da01b05..260c02e 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
> +++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
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

