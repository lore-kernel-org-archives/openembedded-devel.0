Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1AD73F4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 12:09:45 +0000 (UTC)
Received: by wicmc15 with SMTP id mc15so52376330wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=W9MGpd32I8GgDHuEEz3k2WHD8cpwOoT0dj3Man3kfDc=;
	b=FHZjJScGbyOyht1eu5nWMZsO3cJQdFiZ1Ha9StJCsGi/KfUfXoHA+UWrsqt2TNlMZH
	Nf9ItZ5g9WOSu0URfJ0KqBhfkZc5wiSbOFDw4BlrM10gcXZS+pO2pCTM9f1m0fcHH/RS
	Gem4ULW0FgEEgI21JHMVLibquLmAQYMONQ5gJL0tV+9Oxn4wxzufEH4kmEplpFul1JJk
	qbY99NNNAU8Kz1itDE7VkQaU71tyT6ZhdPVLiNPN3tfY6rNOspdE3V2gERNc6pjtHqtQ
	U+Dh4TKsyGVqyJO0YN0cwgOa+xBKb6+Pb6l0eJXQZWaMQcLfn+Su+pTJDQRRYU/CJkDW
	v1Dg==
X-Received: by 10.194.110.67 with SMTP id hy3mr30023583wjb.87.1431432586406;
	Tue, 12 May 2015 05:09:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fo7sm2596347wic.1.2015.05.12.05.09.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 05:09:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 May 2015 14:09:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150512120949.GB2714@jama>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/8] xfce updates + udisks2
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
X-List-Received-Date: Tue, 12 May 2015 12:09:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 06:10:38PM +0200, Andreas M=FCller wrote:
> The following changes since commit 2080f15e86d3d8e1e1f65e16b014545fe53811=
4c:
>=20
>   pcsc-lite_1.8.6: Modified the license for libpcscspy. (2015-04-24 15:11=
:37 +0200)

One of the changes is causing xfce4-screenshooter-1.8.2 to fail
http://errors.yoctoproject.org/Errors/Details/10729/

Can you please check that?=20

> are available in the git repository at:
>=20
>   git@github.com:schnitzeltony/meta-openembedded.git patches
>=20
> for you to fetch changes up to bf435e1c21ce2522e335c905a18f2175824daa73:
>=20
>   add udisks2 2.1.5 (2015-05-06 18:04:45 +0200)
>=20
> ----------------------------------------------------------------
> Andreas M=FCller (8):
>       exo: update to 0.10.4
>       xfce4-session: update to 4.12.1
>       xfce4-power-manager: update to 1.4.4
>       xfce4-time-out-plugin: update to 1.0.2
>       xfce4-smartbookmark-plugin: initial add 0.4.6
>       packagegroup-xfce-extended: add xfce4-smartbookmark-plugin
>       thunar: update to 1.6.8
>       add udisks2 2.1.5
>=20
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb                         =
                                    | 31 +++++++++++++++++++++++++++++++
>  meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin=
_0.4.6.bb                           |  9 +++++++++
>  meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.1.bb=
 =3D> xfce4-time-out-plugin_1.0.2.bb} |  4 ++--
>  meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb =3D> exo_0.10.4.bb}           =
                                      |  4 ++--
>  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb      =
                                    |  1 +
>  meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb =3D> thunar_1.6.8.bb}    =
                                      |  4 ++--
>  meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.3.bb=
 =3D> xfce4-power-manager_1.4.4.bb}   |  4 ++--
>  meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.0.bb =3D> xfce4=
-session_4.12.1.bb}                   |  4 ++--
>  8 files changed, 51 insertions(+), 10 deletions(-)
>  create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
>  create mode 100644 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-s=
martbookmark-plugin_0.4.6.bb
>  rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1=
=2E0.1.bb =3D> xfce4-time-out-plugin_1.0.2.bb} (67%)
>  rename meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb =3D> exo_0.10.4.bb} (87=
%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb =3D> thunar_1.6.8.=
bb} (87%)
>  rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1=
=2E4.3.bb =3D> xfce4-power-manager_1.4.4.bb} (89%)
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.0.bb =3D=
> xfce4-session_4.12.1.bb} (85%)
>=20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

