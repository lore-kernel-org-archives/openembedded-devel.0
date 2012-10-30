Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TT7o5-0002JA-UJ for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 10:08:21 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TT7b6-0003No-Ey for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 09:54:56 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 09:54:56 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 09:54:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Oct 2012 09:54:39 +0100
Message-ID: <k6o4kb$vca$1@ger.gmane.org>
References: <CAMQ5J2a8zLVVDPNw6vHhgsQ1pRhz_QdqaJJz7U_aQv2MwEg5zQ@mail.gmail.com>
	<CAMQ5J2aXaBZg3k3Guj=B+KgdKnf_Px3OmKu8C5oKmyiwdG7AFw@mail.gmail.com>
	<1514371.ACA88Gs2zU@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1514371.ACA88Gs2zU@helios>
X-Enigmail-Version: 1.4.4
Subject: Re: Kernal build errors
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
X-List-Received-Date: Tue, 30 Oct 2012 09:08:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-12 10:43, Paul Eggleton schreef:
> On Monday 29 October 2012 13:21:50 RaNgErS wrote:
>> I am very new to this stuff, and I tried to build an image i got some 
>> errors which are not solved even i tried for a whole week. It is from
>> the kernal side or sth. i am attaching the log file obtained .
> 
> The module packages specified don't exist, which means either the
> functionality they would have included is compiled into the kernel
> (option value = "y") or they weren't enabled at all (option value="n").
> So you should check your kernel configuration.
> 
> If they are enabled but you do genuinely want these to be compiled into
> the kernel rather than as modules, the task-picop-demo recipe needs to be
> changed to use RRECOMMENDS rather than RDEPENDS to bring in the kernel
> modules only if they exist; that will fix the error.

RDEPENDSing on kernel-modules is not allowed anyway, you should always use
RRECOMENDS for those.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQj5XPMkyGM64RGpERAlrHAJ9aLi10oRaK39QTnitb5+uutMZRLQCgh5Uq
PMsZo20st543harAPvScJzU=
=G4PF
-----END PGP SIGNATURE-----



