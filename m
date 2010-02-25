Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkimW-0001TU-RG
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 19:49:54 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nkijp-0004QJ-Ip from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 10:47:05 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Feb 2010 10:47:05 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 18:47:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Feb 2010 11:47:02 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251407577-2052-1-git-send-email-clarson@mvista.com>
References: <1251407577-2052-1-git-send-email-clarson@mvista.com>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Feb 2010 11:47:02 -0700
Message-ID: <1267123622.18176.539.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 18:47:05.0410 (UTC)
	FILETIME=[ED08EA20:01CAB64A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: insane.bbclass: only abort on the gettext check if it's the po makefile getting hte messages, for now.
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
X-List-Received-Date: Thu, 25 Feb 2010 18:49:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-08-27 at 11:12 +0000, Christopher Larson wrote:
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
> classes/insane.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index b811ad0..c431b46 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -548,7 +548,7 @@ python do_qa_configure() {
>      for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True))=
:
>          logfile =3D os.path.join(root, "config.log")
>          crosscheck =3D "grep 'CROSS COMPILE Badness:' %s > /dev/null" % =
logfile
> -        gettextcheck =3D "grep -E 'WARNING:  (po|intl)/Makefile.*\.in se=
ems to ignore the .*dir setting$' %s > /dev/null" % logfile
> +        gettextcheck =3D "grep -E 'WARNING:  po/Makefile.*.in seems to i=
gnore the .*dir setting$' %s > /dev/null" % logfile
>          if "config.log" in files:
>              if os.system(crosscheck) =3D=3D 0:
>                  bb.fatal("""This autoconf log indicates errors, it looke=
d at host includes.


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


