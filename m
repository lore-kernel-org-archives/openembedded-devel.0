Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2IIx-0006Re-RL for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 08:16:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2IH7-0005LV-H5 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 08:14:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:14:37 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:14:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 08:14:22 +0100
Message-ID: <imc6ke$j7j$1@dough.gmane.org>
References: <1299591298.3785.126.camel@mattotaupa>	<1300449625.3830.47.camel@mattotaupa>	<im4tuv$so3$1@dough.gmane.org>
	<201103230133.06164.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <201103230133.06164.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Wed, 23 Mar 2011 07:16:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-03-11 01:33, Andreas Mueller wrote:

> Anyway: In 'xfce4-session' / config.log I found:
> 
> | configure:15972: checking for iceauth
> | configure:15990: found */usr/bin/iceauth*
> | configure:16002: result: /usr/bin/iceauth
> 
> So - as Khem suggested - and with xfce4-session: RDEPENDS_${PN}="iceauth" I:
>   - changed iceauth to extent to iceauth-native.
>   - changed xfce4-session: DEPENDS = "iceauth-native ..."

No, it only wants to probe for the PATH of the binary to encode into the
result. We do NOT want target binaries to point to your builddir instead
of ${bindir}.

As I said before, Pauls patch does the right thing.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNiZ3OMkyGM64RGpERAhGkAJ9DcOr2vrAnAEkR8YmsNYSIJokHeACeLMiv
s5rQTqwrhSBj+oyZCHdRM6w=
=Fjad
-----END PGP SIGNATURE-----



