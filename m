Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ogect-0007w8-0p
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:07:25 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 9CE0E4657
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:11:49 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Aug 2010 18:07:06 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201008041807.06239.khimov@altell.ru>
X-Altell-MailScanner-ID: 9CE0E4657.14DDA
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] perl: use only one method all_perl_packages
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
X-List-Received-Date: Wed, 04 Aug 2010 14:07:25 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 04 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=
=B0 2010 17:51:57 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fischer=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> .. to avoid
> ERROR: Error Method already seen: all_perl_packages in' perl_5.8.8.bb'
> now in 'perl_5.10.1.bb'
>=20
> TODO: error() already prints "ERROR:" so the "Error" in above msg is
> redundant
>=20
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

What kind of configuration gives you such an error? Never seen that.

Although the change itself looks good, I'd only probably rename=20
perl_helper.inc to plain perl.inc, we can merge more common things between=
=20
different perl versions later.

Acked-by: Roman I Khimov <khimov@altell.ru>


