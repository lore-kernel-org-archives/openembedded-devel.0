Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oy6el-0007YX-4o
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:29:28 +0200
Received: from [192.168.42.217] (unknown [92.117.88.188])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 46FC81B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:31:51 +0000 (UTC)
Message-ID: <4C98EB61.6070000@freyther.de>
Date: Wed, 22 Sep 2010 01:29:05 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284933592-4558-1-git-send-email-pirobk@gmail.com>	<4C9693E5.3040504@freyther.de>
	<AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
In-Reply-To: <AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Tue, 21 Sep 2010 17:29:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 09/21/2010 02:16 AM, Bj=F6rn Krombholz wrote:

>> use startsWith and avoid the extra array allocation?
>=20
> Array slicing just provides a new mapping onto the original array and
> doesn't copy any data.
>=20
> I chose this syntax to make it consistent with qt4x11.bbclass

Well, it creates a new object, and you need to count things by hand (even=
 if
humans have hands they tend to fail on that). Using the starts with funct=
ion
is safer and avoid creating extra objects. :)


