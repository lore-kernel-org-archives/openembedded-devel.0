Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RBAQL-000310-8g
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 21:13:05 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LSK007E02G3V0W2@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	04 Oct 2011 14:07:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 035CD14AF5D; Tue,
	04 Oct 2011 15:07:14 -0400 (EDT)
Date: Tue, 04 Oct 2011 15:07:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CAMKF1soFxjRNw391zLK+Tr8kjwDhfEyF8sY-0y0J2xrt0TF+=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111004190714.GB23650@denix.org>
MIME-version: 1.0
References: <1317025776-2433-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
	<4E8B2D57.6060004@gmail.com> <20111004164552.GA23650@denix.org>
	<CAMKF1soFxjRNw391zLK+Tr8kjwDhfEyF8sY-0y0J2xrt0TF+=g@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 19:13:05 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Oct 04, 2011 at 10:43:28AM -0700, Khem Raj wrote:
> On Tue, Oct 4, 2011 at 9:45 AM, Denys Dmytriyenko <denis@denix.org>=
 wrote:
> > On Tue, Oct 04, 2011 at 08:59:19AM -0700, Khem Raj wrote:
> >> On 10/3/2011 11:47 PM, Reizer, Eyal wrote:
> >>> Ping on this patch.
> >>>
> >>
> >> I would suggest to rebase this patch against openembedded-core
> >> and resubmit
> >
> > Nothing prevents these changes to be submitted to oe-core, but th=
ey were
> > meant to eventually get into 2011.03-maintenance branch.
>=20
> For 2011.03-maintenance yes ofcourse. However I would like to encou=
rage changes
> to go into oe-core and other appropriate layers as well since that =
makes it easy
> to upgrade to the layered structure in future since it will have
> changes that went
> into 2011.03-maintenance branch

Khem,

That is understood and inside TI we are currently working on a migrat=
ion path=20
for our OE/Arago based products to move to oe-core/Yocto. Unfortunate=
ly, our=20
component teams are not yet up to speed and still need work done on t=
he old=20
code base, based on 2011.03-maintenance...

--=20
Denys


> >>>> -----Original Message-----
> >>>> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> >>>> Sent: Monday, September 26, 2011 11:30 AM
> >>>> To: openembedded-devel@lists.openembedded.org
> >>>> Cc: Reizer, Eyal
> >>>> Subject: [PATCH] wpa_supplicant update to use a newer commit
> >>>>
> >>>> Signed-off-by: Eyal Reizer<eyalr@ti.com>
> >>>> ---
> >>>> =A0 recipes/wpa-supplicant/wpa-supplicant_git.bb | =A0 =A02 +-
> >>>> =A0 1 files changed, 1 insertions(+), 1 deletions(-)
> >>>>
> >>>> diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb
> >>>> b/recipes/wpa-supplicant/wpa-supplicant_git.bb
> >>>> index 8f6971e..7408808 100644
> >>>> --- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
> >>>> +++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
> >>>> @@ -1,6 +1,6 @@
> >>>> =A0 require wpa-supplicant-0.7.inc
> >>>>
> >>>> -SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> >>>> +SRCREV =3D "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
> >>>> =A0 PR =3D "r0"
> >>>> =A0 PV =3D "0.7.3+0.8.0-rc"
> >>>> =A0 PR_append =3D "+gitr${SRCPV}"
> >>>> --
> >>>> 1.7.0.4
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-devel
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



