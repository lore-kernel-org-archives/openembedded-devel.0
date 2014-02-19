Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0E26E7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 08:00:28 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WG24u-0005Tm-W8 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Feb 2014 09:00:24 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:00:24 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:00:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 19 Feb 2014 09:00:40 +0100
Message-ID: <le1o9u$sbk$1@ger.gmane.org>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: GDM alternative?
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
X-List-Received-Date: Wed, 19 Feb 2014 08:00:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Lee schreef op 18-02-14 22:24:
> Hello everyone, I am sure this has been asked before but I haven't found
> a solution.
> 
> I am currently integrating GDM to my XFCE image. I was hoping that it's
> as easy as adding GDM as the graphical init manager (in local.conf), but
> it looks like PolicyKit, Console Kit, PAM, gconf, gconf-sanity (as per 
> meta-angstrom) all need to be correctly configured for GDM to work. This 
> integration of multiple frameworks is not what I had in mind. So I am
> now searching for alternative - something more lightweight and with less 
> dependency.

GDM works without the pk-gnome and ck libdir symlinks, but it's a pain in
the ass to get it working with a non-GNOME session by default.

To get autologin working again:

https://github.com/Angstrom-distribution/meta-oe/commit/26d1cca7ef9bb2e656ba6998adc4c99810654fb9

This used to work, but I'm debugging why it doesn't anymore:

https://github.com/Angstrom-distribution/meta-angstrom/blob/angstrom-v2013.12-yocto1.5/recipes-tweaks/gdm/angstrom-gdm-xfce-hack.bb

I'm slowly debugging GDM issues for Angstrom v2013.12 and will send patches
to meta-oe/master soon(-ish).

But to answer your question: Andreas uses 'lxdm' in his xfce images in the
meta-misc layer. It's on my list to try out so I can't say if it works right
now.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTBGSoMkyGM64RGpERApCvAJ9N9N+3YY6DvDXJMAi+hLmgR/aw8QCgq9Qc
NUOrhTxjxhLllVNETM8QU00=
=m7et
-----END PGP SIGNATURE-----


