Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MhXYS-00088c-AC
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 01:41:56 +0200
Received: by fxm24 with SMTP id 24so1189165fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4w6zdH+WKrVuOjaqqiLu9y0k6rIE3/TsUAePMconShw=;
	b=qjH2syhd8tlOb5qA1qZXP628e9Z9QCo6pvueVeDAZoarsoK5KsuYyn0p240H+aT4Wn
	xLjQaKNrINWCgZdNEZU0rli499tcoJk3GBlzNb+8jkzqIHLiwDUwhoBCEOpWRwqZDSBM
	XBxS8J+LWMgNHqvHWKMa1Mzel1EyBImN+OSjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DUA4lmXRKCZRMLBi0WW5xQs2CEB+SJd2nIAu60zItdDwVEN8GoNfWLAJn9RnMg5wXi
	Ua0IDnKxBS5/JVodiX3owdT66U+pjX437bQKhR3+UQ0rAxjQoynxfTaGk4AwBALrr3PW
	CtlV1xxp51/S6Ho8E+wADMhONdHgHpLRJv/gA=
MIME-Version: 1.0
Received: by 10.239.130.150 with SMTP id 22mr258709hbj.59.1251588214687; Sat, 
	29 Aug 2009 16:23:34 -0700 (PDT)
In-Reply-To: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
References: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
Date: Sun, 30 Aug 2009 01:23:34 +0200
Message-ID: <c384c5ea0908291623t1db9868du460184f390306d1c@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: getting back to < 2MB rootfs with mtd-utils
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
X-List-Received-Date: Sat, 29 Aug 2009 23:41:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Aug 29, 2009 at 10:51 PM, Cliff Brake<cliff.brake@gmail.com> wrote:
> So I need to figure out why mtd-utils is pulling in so much stuff.
> Also, it would be nice to remove opkg. =A0These are mostly just notes as
> I work through this, but if anyone has good ideas, they are welcome
>

Uhm, and I wish someone could fix the bitbake "-g" option (generate
dependency graphs).

I'm offering a $20 code bounty for fixing it and getting that upstream.

I'm offering another $30 code bounty for adding regex ignore support
for the dependency graph and getting that upstream.



My earlier work on this has grown out-of-date and my python code foo
has grown worse while I am writing device drivers again:

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/dependsgrap=
h/dependsgraph.sh
http://bugs.openembedded.org/show_bug.cgi?id=3D1488

Regards,
--=20
Leon


