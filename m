Received: from mail-ew0-f216.google.com ([209.85.219.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <javieralso@gmail.com>) id 1NBuuI-0001Sy-Ga
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 19:42:05 +0100
Received: by ewy8 with SMTP id 8so604415ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=17slbTVhn6r9iwwD8L6yoYt2vNuIAlBOVpG2Qdp81h0=;
	b=eqey+EccmGmZ8K0jYVpEo2Oe12ueBIH4EOS/l/JgEKyipHtRVks9gPeEMyDvR0k86i
	y+e6TNOy4KfydenKPSa9TfPMVftSuhdFNyaGzy59m+6LkYrhH1rTSmEzLgyXQ0LtpAAu
	ql7i5n1655mdZNBGCS/yf64X4+p033EoRBVB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=NEyHTXSVVtphd4/gXrvLQob+X636o+oS9OU28UON0FUnlwJwPnpGP7XcmFJabkqLSV
	/NZSwY884Qvon22ZRLbXil9doEbVmDzYOKw5JdMne9IrDab0uagdi4FnnzJ8RzgnJ+dX
	Qn0OG7SVVI8UUaTbeWZTKUkTrISArb3bnMCLs=
Received: by 10.213.24.2 with SMTP id t2mr1666738ebb.23.1258828835955;
	Sat, 21 Nov 2009 10:40:35 -0800 (PST)
Received: from Gorodetsky ([95.214.11.136])
	by mx.google.com with ESMTPS id 28sm659040eyg.12.2009.11.21.10.40.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Nov 2009 10:40:35 -0800 (PST)
Date: Sat, 21 Nov 2009 19:41:24 +0100
From: Javier Almansa Sobrino <javieralso@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091121194124.04fb19e2@Gorodetsky>
In-Reply-To: <d1b08f940911201429g31d37920n704868df08015f3f@mail.gmail.com>
References: <20091120172438.3e6f603e@Gorodetsky>
	<200911202055.21122.david.lanzendoerfer@o2s.ch>
	<d1b08f940911201429g31d37920n704868df08015f3f@mail.gmail.com>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i486-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.219.216
X-SA-Exim-Mail-From: javieralso@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error building opie-image
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
X-List-Received-Date: Sat, 21 Nov 2009 18:42:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2009 23:29:58 +0100
Andrea Adami <andrea.adami@gmail.com> wrote:

> Hello,
>=20
> the issue with opie-networksettings appears with the new kernel headers.
> Quick fix you could try:
>=20
> wextensions.h
>=20
> 6c6
> -#include <net/if.h>
> +//#include <net/if.h>
>=20
> Code is now in <linux/wireless.h>
>=20
> Regards
>=20
> Andrea
>=20

Ok, it fix my problem and the compilation finished OK. Thanks a lot.


--=20
I can remeber the exact instant when I relized that a large
part of my life from then on was going to be spent in finding
mistakes in my own programs.

-- Maurice Wilkes, Head of the Computer Laboratory
   of the University of Cambridge, 1949 --

--------------------------------
Javier Almansa Sobrino.
Ingeniero T=C3=A9cnico en Inform=C3=A1tica de Sistemas.

FSF #7032 Member (www.fsf.com)

Grupo de Investigaci=C3=B3n ARCo.
Escuela Superior de Inform=C3=A1tica. Ciudad Real
Tel: (+34)926 29 53 00 Ext: 3705



