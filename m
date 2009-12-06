Received: from mail-yw0-f122.google.com ([209.85.211.122])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NHMSF-0002kK-9e
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 20:07:39 +0100
Received: by ywh28 with SMTP id 28so675737ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 11:05:55 -0800 (PST)
Received: by 10.91.161.26 with SMTP id n26mr4636029ago.88.1260126354564;
	Sun, 06 Dec 2009 11:05:54 -0800 (PST)
Received: from localhost (elphelut.fttp.xmission.com [166.70.233.217])
	by mx.google.com with ESMTPS id 7sm2243342yxd.8.2009.12.06.11.05.53
	(version=SSLv3 cipher=RC4-MD5); Sun, 06 Dec 2009 11:05:53 -0800 (PST)
Date: Sun, 6 Dec 2009 12:05:13 -0700
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091206120513.235ea20a@xora.org.uk>
In-Reply-To: <ac9c93b10912061051j6826faiaa2f3fcbdd5b850b@mail.gmail.com>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
	<20091202114959.GA8668@zlo.nu>
	<ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
	<20091206075442.5eda3c23@xora.org.uk>
	<ac9c93b10912061051j6826faiaa2f3fcbdd5b850b@mail.gmail.com>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.211.122
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Sun, 06 Dec 2009 19:07:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Dec 2009 19:51:21 +0100
Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:

> 2009/12/6 Graeme Gregory <dp@xora.org.uk>:
> > On Sun, 6 Dec 2009 13:17:16 +0100
> > Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> >
> >> It would also be nice to be able to get the used by information.
> >> E.g. if I change a package (especially wrt staging) I would like to
> >> verify that the packages which use the modified package still
> >> build.
> >>
> >> The current el-cheapo solution for a package XYZ is to do something
> >> like a grep =C2=A0DEPENDS.*XYZ */*.bb but of course that won't work if
> >> DEPENDS spans multiple lines.
> >>
> > bitbake -g target will drop a dependency graph in the directory you
> > run bitbake from.
> >
> > Graeme
>=20
> Graeme, I know but I would like to have exacty the reverse: a list of
> packages that depend on the package at hand.
> bitbake -g gives all packages a package depends on, but I would like
> to have a list of packages that depend on a specific package.
>=20
> so e.g. I want to get a list of packages that depend on libxml (and
> bitbake -g libxml gives me the packages libxml depends on).
>=20
> I hope that clarifies my question.
>=20
Still the same answer, bitbake -g world then parse the graph.

Graeme



