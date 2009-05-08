Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2Doi-0006Uj-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 02:19:56 +0200
Received: by yw-out-1718.google.com with SMTP id 9so678899ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 17:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G0uNOewu6Wrsnbx9bPPxpMI7DJHA+/u7+xE3jzaPFqQ=;
	b=jAZfIdfOn+A1E8zDGvHY4EItfyHSVywt+oBstZsYPv+ZlgzQOx7nKbj+Gp9pohr/IU
	xKCE4JNbn9Ph04RweM5OQsdR89jFyF2Ejx/7UGxJNPjSrJgvnRHZlHJlfBzEcrbm+Thm
	IKqBIUjOUwsSMovb479YpvaUpOu2MMjGsc2t4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=goICH8fQ0osYJUkYwqcmTixK4e7NT0y/tmgAgxpvIREPzRbmQgpzRgZQxWQzAXZKby
	XvVx6HIkxGgsjInMc/pQ04Lnlt1Et8QVjWQKyTdNY65fDiWap0zuNSPtJySuCnT10xF9
	q0UkRN1ZbuG4XFzhTFM/XofzuGXYhfHtYnPgU=
MIME-Version: 1.0
Received: by 10.151.73.3 with SMTP id a3mr5442037ybl.148.1241741627177; Thu, 
	07 May 2009 17:13:47 -0700 (PDT)
In-Reply-To: <be7a9f3d0905051001p5a933c2ds1c77b9b8afb75647@mail.gmail.com>
References: <be7a9f3d0905051001p5a933c2ds1c77b9b8afb75647@mail.gmail.com>
Date: Thu, 7 May 2009 20:13:47 -0400
Message-ID: <f96d234e0905071713u17020e74v7e3cb68af7a2cc9@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Use of an INC_PR var when using a .inc file common to multiple recipes
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
X-List-Received-Date: Fri, 08 May 2009 00:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2009 at 1:01 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> Hello,
>
> I've been noticing how boring is to update .inc files that are used by
> many recipes. It's also risky since we can easily forget to update a
> required bb =A0file or, in worse case, a new bb can be included in the
> overlay and it won't be updated with the changes done on the .inc
> file.
>
> To solve it, I'd like to recommends the usage of the way I did for
> firefox-l10n packages. I'm adding them just for reference.
>
> What people think about it?

From a quick look, I assume you are meaning the way you did the PR?

recipe: PR =3D "${INC_PR}.1"

inc file: INC_PR =3D "r1"

I like it and added to: http://wiki.openembedded.net/index.php/Styleguide

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


