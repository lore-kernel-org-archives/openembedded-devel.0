Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NbsWC-0002mQ-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 10:24:31 +0100
Received: (qmail 16411 invoked by uid 813007); 1 Feb 2010 09:22:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Feb 2010 09:22:04 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Feb 2010 10:21:47 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <op.u7dv44vqmn1qzu@camelguo>
In-Reply-To: <op.u7dv44vqmn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201002011021.47660.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: circular dependency when building linux_2.6.25.bb
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
X-List-Received-Date: Mon, 01 Feb 2010 09:24:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 31 stycznia 2010 o 07:25:42 Guo Hongruan napisa=C5=82(a):
> Hi guys,
>    I tried to build openembedded with the following configration in my
> local.conf
> MACHIN=3Dat91-l9260
> DISTRO=3Dmicro
> LIBC=3Dglibc
>=20
> But I failed to start building and met the following error:
> ERROR: Unbuildable tasks were found.
> These are usually caused by circular dependencies and any circular
> dependency chains found will be printed below. Increase the debug level to
> see a list of unbuildable tasks.

Try this patch:

10:21 hrw@home:linux$ git diff .
diff --git a/recipes/linux/linux_2.6.25.bb b/recipes/linux/linux_2.6.25.bb
index a89374a..38e651b 100644
=2D-- a/recipes/linux/linux_2.6.25.bb
+++ b/recipes/linux/linux_2.6.25.bb
@@ -98,5 +98,5 @@ python do_compulab_image() {
 }


=2Daddtask compulab_image after do_deploy before do_package
+addtask compulab_image after do_deploy before do_build

As we moved deploy task to be *after* package.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




