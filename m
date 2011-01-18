Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1Pf6a3-0008Ei-9N; Tue, 18 Jan 2011 09:06:19 +0100
Received: by bwz10 with SMTP id 10so3039478bwz.6
	for <multiple recipients>; Tue, 18 Jan 2011 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=QyFDoMR1bhFB3Aepg8GGPE8xVT3rA23kFq+x9m88V5Y=;
	b=QU/hRxdUxw+Wpk6mYZHP5fJ/Te9ufR5Sp8ap21tJi+va7fHIlyJv87moYX4AWa+InE
	X1GRWY/tC07mDK3XqCI6yGAV1/he+esTfBd65yL7WB7Q/qkiRRd8bYNOPHmCYDyobKXL
	IS42Z1hLSScWo16UlwgvfQyX6+MlHdC1U4nKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=cyenpfzMhcajHZjDOvUKO183xguEYoWWA3gqxgb+7p6ycFrbzcz9ilqOgiwSfr0wgV
	nMDAQEnfEvf5T1lPx77f2WfXXM3ip4VffyVCI/yK/fxRGM56Dx80ilNrw68OgkaW0QNI
	wMgxeHU+CepCZHxlo6Wq/GgzHh/QGriqatp1U=
MIME-Version: 1.0
Received: by 10.204.119.133 with SMTP id z5mr3059429bkq.72.1295337941083; Tue,
	18 Jan 2011 00:05:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Tue, 18 Jan 2011 00:05:41 -0800 (PST)
In-Reply-To: <4D353F81.50301@xora.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
Date: Tue, 18 Jan 2011 06:05:41 -0200
X-Google-Sender-Auth: -1hTa6ENOe-1LSG5iCMu12LogWw
Message-ID: <AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-members@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 08:06:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 05:21, Graeme Gregory <dp@xora.org.uk> wrote:
> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
>> - where possible stick to one recipe per package. This reduces the
>> maintenance work and reduces the QA nightmare of lots of different
>> permutations.
>> I feel one recipe per package should be the common case for
>> applications, and preferably also for libs (although I am well aware
>> that especially in the latter case multiple versions cannot always be
>> avoided).
>
> OE is not a distro so this is a non starter already, please don't bog
> down this discussion by re-opening this again. Angstrom 2008, Angstrom
> 2010, kaelios and slugos are all released distributions with different
> versions of apps just as a starter and they arent even near the total
> number of distros in OE.

I disagree. I think having too many versions of a package just makes
difficult to get things done:

 - it increases the amount of maintainence work;
 - has a bigger time to get bugs spoted;

Users of old distros ought to use a specific repository and branch.
Master ought to be kept clean for 'next distro release'.

My 2c.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


