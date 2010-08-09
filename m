Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OiOqp-0006ZB-V6 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 11:41:02 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet1.eads.net with ESMTP; 09 Aug 2010 11:29:56 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 9 Aug 2010 11:40:31 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 9 Aug 2010 11:40:31 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Aug 2010 11:40:29 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E3E@deimsg40.de.net.world>
In-Reply-To: <1281346042.3767.6.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] busybox: fix defconfig handling problems triggered
	by "configure according to {MACHINE, DISTRO}_FEATURES";
	added inetd handling (resent)
Thread-Index: Acs3pUqYE0IVSVpiTVCvIAUBXX68XQAALQ7Q
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E17@deimsg40.de.net.world>
	<1281346042.3767.6.camel@mattotaupa>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Aug 2010 09:40:31.0310 (UTC)
	FILETIME=[E8631EE0:01CB37A6]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling (resent)
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
X-List-Received-Date: Mon, 09 Aug 2010 09:41:02 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'll try it again, it's not easy to send out something in a proper way =
from the "restricted area" here. (git-send-email is impossible for =
example)

But by the way, it may be very useful for newbees like me to have an =
HowTo to create a patch in a proper way, including the necessary git =
commands and a complete example for subject and header data.

Regards
Wolfgang Hauser
   =20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Paul Menzel
Gesendet: Montag, 9. August 2010 11:27
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] [PATCH] busybox: fix defconfig handling problems =
triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added =
inetd handling (resent)

Dear Wolfgang,


thank you for your effort. If the subject line is that long, please put
[RESENT] after [PATCH] so that the tools can strip it automatically.

Am Montag, den 09.08.2010, 10:12 +0200 schrieb Hauser, Wolfgang =
(external):
> busybox: fix defconfig/.config usage; add inetd, telnetd package; add
> inetd support for ftpd, telnetd, httpd
>=20
> *Use ${S}/.config instead of ${WORKINGDIR}/defconfig for installing
> confguration dependend parts.
> *This applies the changes done by DISTRO_FEATURES processing.
> *Added configuration dependend packages for inetd, telnetd, httpd =
which
> enable inetd based daemon starting or standalone starting.
> *Enable starting of ftpd by inetd.

as pointed out in another post by someone, the commit policy require a
Signed-off-by: Name <address> line [1].

> ---
>  recipes/busybox/busybox.inc           |  220
> ++++++++++++++++++++++++++++++---

It looks like your MUA mangled the patch. You should turn off automatic
line wrapping, use `git-send-email` or attach the patches.

[...]

Please send a second revision marked as [PATCH v2] and remember to
update the patch queue [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork


