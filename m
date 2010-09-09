Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtaSC-0003as-8f
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 08:17:50 +0200
Received: by iwn2 with SMTP id 2so801690iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 23:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IVSv9gDcwWDYmSOnGOEQYY+gC+qX+lp/jtMuPC302Ho=;
	b=n4dmTJsrSb62sQJrEjhijqIOR0tW7ryygRnO4AZAqrSP0uhSbcl2hGx+X1RYJN6F2G
	0tCkC2kYK9ZnFPhhVmPBp6rEe+6S5ZAp6ZPNhA/mwTY5K5ez4hZoonCt1YVkBmoGhAYV
	/srZU01+2ZVxmfhay6AE/dSVJc1L1dtuNUn7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XoDz8QIFdBKKU1CI6yzzYPwYwlI2XpkK+fsEiiSSs+18KaO7mi6zUp7hj0xz2MjgOM
	DpScM9ea5AhVlqRhp7IcrQHXQTn8F/0V53DMDuqPcRArD60m95/eplzzVN2+jUUo1r5+
	GmDPUtqKT09PQZdjatiFSSfo7lVZsHq3apUhU=
MIME-Version: 1.0
Received: by 10.231.14.69 with SMTP id f5mr11041631iba.116.1284013027446; Wed,
	08 Sep 2010 23:17:07 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 23:17:07 -0700 (PDT)
In-Reply-To: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
References: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
Date: Thu, 9 Sep 2010 08:17:07 +0200
Message-ID: <AANLkTimU_Rbj=Kex3Qs-EkZSOLUZmV+pY_0xzt-dZ+Mx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Thu, 09 Sep 2010 06:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/8 Chase Maupin <chasemaupin03@gmail.com>:
> * Added a description of the SOC_FAMILY variable that
> =A0can be set in the machine configuration files.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
> =A0docs/usermanual/chapters/common_use_cases.xml | =A0 24 +++++++++++++++=
+++++++++
> =A01 files changed, 24 insertions(+), 0 deletions(-)
>
> diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/userman=
ual/chapters/common_use_cases.xml
> index d86d0ca..ef81b95 100644
> --- a/docs/usermanual/chapters/common_use_cases.xml
> +++ b/docs/usermanual/chapters/common_use_cases.xml
> @@ -94,6 +94,30 @@ SRCDATE =3D "20061014"
> =A0 =A0 =A0 =A0 </listitem>
> =A0 =A0 =A0 </itemizedlist></para>
>
> + =A0 =A0<para>There are also some optional variables that can be defined=
:
> + =A0 =A0<itemizedlist>
> + =A0 =A0<listitem>
> + =A0 =A0 =A0 =A0 =A0<para><command>SOC_FAMILY</command> describes a fami=
ly of processors
> + =A0 =A0 =A0 =A0 =A0 =A0that all share common features such as kernel ve=
rsions,
> + =A0 =A0 =A0 =A0 =A0 =A0bootloaders, etc. =A0This is used to allow overr=
ides for a whole
> + =A0 =A0 =A0 =A0 =A0 =A0set of devices rather than per machine overrides=
 being used.
> + =A0 =A0 =A0 =A0 =A0 =A0The use of SOC_FAMILY as an override is currentl=
y a distribution
> + =A0 =A0 =A0 =A0 =A0 =A0or local setting.
> + =A0 =A0 =A0 =A0 =A0</para>
> + =A0 =A0 =A0 =A0 =A0<para>
> + =A0 =A0 =A0 =A0 =A0 =A0NOTE: SOC_FAMILY is different than MACHINE_CLASS=
 in that
> + =A0 =A0 =A0 =A0 =A0 =A0MACHINE_CLASS is intended to specify a grouping =
of devices
> + =A0 =A0 =A0 =A0 =A0 =A0that may have different processors but share com=
mon features.
> + =A0 =A0 =A0 =A0 =A0 =A0For example all OMAP3 devices can be described u=
sing the SOC_FAMILY
> + =A0 =A0 =A0 =A0 =A0 =A0"omap3" and this value can be used in overrides =
to prevent
> + =A0 =A0 =A0 =A0 =A0 =A0requiring multiple machine specific overrides. =
=A0MACHINE_CLASS
> + =A0 =A0 =A0 =A0 =A0 =A0might be used to describe a class of devices suc=
h as a cell
> + =A0 =A0 =A0 =A0 =A0 =A0phone in which the processor may be different bu=
t the
> + =A0 =A0 =A0 =A0 =A0 =A0features such as touchscreen, GPS, modem, etc ar=
e the same.
> + =A0 =A0 =A0 =A0 =A0</para>
> + =A0 =A0 =A0 =A0</listitem>
> + =A0 =A0</itemizedlist></para>
> +
> =A0 =A0 <para>Next the kernel recipe needs to be added if it doesn't alre=
ady exist.
> =A0 =A0 </para>
> =A0 </section>
> --
> 1.7.0.4

Thanks for writing this.
Seems like a decent description to me.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


