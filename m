Return-Path: <joe@deserted.net>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 808A96D128
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 13:31:54 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id f11so556482qae.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=UuYLfv1iyCQACYddZs5zhnILqRmPEzk5nJNzdkcyAU8=;
	b=gEFvovJxjLf/s34abM8W5PHkgcNdlHEOZrb1D8Yvk95neH2PbZ0B0YtNMoPeEjWkZs
	yPDPzxx4lSroqw56dEZxlxnntqewYlwmHMrBfiUtAPoJfr+aKp6UM+Tl3NZsF+LYcaYh
	VqRva7BkS/C3OQfvdrUpoevZcuhfZwk/k+8STm1gsljWQ3gduKqzEJ9q7WcGBEoWZfdi
	HSJpifa6/4m4eFFHMcFBg3Kz+/5MisukB1ppeYrIvfAvOqZ6aym87vykvmigv4Ru2cN9
	GKrLzuFyTo5imTP5C+uF3CWPgeR6GIr7qyk4hM7gdOzxzO25r+rHASjXw1ltMYYCJ+5T
	tZQQ==
X-Gm-Message-State: ALoCoQmxNYpb0+Vil4NDfLNcQVwKUQeEGgYkY0v/jAKxW0PJHREAO/3f6fkzyb/PFnH7etXZpYwO
X-Received: by 10.224.79.12 with SMTP id n12mr9739449qak.109.1382707915799;
	Fri, 25 Oct 2013 06:31:55 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id r1sm19372840qam.4.2013.10.25.06.31.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 06:31:51 -0700 (PDT)
Date: Fri, 25 Oct 2013 09:31:49 -0400
From: Joe MacDonald <joe@deserted.net>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Message-ID: <20131025133147.GA4566@deserted.net>
References: <1382608121-6622-1-git-send-email-xufeng.zhang@windriver.com>
	<20131024174404.GA3984@deserted.net>
	<5269CDA0.5030201@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5269CDA0.5030201@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal
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
X-List-Received-Date: Fri, 25 Oct 2013 13:31:55 -0000
X-Groupsio-MsgNum: 46890
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [OE] [PATCH meta-networking] quagga/ripd: Fix two bugs after rece=
ived SIGHUP signal] On 13.10.25 (Fri 09:47) Xufeng Zhang wrote:

> On 10/25/2013 01:44 AM, Joe MacDonald wrote:
> >[[oe] [OE] [PATCH meta-networking] quagga/ripd: Fix two bugs after recei=
ved SIGHUP signal] On 13.10.24 (Thu 17:48) Xufeng Zhang wrote:
> >
> >>There are two problems for ripd implementation after received
> >>SIGHUP signal:
> >>1). ripd didn't clean up ifp->connected list before reload
> >>     configuration file which makes the same advertise packet
> >>     being sent multiple times(depends on how many SIGHUP was recieved).
> >>2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
> >>     during restart which is different from the flag when ripd is
> >>     firstly started up, leading to unnecessary route to be advertised.
> >>
> >>[YOCTO #5266]
> >Hey Xufeng,
> >
> >Normally I wouldn't go this deep into the detail but since you
> >referenced the Yocto bug and the Quagga discussion in the commit log and
> >the bug itself, I thought I'd try to understand what's going on here.
> >The last thing I saw from the Quagga maintainer is this:
> >
> >    The ifp->connected list contains connected prefixes of a given
> >    interface. These exist regardless of particular routing protocols and
> >    emptying the list during ripd reconfiguration would be plain wrong. I
> >    allow for a chance there is a bug that is related to ifp->connected
> >    and SIGHUP handling at once, but not in this specific way.
> What he said is that this ifp->connected list is exist in all
> routing protocols,
> and if it needs cleanup, it should be done in a more general way, such as
> in zebra client which is independent of routing protocol.

I'm not sure that's the interpretation I would have taken from the
quoted text, but if what you indicate is what the maintainer meant, then
is he not saying that the SIGHUP handling issue also exists for other
routing daemons in the suite?  Are you saying a similar patch would then
be required for potentially all daemons in quagga?

Don't get me wrong, repairing one is better than repairing none, but on
my first read of his comments it didn't seem like the maintainer even
agreed that there was a bug at all and your interpretation suggests that
the same bug likely impacts all quagga daemons.  Any sense on whether
that's the case?

-J.

> But I have specified the reasons in the above email that why it's
> not easy to
> implement this general way:
> #########################################
> More comments:
> Generally this connected interface address stuff is cleaned up in
> rip_interface_address_delete()
> which is triggered by zsend_interface_address(), but just as the
> annotation said above
> zsend_interface_address() function in zebra/zserv.c,
> ZEBRA_INTERFACE_ADDRESS_DELETE
> message could only happens in two cases:
> 1). ip address uninstall
> 2). RTM_NEWADDR on routing/netlink socket
>=20
> It didn't take the SIGHUP signal into consideration, but since the
> SIGHUP is handled
> by every daemon independently, this cleanup is not easy to be
> implemented commonly,
> so I think this is a proper way to do this.
> #########################################
> So it needs to redesign a lot of stuff to implement this.
>=20
> >and it looks like the patch here is the same as the one that the
> >maintainer indicated is "plain wrong".
> >  Can you help me get some
> >confidence that this isn't going to have negative side-effects if we
> >integrate it?
> Yes, there should be no side-effects:
> 1. This modification is only going into ripd daemon and it only
> takes effect when ripd is restarting.
> 2. The fix for problem 1). just remove the previously connected
> addresses of the interface, and these
>     connected addresses list will be reconstructed when ripd read
> the configuration during restarting.
> 3. The fix for problem 2). definitely has not any side-effect
> because I just restore the horizon flag to
>     the values when ripd daemon is firstly start up.
>=20
> And the customer has already test the fix for a lot of times, no
> problem is found.
>=20
>=20
> Thanks,
> Xufeng
>=20
> >-J.
> >
> >>Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
> >>---
> >>  .../ripd-fix-two-bugs-after-received-SIGHUP.patch  |   49 +++++++++++=
+++++++++
> >>  .../recipes-protocols/quagga/quagga.inc            |    3 +-
> >>  2 files changed, 51 insertions(+), 1 deletions(-)
> >>  create mode 100644 meta-networking/recipes-protocols/quagga/files/rip=
d-fix-two-bugs-after-received-SIGHUP.patch
> >>
> >>diff --git a/meta-networking/recipes-protocols/quagga/files/ripd-fix-tw=
o-bugs-after-received-SIGHUP.patch b/meta-networking/recipes-protocols/quag=
ga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
> >>new file mode 100644
> >>index 0000000..c081143
> >>--- /dev/null
> >>+++ b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-=
after-received-SIGHUP.patch
> >>@@ -0,0 +1,49 @@
> >>+ripd: Fix two bugs after received SIGHUP signal
> >>+
> >>+There are two problems for ripd implementation after received
> >>+SIGHUP signal:
> >>+1). ripd didn't clean up ifp->connected list before reload
> >>+    configuration file.
> >>+2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
> >>+    which lead to the unnecessary route to be advertised.
> >>+
> >>+Upstream-Status: Pending
> >>+
> >>+Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
> >>+---
> >>+--- a/ripd/rip_interface.c
> >>++++ b/ripd/rip_interface.c
> >>+@@ -500,6 +500,8 @@
> >>+   struct listnode *node;
> >>+   struct interface *ifp;
> >>+   struct rip_interface *ri;
> >>++  struct connected *ifc;
> >>++  struct listnode *conn_node, *next;
> >>+
> >>+   for (ALL_LIST_ELEMENTS_RO (iflist, node, ifp))
> >>+     {
> >>+@@ -514,6 +516,13 @@
> >>+ 	  thread_cancel (ri->t_wakeup);
> >>+ 	  ri->t_wakeup =3D NULL;
> >>+ 	}
> >>++
> >>++      for (conn_node =3D listhead (ifp->connected); conn_node; conn_n=
ode =3D next)
> >>++        {
> >>++          ifc =3D listgetdata (conn_node);
> >>++          next =3D conn_node->next;
> >>++          listnode_delete (ifp->connected, ifc);
> >>++        }
> >>+     }
> >>+ }
> >>+
> >>+@@ -548,8 +557,8 @@
> >>+ 	  ri->key_chain =3D NULL;
> >>+ 	}
> >>+
> >>+-      ri->split_horizon =3D RIP_NO_SPLIT_HORIZON;
> >>+-      ri->split_horizon_default =3D RIP_NO_SPLIT_HORIZON;
> >>++      ri->split_horizon =3D RIP_SPLIT_HORIZON;
> >>++      ri->split_horizon_default =3D RIP_SPLIT_HORIZON;
> >>+
> >>+       ri->list[RIP_FILTER_IN] =3D NULL;
> >>+       ri->list[RIP_FILTER_OUT] =3D NULL;
> >>diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta=
-networking/recipes-protocols/quagga/quagga.inc
> >>index 89b9f7a..bf37067 100644
> >>--- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >>+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >>@@ -31,7 +31,8 @@ SRC_URI =3D "http://download.savannah.gnu.org/release=
s/quagga${QUAGGASUBDIR}/quagg
> >>             file://quagga.default \
> >>             file://watchquagga.init \
> >>             file://watchquagga.default \
> >>-           file://volatiles.03_quagga"
> >>+           file://volatiles.03_quagga \
> >>+           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
> >>
> >>  PACKAGECONFIG ??=3D ""
> >>  PACKAGECONFIG[cap] =3D "--enable-capabilities,--disable-capabilities,=
libcap"
> >>
> >>
> >>_______________________________________________
> >>Openembedded-devel mailing list
> >>Openembedded-devel@lists.openembedded.org
> >>http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJqcrcACgkQwFvcllog0XxBjQCdE4x3Rkmzc96BWja2U9da+dqK
8YMAnRlIdWNwsleDmpmgoyIxN+VnGAST
=CDD7
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
