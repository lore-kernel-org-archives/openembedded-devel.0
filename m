Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGCoC-00023a-Lr for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 18:46:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGCiX-0001wA-Br for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 18:40:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 18:40:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 18:40:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 18:40:28 +0200
Message-ID: <j7ka5s$ioi$1@dough.gmane.org>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111018162433.GJ20678@jama.jama.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 16:46:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-11 18:24, Martin Jansa schreef:
> On Tue, Oct 18, 2011 at 04:51:09PM +0200, Paul Menzel wrote:
>> Am Dienstag, den 18.10.2011, 16:10 +0200 schrieb Martin Jansa:
>>> From: pespin <pespin.shar@gmail.com>
>> 
>> The name is still not correct. Although the Signed-off-by line is. 
>> Please correct that.
> 
> Thanks for catching that, fixed in jansa/pull branch.
> 
>>> * Copied from oe-classic
>>> <http://git.openembedded.org/openembedded/commit/?id=63d3969b0f839fc4b7bf7fe836daec729d9d3c53>
>>>
>>> 
* Remove PE=1
>>> * Add LIC_FILES_CHKSUM * Builds fine using SHR distro * JaMa: removed
>>> PR
>> 
>> Was the recipe tested somehow?
> 
> Tested on om-gta02 after building it with SHR and added 
> RDEPENDS_${PN}-test = "glibc-gconv-utf-16"

Could you please change that to something like:

RDEPENDS_${PN}_append_libc-glibc " glibc-gconv-utf-16"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnav8MkyGM64RGpERAoswAJ9cEsFI3GGwHoy6wwSSxHq3rKFjGgCfR6o6
JheuujpRfaxIxHr6qL3lK30=
=vuU4
-----END PGP SIGNATURE-----



