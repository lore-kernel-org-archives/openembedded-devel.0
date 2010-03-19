Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NsZSx-0007q3-Az
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 11:30:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2JAR1cF014053
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 10:27:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13768-05 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 10:26:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2JAQrmr014047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 10:26:54 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hnviha$nf1$1@dough.gmane.org>
References: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
	<1268990986.3893.5.camel@mattotaupa>  <hnviha$nf1$1@dough.gmane.org>
Date: Fri, 19 Mar 2010 10:26:52 +0000
Message-ID: <1268994412.4292.0.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	o2JAR1cF014053
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Fri, 19 Mar 2010 10:30:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-03-19 at 11:09 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 19-03-10 10:29, Paul Menzel wrote:
> > Am Mittwoch, den 17.03.2010, 21:22 +0100 schrieb Steffen Sledz:
> >=20
> > [=E2=80=A6]
> >=20
> >> diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/lib=
unwind.inc
> >> new file mode 100644
> >> index 0000000..8513dc2
> >> --- /dev/null
> >> +++ b/recipes/libunwind/libunwind.inc
> >> @@ -0,0 +1,13 @@
> >> +DESCRIPTION =3D "a portable and efficient C programming interface (=
API) to determine the call-chain of a program"
> >> +DEPENDS =3D ""
> >=20
> > Remove this empty variable?
>=20
> I think that's meant to do what INHIBIT_DEFAULT_DEPS does, but I'm not =
sure.

FWIW, it won't do that. It does appear to be totally purposeless.

Cheers,

Richard



