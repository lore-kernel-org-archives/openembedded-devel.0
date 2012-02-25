Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S16og-00083p-8F
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 02:52:54 +0100
Received: by vcbfl13 with SMTP id fl13so15496vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.71.80 as permitted sender) client-ip=10.52.71.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.71.80 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.71.80])
	by 10.52.71.80 with SMTP id s16mr2476995vdu.131.1330134270866 (num_hops
	= 1); Fri, 24 Feb 2012 17:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2CUWR/p8OmhoRUXVJhZORZOouJKH+FjWyEgrn5UMnfY=;
	b=VlcMKuVmBT0j53pWaQ7PkX3E5BRv1GU2SMdebMI6nh6IyZJifHMaMjXqMIEm2HDuLr
	WJOI3Q3gn58J2UiBVVyEXzKdFNzn4zoImG++QgmBX+HmjzN3KA3SgK26DofyIjHIfuQp
	g+lRAJAoPFylTsCSTZ+tP49BQPIcXzXopGJNY=
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr1964783vdu.131.1330134270369; Fri,
	24 Feb 2012 17:44:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 24 Feb 2012 17:44:30 -0800 (PST)
In-Reply-To: <6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
References: <cover.1330116875.git.otavio@ossystems.com.br>
	<6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
Date: Fri, 24 Feb 2012 23:44:30 -0200
X-Google-Sender-Auth: IqDgiAndceYV6mv9z-Vz42SCZaY
Message-ID: <CAP9ODKrBwMjUg+WUY1b18k_PyKHDgjhEH7hXLjB+1wJ78-u2_g@mail.gmail.com>
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
X-List-Received-Date: Sat, 25 Feb 2012 01:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 18:55, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> =A0meta-oe/classes/systemd.bbclass | =A0 72 +++++++++++++++++++----------=
---------
> =A01 files changed, 36 insertions(+), 36 deletions(-)

This broke it; I am fixing it and will send a patch soon.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


