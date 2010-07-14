Received: from ausxippc101.us.dell.com ([143.166.85.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OZ7VB-0007O2-Lm
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 21:20:18 +0200
X-Loopcount0: from 10.166.72.158
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Jul 2010 14:20:06 -0500
Thread-Topic: [oe] SSH configuration question.
Thread-Index: AcsiUUguss2Y8HSsSh+3oZ+ZjUNHbABOCf2Q
Message-ID: <113134CF306E8E4CACC27BE5937261B20931CA5EBA@AUSX7MCPS303.AMER.DELL.COM>
References: <AcsiE3tIy8VpAAlrQiyyzbOb0c/t7w==>
	<113134CF306E8E4CACC27BE5937261B20931BF14A7@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTilaDl7gXH2rDTlpJEr52nJz2O9I6rKCzeFWmoLb@mail.gmail.com>
In-Reply-To: <AANLkTilaDl7gXH2rDTlpJEr52nJz2O9I6rKCzeFWmoLb@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Jul 2010 19:20:08.0005 (UTC)
	FILETIME=[922C2750:01CB2389]
X-SA-Exim-Connect-IP: 143.166.85.207
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SSH configuration question.
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
X-List-Received-Date: Wed, 14 Jul 2010 19:20:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip.  The patch included below seems to do the trick.

diff --git a/recipes/openssh/openssh.inc b/recipes/openssh/openssh.inc
index 9e4ca14..f20f27c 100644
--- a/recipes/openssh/openssh.inc
+++ b/recipes/openssh/openssh.inc
@@ -1,4 +1,5 @@
 DEPENDS =3D "zlib openssl"
+DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}=
"
=20
 RCONFLICTS_${PN} =3D "dropbear"
 RCONFLICTS_${PN}-sshd =3D "dropbear"
@@ -26,7 +27,8 @@ CFLAGS_prepend =3D "-I${S} "
 CFLAGS_append =3D " -D__FILE_OFFSET_BITS=3D64"
 LDFLAGS_prepend =3D "-L${S} -L${S}/openbsd-compat "
 EXTRA_OECONF =3D "--disable-suid-ssh --with-ssl=3D${STAGING_LIBDIR}/ssl \
-               --with-rand-helper=3Dno --without-pam \
+               --with-rand-helper=3Dno \
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '=
--without-pam', d)} \
                --without-zlib-version-check \
                --with-privsep-path=3D/var/run/sshd \
                --sysconfdir=3D${sysconfdir}/ssh \


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Tuesday, July 13, 2010 1:03 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] SSH configuration question.

On Mon, Jul 12, 2010 at 3:42 PM,  <Sean_Hudson@dell.com> wrote:
> All,
>
> =A0What is the best way to update the configuration used to build SSH?
>
> =A0Specifically, I'd like to build SSH with pam enabled, however, the con=
figuration in the recipes/openssh/openssh.inc specifies "-without-pam".
>

in your case you could use DISTRO_FEATURE to check if pam is available
and set the option accordingly. something like below

EXTRA_OECONF +=3D ${@base_contains('DISTRO_FEATURES', 'pam',
'--with-pam', '--without-pam', d)


Thx
-Khem

> Regards,
> =A0 =A0 -Sean
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


