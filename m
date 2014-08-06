Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 481CB609AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 18:36:43 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so2989717wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O3cmw5znme/v3eN9NhL7tYp8r15RE9wGDH0n/+jGSkU=;
	b=E9DAxD5rTssBOTFudkU5Y+Gm5o1NZkj6I5lGqlaXI2oou2lOsbDMV6CzDESODIvpNO
	Q+mE8XEtoFadaIyHLcdVNEc3i7PTPZRJCY0u1MYkrK62MXJ3jLFaStLWS6vyn5ffvhpk
	+AhDgyuuMNEy8b3aDUyjibH6S5MCTo8fN0MA2/HWuJbG27SY6Rq/dWI9fIqYJL9MZ1An
	oSqqc163WJYYzaewUdZZSTgiJURp/E1BhSpWKXl4oJp65S8QZ+Ujhb44CRxVIVGCHvla
	uf44R4v/ZoHRt7ATd9C3BhyDtdyboWZWQIAjkPGZXk0OZ1+LX6OT/0oyc6KHmPXP7naL
	WRHA==
X-Received: by 10.180.99.34 with SMTP id en2mr53325770wib.34.1407350204781;
	Wed, 06 Aug 2014 11:36:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ga2sm4201400wjb.44.2014.08.06.11.36.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 11:36:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 20:37:14 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806183714.GM14848@jama>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 18:36:46 -0000
X-Groupsio-MsgNum: 51459
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
Content-Disposition: inline

--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> Version 1.12.0 is out, update the SRC_URI and associated variables.

BTW: this causes:
ERROR: QA Issue: Package version for package wireshark went backwards
which would break package feeds from (0:1.12.0-rc2-r0.3 to
0:1.12.0-r0.0) [version-going-backwards]

Which is caused by incorrect PV in rc2 (which I haven't noticed before),
but as rc2 was in master only for couple of days, I can live without PE
bump in it.

> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ----------------------
>  ...wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} | 10 +--
>  2 files changed, 5 insertions(+), 104 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} (81%)

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiddoACgkQN1Ujt2V2gBzQLwCeL4hh4wsjQqkQKywG0qhLc76T
dcgAoJf2EQCFcS+3VMKJOa0rNAJl5cyN
=+5JK
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
