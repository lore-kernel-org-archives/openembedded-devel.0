Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1KsHWc-00071O-51
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 15:43:54 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id ED1A216DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 15:51:02 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id F214F2A420A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 15:52:07 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 21 Oct 2008 15:43:15 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>
In-Reply-To: <gdk0so$7qm$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] support another hardware
Thread-Index: AckzUDLSmJhk9yEzTtKOizjH+J+SQAAMqZgQ
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>
	<gdk0so$7qm$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Tue, 21 Oct 2008 13:43:54 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> a) find out which kernel version your custom kernel is (e.g 2.6.27)
> b) extract the diff (diff -Nurd linux-2.6.27/ linux-2.6.27-mymachine/)
> c) add SRC_URI_append_mymachine =3D "file://mymachine.diff" to=20
>    linux_2.6.27.bb
> d) put defconfig in packages/linux/linux-2.6.27/mymachine/defconfig

It seems to be necessary to add DEFAULT_PREFERENCE_mymachine =3D "1" =
too. Right?



