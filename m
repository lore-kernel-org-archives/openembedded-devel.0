Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S17a4-0000gv-Nz
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 03:41:52 +0100
Received: by vbbff1 with SMTP id ff1so2195047vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 18:33:29 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.172.196 as permitted sender) client-ip=10.52.172.196; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.172.196 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.172.196])
	by 10.52.172.196 with SMTP id be4mr2555110vdc.80.1330137209187
	(num_hops = 1); Fri, 24 Feb 2012 18:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fDGXS2L1Z+djHJJSz9od1uPRjthx8Akm1hAW5mI0ZqY=;
	b=wC8Rv1PTPxJDLRTGp/mUcAGPhEeZYgc+ux8kVzg6duf30EFVa6rod+uZb27oB0f4Ax
	Hbp7VQvoaWTJHzGBDDZBRcoJUrnKQN8+yaAcRlnAQFOkRKVrILI5jSRFCxpFGh4KrSAC
	q2cs7rmWp3KD4A9DlfHuGGhkVhdn4481LJ2HA=
MIME-Version: 1.0
Received: by 10.52.172.196 with SMTP id be4mr2028444vdc.80.1330137209136; Fri,
	24 Feb 2012 18:33:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 24 Feb 2012 18:33:29 -0800 (PST)
In-Reply-To: <CAP9ODKrBwMjUg+WUY1b18k_PyKHDgjhEH7hXLjB+1wJ78-u2_g@mail.gmail.com>
References: <cover.1330116875.git.otavio@ossystems.com.br>
	<6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
	<CAP9ODKrBwMjUg+WUY1b18k_PyKHDgjhEH7hXLjB+1wJ78-u2_g@mail.gmail.com>
Date: Sat, 25 Feb 2012 00:33:29 -0200
X-Google-Sender-Auth: ZiURlij__-tHMe001FEwGBN1g3M
Message-ID: <CAP9ODKqyQAteyfXFWxX5akvq8u6eJ4RLg7qpsb9RrbTsKmrEzQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe 2/2] systemd.bbclass: do not mangle PACKAGES variable in native, nativesdk and cross
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
X-List-Received-Date: Sat, 25 Feb 2012 02:41:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 23:44, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Fri, Feb 24, 2012 at 18:55, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>> =A0meta-oe/classes/systemd.bbclass | =A0 72 +++++++++++++++++++---------=
----------
>> =A01 files changed, 36 insertions(+), 36 deletions(-)
>
> This broke it; I am fixing it and will send a patch soon.

I ended sending two patches to fix this. The second one is the right
to be take since it fix the packaging and parsing. Sorry by this
mistake.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


