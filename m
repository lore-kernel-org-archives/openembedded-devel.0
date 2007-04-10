Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HbKCa-0004QD-AK
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 19:32:20 +0200
Received: from [192.168.1.23] (44.84-48-58.nextgentel.com [84.48.58.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 795EF1BF29B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 19:32:23 +0200 (CEST)
From: =?utf-8?q?=C3=98yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2007 19:32:19 +0200
User-Agent: KMail/1.9.5
References: <461BB515.7030108@balister.org>
	<200704101902.04699.repvik@kynisk.com>
	<461BC751.4090606@balister.org>
In-Reply-To: <461BC751.4090606@balister.org>
MIME-Version: 1.0
Message-Id: <200704101932.19318.repvik@kynisk.com>
Subject: Re: RFC: U-Boot package clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 17:32:20 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 10 April 2007 19:20, Philip Balister wrote:
> =C3=98yvind Repvik wrote:
> > I think I moved uboot-utils away from the uboot-utils directory and into
> > u-boot. Either way, it's not quite done yet. I'll take a look at them a=
nd
> > remove whichever one is "wrong".
> >
> >>   uboot-utils_1.1.2.bb <- This is PR5 and the one in the uboot-utils is
> >> PR4
>
> I think uboot-utils belongs in the u-boot directory.=20

Yes. The correct .bb is in the uboot-directory, but the patches in=20
packages/uboot-utils/u-boot-1.2.0/ weren't moved at the same time.=20
I'll move that first ;-)

>
> Can we modify u-boot.inc to create the u-boot-utils package internally?

IIRC, "make all" also builds the utils. This would be the best way to build=
=20
the utils, instead of a separate u-boot-utils.bb.=20

My strategy would be something like this:

Remove 1.1.2 and 1.1.4 (unless someone uses them, of course)

Move as much common stuff into u-boot.inc as possible.

Add u-boot-utils as a sub-package of u-boot.=20

What do you think about that?

=C3=98yvind


