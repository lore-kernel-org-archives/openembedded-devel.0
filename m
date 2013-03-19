Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UI1GQ-00040w-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 19:28:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2JIB7xC002400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 11:11:07 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 11:11:08 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 08FDF7FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:10:28 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 0F6A722578; Tue,
	19 Mar 2013 14:11:07 -0400 (EDT)
Date: Tue, 19 Mar 2013 14:11:07 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130319181106.GG6165@windriver.com>
References: <1363688659-2222-1-git-send-email-obi@opendreambox.org>
	<20130319124909.GA6165@windriver.com>
	<514886F0.9040601@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <514886F0.9040601@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: update to current patchlevel
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
X-List-Received-Date: Tue, 19 Mar 2013 18:28:04 -0000
X-Groupsio-MsgNum: 43602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Content-Disposition: inline

--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] autofs: update to current patchlevel] On=
 13.03.19 (Tue 16:40) Andreas Oberritter wrote:

> On 19.03.2013 13:49, Joe MacDonald wrote:
> > [[oe] [meta-networking][PATCH] autofs: update to current patchlevel] On=
 13.03.19 (Tue 11:24) Andreas Oberritter wrote:
> >=20
> >> * Apply all patches from ftp.kernel.org/pub/linux/daemons/autofs/v5/pa=
tches-5.0.8/
> >>
> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> ---
> >>  .../autofs-5.0.7-add-symlink-pseudo-option.patch   |  217 +++++++++
> >>  ...witch_conf-to-not-contain-automount-lines.patch |   50 +++
> >>  ...s-5.0.7-depricate-nosymlink-pseudo-option.patch |   40 ++
> >>  ...-5.0.7-document-browse-option-in-man-page.patch |   46 ++
> >>  ....0.7-dont-fail-on-master-map-self-include.patch |   59 +++
> >>  ....7-dont-schedule-new-alarms-after-readmap.patch |   69 +++
> >>  ...ent-d_type-to-filter-out-files-in-scandir.patch |   41 ++
> >>  ...s-5.0.7-fix-automounter-support-on-parisc.patch |   24 +
> >>  ...descriptor-leak-when-reloading-the-daemon.patch |  179 ++++++++
> >>  ...utofs-5.0.7-fix-init-script-status-return.patch |   39 ++
> >>  .../autofs-5.0.7-fix-libtirpc-build-option.patch   |   66 +++
> >>  ...-fix-map-entry-duplicate-offset-detection.patch |   37 ++
> >>  ...ofs-5.0.7-fix-nobind-man-page-description.patch |   46 ++
> >>  .../autofs-5.0.7-fix-requires-in-spec-file.patch   |   37 ++
> >>  .../autofs-5.0.7-fix-submount-offset-delete.patch  |   45 ++
> >>  ...ofs-5.0.7-fix-systemd-unidir-in-spec-file.patch |   72 +++
> >>  ....7-fix-use-get_proximity-without-libtirpc.patch |   54 +++
> >>  ...s-5.0.7-fix-wildcard-multi-map-regression.patch |  225 ++++++++++
> >>  ...e-WITH_LDAP-conditional-around-LDAP-types.patch |  448 +++++++++++=
++++++++
> >>  ...-5.0.7-make-yellow-pages-support-optional.patch |   15 +-
> >>  ...odules-replicated-use-sin6.addr-s6_addr32.patch |   39 ++
> >>  .../autofs-5.0.7-update-kernel-include-files.patch |   92 ++++
> >>  ...-protocol-ids-instead-of-protoent-structs.patch |  471 +++++++++++=
+++++++++
> >>  ...karound-missing-GNU-versionsort-extension.patch |  149 +++++++
> >>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |   25 +-
> >>  25 files changed, 2582 insertions(+), 3 deletions(-)
> >=20
> > I had started to ask why we wouldn't just update to 5.0.8 directly
> > instead of patching our way there.  Then I thought I'd look myself and
> > now I know.  :-)
> >=20
> > This is just a simple (and wholesale) integration of the patches already
> > upstream?  That seems reasonable to me.
>=20
> Yes.
>=20
> In the future, maybe we should switch to Git. A repository for autofs is
> available at
> git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git. For now, I
> didn't want to change the recipe too much.
>=20
> One of these patches fixed a problem, where the automount daemon would
> hang after receiving SIGHUP, but I don't know which one exactly.

Woo.  Nice.  Well, on the whole I don't have any objection to
5.0.8-ifying this anyway, so importing the batch is reasonable even if
it's just to resolve a single problem.

I'd be a little concerned about going to a straight git source based
solely on some hassle I've had with meta-selinux in the past, but
there's a history for that, too, so maybe it's not a bad idea either.

As it stands, though, I'm happy to merge this.  We can visit the git
tree question pretty much any time.

--=20
-Joe MacDonald.
:wq

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFIqjoACgkQPN8S4W6ZZncVRwCfa9Gt1KDQyFATOFLY0lLk1XYp
n1QAn1RdvN4WOKx8RWP7I8attJ7ei1Z+
=m/MS
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--
