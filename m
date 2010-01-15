Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NVfn4-0003Gq-Eh
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 07:36:17 +0100
Received: (qmail 17721 invoked by uid 813007); 15 Jan 2010 06:34:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Jan 2010 06:34:04 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 07:33:59 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <> <20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001150733.59792.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 06:36:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 15 stycznia 2010 o 02:35:13 Guo Hongruan napisa=C5=82(a):
> =E5=9C=A8 Fri, 15 Jan 2010 03:53:01 +0800=EF=BC=8CKhem Raj <raj.khem@gmai=
l.com> =E5=86=99=E9=81=93:
> > On (14/01/10 17:19), Guo Hongruan wrote:
> >> After changing this way, the native tools can be shared with
> >> different buildings.
> >
> > They get shared even now. I have my TMPDIR =3D /scratch/oe/build and
> > DEPLOY_DIR =3D ${TMPDIR}/deploy/${LIBC}
> >
> > I share the native tools all the time
=20
> This way, the packages built in ${TMPDIR}/work/ will bother each other. It
> is obvious that a binary package built based on uclibc is different with
> the same one built base on glibc. So I think it's better to classify them
> using ${LIBC}.

As long as you do build for uclibc and glibc/eglibc in one TMPDIR they are=
=20
fine due to different TARGET_SYS. Problem starts when you want to share gli=
bc=20
and eglibc builds as they use same TARGET_SYS. And thats when you need=20
something to separate TMPDIR. But as I wrote before you can alter name of=20
directories in your local.conf without changing them for rest of our users.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




