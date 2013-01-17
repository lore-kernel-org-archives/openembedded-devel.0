Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvwoG-0002GP-KP
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 22:15:47 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so1287102dae.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 13:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1qR8hWRl7gge7MJOGWH00su05U9jdXjGwRjfNf+YN6M=;
	b=KKYdAvsTo3rQ+aNXRtls1T2nA2TSWkgIGGVUG1rs290oLYIscwioXIQX4oXYadebey
	ucNe6c7tAZ2Ap7cz4Vo8CXadf9cYq+rXzWVsjUax9nDO+U4BDw5vZX9xPHc1VBDL7UeT
	8zzWn3RkxOENb3KhqRZg9V0EwPIVhEVPN4XKiNg7Ii76RRvKfzJodVglCc+JKPDv4MtM
	CU0VLaj+WyOzlYkBvg+nYb7KJ+352Cn8GqmA7UjliL9rfAedoH7tdeqs6jRoxY4mN3My
	o27rlCGSlwzwkNc1eXhuUd43Ymp5Tuj6Yx4g9xmzmfvYoiKahTjVNjtcQiqt7633aXxG
	WQ/A==
X-Received: by 10.66.76.194 with SMTP id m2mr17088809paw.14.1358456416234;
	Thu, 17 Jan 2013 13:00:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm1957318pay.5.2013.01.17.13.00.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 13:00:15 -0800 (PST)
Date: Thu, 17 Jan 2013 22:00:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130117210009.GM3067@jama>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
	<FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
	<20130109142224.GP3722@jama.palm1.palmone.com>
	<20130109144237.GB5259@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130109144237.GB5259@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] traceroute: Remove bashisms
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
X-List-Received-Date: Thu, 17 Jan 2013 21:15:51 -0000
X-Groupsio-MsgNum: 42733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ARLBH93C7pgvpZY"
Content-Disposition: inline

--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:42:37AM -0500, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] traceroute: Remove bashisms] On 13.01.=
09 (Wed 15:22) Martin Jansa wrote:
>=20
> > On Fri, Dec 21, 2012 at 10:02:28PM +0000, Little, Morgan wrote:
> > > On 12/21/2012 04:37 PM, Martin Jansa wrote:
> > > > On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
> > > > <morgan.little@windriver.com> wrote:
> > > >> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> > > >> ---
> > > >>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb |=
 6 ++----
> > > >>  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/meta-networking/recipes-support/traceroute/traceroute=
_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> > > >> index 719d9fb..d855c67 100644
> > > >> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb
> > > >> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb
> > > >> @@ -32,10 +32,8 @@ do_install() {
> > > >>
> > > >>      install -d ${D}${mandir}
> > > >>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> > > >> -    pushd ${D}${mandir}
> > > >> -    ln -s ${PN}.8 ${PN}6.8
> > > >> -    ln -s ${PN}.8 tcptraceroute.8
> > > >> -    popd
> > > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> > > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
> > > >
> > > > Thanks for quick reply and fix, but I think this should be:
> > > >> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> > > >> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> > > >
> > > > ${D} path won't be valid on target and missing slash after mandir
> > > It looks like it should be. Thank you for noticing that.
> > > >
> > > > And is there something referencing those man pages with different
> > > > name? Or why are those symlinks provided?
> > > I provided them because I was basing the do_install step off of the .=
spec file the Fedora uses in their RPM file. It does a similar symlink step=
=2E I believe that is can be removed.
> >=20
> > ping :)
>=20
> I think this belongs to me to finish up now.  I plan to remove them.
> I've kept the thread in my inbox so hopefully I can cover all the
> comments on it.

ping2 :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD4ZlkACgkQN1Ujt2V2gBzN2ACghGtyErmOQCzj3UlqTOHTK+cX
RSoAn0jRf5c57yRY5Oq21WwCm6YjclPe
=+jWM
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--
