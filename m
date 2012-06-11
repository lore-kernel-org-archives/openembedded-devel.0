Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Se7yp-0006Rq-RC for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 19:00:39 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Se7oZ-0001eC-QI for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 18:50:03 +0200
Received: from adsl-68-88-77-36.dsl.rcsntx.swbell.net ([68.88.77.36])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 18:50:03 +0200
Received: from koen by adsl-68-88-77-36.dsl.rcsntx.swbell.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 18:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 11 Jun 2012 11:44:52 -0500
Message-ID: <jr57a2$tsp$2@dough.gmane.org>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<35554bb06b4c779574cdb162c1701b0791afd459.1339428767.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-68-88-77-36.dsl.rcsntx.swbell.net
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <35554bb06b4c779574cdb162c1701b0791afd459.1339428767.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH][meta-oe 2/3] nodejs: force use of -mfpu-abi=soft for ARMv5
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
X-List-Received-Date: Mon, 11 Jun 2012 17:00:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-06-12 10:34, Otavio Salvador schreef:
> The build system defaults to 'softfp' but this use hardware instructions
> that are not available making node to fail to run on ARMv5 based CPUs.

That's not true, you are probably getting a wrong -mfpu setting. This patch
changes the ABI, which is the wrong thing to do, NAK.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP1iCEAAoJEHZqAkdh1vT60rUP/RscVAFvhgbYe5fbkvSM+MI6
M+lWqbjSfMwrk+R4RlNQkJVWIiiWiCnsL3d5DhVa6gonvKpFVkPs73w4qZKfWV6E
fawSkXiOMJIYnnxJ45Gcx9RwRu71lRAM+F/22OZIBdEKWreYJ7NB/ZYM/9Rglvgs
xwaaDix0fGa5OJsgLyRXXiwQGAR8ii+nAnJ6VyvuKXevU5cVmZ42N/NpnhajtB6q
zx1O7hleUeY96AUY09xInXi3x4XY/LxTg361dND7TZN772xHtZh1ovM3RPSaMo8Z
enQqLfc1tOmkTva4Bs1MXVkAPPeKzGEGdeW4f+tjvQmhXOnWez6U3JoKok94mw8G
V6rU1QH57/2hrfl9EEzXbvIBkWm9YIzjEW1EpFF3piqlEMrm1Tbmp831NDKVqfnh
gYRP0l6fMb62GaxXqY2vyvpuYxV/qhJe739FAjmYi9NFFuaShnrDC0EyBHb32luL
cNDHynug716QDVrv3+zsgp/5GgmpDgNfJBjnyxvnBfVrkxn223sadsi83ZWE2vOA
4pjE11IaK3RGer9dsAzxYegZiavad8HU9DZLJR1mlzNmHoYJc/EC3euos9l/tlAE
EJ814hogHhvSfzjgLfI6+Nom9s9I2shl1p+Osy6av3sf25v1fJPBJmd+HdrIovx5
jR8BLzOaWBpNzVFxZgAN
=9VGf
-----END PGP SIGNATURE-----



