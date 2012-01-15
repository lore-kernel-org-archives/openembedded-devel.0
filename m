Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RmMCn-0006pJ-Lu for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 10:16:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RmM5U-0003XM-0K for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 10:09:16 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 10:09:15 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 10:09:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 15 Jan 2012 10:09:03 +0100
Message-ID: <jeu53e$cvt$1@dough.gmane.org>
References: <20120113110213.AFF2110331@opal>
	<201201131659.37622.schnitzeltony@gmx.de>
	<jerg1f$kn1$1@dough.gmane.org>
	<201201150322.22329.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201201150322.22329.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.4
Subject: Re: [oe-commits] Koen Kooi : libjpeg-turbo: initial add
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
X-List-Received-Date: Sun, 15 Jan 2012 09:16:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-01-12 03:22, Andreas Müller schreef:
> On Saturday, January 14, 2012 09:57:21 AM Koen Kooi wrote:
>> Op 13-01-12 16:59, Andreas Müller schreef:
>>> Another stupid question from my side: How can I make this replace 
>>> libjpeg?
>> 
>> Build it manually and then opkg upgrade or set PREFERRED_PROVIDER_jpeg
>> = "libjpeg-turbo". Angstrom will make it the default next week.
>> 
> In the first step I have set
> 
> PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
> 
> in my machine configuration and built image incremental and from
> scratch.
> 
> In the second step after angstrom update (and native fix by Eric) I have
> build image incremental.
> 
> In all cases the only jpeg library found in my image was:
> 
> libjpeg8_8c+1.2.0-r0_armv7a.ipk

And that's how it should be:

$ dpkg-deb -I libjpeg8_8c+1.2.0-r0_armv7a.ipk
 new debian package, version 2.0.
 size 81424 bytes: control archive= 489 bytes.
     554 bytes,    15 lines      control
 Package: libjpeg8
 Version: 8c+1.2.0-r0
 Description: libjpeg-turbo version 8c+1.2.0-r0
  libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions
  (MMX, SSE2, NEON) to accelerate baseline JPEG compression and
  decompression
 Section: base
 Priority: optional
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: BSD-3-Clause
 Architecture: armv7a
 OE: libjpeg-turbo
 Homepage: http://libjpeg-turbo.org/
 Depends: libc6 (>= 2.12)
 Source:
svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8Sl60ACgkQMkyGM64RGpGSaACfdOMvovSZ/eoclabkYkh3cXGQ
kEYAnAhBifJ0F5FbMQ6JSOXvHhKgNMJb
=jBcU
-----END PGP SIGNATURE-----



