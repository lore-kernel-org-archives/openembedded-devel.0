Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 18D9F72DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:26:14 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YLenX-0004qm-Ik from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2015 13:26:15 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 13:26:15 -0800
Received: by burninator (Postfix, from userid 1000)	id 7F5F1581332; Wed, 11
	Feb 2015 16:26:14 -0500 (EST)
Date: Wed, 11 Feb 2015 16:26:14 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150211212614.GG30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
	<1423674029.1873.9.camel@tycho.nsa.gov>
	<54DBC210.5020308@twobit.us>
MIME-Version: 1.0
In-Reply-To: <54DBC210.5020308@twobit.us>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-selinux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 21:26:26 -0000
X-Groupsio-MsgNum: 54189
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0XhtP95kHFp3KGBe"
Content-Disposition: inline

--0XhtP95kHFp3KGBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-selinux] On 15.02.11 (Wed 15:56) Philip Tricca wrote:

> On 02/11/2015 12:00 PM, dpquigl wrote:
> > On Wed, 2015-02-11 at 09:25 -0700, Christopher Larson wrote:
> >> On Wed, Feb 11, 2015 at 8:53 AM, dpquigl <dpquigl@tycho.nsa.gov> wrote:
> >>
> >>> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> >>> by the yocto project. I'm trying to use it with a base openembedded c=
ore
> >>> and its not in sync with oe-core because its based on pokey. This made
> >>> me think of two questions. 1) Why is this not in OE core since so many
> >>> packages in core can potentially have SELinux support enabled and 2) =
if
> >>> its not supposed to be in core where should turning on SELinux support
> >>> in a recipe go? For example coreutils can have SELinux support enable=
d.
> >>> Currently this is in meta-selinux as a bbappend to the coreutils
> >>> package. This works out because its always going to be there. However
> >>> there is also a bbappend for an LXC recipe. LXC isn't in core which
> >>> means it has a dependency on a layer not in core.
> >>>
> >>
> >> This is a bug in the layer. It's fairly trivial to construct a layer in
> >> such a way that you can have per-layer bbappends that are only applied=
 when
> >> that layer exists. This is likely the approach meta-selinux should tak=
e to
> >> address this implicit dependency upon meta-virtualization.
> >=20
> > Thanks for the suggestion. I figured there was a way to do this but I'm
> > new enough to OE and bitbake that it wasn't immediately obvious to me
> > how to accomplish this. I'll look into giving it a try.
>=20
> I didn't know this was possible either. Will be useful to have in
> meta-selinux independent of this conversation. Looks like a good example
> of this method used in meta-mentor can be found here:
>=20
> https://lists.yoctoproject.org/pipermail/meta-mentor/2013-May/000052.html

I absolutely think this will be a benefit to anyone using meta-selinux.

> >> That said, I think most folks would be open to PACKAGECONFIGs for seli=
nux
> >> capability going into the main recipes, as that's not an invasive chan=
ge,
> >> nor a patch, but just a tweak in configuration.
> >=20
> > That is good to hear. I'm going through the repo now to figure out what
> > is really needed to get SELinux working and what is extra. We've been
> > having a discussion here about the need to support certain policy
> > configurations on embedded SELinux systems. I'm still new enough to all
> > of this that I imagine it will take me a while to figure out how and
> > what to add PACKAGECONFIG wise to fit meta-selinux into oe-core.
>=20
> I'm happy to take a crack at using the per-layer bbappend method
> described above in meta-selinux. When meta-selinux picked up a
> dependency on 3 new layers caused by bbappends I had to update a bunch
> of my build stuff even though I'm not using said layers.

If you don't mind and you've got the time, I'll be happy to merge the
patch, Philip.

--=20
-Joe MacDonald.
:wq

--0XhtP95kHFp3KGBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU28j2AAoJEEn8ffcsOfaWbzgIAI6VBM4ImlWtl0wJ/kOl1Hfx
geOYJSePLeNqQ3hVIOnRneQ0bhR/aCqPpfbcZWdmiifj1nmsB8im1wNumuL19GmZ
TZc3P07pmFbqsOf0vFUXHuk6HR/cTGlht/5XK0MS2i+HmFYV54MbRuB5DUzFNHoS
ggAQkKgmAmj7ut71oBXiTz0gv6PjGhaCTOuFPbWYhfxawQMR3ZiamCaOUkslkAzp
lzamCvwKMbzQcMKXVC7G+IOenIwlzeJpCimtazM1eGUZxypsMIJxQyAWyBzIUzN+
aj4JQcOdTa6R8CnlVuRxZd5j0+zQUB6ZgkIsT+qW161I+8gwebksTj1nC5XQMKA=
=Mvum
-----END PGP SIGNATURE-----

--0XhtP95kHFp3KGBe--
