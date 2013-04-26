Received: from rrcs-98-100-91-244.central.biz.rr.com ([98.100.91.244]
	helo=pluto.melinkcorp.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bevenson@melinkcorp.com>) id 1UVheI-00029Q-Ca
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 14:21:11 +0200
Received: from pluto.melinkcorp.local ([10.0.2.4]) by pluto.melinkcorp.local
	([10.0.2.4]) with mapi; Fri, 26 Apr 2013 08:03:25 -0400
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Apr 2013 08:03:23 -0400
Thread-Topic: [oe] SRC_URI for Subversion server not supporting svn:// protocol
Thread-Index: Ac5B9VNo6lyaIxVeTCKxdRAcM7mGJAAf1O7Q
Message-ID: <91586D499ADFD74FBCFB8425266A5DE40139FD94D9AA@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE40139FD94D8FD@pluto.melinkcorp.local>
	<20130425204057.GI5538@jama.dyndns-home.com>
In-Reply-To: <20130425204057.GI5538@jama.dyndns-home.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 023F8225004324023F8372
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: SRC_URI for Subversion server not supporting svn://	protocol
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
X-List-Received-Date: Fri, 26 Apr 2013 12:21:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin,

Thanks for the pointer.  I had been looking at the Bitbake manual over at o=
penembedded.org, which still has "proto=3D" in its examples.  Also, I'm in =
the process of moving some recipes over from OpenEmbedded Classic (2011.03-=
maintenance branch) to Poky (poky-danny branch), and I was trying it out un=
der OE-Classic.  Even with the updated recipe, the fetch didn't work under =
my OE-Classic build environment.  But, the fetch worked just fine under pok=
y-danny.  Since I'm transitioning to Poky, I'm not going to bother trying t=
o figure out why it didn't work with the old build system.

Thanks,
Bryan

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, April 25, 2013 4:41 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] SRC_URI for Subversion server not supporting svn://
> protocol
>=20
> On Thu, Apr 25, 2013 at 04:11:44PM -0400, Bryan Evenson wrote:
> > I have a Subversion server that is setup for https:// access only
> (Apache server which redirects all http to https, no svnserve active).
> There is an application on the repository that I would like to create a
> recipe for.  However, I'm running into issues with the SRC_URI for this
> application.
> >
> > If I create a SRC_URI of the form:
> > SRC_URI =3D
> "svn://path/to/svn/repository/;module=3Dprojectname;rev=3DHEAD;proto=3Dht=
tps"
>=20
> Close, but use protocol=3Dhttps.
>=20
> > Then the fetch fails due to the svn checkout command being formed as:
> > svn co svn://path/to/svn/repository/ projectname
> >
> > which my Subversion server rejects because it's not implementing the
> svn protocol (I know there are other checkout options in the command,
> but they're not important to this topic).  If I then change the SRC_URI
> as follows:
> > SRC_URI =3D
> "https://path/to/svn/repository/;module=3Dprojectname;rev=3DHEAD;proto=3D=
svn"
> >
> > Then during the fetch it attempts to use wget instead of a svn
> checkout.  This also has issues since the base wget checkout is setup
> to checkout a single file and not recursively checkout a directory.
> Plus, I'd like to do a Subversion checkout for my workflow.
> >
> > Is there a way to tell Bitbake to do a svn checkout but use an
> https:// URL?  If not, does anyone else have any other suggestions?
> >
> > Thanks,
> > Bryan
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


