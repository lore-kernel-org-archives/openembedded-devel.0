Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswmb-0002Y0-Ms
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:37:36 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so771187dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+t9pTYkE5p6Pdi/V9ddD9nWuUuAikILEmtXprZT/W1M=;
	b=NGkPirZMWrNcLSbmL7FxM4RxQT0lEc19k725YHqFrof7NcXiRoe5c6b6OaI5WBVxKJ
	HD68EisTXpdmOp20D9xwhfiJ9qyrePTgxoJq9Tw+PWrDRjWIzAvvxVnRlC6MaSyGUu9T
	+5XvxvTFVxVtKbUMg3P+kOlCqz9MSnmb7o3RXHqkyHvDxy38h8k0+wfB4HBX74na3zBN
	zBEZSOruu5D6M7QcdcIeWNeLeWvaCEDdYtwBXU+N814oiDFh0zjavusC9OxkSx4/apZu
	kOTjGndipKEzX423bZ+KoIFPTmv0xNP8n/nll9lqHbs+5anhjrtPlIP46EWvhkth6S9T
	nOZA==
X-Received: by 10.69.1.9 with SMTP id bc9mr209743973pbd.61.1357741340924;
	Wed, 09 Jan 2013 06:22:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm42895941paz.32.2013.01.09.06.22.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:22:19 -0800 (PST)
Date: Wed, 9 Jan 2013 15:22:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109142224.GP3722@jama.palm1.palmone.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
	<FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
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
X-List-Received-Date: Wed, 09 Jan 2013 14:37:43 -0000
X-Groupsio-MsgNum: 42599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRkqPRiqIDKgfg/F"
Content-Disposition: inline

--TRkqPRiqIDKgfg/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 10:02:28PM +0000, Little, Morgan wrote:
> On 12/21/2012 04:37 PM, Martin Jansa wrote:
> > On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
> > <morgan.little@windriver.com> wrote:
> >> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> >> ---
> >>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6 +=
+----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0=
=2E18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> index 719d9fb..d855c67 100644
> >> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> @@ -32,10 +32,8 @@ do_install() {
> >>
> >>      install -d ${D}${mandir}
> >>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> >> -    pushd ${D}${mandir}
> >> -    ln -s ${PN}.8 ${PN}6.8
> >> -    ln -s ${PN}.8 tcptraceroute.8
> >> -    popd
> >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
> >
> > Thanks for quick reply and fix, but I think this should be:
> >> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> >> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> >
> > ${D} path won't be valid on target and missing slash after mandir
> It looks like it should be. Thank you for noticing that.
> >
> > And is there something referencing those man pages with different
> > name? Or why are those symlinks provided?
> I provided them because I was basing the do_install step off of the .spec=
 file the Fedora uses in their RPM file. It does a similar symlink step. I =
believe that is can be removed.

ping :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TRkqPRiqIDKgfg/F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlDtfSAACgkQN1Ujt2V2gBxswACguMhrP29TO8ckeXIiXR3Or+/x
k5wAmMTrV/pHpurxsy9u7Fi0RTtkKKc=
=d9Oy
-----END PGP SIGNATURE-----

--TRkqPRiqIDKgfg/F--
