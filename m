Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NsA3F-0004kF-0O
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 08:21:54 +0100
Received: by ywh13 with SMTP id 13so920182ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=419+maqePSPtn8m8xHfqu97XO4WMTmCtG2YfA7fdgQo=;
	b=Atn5x1WxA8ICyKxxhmFa5wi4Pes+IDpdS/CK+1rhdoUgSXwF9JHigC2aEs8WDoOI3k
	hSvgbyoZ/J+s2+rsWvCkhuO0gXswKL5ed/2w0WDtjo7w7iJIcA0chg0MOa7awQg/dETE
	NGQbaHAmQb15FJYx02bIXfjGCUs32ehI/d4Iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Zp2JRAZbn20Lf8EAjb6vznfTQWacqoY7/JaaISIc70czVXL9F0u8RrAJwZDpR0qkub
	vm8mtifvsXyP8qll8+OswJqlItZwrEY3YG6Q9pQ9rw5l7T5IXl6I0pY6kT9A8/PFfxab
	JymczQ2fXWo4gbw1uU3krRafGTVqlOCd3p//I=
MIME-Version: 1.0
Received: by 10.100.74.18 with SMTP id w18mr3321105ana.41.1268896728377; Thu, 
	18 Mar 2010 00:18:48 -0700 (PDT)
In-Reply-To: <4BA1B29B.8040704@tait.co.nz>
References: <4BA1B29B.8040704@tait.co.nz>
Date: Thu, 18 Mar 2010 08:18:48 +0100
Message-ID: <ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.183
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] Renamed prefix_native, bindir_native, etc using 	hyphens
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
X-List-Received-Date: Thu, 18 Mar 2010 07:21:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/18 Douglas Royds <douglas.royds@tait.co.nz>:
> =A0 - Avoids clashing with the machine override when MACHINE=3Dnative
> =A0 - bindir_cross similarly renamed for consistency
>
[...]
>
> =A0# Path prefixes
> =A0base_prefix =3D "${STAGING_DIR_NATIVE}"
> -prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> -exec_prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> +prefix =3D "${STAGING_DIR_NATIVE}${prefix-native}"
> +exec_prefix =3D "${STAGING_DIR_NATIVE}${prefix-native}"

[...]

Shouldn't we then for consistent naming also go to exex-prefix etc ?

FM


