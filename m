Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MDNxG-0006Im-ME
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 21:22:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 2DE7B1422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 21:14:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toebvaPj5LiX
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 21:14:09 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 05EC314171A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 21:14:08 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244385233.4151.27.camel@lenovo.internal.reciva.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
Date: Sun, 07 Jun 2009 21:13:30 +0200
Message-Id: <1244402010.4463.36.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: e2fsprogs-libs failed on	latest	org.openembedded.dev	branch
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
X-List-Received-Date: Sun, 07 Jun 2009 19:22:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> > I was hoping that it was fixed by this commit:
> > http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3ac37=
564039127c80eb5cf109fddf23a8e438bf8
> >=20
> > Can you confirm, that you have a newer snapshot?
>=20
> That commit doesn't obviously look like it would fix anything; it seems
> to just be tweaking the names of some local variables.  What was the
> intent of that change?

>/home/daniel/work4/oe_fr/tmp/work/armv4t-angstrom-linux-gnueabi/util-lin=
ux-ng-2.15-r3/install/e2fsprogs-libs-dbg
=EF=BB=BF
1. This path apparently mixes path elements defined by two different
recipes. I was under impression, that there exists some type of
unintended =EF=BB=BFcv_libdir inheritance between these two recipes. Mayb=
e my
impression was incorrect, but

2. After applying of this patch, I did not see this error any more.
I even tested rebuild from scratch with no error. And finally

3. The =EF=BB=BFvariable name cv_libdir is deduded from "libcv" in opencv=
 recipe
and has no relation to e2fsprogs nor util-linux-ng.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



