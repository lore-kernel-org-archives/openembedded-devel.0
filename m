Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Pzk9M-0005GF-Cq
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 07:24:04 +0100
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Pzk7h-0005W0-Ud from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 23:22:22 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 16 Mar 2011 07:22:18 +0100
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1300254477.2818.5.camel@eha>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Python-native dependency in libxml2
Thread-Index: Acvjnv9+NDQoSDiGRFakgj3Mic2aHgAAqQAg
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de><1300180117.2522.14.camel@eha>
	<20110315220301.GC3042@denix.org> <1300254477.2818.5.camel@eha>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 06:24:04 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I was looking at the libxml2 package. While going through the recipes I
came to know that its native package depends on python-native package as
well. This dependency is defined in libxml2.inc file.=20

DEPENDS_virtclass-native =3D "python-native"

This package build fine after removing this dependency. I am not clear
why this dependency is being added in libxml2 package. Can somebody
clear that to me. While looking at the git log I came to know that this
change is coming from libxml2-native.inc file. But I am not clear why
this dependency was added as this package build fine without it.

Please help me in understanding this dependency. Thanks.

Regards,
Noor


