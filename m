Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O7FBe-00052u-Na
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 23:52:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O7F84-00025L-1A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 14:49:12 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 28 Apr 2010 14:49:11 -0700
Received: from 172.30.80.19 ([172.30.80.19]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 28 Apr 2010 21:49:10 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	28 Apr 2010 14:49:01 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BD5BE2F.7030407@mwester.net>
References: <4BD5BE2F.7030407@mwester.net>
Organization: Mentor Graphics Corporation
Date: Wed, 28 Apr 2010 14:49:00 -0700
Message-ID: <1272491340.3865.806.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 28 Apr 2010 21:49:11.0491 (UTC)
	FILETIME=[A3191130:01CAE71C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fix: stage hidden files as well
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
X-List-Received-Date: Wed, 28 Apr 2010 21:52:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-04-26 at 11:24 -0500, Mike Westerhof wrote:
> The following patch is a proposed patch to fix the problem where hidden
> files are sometimes missed during staging.  A specific example is that
> the symbolic link ".config" is not copied to the kernel staging area,
> which causes madwifi-ng to fail to build.
>=20
> diff --git a/classes/staging.bbclass b/classes/staging.bbclass
> index 32038a5..cb19cb9 100644
> --- a/classes/staging.bbclass
> +++ b/classes/staging.bbclass
> @@ -35,6 +35,13 @@ sysroot_stage_dir() {
>         if [ -d "$src" ]; then
>                 mkdir -p "$dest"
>                 cp -fpPR "$src"/* "$dest"
> +               # Get hidden files as well, but carefully
> +               for i in "$src"/.*
> +               do
> +                       if [ "$i" !=3D "$src"/. -a "$i" !=3D "$src"/.. ];=
 then
> +                              cp -fpPR "$i" "$dest"
> +                       fi
> +               done
>         fi
>  }
>=20
> If anyone has a better way to address the copy operations above, that
> would be great.

So, I said this on IRC, but more formally, how about just for i in
"$src"/.??* do as this lets us know we don't have '.' or '..', and if we
skip out on '.a' or something being installed, that reeks of a bug in
the program in question that should be fixed anyways (and would
catch .config and others).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


