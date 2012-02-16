Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ry29t-0008MO-I9
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 15:18:05 +0100
Received: by pbcum15 with SMTP id um15so2141010pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 06:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=b+GYxgywdvSBt7PJk8PaMCkiTofGuQiGNiAf+t/tPeE=;
	b=Bt8j2dZpkCiYly9RsscwQczOHyrXhmVKj3iMEKH1a/q2THH15uqq68l4hrcwPO7uOw
	CpiXmiEF+mSzpHBIfbS+f6BUAKOlNH2B7zsxkHfZ8YRHOln1fLDeGAipcrvd2IoBlzJ1
	C5K7F9R9+K13dZccNqPZB+NvF7GQCc9l/ZLXM=
MIME-Version: 1.0
Received: by 10.68.75.135 with SMTP id c7mr14028740pbw.43.1329401391828; Thu,
	16 Feb 2012 06:09:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 16 Feb 2012 06:09:51 -0800 (PST)
In-Reply-To: <CALbNGRSUxOf7U7H7AJjCaXYhuYe8bd64_YW6Vc9Mnf9PKdn+sg@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
	<CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
	<CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
	<CAP9ODKq9xT+ZqCajjqDkM_-=Tkh8OJk0hKAugGfhXd6E=61Cpg@mail.gmail.com>
	<CALbNGRSUxOf7U7H7AJjCaXYhuYe8bd64_YW6Vc9Mnf9PKdn+sg@mail.gmail.com>
Date: Thu, 16 Feb 2012 12:09:51 -0200
X-Google-Sender-Auth: CItkxB6NrI259kgLc7mgpz5m7X4
Message-ID: <CAP9ODKofxACXcKtk__mC4AB1a+GbJiiR7b=rutess-eJ53Z3AQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 14:18:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 12:04, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> This is not the case for many packets having *.socket files
> referencing *.service by 'Also'. But in gpsd.socket is nothing like
> that.
>
> One question the other way round: What fallout do you expect by this patc=
h?


No fallout but I think we ought to support the specification to avoid
needing to touch this code soon. As systemd explicitly say's that if a
.socket is provided, a .service or a @.serivce needs to be available, we
might support this case too.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

