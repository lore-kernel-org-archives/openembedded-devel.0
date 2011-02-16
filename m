Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpeXN-0000bf-A2
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:23:09 +0100
Received: by bwz10 with SMTP id 10so1340633bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=9TOxhzzzxx00ClRfZs9/0jgPht/y5R59BjZxjZ/YLaY=;
	b=RUOmriBJXwSz7CRE0c19PaCzLje+TJ5hqK8fqjGbwvRzrS7EhGwLHFpPk5EIgneObc
	1hq7PCR436SGxQN8s+7S1s7B/hQBGSiwEChWes0AOv9idEObm3s45NR8e+Kg4KpJtT8d
	ki7odEsfdJ01cY/LCk6S3xXuMdrk4tHwhKbwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xdATC14xPERjjUmzOb8LaRhaKkzpbX+2q2oZzuDL8aK14HmhfOhfYYZhrC6Zv5bptU
	lf0T0eR9Nfhyy1VL1r64FMhRM/Kt5Dcc+AJdJPL0m7/mrOvt0AGkah6+Tt/8h8k04U8K
	gt9wxTs12PfqNEOmiMt0SiteeDvtiQoletfKw=
MIME-Version: 1.0
Received: by 10.204.77.18 with SMTP id e18mr318936bkk.78.1297851716368; Wed,
	16 Feb 2011 02:21:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 02:21:56 -0800 (PST)
In-Reply-To: <AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
	<AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
Date: Wed, 16 Feb 2011 10:21:56 +0000
X-Google-Sender-Auth: LvldzxbEPQS5eNGJ8C3aO3xvWnA
Message-ID: <AANLkTi=P1xjkWFg=JpFXU3a=LeU+nWxgw=ScxoBZ1E5_@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Pull request from O.S. Systems tree
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
X-List-Received-Date: Wed, 16 Feb 2011 10:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 07:45, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Otavio, thanks for your contributions.
>
> One remark:
> - what about going to a newer version of cups. i seem to recall
> meta-oe or poky has 1.4.6

Sure. This is easy and I can do. I just wanted to get this part merged
before doing it.

> And one request (or maybe discussion point for the community).
> Would it be possible to post patches. That makes it much easier to review=
 them.

Sure I can. It is at
https://projetos.ossystems.com.br/git/?p=3Dusers/otavio/org.openembedded.de=
v.git;a=3Dsummary

> (alternately maybe links to web browsable patches would be nice).
> pull requests are somewhat harder to review (at least for me)

Well ... not really. You can copy the line from the pull-request and
merge it into a temporary branch and check it there. You don't have to
add the remote for it. Just:

git checkout -b review-otavio
git pull git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.=
dev.git
master

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


