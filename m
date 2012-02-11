Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCvV-0002LD-1X
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:23:41 +0100
Received: by eaal10 with SMTP id l10so984173eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=MOQJZZstJF3ZT0Qvl6eUy4v0Fh1iY76qsM4HyLV9BSY=;
	b=cwpQjCZri/CTL4/6JLpdvYMpoQzYTFjIOxCbXNO+Xc87LeMDD8gAYIo0MWTHy4Iepa
	HhhiulmroLKTRcXKGTjbiwRcLmBBHnTvyQ7nVYkdx74kOJEw+P21mMLlg3/IBKWVutb8
	MrJd/eiJweZVckKeyTR1eltIHbC05rJ0wWJ5I=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr949077ebq.50.1328966133113; Sat,
	11 Feb 2012 05:15:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:15:33 -0800 (PST)
In-Reply-To: <1328925603-2967-3-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-3-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:15:33 -0200
X-Google-Sender-Auth: RlPXD6jaDbUSiOWNWWIcXnshMo4
Message-ID: <CAP9ODKrUO2t0wmWvB_4q8UQrK3G1kZQJ8P5R6tAjsCVY0j_W0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 3/7] systemd.bbclass: cosmetics
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
X-List-Received-Date: Sat, 11 Feb 2012 13:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 23:59, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>  python populate_packages_prepend () {
> -       def systemd_package(pkg):
> +       def systemd_prepost_instrm(pkg):
>

I fully agree about renaming it but wouldn't
systemd_generate_package_scripts(pkg) be more descriptive?

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

