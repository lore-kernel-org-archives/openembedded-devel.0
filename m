Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oh5Tt-0001zI-E1
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 20:47:57 +0200
Received: by fxm12 with SMTP id 12so3303700fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JEoF9pWdCl78bcSWuz7C/er9TLRRwXCmKiNpbdap5SM=;
	b=pdh8T33XQpb58tH0X4IYYmHRXeOE0DQJEQM/h6HeE/IH+Nsj4xZ5bw4ct7dhe41Ewy
	rgF9Ld3HySzTo5ylxoqrKWGKgK2ejGYujI8yBVtc2D2QYISRlc3aT+3DiAz+/o2vEYXM
	z+Jw56cT+OdStMYB0b2fgX7igjix8eHDhCTck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sbPGjc8SamrYJKRzhOKlv3SPWpI6J47fu/fG7HC9AwutpnxOutH9Yh/S+xoaWALfLF
	GwLssnBd+Vp+SviZppEDcLT6I7uvWbDO41X5maNFQOtTZocEiJ2wcDbXUvjf6yE2gqd4
	Rdv4ONX1zEa9DYlIE/Ml3pebjNI4xdzvi+uYI=
MIME-Version: 1.0
Received: by 10.204.46.159 with SMTP id j31mr7517657bkf.5.1281034064104; Thu, 
	05 Aug 2010 11:47:44 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 11:47:44 -0700 (PDT)
In-Reply-To: <1280997881-6037-2-git-send-email-henri.bragge@dcombus.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280997881-6037-1-git-send-email-henri.bragge@dcombus.com>
	<1280997881-6037-2-git-send-email-henri.bragge@dcombus.com>
Date: Thu, 5 Aug 2010 20:47:44 +0200
Message-ID: <AANLkTikTrwy+=dhHj7Va4LcfxM1otvAjiPT2dMb1L5HZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3 2/2] recipe for scli-0.4.0
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
X-List-Received-Date: Thu, 05 Aug 2010 18:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/5 Henri Bragge <henri.bragge@dcombus.com>:
>
> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
> ---
> =A0recipes/scli/scli_0.4.0.bb | =A0 12 ++++++++++++
> =A01 files changed, 12 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/scli/scli_0.4.0.bb
>
> diff --git a/recipes/scli/scli_0.4.0.bb b/recipes/scli/scli_0.4.0.bb
> new file mode 100644
> index 0000000..3d24910
> --- /dev/null
> +++ b/recipes/scli/scli_0.4.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "SNMP Command Line Interface"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "gsnmp readline libxml2 ncurses"
> +PR =3D "r0"
> +
> +SRC_URI =3D "ftp://ftp.ibr.cs.tu-bs.de/pub/local/scli/scli-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "486c92c76059a35c87e88edf24cbf804"
> +SRC_URI[sha256sum] =3D "308511589260d3da9bc5817ace363180070ac83ccba9231b=
7b9a01e1b0c29fe1"
> +
> +inherit autotools
> --
>
Tried it. Fetch is ok now, but when building I get a QA issue causing
the build to fail (angstrom/beagleboard):

OTE: Running task 665 of 669 (ID: 16,
/home/frans/oe/openembedded/recipes/scli/scli_0.4.0.bb,
do_package_write_ipk)
ERROR: QA Issue with staging: libexslt.pc failed sanity test (tmpdir)
in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/=
usr/lib/pkgconfig
ERROR: QA Issue with staging: libxslt.pc failed sanity test (tmpdir)
in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/=
usr/lib/pkgconfig
ERROR: QA staging was broken by the package built above

see http://tinderbox.openembedded.net/builds/81310/


Frans


