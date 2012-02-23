Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0YFc-0007vS-Qr
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:58:25 +0100
Received: by pbbjt11 with SMTP id jt11so624854pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:50:02 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.135.34 as permitted sender) client-ip=10.68.135.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.135.34 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.135.34])
	by 10.68.135.34 with SMTP id pp2mr2398836pbb.106.1330001402870
	(num_hops = 1); Thu, 23 Feb 2012 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iIMCkOl1EYDolJVcWarxDMQYY57xTW9G1D4vI9IA3Pg=;
	b=vWeFgue7LHz3NUbEGJjcGMggq4yEdKQEhWdviEOCh9MJwKg0+2JehKz7VpVPuN/bmZ
	JwI6tdvHn0adsyhbldaxVHysYRGvBE2UnlcA6daYllxc6tvQ0ImKyXXRRvZo6PPbEVPu
	pMY9EENh9EJIS7U6hHrUChjX7bqxxaDpil6eY=
MIME-Version: 1.0
Received: by 10.68.135.34 with SMTP id pp2mr2057043pbb.106.1330001402832; Thu,
	23 Feb 2012 04:50:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 04:50:02 -0800 (PST)
In-Reply-To: <1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2012 10:50:02 -0200
X-Google-Sender-Auth: NKbjavqGKQKaOG9kZ4ob5NltvKk
Message-ID: <CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gateone, networkmanager, cloud9, ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 12:58:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:40, Martin Jansa <martin.jansa@gmail.com> wrote:
> * maybe we should move systemd_unitdir definition outside systemd.bbclass
> =A0because it's used in few more recipes which doesn't inherit systemd

Please split this patch and do PR bump so we get them rebuild.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


