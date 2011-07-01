Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qcg7i-0008VW-LH for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 17:59:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qcg45-0003oj-Uz for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 17:55:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 17:55:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 17:55:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 17:55:22 +0200
Message-ID: <iukqla$apc$1@dough.gmane.org>
References: <4E0C4BF3.2050701@dresearch-fe.de>
	<1309428937.2551.107.camel@phil-desktop>
	<4E0DEA22.1040308@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <4E0DEA22.1040308@dresearch-fe.de>
X-Enigmail-Version: 1.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Any reasons not to use "newer" ppp?
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
X-List-Received-Date: Fri, 01 Jul 2011 15:59:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-07-11 17:39, Steffen Sledz schreef:
> On 30.06.2011 12:15, Phil Blundell wrote:
>> On Thu, 2011-06-30 at 12:12 +0200, Steffen Sledz wrote:
>>> The current oe-dev master contains recipes for 2.4.4 and 2.4.5,
>>> but both are DEFAULT_PREFERENCE = "-1", so 2.4.3 is used by
>>> default.
>>> 
>>> We hit a problem in LCP open/close handling which is fixed in the
>>> newer versions.
>>> 
>>> Is there any reason *not* to go to 2.4.5?
>> 
>> Oe-core is using 2.4.5 and presumably it works OK there.  Judging
>> from the commit messages there is no good reason for 2.4.5 to have
>> been set D_P=-1 in oe.dev, so I think you should be safe to
>> upgrade.
> 
> While making some investingations in this i hit another problem.
> 
> The recipe *ppp_2.4.5.bb* in *oe-core* contains lines like these: 
> ------------------>snip<------------------- FILES_${PN}-dbg +=
> "${libdir}/pppd/2.4.3/.debug" FILES_ppp-oa       =
> "/usr/lib/pppd/2.4.3/pppoatm.so" FILES_ppp-oe       =
> "/usr/sbin/pppoe-discovery /usr/lib/pppd/2.4.3/rp-pppoe.so" 
> FILES_ppp-radius   = "/usr/lib/pppd/2.4.3/radius.so
> /usr/lib/pppd/2.4.3/radattr.so /usr/lib/pppd/2.4.3/radrealms.so" 
> FILES_ppp-winbind  = "/usr/lib/pppd/2.4.3/winbind.so" 
> FILES_ppp-minconn  = "/usr/lib/pppd/2.4.3/minconn.so" 
> FILES_ppp-password = "/usr/lib/pppd/2.4.3/pass*.so" 
> ------------------>snip<-------------------
> 
> I can't imagine that it is intentionally to have hardcoded pathes
> with *2.4.3* in it here.
> 
> The ppp_2.4.5.bb recipe in oe-dev looks much cleaner. Is there
> someone who feels as a maintainer of ppp and can do some housekeeping
> here?

The OE-core recipe also has a ton of QA errors being reported, so I
wouldn't use that as an example of how to do things.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFODe3qMkyGM64RGpERAj5XAJ9cHJUSIcJ6sS6bqfNYSTYB6/KgSgCeNxZk
i6REs8lKOlBywYBoXpzt+PA=
=5yYU
-----END PGP SIGNATURE-----



