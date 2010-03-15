Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1Nr7d0-0005Y1-8z
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:34:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 4DF97A2C3D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:31:31 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id GuI9jpm3GqBO
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:31:30 +0100 (CET)
Received: from tomboy.localnet (pD9E154E8.dip.t-dialin.net [217.225.84.232])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 860E0A2C3C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:31:30 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 11:31:29 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-0.slh.16-sidux-amd64; KDE/4.3.4; x86_64;
	; )
References: <4B9E0843.30005@dresearch.de> <4B9E09C8.2060903@ge.com>
	<4B9E0A1B.3070606@dresearch.de>
In-Reply-To: <4B9E0A1B.3070606@dresearch.de>
MIME-Version: 1.0
Message-Id: <201003151131.29321.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI fetching problem
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
X-List-Received-Date: Mon, 15 Mar 2010 10:34:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Montag 15 M=E4rz 2010 11:21:15 schrieb Steffen Sledz:
> Martyn Welch wrote:
> > Steffen Sledz wrote:
> >> I work at a recipe for rsyslog (http://www.rsyslog.com) and hit a
> >> problem with the wget fetcher.
> >>
> >> The download uri for rsyslog-5.4.0.tar.gz does not contain the archive
> >> name itself but is
> >> http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml.
> >>
> >> If i set
> >>
> >> SRC_URI =3D "http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml"
> >> SRC_URI[archive.md5sum] =3D "291882229d50496f42bd63174076dd37"
> >> SRC_URI[archive.sha256sum] =3D
> >> "d9cd21d2fcd45fcae65eb0a51927c40315cca02afdc62478abd950febfcf7228"
> >
> > At a guess you need to add ";name=3Darchive" to the end of your SRC_URI.
>=20
> Nope, same behaviour. :(
>=20
> BTW: The ";name=3D" option is not documented in the user manual at
> <http://docs.openembedded.org/usermanual/usermanual.html>.
>=20
> Steffen

Use a propper URL for the Download:=20
http://download.rsyslog.com/rsyslog/rsyslog-5.4.0.tar.gz

Thomas


