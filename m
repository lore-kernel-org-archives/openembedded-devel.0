Received: from [195.135.220.2] (helo=mx1.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LpQiA-0008J3-7P
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 19:28:43 +0200
Received: from Relay1.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id 74C2D6CB00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 19:25:52 +0200 (CEST)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id D43CD62806A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 19:25:51 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200904021643.32367.marcin@juszkiewicz.com.pl>
References: <1238678587.27664.36.camel@hammer.suse.cz>
	<200904021643.32367.marcin@juszkiewicz.com.pl>
Date: Thu, 02 Apr 2009 19:25:50 +0200
Message-Id: <1238693150.22651.8.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.25.92 
X-SA-Exim-Connect-IP: 195.135.220.2
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI, 
	RDNS_NONE,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] introduction of virtual/gail
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
X-List-Received-Date: Thu, 02 Apr 2009 17:28:51 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz wrote:
> Dnia czwartek, 2 kwietnia 2009 o 15:23:07 Stanislav Brabec napisa=B3(a)=
:
> > gtk+ >=3D 2.13.0 already includes gail. However build of gail package
> > may be still triggered by a number of package that require it
> > explicitly. It causes runtime problems having two different packages
> > providing the same library.
> >
> > This patch introduces virtual/gail, which can be satisfied by gtk+ >=3D
> > 2.13.0 or gail, depending on preferred version of gtk+ of a
> > particular distro.
>=20
> Please bump PR of affected GTK+ recipes and I will Ack it.

OK, I will do.

There is one remaining problem: How to create correct RREPLACES for all
locale packages?

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



