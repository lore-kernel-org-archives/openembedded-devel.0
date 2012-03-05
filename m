Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4f4W-0004Nz-Pw
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 22:03:56 +0100
Received: by vcbfl13 with SMTP id fl13so3991494vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 12:55:21 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.66.228 as permitted sender) client-ip=10.52.66.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.66.228 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.66.228])
	by 10.52.66.228 with SMTP id i4mr36471286vdt.12.1330980921467 (num_hops
	= 1); Mon, 05 Mar 2012 12:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=v//BGfNvTQOeGR5y0420fJue3/rEZUHMYMhESqoi7G4=;
	b=HF3ngBJXxvKcNPx7y9SVJoUrDCDEJpAFEapVuIMK0dLc4x8ZTj66JL2/77knkVjz1Y
	Yf32kanRUlmtrwBrF56hm663KKDZFJSMS1QPAaO83Ow4Dypq6laQqniev0CKRpouHzn4
	Kts8tPXKWqF2FQQ1ClVb9PeeNO4KwohG0xWgbHjsAFzUtGjXQxwpz/+Gcj0I1WcLTWtt
	3+JS0EE3wc0K3cpchKmG4NNznw+aQskU99A1nV6r8NhLRSi4lqbcWI1yYpDkQIqPiCbG
	//wPQSbHk71/ZtNFrRyncDtGvp1nijfUATvGlWfvh0Uo3N6lcNcg4EAdBPSO6Xi/Eye+
	c/7A==
MIME-Version: 1.0
Received: by 10.52.66.228 with SMTP id i4mr31184971vdt.12.1330980921385; Mon,
	05 Mar 2012 12:55:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 12:55:21 -0800 (PST)
In-Reply-To: <jj37mf$dsm$1@dough.gmane.org>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
	<1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoGobJnLbOHjWWRupWNDJAUNJ8o4ROBm6EDKN4uiWu=rQ@mail.gmail.com>
	<jj37mf$dsm$1@dough.gmane.org>
Date: Mon, 5 Mar 2012 17:55:21 -0300
X-Google-Sender-Auth: r9CgSobIWAdFDdokPFvPwJvRgT4
Message-ID: <CAP9ODKrLhkyTHF8n3BVsKWG=-5bMieT7+Dua0+VF4sGFXcmD4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Mon, 05 Mar 2012 21:03:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 17:29, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 05-03-12 19:12, Otavio Salvador schreef:
>> On Mon, Mar 5, 2012 at 14:37, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> + =A0 =A0 =A0 # create dir for journal + =A0 =A0 =A0 install -d
>>> ${D}${localstatedir}/log/journal
>>
>> I'd prefer if journal could default to use a buffer or something similar
>> instead of writting to disk as we ought to be careful about space in
>> embedded devices, in general.
>
> And that's why patch 1/3 enables xz compression :)

I understand however I think that write the log to the disk by default
is wrong. We can do it by machine basis or other type of override by
by default we ought to avoid writting to disk.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


