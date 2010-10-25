Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAT2e-0001U4-4n
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 21:49:13 +0200
Received: by yxe42 with SMTP id 42so2469852yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pR46vQTZu30hB186vAAwu6lWODDZxIJiTsJA49xxITg=;
	b=vmgIMjrwfjLjrbbk5v+QpKsQ/0X+yikJxn1T78K3PpYjo6o89Ka/r3QR653WUvcWS9
	q9Z0efvGhRFm4Ouu+Cf0qg/sX8XR37+bi1dFGExzeWR10y4u2kkU6JHvLSfh2mGlnz+4
	yKNHzyfhxMRk4EpMOhx4Rrt9mJn4MPQ6rRLu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TvIkhweDnYriMhDniyYoOeTuvo58u8M6QxebfSl9CAeGNdyQfIUDnsamYxCtZ5f6j2
	pufocDESJ4/PmckfG92tuHmE4w2noO7g5azly+9sYIkwyVX+TmUdv1Ejct8oZceJJlwB
	w66lG9XBpEfH0Zk4HxeTeoKhH18jzMn5cbGPM=
Received: by 10.42.71.70 with SMTP id i6mr1126535icj.200.1288036106191; Mon,
	25 Oct 2010 12:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 12:48:05 -0700 (PDT)
In-Reply-To: <AANLkTinhVFqdS1XQ1OmhSHVwr0MS9pZgMMR9cqBoFxYM@mail.gmail.com>
References: <AANLkTinhVFqdS1XQ1OmhSHVwr0MS9pZgMMR9cqBoFxYM@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 12:48:05 -0700
Message-ID: <AANLkTimnpM-4_d7LV8bv5AnYPN02ZkUNS7h+BaEJyd1H@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python.h LONG_BIT definition error on 64 bit build machine
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
X-List-Received-Date: Mon, 25 Oct 2010 19:49:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2010 at 8:57 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> I'm working on a recipe for a new version of hplip (it depends on
> python). =C2=A0It builds just fine on my 32 bit Ubuntu development machin=
e,
> but when I attempt the build on my 64 bit Ubuntu machines the build
> fails with the following error:
>
> In file included from
> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/pytho=
n2.6/Python.h:58,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from io/mudext/hp=
mudext.c:27:
> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/pytho=
n2.6/pyport.h:685:2:
> error: #error "LONG_BIT definition appears wrong for platform (bad
> gcc/glibc config?)."
>
> I seem to recall seeing this error in the distant past.
>
> Is this a known issue with python on 64 bit machines?
>
> Any advice?
>

see this https://bugzilla.redhat.com/show_bug.cgi?id=3D139911

> Steve
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


