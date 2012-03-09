Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S5tlq-0003IW-RH for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 07:57:46 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S5tdU-00072y-TC for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 07:49:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 07:49:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 07:49:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 Mar 2012 07:48:58 +0100
Message-ID: <jjc94n$uin$1@dough.gmane.org>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
	<CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
	<CALbNGRTiaqQQPb_UqkCKrevZYJk4+LLUh9E2VDzAcHHC6v_sTw@mail.gmail.com>
	<CALbNGRT1iEb8G=OXNog5aU9CZgO1j_Gc8bmD_pbDQ9UU96YL-Q@mail.gmail.com>
	<CAP9ODKrpiLEAyxx+2MHLxSaM_RkUh=AsMuA=8FECFz9TwkBdcw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAP9ODKrpiLEAyxx+2MHLxSaM_RkUh=AsMuA=8FECFz9TwkBdcw@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Fri, 09 Mar 2012 06:57:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-03-12 18:59, Otavio Salvador schreef:
> On Thu, Mar 8, 2012 at 14:15, Andreas Müller 
> <schnitzeltony@googlemail.com> wrote:
>> My personal opinion: since RAM is most expensive prefer flash/disk as 
>> default ( as Koen already pointed out this default can be simply 
>> overridden by deleting /var/log/journal [2][3] )
> 
> If this is the case, then let's make this patch ensure this works out of
> box ... I do think most people will get full flash/disk without knowing
> why.

We're working on it with the systemd people to see what is causing the
'runaway' logs.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9Zp9gACgkQMkyGM64RGpEdEQCgrvRjHfFYxa8ZSwi647xeQffa
47IAnR/aaqwUVbVBPiE5+XV7KtYcBrrA
=x8rX
-----END PGP SIGNATURE-----



