Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Qdguw-0005IT-Bb
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 13:02:18 +0200
Received: by bwf20 with SMTP id 20so4564903bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2011 03:58:26 -0700 (PDT)
Received: by 10.204.16.133 with SMTP id o5mr5550883bka.158.1309777106125;
	Mon, 04 Jul 2011 03:58:26 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id e16sm4814712bke.6.2011.07.04.03.58.24
	(version=SSLv3 cipher=OTHER); Mon, 04 Jul 2011 03:58:24 -0700 (PDT)
Message-ID: <4E119CD0.2070607@dresearch-fe.de>
Date: Mon, 04 Jul 2011 12:58:24 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309454880.4401.32.camel@mattotaupa>
	<1309768279-4797-1-git-send-email-sledz@dresearch-fe.de>
	<1309769551.4472.24.camel@mattotaupa>
In-Reply-To: <1309769551.4472.24.camel@mattotaupa>
X-Enigmail-Version: 1.2
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2 1/2] ppp-2.4.5: own package for PPPoL2TP plugin
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
X-List-Received-Date: Mon, 04 Jul 2011 11:02:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2011 10:52, Paul Menzel wrote:
> Am Montag, den 04.07.2011, 10:31 +0200 schrieb Steffen Sledz:
> 
> Could you please add the following to the commit message before you commit?
> 
> Adding that package fixes the following error message.
> 
> NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started WARNING: the following files were installed but not shipped in any package: WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so

added

>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de> --- recipes/ppp/ppp_2.4.5.bb |    6 ++++-- 1 files changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb index 2b6b6f7..883b695 100644 --- a/recipes/ppp/ppp_2.4.5.bb +++ b/recipes/ppp/ppp_2.4.5.bb @@ -3,7 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon" HOMEPAGE = "http://samba.org/ppp/" DEPENDS = "libpcap" LICENSE = "BSD GPLv2" -PR = "r1" +PR = "r2" # Not well tested DEFAULT_PREFERENCE = "-1"
>> 
>> @@ -49,11 +49,12 @@ do_install_append () { }
>> 
>> CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options" -PACKAGES =+ "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools" +PACKAGES =+ "ppp-oa ppp-l2tp ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools" FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd" FILES_${PN}_nylon  = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${sbindir}/tdbread" FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug" FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so" +FILES_${PN}-l2tp     = "${libdir}/pppd/${PV}/pppol2tp.so ${libdir}/pppd/${PV}/openl2tp.so" FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so" FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so" FILES_${PN}-winbind  = "${libdir}/pppd/${PV}/winbind.so" @@ -61,6 +62,7 @@ FILES_${PN}-minconn  =
>> "${libdir}/pppd/${PV}/minconn.so" FILES_${PN}-password = "${libdir}/pppd/${PV}/pass*.so" FILES_${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump" DESCRIPTION_ppp-oa       = "Plugin for PPP needed for PPP-over-ATM" +DESCRIPTION_ppp-l2tp     = "Plugin for PPP needed for PPP-over-L2TP" DESCRIPTION_ppp-oe       = "Plugin for PPP needed for PPP-over-Ethernet" DESCRIPTION_ppp-radius   = "Plugin for PPP that are related to RADIUS" DESCRIPTION_ppp-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
> 
> Putting these additions one line above would sort it alphabetically, would not it? If yes, it would be nice to fix this too before pushing the commit.

sorted

> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

and pushed

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


