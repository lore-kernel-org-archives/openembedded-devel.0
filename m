Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXqz9-0004U7-BS
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 07:57:46 +0100
Received: by fxm28 with SMTP id 28so4125707fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 22:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/4Cx1ooXdq9DOJjrlSGBhS+4Rl6+x0kb8A50tw0zneo=;
	b=tZ/SLO61tjkPlkNrw1jPziR3imuneGUE1DTzts0vyO7ttWXeTRAMOUH93y7UI5K94A
	OHlMAXgkTWzdbJ1WpXpK1dkLEMhOXbldQFD/9Wwr8HOWEbnIDE+lm4jvDDiKYkNLxNZs
	ie0g6J6slRYPOdVCnvVN8QHymXrcEd2lH4xCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gQGzx60qM7HRK/UN0xoo2T314WDm4hwhyMoRhcIT7epbzIe0YlxBJ+9Osofhw+n+oT
	DHeeucD1XkbUoS9GFSoIaGRBPIxfA7My5wIG2mniqJxlLFZDktseewT284+1Eha9Fzq+
	LDEYurLALS/9pT4+FBN3t56CGy1X99VL1tX1o=
MIME-Version: 1.0
Received: by 10.223.5.90 with SMTP id 26mr999413fau.59.1264056926705; Wed, 20 
	Jan 2010 22:55:26 -0800 (PST)
In-Reply-To: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 21 Jan 2010 07:55:26 +0100
Message-ID: <141020e31001202255q5be48fe9j3ca8ae6dc140432b@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.228
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Xorg upgrade and libpixman removal
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
X-List-Received-Date: Thu, 21 Jan 2010 06:57:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 20, 2010 at 1:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> libpixman-native and pixman "conflicts"
>
> It ends like this (libpixman-native is 0.10.0):
> arm-oe-linux-gnueabi-libtool: link: cannot find the library
> `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la'
> or unhandled argument
> `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la'
>
> It can be resolved by rebuilding both in right order, but libpixman was
> used only in cairo-native, so I moved libpixman to obsolete and added
> pixman-native to normal pixman recipes (Koen agreed that libpixman can be
> removed)

Old pixman and xorg upgrade pushed,

pixman_0.17.4 waiting for test on arm7..

> Can someone test NEON on armv7?
> especially pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch,
> because it was partially included upstream and I'm not following it as close as I should :).


