Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QCbgc-0004Ub-Ak
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 19:59:34 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJY00I35PUH2FW0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Apr 2011 12:56:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A81FB14AF5B; Wed,
	20 Apr 2011 13:56:41 -0400 (EDT)
Date: Wed, 20 Apr 2011 13:56:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110420175641.GA25373@denix.org>
References: <1302727726-9362-1-git-send-email-eyalr@ti.com>
	<iojko1$bte$3@dough.gmane.org>
	<BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
	<iojvmj$de8$1@dough.gmane.org>
	<BANLkTi=PX+c_=1ghKQt0131OMtS7YQzR-A@mail.gmail.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F03320BB47A@dnce02.ent.ti.com>
MIME-version: 1.0
In-reply-to: <EC51CDB0807A51469E0C9CB8CF72D65F03320BB47A@dnce02.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: [PATCHv2] wpa-supplicant: Build from git sources
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
X-List-Received-Date: Wed, 20 Apr 2011 17:59:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 20, 2011 at 05:36:15PM +0200, Reizer, Eyal wrote:
> Hi Koen,
> 
> adding such a PV to the recipe causes the files that are located under 
> recipes/wpa-supplicant-git/ and are part of SRC_URI not to be found as it 
> appears that it now looks for them under:
> 
> recipes/wpa-supplicant-0.7.3+0.8.x/

You have two options:

1. Move the files under recipes/wpa-supplicant-0.7.3+0.8.x/
2. Keep them at recipes/wpa-supplicant-git/ but add to the recipe:
FILESPATHPKG .= ":wpa-supplicant-git"

And, BTW, please don't use 0.8.x in the PV! Use 0.7.3+0.8.0-rc or something.

-- 
Denys

> How do I work around this?
> 
> Best Regards,
> Eyal
> On Tue, Apr 19, 2011 at 7:37 AM, Koen Kooi <koen@dominion.thruhere.net<mailto:koen@dominion.thruhere.net>> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> On 19-04-11 14:13, ???????? ?????????? wrote:
> > This naming is used in other recipes building from git.
> > Any suggestions of how it should be called instead?
> You are entirely right that the filename usually is foo_git.bb<http://foo_git.bb/>, but
> there would be something like PV = "x.y.z+git" inside.
> This is to ensure upgrade paths from e.g. 0.7.3 to the 0.8rc and 0.8
> final release. If I have '0.7.3' installed, upgrading to 'git' is no
> problem, but going from 'git' to '0.8.0' would be, since 'git' will sort
> higher.
> I'm not into wpa-supplicant release versioning, so I don't have the
> right solution, but something like
> 
> PV = "0.7.3+0.8rc"
> PR_append = "gitr${SRCPV}"
> 
> should work.
> 
> regards,
> 
> Koen
> 
> 
> > ???????????? 2011 4 19 12:35, ?????? "Koen Kooi" <koen@dominion.thruhere.net<mailto:koen@dominion.thruhere.net>> :
> > On 13-04-11 22:48, Eyal Reizer wrote:
> >>>> * Builds a new version 0.8.x which is not released yet as a zip file.
> >>>> This version has new features like WIFI-direct used in new mac80211
> >>>> versions
> >>>>
> >
> > Same thing as with hostap-daemon: 'git' is not a valid PV.
> >
> >>
> >>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists.openembedded.org>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> iD8DBQFNrYISMkyGM64RGpERAlbGAKCZCfCJloSSt8qNx3nclhPuG1KwKwCfYH6o
> dloJiapREwDLoeMUrdgWGu4=
> =9v/S
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


