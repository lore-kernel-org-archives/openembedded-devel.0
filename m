Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 41ECD738EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 16:12:50 +0000 (UTC)
Received: by wizk4 with SMTP id k4so27917876wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=czrxmQb/msgfJIPM2orUdAhVC1J0NQyHnL1AjXZ5KC0=;
	b=EyJ7TXaRBWFf5ytRU7C6yAIfJ/w1NR1fLcUjNRBrdO+f8HCqIuheQKcnmOZTIX9xJ7
	Xyc/HrV/tgz1aBpKgvNdSIOR62dCwXBhZIPuGg6V98WCzKZoZydd8Xipn4ivEUdAOA+R
	l0BrVU8lmT27qtJXAOx6UjErasxF2lEYoyHR+NfYH5vdGdeNUJ51xSjjwxzIS+8q9dUw
	ysRMR7XztVfpCN7VMsidDC22LmQ/g3JxWGadOdCJgu1GBikB6BcMZIRW4xUgzjwncdFc
	x8wdwJ1gX2tIcItU6L1TP82LDWWiBZwDKQaLppm/HkbOk2oBQ23bu/d0mRgOj88pJ9hw
	JbfA==
X-Received: by 10.194.81.104 with SMTP id z8mr16933952wjx.45.1429891971568;
	Fri, 24 Apr 2015 09:12:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e2sm4188399wix.15.2015.04.24.09.12.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 09:12:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Apr 2015 18:13:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150424161325.GD2353@jama>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
	<1429890232-20762-2-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1429890232-20762-2-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-systemd][PATCH V3 2/2] layer.conf: add detection of meta-oe layer.
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
X-List-Received-Date: Fri, 24 Apr 2015 16:12:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2015 at 06:43:52PM +0300, Cristian Iorga wrote:
> bluez append has been moved to meta-oe,
> so add detection for that layer.

This isn't "detection" :)

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta-systemd/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
> index 0563f44..06c2ff1 100644
> --- a/meta-systemd/conf/layer.conf
> +++ b/meta-systemd/conf/layer.conf
> @@ -15,6 +15,7 @@ BBPATH .=3D ":${LAYERDIR}"
>  BBFILES +=3D "\
>    ${LAYERDIR}/recipes-*/*/*.bb \
>    ${LAYERDIR}/oe-core/recipes-*/*/*.bbappend \
> +  ${LAYERDIR}/meta-oe/recipes-*/*/*.bbappend \
>  "
> =20
>  BBFILE_COLLECTIONS +=3D "systemd-layer"
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

