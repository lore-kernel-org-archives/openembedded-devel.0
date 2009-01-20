Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1LPDVe-000859-F4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jan 2009 11:07:02 +0100
Received: from UNKNOWN (imp6-g19.priv.proxad.net [172.20.243.136])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 930EE5E6AF;
	Tue, 20 Jan 2009 12:05:21 +0100 (CET)
Received: by UNKNOWN (Postfix, from userid 0)
	id 3148D103DE70E; Tue, 20 Jan 2009 11:00:02 +0100 (CET)
Received: from  ([82.123.133.183]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Tue, 20 Jan 2009 11:00:02 +0100
Message-ID: <1232445602.4975a0a22bf12@imp.free.fr>
Date: Tue, 20 Jan 2009 11:00:02 +0100
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@datenfreihafen.org>
References: <1232393997.4974d70deeb97@imp.free.fr>
	<20090120081042.GE13810@excalibur.local>
In-Reply-To: <20090120081042.GE13810@excalibur.local>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.133.183
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: problems with building
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
X-List-Received-Date: Tue, 20 Jan 2009 10:07:02 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for the anwser.

Selon Stefan Schmidt <stefan@datenfreihafen.org>:
> On Mon, 2009-01-19 at 20:39, Alain2210 wrote:
> >
> > I'm trying to build an image with openembedded. But I have to problem=
s :
> > 1) for building linux-ezx-2.6.21-ezxdev-r24
> > I have had to add information to checksums.ini
> > -------------------------
> > diff --git a/conf/checksums.ini b/conf/checksums.ini
> > index 4ebf4bc..c3de2df 100644
> > --- a/conf/checksums.ini
> > +++ b/conf/checksums.ini
> > @@ -13882,6 +13882,10 @@
> sha256=3D9cd89808a3c63e48ea809510e25a0277a53c7cb2e039f35a
> >  md5=3D7c4b0de088db249cd94ec0001c4d3edd
> >  sha256=3Df91accabee3408cc318affb01b1dd764cad555441a2c8ee23c598880f58=
25807
> >
> > +[http://www.rpsys.net/openzaurus/patches/archive/lzo_crypto-r1.patch=
]
> > +md5=3D95b10e4703e970af59e32ea3b1e3bb02
> > +sha256=3D3025b52d6f614935cc28a5133daaa7968ee0ea1dfef00c15cd4642a4ea3=
12f88
> > +
> >  [http://www.rpsys.net/openzaurus/patches/archive/lzo_crypto-r2.patch=
]
> >  md5=3D29162001c88d9dbe0ccb25103a1aefb4
> >  sha256=3D0b68f2d73dc54404d29015455ba84021a925aa2cfb6f1fe75705fe2268b=
2e2e8
> > -------------------------------------
>
> I could apply this, but then you would still have an old kernel with pa=
tches
> the
> OpenEZX team no longer support. We should better make the kernel from o=
penezx
> git the default and set a sane srcrev for it. Will try to test it this =
week.

Yes, I know that this kernel is very old (2.6.21) but it is the standard =
one
that is build when I do "bitbake fso-illume-image" for a e680 and distro =
=3D
angstrom-2008.1

When the build will be finished, I will try another kernel.

>
> > 2) I have a problem when fetching with git for exemple for dbus-hlid_=
git.bb
> > or libgdbus_git.bb, I get :
> > git pull --tags git://git.freesmartphone.org/dbus-hlid.git failed wit=
h
> signal 1,
> > output:
> >
> > and above
> >
> > Fetching tags only, you probably meant:
> >   git fetch --tags
> >
> > I have tried by hand, git pull --tags does not work but git fetch --t=
ags
> does.
> >
> > What have I to change ?
>
> You mentioned in your next mail that you still have bitbake 1.8.10, ple=
ase
> update to the latest release 1.8.12 and re-test.
>

Thanks.

Alain


