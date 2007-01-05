Received: from [64.233.184.227] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1H2qJ6-0007ri-3a
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 15:44:32 +0100
Received: by wr-out-0506.google.com with SMTP id 58so1269536wri
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jan 2007 06:43:10 -0800 (PST)
Received: by 10.78.204.1 with SMTP id b1mr2988304hug.1168008189337;
	Fri, 05 Jan 2007 06:43:09 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Fri, 5 Jan 2007 06:43:09 -0800 (PST)
Message-ID: <d46153c40701050643t21c850eh3d90440648def24c@mail.gmail.com>
Date: Fri, 5 Jan 2007 08:43:09 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <459D28BF.3000208@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1H2VAZ-0000cW-1g@linuxtogo.org>
	<459D28BF.3000208@dominion.kabel.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev madwifi-ng: add slugos support and bump to latest snapshot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jan 2007 14:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> mwester commit schreef:
> > madwifi-ng: add slugos support and bump to latest snapshot
>
> > packages/madwifi/files/slugos-VFP-wackelf.patch
> > packages/madwifi/files/slugos-xscale-be-elf-copts.patch
> > packages/madwifi/files/slugos-xscale-le-elf-copts.patch
> > packages/madwifi/madwifi-ng_r1871-20061229.bb
>
> > +SRC_URI_slugos = "http://snapshots.madwifi.org/${PN}/${PN}-${PV}.tar.gz \
> > +               file://slugos-xscale-be-elf-copts.patch;patch=1 \
> > +               file://slugos-xscale-le-elf-copts.patch;patch=1 \
> > +               file://slugos-VFP-wackelf.patch;patch=1"
> > +
>
> Ehm, shouldn't those be machine specific? what happens if I build slugos for powerpc?
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFFnSi+MkyGM64RGpERAurmAJ9shLtzRB9T1PoZBtzFEVIR7vqg0QCgndOp
> a2JCeIISh0ZghHjD31o7CFA=
> =PmaW
> -----END PGP SIGNATURE-----

Is there a reason why these patches are slugos-specific?  I'm
wondering because this new version of madwifi does not build for me
anymore because the xscale patches are out of date.  It does work if I
use the slogos patches though.  The wackelf patch is handy as well.


