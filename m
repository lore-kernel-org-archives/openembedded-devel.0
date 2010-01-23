Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYdcZ-0006Eu-4J
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:53:42 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 60BBB1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 10:50:11 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 11:51:03 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1264241020.3630.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<op.u6zdrp0kmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u6zdrp0kmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001231151.03392.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: add fw-and-powerpc-install.patch
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
X-List-Received-Date: Sat, 23 Jan 2010 10:53:42 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 23 January 2010 11:22:27 Guo Hongruan wrote:
> =E5=9C=A8 Sat, 23 Jan 2010 18:03:40 +0800=EF=BC=8CPaul Menzel
>=20
> <paulepanter@users.sourceforge.net> =E5=86=99=E9=81=93:
> > Am Samstag, den 23.01.2010, 17:53 +0800 schrieb Guo Hongruan:
> >> the building of linux-storcenter_2.6.27.7 failed due to lack of this
> >> patch
> >
> > I think Holger meant, what the patch is doing. Maybe it is not needed
> > and you can remove it from `SRC_URI`.
>=20
> I just copied it from linux-orion directory. This patch just adds space
> between '-m' and 'mode'. (see the patch) On my ubuntu-8.04, 'install
> -m0644' is the same as 'install -m 0644', so this patch can be removed
>  from SRC_URI. But I don't know whether or not it is an issue on other
> linux operation systems.

This was a general remark on commit messages. I wanted to point out
that your commit message does not say anything and this normally means
if you are not able to say what the issue is you don't understand it yourse=
lf.

So from this thread and the fact you were copying the file it means. That t=
he
current "linux-storcenter" recipe is failing in the do_patch phase because =
the
file can not be found?

The first thing to note is your commit message should include the problem
you are trying to fix! Now the second thing is to figure out to fix it. E.g=
=2E=20
where is the SRC_URI touched? Maybe it does make sense to copy the patch to=
=20
recipes/linux/files? Or to version it as well? Or maybe it is not needed at=
=20
all?

I would really appreciate if you could put some more care into the patches =
you=20
are writing, this starts with the commit message and should be continued wi=
th=20
the content of the patch itself.


thanks
	z.




