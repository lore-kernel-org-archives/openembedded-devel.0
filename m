Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 940F7601F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 09:34:38 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so864229wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NyECebyMY7mmfCLBUOYqzuAPi3khLCIvVQvE+Ct3LVQ=;
	b=URE6OpG34k/Ue1JwYUCFGDi/PUVNx+Dkgwo93iNSWEEesPbBy+Xxd4IIwjU75s0Fxw
	FM1v8TeKz0GQw0gFkXZflSJUUbrEY6p2mrf/0tVoV4forffXF295a1U699rR8wqUHLbl
	4puo1yD6Jzd8fsbiFu96O8W4SIe3k3Bg+t8/uxNPgF1UcsrW8mxRsHduiF5wzQneDK1S
	JkU8XxrzvBea0z+MyETeJrDZhE3zYuJgtoMdVu5DJS9sbX5IV6oo4EO1GGY0UeYEqaE6
	zxan6fm5Xb72hppH3xhqgGytvIwR1z2WPk7MQffcXu3yIBXoFN7kzXa7H8WQpsFBD012
	HWgQ==
X-Received: by 10.194.236.200 with SMTP id uw8mr41411673wjc.50.1413884070415; 
	Tue, 21 Oct 2014 02:34:30 -0700 (PDT)
Received: from localhost ([89.176.104.3]) by mx.google.com with ESMTPSA id
	q10sm14747204wjq.35.2014.10.21.02.34.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Oct 2014 02:34:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 Oct 2014 11:34:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141021093428.GD2455@jama>
References: <1413434645-13943-1-git-send-email-net147@gmail.com>
	<20141018090624.GC2437@jama> <20141018111721.GH2437@jama>
	<CANwerB3D1ehK9e_FxYjnNmJZR47_Ae5fpNgjqx3Fcub4_8BC=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB3D1ehK9e_FxYjnNmJZR47_Ae5fpNgjqx3Fcub4_8BC=g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Tue, 21 Oct 2014 09:34:40 -0000
X-Groupsio-MsgNum: 52574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline

--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2014 at 12:37:21PM +1100, Jonathan Liu wrote:
> On 18 October 2014 22:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Sat, Oct 18, 2014 at 11:06:24AM +0200, Martin Jansa wrote:
> >> On Thu, Oct 16, 2014 at 03:44:05PM +1100, Jonathan Liu wrote:
> >> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> > ---
> >> >  ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 +++++++++++=
++++++++
> >> >  ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 +++++++++++=
+++++++++++
> >> >  recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  2 ++
> >> >  recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
> >> >  4 files changed, 68 insertions(+)
> >> >  create mode 100644 recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-det=
ection-for-mfpu-neon-vfpv4.patch
> >> >  create mode 100644 recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC=
-when-extracting-C-compiler-flags.patch
> >>
> >> This seems to break qemuarm build:
> >>
> >> | No external chromium sources were found, falling back to /home/jenki=
ns/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.=
3.2-r0/git/sr
> >> c/3rdparty/chromium
> >> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qmake_ex=
tras.gypi
> >> | Using extra options found in /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/git/src/core/qtwebeng=
ine_extras.gy
> >> pi
> >> | Updating projects from gyp files...
> >> | gyp: name 'arm_tune' is not defined while evaluating condition 'arm_=
tune!=3D""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-li=
nux-gnueabi/qtw
> >> ebengine/5.3.2-r0/git/src/core/core.gyp
> >> | Project ERROR: -- running gyp_qtwebengine failed --
> >> | WARNING: exit code 3 from a shell command.
> >> | ERROR: Function failed: do_configure (log file is located at /home/j=
enkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtwebengin=
e/5.3.2-r0/te
> >> mp/log.do_configure.30039)
> >> NOTE: recipe qtwebengine-5.3.2-r0: task do_configure: Failed
> >
> > Probably fixed in
> >
> > commit 1cbb91b4a06d6e6626c5345d5a9d7d0fbe9e1bbb
> > Author: Andras Becsi <andras.becsi@digia.com>
> > Date:   Thu Sep 18 18:22:37 2014 +0200
> >
> >     Set arm_tune to empty string if mtune flag is not set by toolchain
> >
> > which needs to be backported to qtwebengine_5.3.2+git.bb
> >
> > Please re-test and re-send, I'm upgrading _git recipes to 5.4-beta in
> > the mean time so the backport won't be needed in qtwebengine_git.bb.
>=20
> Backport of the arm_tune patch looks good to me.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
>=20
> Does it resolve the qemuarm build failure for you?

Unfortunately not completely, now it's arm_fpu:

| Updating projects from gyp files...
| gyp: name 'arm_fpu' is not defined while evaluating condition 'arm_fpu!=
=3D""' in /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-g=
nueabi/qtwebengine/5.3.2-r0/git/src/core/core.gyp
| Project ERROR: -- running gyp_qtwebengine failed --
| WARNING: exit code 3 from a shell command.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRGKKQACgkQN1Ujt2V2gBzU9wCfevT3U9mjqRWl8ok0uN1QEhgd
iZsAn3asEaRMyXPm4E+mSfb96S9rebaR
=RH0Y
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--
