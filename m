Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 28 May 2016 08:33:11 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C3A32608B7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 08:33:11 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1b6ZRg-0007eF-0c for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2016 10:18:08 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 10:18:07 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 10:18:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 May 2016 10:17:46 +0200
Message-ID: <nibk7a$fm1$1@ger.gmane.org>
References: <1464359669-14962-1-git-send-email-akuster808@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
In-Reply-To: <1464359669-14962-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-multimedia][master][krogoth][PATCH] dvd-apps: Fix several QA WARNINGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 May 2016 08:33:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 27-05-16 om 16:34 schreef Armin Kuster:
> Example: WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: 
> /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, but
> no providers found in RDEPENDS_dvbdate? [file-rdeps] WARNING: 
> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbtraffic contained 
> in package dvbtraffic requires libdvbapi.so, but no providers found in 
> RDEPENDS_dvbtraffic? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
> do_package_qa: QA Issue: /usr/bin/dvbscan contained in package dvb-scan 
> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-scan? 
> [file-rdeps] WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: 
> /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, but 
> no providers found in RDEPENDS_dvb-apps? [file-rdeps] WARNING: 
> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/femon contained in 
> package dvb-femon requires libdvbapi.so, but no providers found in 
> RDEPENDS_dvb-femon? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
> do_package_qa: QA Issue: /usr/bin/dvbnet contained in package dvbnet 
> requires libdvbapi.so, but no providers found in RDEPENDS_dvbnet? 
> [file-rdeps]
> 
> and WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbscan 
> contained in package dvb-scan requires libdvbcfg.so, but no providers 
> found in RDEPENDS_dvb-scan? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
> do_package_qa: QA Issue: /usr/bin/gotox contained in package dvb-apps 
> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? 
> [file-rdeps]

This shows that OE adds RDEPENDS automagically but can't find the matching
RPROVIDERS, so ....


> Signed-off-by: Armin Kuster <akuster808@gmail.com> --- 
> meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb | 10 ++++++++++ 1 
> file changed, 10 insertions(+)
> 
> diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb 
> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb index 
> 1c0d686..d6465d7 100644 --- 
> a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb +++ 
> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb @@ -63,6 +63,9 
> @@ PACKAGES =+ "dvb-evtest dvb-evtest-dbg \ dvb-femon dvb-femon-dbg \ 
> dvb-zap-data"
> 
> +# Expose the packages from the above spitting +PACKAGES =+ "libdvbapi 
> libdvbcfg libdvben50221 \ +             libesg libucsi libdvbsec"

... this would fix that, but ..

> FILES_${PN} = "${bindir} ${datadir}/dvb" FILES_${PN}-doc = "" @@ -104,3 
> +107,10 @@ FILES_dvb-femon = "${bindir}/femon" FILES_dvb-femon-dbg = 
> "${bindir}/.debug/femon"
> 
> FILES_dvb-zap-data = "${docdir}/dvb-apps/szap" + +RDEPENDS_dvbdate =+ 
> "libdvbapi libucsi" +RDEPENDS_dvbtraffic =+ "libdvbapi" 
> +RDEPENDS_dvb-scan =+ "libdvbapi libdvbcfg libdvbsec" +RDEPENDS_dvb-apps 
> =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi" 
> +RDEPENDS_dvb-femon =+ "libdvbapi" +RDEPENDS_dvbnet =+ "libdvbapi"

... this part isn't needed since the QA issue above wouldn't have triggered
otherwise.

regards,

Koen



