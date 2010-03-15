Received: from mail-yx0-f201.google.com ([209.85.210.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrAky-0005je-LO
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:54:58 +0100
Received: by yxe39 with SMTP id 39so1566439yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yj8kPyg888dALk0IPmdwAe+I8imqgXtfFmyRgyqHlxA=;
	b=wJv37pyEduof4HtvdkWRnUZOZ633xtall2UwAPbNBL5pYhV4a63R8gcyDhsUv/lFYu
	1nX+bmzCDa4/nJx8Rqyf/badb8QfIPbQnQEp7TH/ZdyOvRm5irc8XgiNaSDnafhgklHF
	b0B76cpD1pvWmm0Z7pqj0fXram8hCyhz3KmPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JJql4/dclS+u4IHeSitUXpXvhH6/mDUMnVZ7rCu9sYrOJPlUDA5bP8hxKD76OYazc1
	qKM9h+UEFzJbwD67RwZcy1jiPvz/MtsTkJGQRavGRuBJm4R58yA2cp43naRiWlxagd0W
	WEVp/K5OZya33B2WkzEntLjCthwTQaYzl16O8=
MIME-Version: 1.0
Received: by 10.101.205.23 with SMTP id h23mr218003anq.207.1268661114352; Mon, 
	15 Mar 2010 06:51:54 -0700 (PDT)
In-Reply-To: <hnl2fl$9kt$1@dough.gmane.org>
References: <hnl2fl$9kt$1@dough.gmane.org>
Date: Mon, 15 Mar 2010 14:51:54 +0100
Message-ID: <ac9c93b11003150651v1edab66cg9fe285a4fa6384ed@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.201
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Please don't remove recipes that have PREFERRED_VERSION set on them, e.g. tiff
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
X-List-Received-Date: Mon, 15 Mar 2010 13:54:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/15 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> conf/distro has:
>
> ../conf/distro/include/kaeilos-2009-preferred-versions.inc:49:PREFERRED_V=
ERSION_tiff
> =A0 =A0 =A0 =A0 =A0 =3D "3.8.2+4.0.0beta2"
> ../conf/distro/include/preferred-om-2009-versions.inc:25:PREFERRED_VERSIO=
N_tiff
> =A0 =A0 =A0 =A0 =3D "3.8.2+4.0.0beta2"
> ../conf/distro/include/angstrom-2008-preferred-versions.inc:47:PREFERRED_=
VERSION_tiff
> =A0 =A0 =A0 =A0 =A0=3D "3.8.2+4.0.0beta2"
>
> And that version was removed this morning without any warning. Would
> people please stop doing that?


Several of the distro's seem to be orphaned, so this rule will cause
that we create more and more garbage to pile up.
is that desirable.

Btw, wrt this specific recipe. This was misnamed. A beta recipe is
named as last_version+new_version. The predecessor of 4.0.0 in this
case was 3.9.2 (iirc) not 3.8.2.

Frans


