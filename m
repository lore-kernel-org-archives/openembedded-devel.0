Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUECp-0004LF-KH for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:38:11 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUE3A-0005JS-Jb for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:28:12 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 11:28:12 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 11:28:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 May 2012 11:27:57 +0200
Message-ID: <jot7j3$df9$1@dough.gmane.org>
References: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
	<CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
	<CADZ6=au=JZVMD9_PNbcbSmv6JzxtZWeQD6suneG=fk9Ks4pHCg@mail.gmail.com>
	<CAF6bG8fEnVNtkEO9iHtrpB822w-SNWzTd-4WSTr_SgNqNpHTtg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CAF6bG8fEnVNtkEO9iHtrpB822w-SNWzTd-4WSTr_SgNqNpHTtg@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: New kmod {libdir} breaks udev, systemd build
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
X-List-Received-Date: Tue, 15 May 2012 09:38:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-05-12 19:42, Marko Lindqvist schreef:
> On 14 May 2012 20:23, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>> 
>> openembedded-core only features udev-164 (vs. -182 in meta-oe). -164 in
>> oe-core does not use libkmod, so there's no issue with libkmod in 
>> oe-core. It's no surprise that it "worked for you", you were building 
>> anicent tools.
> 
> I know. I were asking why versions are setup like this. If -182 makes 
> more sensible default, why it's not one in -core. My main point was that
> seemingly unrelated change to build xterm to my image (requiring meta-oe
> layer) caused *default* udev version to change (I'm not setting
> PREFERRED_VERSION anywhere).

Setting preferred versions is the task of the DISTRO. If the DISTRO doesn't
care about the udev version, it will change if you add different versions to
your stack. If that offends you, switch to another DISTRO.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPsiGdAAoJEHZqAkdh1vT6qUIP/2l+gdBLEmcr1eNJAXa2brKf
7EpMMNChKurwoBQHJqWUFYWGfFDpTsda02jIV3sB4dZ7DzVCrs4MQrBQYBNvoYhb
/xrjnObNDv12mlVTmBU8mfL9BtkCGdjhEs9lq1WDGO6nTEVnlE3T8+skmoGuDfwV
vq1HejuwMNsM5SaC8/jEHDM41YT5gqDMOViSZhwIfSvCPzJ2dc4An5yq601HEIH4
T+SM+BpGLmUgsW0mMnTXgo61BCHc3DMtV3qVl8V/FJRm92OigWUFWihSE+lv9G6O
URpErYOwYFaQaqZs3Ma3MpBQ3GGj1q2FC0ypJ9PsdU2W4SPZsMxJD7VDg/1HbLzn
tsVQPB2+DILoIjUliq+YAAVERj0rAaGbHw6dvFKuaielYjBkCutj3UICG8i0tTyJ
rtIvK7NbWm9BON3t4EHpuzsmyQ90q24glbKGYsEF1F2ckaXj4TRntDcJPu9Cha/7
OQ3lunZINzRf2xKE/ixzmMvTlhehvhrusuV3QboRg0UBVAFlscjeTuZCf+VpX4SY
GKPEV9GZH/0aZwwQgx3/E/+tcwac+IKc+RGk6b3jU269Dz/ShcHmXsBWlCpw2St7
fNakj0PELguutLMqeEYTJedqUBFpfd6y7oz1upxyMF21EUkBdK9mvEF1OX9XmXhs
tQR8lTJjm8PJZ8doKJjk
=bXQJ
-----END PGP SIGNATURE-----



