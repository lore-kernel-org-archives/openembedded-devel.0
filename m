Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leonid.titov@gmail.com>) id 1RziKQ-0005EA-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 06:31:54 +0100
Received: by lahc1 with SMTP id c1so7284884lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 21:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of leonid.titov@gmail.com designates
	10.112.23.66 as permitted sender) client-ip=10.112.23.66; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of leonid.titov@gmail.com
	designates 10.112.23.66 as permitted sender)
	smtp.mail=leonid.titov@gmail.com;
	dkim=pass header.i=leonid.titov@gmail.com
Received: from mr.google.com ([10.112.23.66])
	by 10.112.23.66 with SMTP id k2mr8593186lbf.64.1329801815824 (num_hops
	= 1); Mon, 20 Feb 2012 21:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s+H2+/JUlMRwWHnJJXBg1GOQO8vbrD0o5UifJJUIvYo=;
	b=OdG2lRnGiWND83idNRnTgV5A+rWldonXoIsCRF3xK0TKGebnqIZcZ1Y5mZ+u7e+eSL
	i8fpcOBoXkNjz6XYgNgL3oclF8ax9VMX7/ddo6KIGF4a4lAZQGuxalShCntXorxT/Lc5
	voVRa0L8WOpKC1DKy7Rcqco6Mpoe1zmxoUgvI=
MIME-Version: 1.0
Received: by 10.112.23.66 with SMTP id k2mr7187664lbf.64.1329801810897; Mon,
	20 Feb 2012 21:23:30 -0800 (PST)
Received: by 10.152.24.197 with HTTP; Mon, 20 Feb 2012 21:23:29 -0800 (PST)
Received: by 10.152.24.197 with HTTP; Mon, 20 Feb 2012 21:23:29 -0800 (PST)
In-Reply-To: <CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
	<CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
Date: Tue, 21 Feb 2012 09:23:29 +0400
Message-ID: <CANLRtZxf+QGt7f7cxuMFCiN_ii_79J5cgOJ480oggtxEHoqUGg@mail.gmail.com>
From: Leonid Titov <leonid.titov@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Tue, 21 Feb 2012 05:31:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=D0=AB=D1=88=D1=89=D1=8B=D0=BF=D0=B6=D0=B8=D1=89=D0=B0=D1=89=D1=89=D1=89=D0=
=B2=D0=B2=D1=86=D1=88=D1=88=D0=B9=D0=BA=D0=B3=D0=BA=D1=83=D1=88=D1=83=D0=BA=
=D1=89=D1=89=D0=B7=D1=83
17.02.2012 22:54 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=
=B5=D0=BB=D1=8C "Andreas M=C3=BCller" <schnitzeltony@googlemail.com>
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:

> On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=C3=BCller wrote:
> >> V1 -> V2:
> >> [2]  do not check configuration variables for cross and nativesdk
> >> [3]  rename systemd_package to systemd_generate_package_scripts
> >> [6]  parse unit files to determine the files to pack
> >> [7]  create warning if *-systemd package already rdepends
> >>      it's base package
> >> added in V2:
> >> [8]-[20] remove obsolet systemd code from recipes (these were used as
> >>      test cases)
> >> [21] dhcp-(relay) test case for multiple systemd packages
> >> [22] modified to start service
> >
> > Whole series looks good to me sofar.
> >
> > I'm not sure what's meant by this warning:
> > WARNING:
> > /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/
> gateone_git.bb:
> > it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> > WARNING:
> > /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/
> cloud9_0.5.1.bb:
> > it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> >
> > I guess we should
> > -SYSTEMD_PACKAGES =3D "${PN}"
> > +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> > with this patchset too and add ${PN}-systemd to task which pulls
> gateone/cloud9.
> >
> > And I'm not sure if this change is intentional:
> >
> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D3=
d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
> >
> > as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
> > probably won't harm if xserver-nodm-init is used only to pull
> > xinit+xserver-common dependency.
> >
> The only 'clean' way out here I see is an additional variable
> overriding automatic rdepending. How about
>
> SYSTEMD_RDEPENDS: If this variable is set with a list of packages, its
> contents are used for redepending (systemd is still added). It should
> be possible to set packages outside of recipe and of course the
> contents should be checked during parse. What do you think?
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

