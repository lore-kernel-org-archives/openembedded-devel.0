Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPIP2-0003Xn-1P for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 22:11:01 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPI8J-0006RW-37 for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 21:53:39 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 21:53:39 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 21:53:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 08 Apr 2013 21:53:34 +0200
Message-ID: <kjv77m$tt7$1@ger.gmane.org>
References: <5162B803.4090400@nedap.com> <20130408131717.GA2470@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <20130408131717.GA2470@jama>
X-Enigmail-Version: 1.5
Subject: Re: machinename with dash in it
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
X-List-Received-Date: Mon, 08 Apr 2013 20:11:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-04-13 15:17, Martin Jansa schreef:
> On Mon, Apr 08, 2013 at 02:28:51PM +0200, Jaap de Jong wrote:
>> Hi All, something strange happens with my machinename with a dash in
>> it: x-y If I bitbake some image it will end up that netbase is not
>> found. Inspection of build/tmp-angstrom_v2012_12-eglibc/work shows 2
>> variants of x-y: one with a dash and one where the dash is replaced by
>> an underscore: x-y and x_y In x-y only netbase is found, rest of the
>> machinespecific packages are in x_y
> 
> MACHINE_ARCH is MACHINE with s/-/_/g (because rpm had issues with -) so
> it's expected.
> 
>> Creating the image fails with the message that netbase is not found... 
>> Any ideas?
> 
> It's probably caused by 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102 do manual cleanup
> described there and it should work fine.

The root cause was this one:
https://git.linaro.org/gitweb?p=openembedded/meta-linaro.git;a=commit;h=30f353c072336ad764e9528ae3c508adb28fa4ad

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRYyA+MkyGM64RGpERAlOqAKCo06UHU8N5U7rGLyddRl8vjS9cBgCgka+u
Zlnl+rXes1ntNxNASOrc6pY=
=Tjzk
-----END PGP SIGNATURE-----



