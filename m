Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UODHH-0002Va-Cd
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 22:30:28 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 815F6D1AA61
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2013 22:13:13 +0200 (CEST)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id C3A6DA6217;
	Fri,  5 Apr 2013 22:13:06 +0200 (CEST)
Date: Fri, 5 Apr 2013 22:13:05 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: clarson@kergoth.com
Message-ID: <20130405221305.6a7ae319@e6520eb>
In-Reply-To: <CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
	<CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Fri, 05 Apr 2013 20:30:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

Le Fri, 5 Apr 2013 10:02:22 -0700,
Chris Larson <clarson@kergoth.com> a =C3=A9crit :
> I'm a bit confused about why this went in. danny is a stable branch, and
> this is clearly not a bugfix. Did the existence of this recipe actually
> cause a problem? This just caused a temporary build break for us due to
> bbappending to a removed recipe. What exactly is the policy for meta-oe's
> danny branch, if it's not "bugfixes only"?

I usually apply patches to danny-next and wait at least one week to get
feedback before pushing to danny (and usually I try to do that on a
friday).
So if you want to prevent this kind of problem for the future, you may
be able to configure one of your autobuilders to build your
projects using danny-next's branch so that you get the error before the
patches are pushed to danny.

Best regards,
Eric


