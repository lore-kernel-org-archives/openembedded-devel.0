Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 210386EA30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 09:07:48 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 56D8B4B0137;
	Wed,  5 Feb 2014 10:07:35 +0100 (CET)
Date: Wed, 5 Feb 2014 10:07:34 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Diego Rondini <diego.ml@zoho.com>
Message-ID: <20140205100734.57360f43@e6520eb>
In-Reply-To: <1391589897-10063-1-git-send-email-diego.ml@zoho.com>
References: <1391589897-10063-1-git-send-email-diego.ml@zoho.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] chromium: Fix build with nss 3.15
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
X-List-Received-Date: Wed, 05 Feb 2014 09:07:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Diego,

Le Wed,  5 Feb 2014 09:44:57 +0100,
Diego Rondini <diego.ml@zoho.com> a =E9crit :

> Meta-browser commit 4b7a82273a85802070441e9c510e0891acc482fa broke Chromi=
um build because removal of meta-browser nss 3.13.3 forced build against OE=
-Core 3.15.1, which is not supported out of the box by Chromium 29.
> This commit backports this patch:
> https://src.chromium.org/viewvc/chrome/trunk/src/net/third_party/nss/ssl/=
bodge/secitem_array.c?r1=3D206184&r2=3D206183&pathrev=3D206184&diff_format=
=3Du
>=20
> Upstream-Status: Backport of SVN REV 206184
>=20
> Signed-off-by: Diego Rondini <diego.ml@zoho.com>

patch committed

Thanks
Eric

