Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OszPP-0007it-4L
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 16:44:28 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o87Ehknq009271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:43:46 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o87Ehjux006652
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:43:46 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o87EhjBa008091
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Sep 2010 09:43:45 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Tue, 7 Sep 2010 09:43:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Sep 2010 09:43:44 -0500
Thread-Topic: [oe] [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make
	it	global
Thread-Index: ActL35ys6JiqTSKzTnCMLD83n/YVEwCumRKw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFA4BD@dlee06.ent.ti.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it	global
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
X-List-Received-Date: Tue, 07 Sep 2010 14:44:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> add global OVERRIDES ${TARGET_SOC_FAMILY} and
> ${TARGET_ARCH}_${TARGET_SOC_FAMILY}
>=20
For my part I would ask why you are renaming SOC_FAMILY to TARGET_SOC_FAMIL=
Y?  Why not leave the name the way it is since others may be using it in ov=
erlays, etc?

Also, you might want to make sure your patch would include Fran's fix to ba=
se.bbclass that he mentioned at http://lists.linuxtogo.org/pipermail/openem=
bedded-devel/2010-September/023680.html

For what my input is worth I would NAK this patch because:

1.  I don't see a reason to add this to the generic set of overrides.
2.  I don't understand why the name of the variable SOC_FAMILY needs to be =
changed.  I know this will break existing overlays and I don't see any reas=
on why the change is made.
3.  I disagree with the ${TARGET_ARCH}_${TARGET_SOC_FAMILY} override.  If y=
ou have two patch series for different architectures then you should have t=
wo SOC_FAMILY settings or use the MACHINE setting for the override.  I thin=
k this override is confusing and redundant.


