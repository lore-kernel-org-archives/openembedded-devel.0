Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdVAS-0000it-Bf
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 22:57:17 +0100
Received: by iyj18 with SMTP id 18so2000497iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=YgJ2UHLc2R8eI3xqJR2xeA6XrSrcYfS0bFE+OresF2c=;
	b=aIiP9Qre5GUlkQDZGfm99DYqTVpYDywLPdNA9rWMA4NE5lMjk3B/ZhSAsN+QyLAblJ
	E1YWPzO4+EaeNGN2R8kt4twxH8GxAGvY5EJxf9ohDViENZYen6q4B19JLUX3hT7r5HwM
	pOTjzmn0sdN7SecutU4dZ7xKtVvKH+2c7ZbYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pdsiGjiZTxyHIPIznmsUKmcJniEjg9trELPUph1gfMI8fK97KYQLCCP2MF6iq75XvO
	+C6VUjo3Zn7PjLHrcXp1UzDURWcXJ5PmAjaxHpmyCL2sNappNfpjPsxpJqvPkWTU63np
	rAfpm80W1uPkAeLw8JFuvfhIEEY4n8KvPT+yM=
Received: by 10.42.230.8 with SMTP id jk8mr3092098icb.165.1294955800569; Thu,
	13 Jan 2011 13:56:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.175.69 with HTTP; Thu, 13 Jan 2011 13:56:20 -0800 (PST)
In-Reply-To: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
References: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2011 13:56:20 -0800
Message-ID: <AANLkTi=p4U3CFO1sMP5mW-EKC-R5nHLqC=0QrN4kXnZK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Use of 'sem_open' failing
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
X-List-Received-Date: Thu, 13 Jan 2011 21:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 4:07 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> I am having trouble to use an application (freerdp) that calls sem_open m=
ethod.
>
> The application has been converted to use sem_open to fix a
> portability issue with MacOS X and it works fine on my Debian but
> fails on the OE built image.
>
> Do someone knws what I am missing here?

It has been reported more than once for arm architecture. I think
there could be issue in the way we build eglibc

For test purposes can you try it using uclibc and see if you still get same
failure ?

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


