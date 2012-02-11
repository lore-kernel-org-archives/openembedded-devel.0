Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCst-0002DF-Q0
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:20:59 +0100
Received: by eaal10 with SMTP id l10so983736eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ferBCh3qOMa+v0GeTel3W5ElGR4ISvTLidVvkP1kFCw=;
	b=TJ6dsthnAjfyZR40uwR98l+0P87bDRs2Sj2RFK9//S7mTB/1VNaZmL+VRIkF7La4cN
	7t7CGZPZFdykDG7mCxs54Bzi2OPFGWo0UndCnMPQ0Q9hsjPWvbgiaCQ5r7PACXMSvbAn
	4QmGh4mvqGbo6CCyLYbHZA7WbwlKam5u/C5b4=
MIME-Version: 1.0
Received: by 10.213.26.212 with SMTP id f20mr921286ebc.12.1328965970971; Sat,
	11 Feb 2012 05:12:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:12:50 -0800 (PST)
In-Reply-To: <1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:12:50 -0200
X-Google-Sender-Auth: fsUIdH_vcyPIvy1Mv84GTCoXYdQ
Message-ID: <CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Sat, 11 Feb 2012 13:20:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> In case SYSTEMD_SERVICE contains only one *.service file, the whole folde=
r
> ${base_libdir}/systemd/system/ is added to FILES_* otherwise only the
> *.service
> files found in SYSTEMD_SERVICE.
>

It seems you'll need to parse the service file and check if it installs
others. For example .socket files usually do that. And then you'll never
add the whole dir automatically but dependently of the services it needs to
install.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

