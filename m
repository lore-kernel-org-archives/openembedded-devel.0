Received: from pasmtpa.tele.dk ([80.160.77.114])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1OR4A6-0008Om-UQ for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:09:15 +0200
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpA.tele.dk (Postfix) with ESMTP id C740B8002EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 15:32:03 +0200 (CEST)
Received: from koontz.localnet ([10.115.0.128]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 22 Jun 2010 15:33:47 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 15:32:02 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.32-23-generic; KDE/4.4.4; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201006221532.02203.sgh@sgh.dk>
X-OriginalArrivalTime: 22 Jun 2010 13:33:47.0953 (UTC)
	FILETIME=[8B355A10:01CB120F]
X-SA-Exim-Connect-IP: 80.160.77.114
X-SA-Exim-Mail-From: sgh@sgh.dk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Image creation while >1 package versions build
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
X-List-Received-Date: Tue, 22 Jun 2010 14:09:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I have trouble getting the correct package-versions in my image when my=20
application is compiled in several versions.

The case is that I sepcify that specify PREFERRED_VERSION_myapp =3D "1.0", =
Myapp=20
is included in my image and when it builds the image myapp-1.0 get pulled i=
n.=20
That is as it should be.

Now I change to PREFERRED_VERSION_myapp =3D "2.0" and build my image again.=
=20
Everything goes well again - myapp-2.0 end up in the image.

If I now change PREFERRED_VERSION_myapp back to "1.0" and rebuild the image=
 it=20
is always myapp-2,0 that ends up in the image. The only way to get myapp-1.=
0 in=20
the image is to delete the generate myapp-2.0.ipk in tmp/deploy/....

I'm using an OE snapshot from around january, so this issue might be fixed.

=2D-=20
S=F8ren Holm


