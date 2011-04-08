Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q8AF4-0002lW-Hr
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 13:52:46 +0200
Received: by wye20 with SMTP id 20so3249342wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=+BKMqJ+mrnSWvaw2BMORFovLnNij8ZgtuDmXBXWsTm4=;
	b=dWXhjdBBJoJ6eg6LNIjbln4NmN6quwLldbw2+BA5oGOaHunzU7He9EKZ6plh6sQLoJ
	WFUnOdPe8FAI8olx2wS0L3KzMSTxMknl9yIJmPQdJW10e3sjr1aDOKKj/R3r5wqPZO2y
	KpnHjdnpiCrZhrm9wmPqfU/Ok6l83jvDrss0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=TLfosDF1+FenmcwCmE63P5aVnkPCIR0ROn+mftyGn8Ve18Rp4Lu6/ZJGlfILcVc96Q
	4tprn0sFwPRWtvPe50hwgRXmZ3Anwh8c2+AMMy1l8wNjC4rxH9IhK3pBurT4WaaiZMOP
	XeMfCOyZ5jrl+4bY1Ot5XofUGnOG+LTtOg5n0=
MIME-Version: 1.0
Received: by 10.216.168.82 with SMTP id j60mr1870403wel.47.1302263436657; Fri,
	08 Apr 2011 04:50:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Fri, 8 Apr 2011 04:50:36 -0700 (PDT)
In-Reply-To: <4D9E4D66.1000701@mentor.com>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
	<BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
	<4D9E4D66.1000701@mentor.com>
Date: Fri, 8 Apr 2011 08:50:36 -0300
X-Google-Sender-Auth: 64b5fz--knlTZsdS3nLkd6-H3NM
Message-ID: <BANLkTinGcvO0-Z97eSZ3uMsuRK-oEHz7Rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 08 Apr 2011 11:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 20:48, Tom Rini <tom_rini@mentor.com> wrote:
> Why are we even tweaking gzip/bzip2? =A0XZ/LZMA can have serious tradeoff=
s
> at higher levels but I thought for bzip2/gzip it was either do it or no
> compression, not "turn it down a little bit".

It changes a lot for compress and decompress time. I think it is
important to be able to change those values but how it is done doesn't
matter to me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


