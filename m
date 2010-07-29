Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OeQ6t-0002Cp-Q7 for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 12:13:20 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 29 Jul 2010 12:01:42 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 29 Jul 2010 12:12:42 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 29 Jul 2010 12:12:41 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 29 Jul 2010 12:12:40 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B58E2@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: eggdbus-native fails to build, dbus-glib-1.so is missing
Thread-Index: AcsvBpP6fFuE4zj8QEyzCuNai4fJzw==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 29 Jul 2010 10:12:41.0999 (UTC)
	FILETIME=[949FA1F0:01CB2F06]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: eggdbus-native fails to build, dbus-glib-1.so is missing
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
X-List-Received-Date: Thu, 29 Jul 2010 10:13:21 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

the latest pull of http://git.gitourious.org/angstrom/openembedded.git
results in a missing dbus-glib-1.so while linking eggdbus.

The problem was in dbus-glib.inc, where the glib-dbus-native staging
package don't include the shared library, the pkg-config.pc is
available.

Seems, that the changes of the staging cause the error, an older version
of OE containing a dbus-glib-native recipe was working well.

Regards
Wolfgang Hauser



