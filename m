Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QaEk7-0005pk-Uk
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 00:20:53 +0200
Received: by vws2 with SMTP id 2so2577737vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7EIXlsQbNSzJHmk61EImIfiIF0hboiiC632rdVQC6ww=;
	b=AjDxuPPGqWnUTJdfzV/pzxdHGYKhQhr8/3SMiIIS1viScaOUU5mmey1XOjABgnGmYh
	GqwB7xVkrHer5hsrkNXU4DDef0aoWjIqhpw+96jq+WE/Rn1tEp5+hJFOsCXh/lUC1HTV
	Kuwbn74peK7078ODqoHez8jPeBO2z3jv1C4vo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=S7Bf6+8lZVFeLzYBPuswg+kY2Cj00skJsTaoMLDqGNKX3/BOKg9ciUv+8Xa+QPvGwI
	qGio3o8I6c58n0CaI8+TDrmpJ2lhi7F5ys26QOGGMGzZQ8Je92SDye/P+Fr/HEZP1E7X
	3Z3sK/V6JVWT4kBPUCbuFV4xTfLzGQw0Jg8mg=
Received: by 10.52.116.33 with SMTP id jt1mr5377319vdb.249.1308953834062; Fri,
	24 Jun 2011 15:17:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Fri, 24 Jun 2011 15:16:54 -0700 (PDT)
In-Reply-To: <BANLkTi=_HKbs2iXrsBUDaX-1VfbzbiSqDQ@mail.gmail.com>
References: <BANLkTikPPYWL_-4qv+584CHgzt1DCzFeog@mail.gmail.com>
	<BANLkTi=_HKbs2iXrsBUDaX-1VfbzbiSqDQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 24 Jun 2011 15:16:54 -0700
X-Google-Sender-Auth: 5YDjspLURwto3XzpBYbcEVFUZHg
Message-ID: <BANLkTik=imKi8tqkt_L1-GQ4PyJFWabnNA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Packaging from devshell
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
X-List-Received-Date: Fri, 24 Jun 2011 22:20:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2011 at 2:40 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> I use devshell for compiling by running a bitbake generated do_compile sh=
ell
> script in work/ for my package, this helps me develop faster as I can ski=
p
> over parsing and other repetitive stages.
>
> However I'm not able to do the same with do_package_write, as the shell
> script for the same appears to have an =C2=A0empty function:
>
> do_package_write() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> }
>
> Could anyone suggest which script =C2=A0should I execute to package from
> devshell?

Nearly all of the packaging process is done from python code, not shell.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


