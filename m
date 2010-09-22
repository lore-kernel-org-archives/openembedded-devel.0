Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OyLPO-0001X1-42
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 11:14:34 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 41809110026D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 11:14:31 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1BCAD1100248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 11:14:30 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225005123.adsl.alicedsl.de
	[92.225.5.123]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 11:14:30 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id D44403C0D8; Wed, 22 Sep 2010 11:14:11 +0200 (CEST)
Date: Wed, 22 Sep 2010 11:14:11 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100922091411.GA24330@rhein.zuhause.netz>
References: <243538.53234.qm@web30303.mail.mud.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <243538.53234.qm@web30303.mail.mud.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4-embedded-gles only build runtime libraries
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
X-List-Received-Date: Wed, 22 Sep 2010 09:14:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 02:55:11PM -0700, Doug Crawford wrote:
> If I include qt4-embedded-gles in my IMAGE_INSTALL then bitbake builds =
all of=20
> qt4: runtime libs, demos, and development tools.=A0 How can I specify t=
hat I only=20
> want to build the qt runtime libs or just specific runtime libs and not=
 build=20
> the demos, documentation, or dev tools?=A0 I still want to use the=20
> qt4-embedded-gles recipe to include the opengl symbols in the gui libra=
ries.
>=20
> Thanks,
> Doug

Thats not possible. You have to write your own qt-recipes, where demo and=
 example stuff
is disabled. By the way putting "qt4-embedded-gles into IMAGE_INSTALL" is=
 wrong anyway.
qt4-embedded-gles is only a build target not the resulting packages.

Bye,

Henning


