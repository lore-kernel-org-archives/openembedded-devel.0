Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4C7616EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 19:10:55 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VI1Qk-0003HD-56 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Sep 2013 21:10:54 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 21:10:54 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 21:10:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 Sep 2013 21:10:45 +0200
Message-ID: <l0d9bb$ik4$1@ger.gmane.org>
References: <1378476045-17681-1-git-send-email-fathi.boudra@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1378476045-17681-1-git-send-email-fathi.boudra@linaro.org>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-networking][PATCH 1/1] fping: add recipe
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
X-List-Received-Date: Fri, 06 Sep 2013 19:10:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-09-13 16:00, Fathi Boudra schreef:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org> --- 
> meta-networking/recipes-support/fping/fping_3.5.bb | 25
> ++++++++++++++++++++++ 1 file changed, 25 insertions(+) create mode
> 100644 meta-networking/recipes-support/fping/fping_3.5.bb
> 
> diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb
> b/meta-networking/recipes-support/fping/fping_3.5.bb new file mode
> 100644 index 0000000..de41797 --- /dev/null +++
> b/meta-networking/recipes-support/fping/fping_3.5.bb @@ -0,0 +1,25 @@ 
> +SUMMARY = "sends ICMP ECHO_REQUEST packets to network hosts" 
> +DESCRIPTION = "fping is a ping like program which uses the Internet
> Control \ +Message Protocol (ICMP) echo request to determine if a target
> host is \ +responding. fping differs from ping in that you can specify
> any number of \ +targets on the command line, or specify a file
> containing the lists of \ +targets to ping.  Instead of sending to one
> target until it times out or \ +replies, fping will send out a ping
> packet and move on to the next target \ +in a round-robin fashion." 
> +HOMEPAGE = "http://www.fping.org/" +SECTION = "console/tools" +LICENSE =
> "BSD" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=09d77789fe32be35acde9637a5ee39b1" +PR = "r0"

Drop the PR but, it's the default

> + +SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz" 
> +SRC_URI[md5sum] = "2e17cb655aa4eb59b5a4a38a89e746ed" +SRC_URI[sha256sum]
> = "09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a" + +S
> = "${WORKDIR}/fping-${PV}" + +inherit autotools + +EXTRA_OECONF =
> "--enable-ipv4 --enable-ipv6"

That should probably be using PACKAGECONFIG for ipv6

> + +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"

What breaks on powerpc and mips?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSKii1MkyGM64RGpERAs1+AJwMTAC9o0rwoWGF55P9slUU1sqbaQCfa8MZ
C7SlRH3oOn6+Sh/YxSiSrWA=
=wkli
-----END PGP SIGNATURE-----


