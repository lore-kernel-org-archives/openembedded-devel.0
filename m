Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pirobk@gmail.com>) id 1PPMsr-0008AT-3Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 23:16:41 +0100
Received: by iwn8 with SMTP id 8so11129838iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Dec 2010 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vS/09r2Y7s3HJeVQvhWKEGJjhx0bSAcpf5DC0hCmWCo=;
	b=gg90qPPORQrXA2Ha1sQj3v2GlEen+u4FLviO/R1ek1Mys2g+N+VAAwBsGxyaHvcgao
	8J2cSUZ+aM80XuStgZ0yvZothwRxTMcBFPCfj8BJR9riFzWeB2kxLF9dC9FZPdxlCtlw
	Wz1AMRHSZLwzsOFfeHOIdiq9OMCXGJnp5aT4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=V9ixxCjzTb3vFP9TWQ3WhP8UbQsRtm1A78bKnuvO9u4ZoJto9oShfykxz1SUpRmh8l
	19eWP7fyAmp94aKZXW+nn2u6M8y+o2kKXICi6MvMl0InkNWKU8hpKGDp6cHNlIax6+Hf
	d9ZXf4Cq+5CawM9eHl2V/MNg3CP/pd6u1IUPk=
MIME-Version: 1.0
Received: by 10.42.227.195 with SMTP id jb3mr1237527icb.224.1291587314840;
	Sun, 05 Dec 2010 14:15:14 -0800 (PST)
Received: by 10.42.176.131 with HTTP; Sun, 5 Dec 2010 14:15:14 -0800 (PST)
Date: Sun, 5 Dec 2010 23:15:14 +0100
Message-ID: <AANLkTi=hznaSZz6erP3oQF4Ffnw+jxdK=+1hzYK-kusU@mail.gmail.com>
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: pirobk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: PREFERRED_PROVIDER and RDEPENDS
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
X-List-Received-Date: Sun, 05 Dec 2010 22:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

qt4-x11-free and qt4-x11-free-gles both provide qt4-x11-free.

Setting

PREFERRED_PROVIDER_qt4-x11-free = "qt4-x11-free-gles"

works as expected. When you bitbake qt4-x11-free you will get the -gles variant.

On the other hand, when bitbaking task-qt4-x11 which RDEPENDS
on qt4-x11-free it is trying to build qt4-x11-free.bb and not the -gles recipe.

Is this a general bug? Or would the correct way be adding something like
RPROVIDES += "virtual/qt4-x11"
to qt4-x11-free.inc and changing the RDEPENDS to the virtual package?


