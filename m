Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1IJz-0007Bk-9a for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 14:05:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1IIF-0004pN-Kd for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 14:03:39 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 14:03:39 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 14:03:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 20 Mar 2011 14:03:27 +0100
Message-ID: <im4tuv$so3$1@dough.gmane.org>
References: <1299591298.3785.126.camel@mattotaupa>	<1300205205.4123.6.camel@mattotaupa>	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>	<1300364903.3950.21.camel@mattotaupa>	<1300402006.17833.14.camel@mattotaupa>	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>
	<1300449625.3830.47.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300449625.3830.47.camel@mattotaupa>
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
X-List-Received-Date: Sun, 20 Mar 2011 13:05:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-03-11 13:00, Paul Menzel wrote:
> Date: Fri, 18 Mar 2011 12:03:43 +0100
> 
> Xfce Session build depends on the executable `iceauth`, which fails when cross compiling for a different architecture.

[..]

> --- a/recipes/xfce-base/xfce4-session_4.6.1.bb

[..]

>  
> +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"

Minor nit: ${bindir}/iceauth

If that's fixed:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNhfsfMkyGM64RGpERAhutAKC9N26qpImGg+Fs8T4EHIZqDe0TnQCcCZgw
SkK1VWwgUwtM2oGG28zZPF0=
=/nQQ
-----END PGP SIGNATURE-----



