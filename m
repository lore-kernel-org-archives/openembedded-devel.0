Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk1qi-0003Gk-2G
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:59:23 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk1o2-0004FI-Fs from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 12:56:34 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 12:56:34 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 20:56:33 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 13:56:33 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266887211-31228-1-git-send-email-clarson@kergoth.com>
References: <1266887211-31228-1-git-send-email-clarson@kergoth.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 13:56:32 -0700
Message-ID: <1266958592.18176.72.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 20:56:34.0311 (UTC)
	FILETIME=[AED5A170:01CAB4CA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] insane: check for .debug as a path component, not part of the path string
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
X-List-Received-Date: Tue, 23 Feb 2010 20:59:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-02-22 at 18:06 -0700, an unknown sender wrote:
> From: Chris Larson <chris_larson at mentor.com>
>=20
> Signed-off-by: Chris Larson <chris_larson at mentor.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  classes/insane.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 804caf0..c2e8d9c 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -279,7 +279,7 @@ def package_qa_check_dbg(path, name,d, elf):
>      sane =3D True
> =20
>      if not "-dbg" in name:
> -        if '.debug' in path:
> +        if '.debug' in path.split(os.path.sep):
>              error_msg =3D "non debug package contains .debug directory: =
%s path %s" % \
>                       (name, package_qa_clean_path(path,d))
>              sane =3D package_qa_handle_error(3, error_msg, name, path, d=
)


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


