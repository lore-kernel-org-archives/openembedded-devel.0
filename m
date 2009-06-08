Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MDhJW-0006CI-Qw
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 18:03:10 +0200
Received: (qmail 1878 invoked by uid 813007); 8 Jun 2009 15:53:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Jun 2009 15:53:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jun 2009 17:54:49 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.4;
	x86_64; ; )
References: <200906031325.48159.marcin@juszkiewicz.com.pl>
In-Reply-To: <200906031325.48159.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200906081754.50176.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Mon, 08 Jun 2009 16:03:11 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 3 czerwca 2009 o 13:25:43 Marcin Juszkiewicz napisa=C5=82(=
a):
> This patch unbreaks current behaviour which was introduced by
> MACHINE_KERNEL_PR variable.
>
> As most of target machines do not use it they have PR with broken
> value (set to "r0" instead of value in recipe). I took other way
> which makes both types of users happy -- those with MACHINE_KERNEL_PR
> in use and those without it.
>
> By default we set M_K_PR to empty string instead of "r0" - this
> allows to check is it set at all or not. If it is set then we set PR
> to this value. Otherwise we ignore existance of that variable and use
> PR from recipe.
>
> Please test and review it. If this will work I will request it for
> stable/2009.

Someone tested that? I would like to get it in .dev and stable/2009 but=20
not without testing.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




