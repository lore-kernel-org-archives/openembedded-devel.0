Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkibM-000180-1g
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 19:38:21 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkiYe-0002jx-Ny from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 10:35:32 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Feb 2010 10:35:32 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 18:35:31 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Feb 2010 11:35:29 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263580233-3494-1-git-send-email-clarson@mvista.com>
References: <1263580233-3494-1-git-send-email-clarson@mvista.com>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Feb 2010 11:35:29 -0700
Message-ID: <1267122929.18176.536.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 18:35:32.0568 (UTC)
	FILETIME=[50119D80:01CAB649]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: base.bbclass: use bb.utils.*_sum instead of calling md5/sha sum commands
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
X-List-Received-Date: Thu, 25 Feb 2010 18:38:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-01-15 at 08:30 +0000, Christopher Larson wrote:
> From: Ross Burton <ross@openedhand.com>
>=20
> Patch courtesy the Poky project.
>=20
> Signed-off-by: Chris Larson <clarson@mvista.com>
> Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Tom Rini <tom_rini@mentor.com>

>=20
> ---
> classes/base.bbclass |   27 +++++++++++++++------------
>  1 files changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 96164d4..dc56282 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -122,23 +122,26 @@ def base_chk_file_vars(parser, localpath, params, d=
ata):
>          raise Exception("The path does not exist '%s'" % localpath)
> =20
>      if want_md5sum:
> -        try:
> -	    md5pipe =3D os.popen('PATH=3D%s md5sum %s' % (bb.data.getVar('PATH'=
, data, True), localpath))
> -            md5data =3D (md5pipe.readline().split() or [ "" ])[0]
> -            md5pipe.close()
> -        except OSError, e:
> -            raise Exception("Executing md5sum failed")
> +        md5data =3D bb.utils.md5_file(localpath)
> +
>          if want_md5sum !=3D md5data:
>              bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%=
s'" % (want_md5sum, md5data))
>              raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%=
s'" % (want_md5sum, md5data))
> =20
>      if want_sha256sum:
> -        try:
> -            shapipe =3D os.popen('PATH=3D%s oe_sha256sum %s' % (bb.data.=
getVar('PATH', data, True), localpath))
> -            sha256data =3D (shapipe.readline().split() or [ "" ])[0]
> -            shapipe.close()
> -        except OSError, e:
> -            raise Exception("Executing shasum failed")
> +        shadata =3D bb.utils.sha256_file(localpath)
> +
> +        # sha256_file() can return None if we are running on Python 2.4 =
(hashlib is
> +        # 2.5 onwards, sha in 2.4 is 160-bit only), so check for this an=
d call the
> +        # standalone shasum binary if required.
> +        if shadata is None:
> +            try:
> +                shapipe =3D os.popen('PATH=3D%s oe_sha256sum %s' % (bb.d=
ata.getVar('PATH', data, True), localpath))
> +                shadata =3D (shapipe.readline().split() or [ "" ])[0]
> +                shapipe.close()
> +            except OSError:
> +                raise Exception("Executing shasum failed, please build s=
hasum-native")
> +
>          if want_sha256sum !=3D sha256data:
>              bb.note("The SHA256Sums did not match. Wanted: '%s' and Got:=
 '%s'" % (want_sha256sum, sha256data))
>              raise Exception("SHA256 Sums do not match. Wanted: '%s' Got:=
 '%s'" % (want_sha256sum, sha256data))


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


