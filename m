Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlfRx-0003Wg-U5
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 13:42:14 +0100
Received: by mail-ob0-f181.google.com with SMTP id oi10so3129132obb.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DBkcuKGCA8PDNbuAv6QyXLjJScspxElQzpSnmZFDJso=;
	b=NunZaxIjz1pe4bbQJN6HCPgN8UeLx1HxWg6kspmIPLpeslLfy3Ee06T0qxEED6XFrm
	tLMelEOpJMGNV1IwOvmaZQ4Rl/5HoqOVwWq1dHSP7bfOcQIOprd+Zx+LLH5dV6VDbPw2
	iBmMD/RwRYoKPfc2Us8t3aURdMgkWjJzI2PPwk6i/+luIGFEHVGn4VT16Wp4wrnGjUj8
	dyNo478+qxbQPXazQvAk+qScJmVtjHQwBjfVip4qUcTglMdYhjGQuboOQpkjxwancNPk
	OCENGkiFyROstkcXbn6ivTbKIx99KTHsq5rwVxEWxjUC2WJdnvNsjlA/e7UGsUXBUkzV
	jX9w==
MIME-Version: 1.0
Received: by 10.182.131.3 with SMTP id oi3mr3376263obb.13.1356006444872; Thu,
	20 Dec 2012 04:27:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 04:27:24 -0800 (PST)
In-Reply-To: <CA+AhUGxM2KQ3tj+UFu4NVwh3O1R2XSq1o5Lj2fn+A-e9r4=Qrg@mail.gmail.com>
References: <CA+AhUGxM2KQ3tj+UFu4NVwh3O1R2XSq1o5Lj2fn+A-e9r4=Qrg@mail.gmail.com>
Date: Thu, 20 Dec 2012 10:27:24 -0200
X-Google-Sender-Auth: JdPMJOuZPVTEHZAJHjzUPJVeJX8
Message-ID: <CAP9ODKpe2vkYeyYT32s2csEDH+S0se6b3JKFgGS4p7L=HeKtoQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 - problems with pkgconfig-0.25
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
X-List-Received-Date: Thu, 20 Dec 2012 12:42:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 8:27 AM, Erik Bot=F6 <erik.boto@pelagicore.com> wro=
te:
> Hi,
>
> When I build qtbase using https://github.com/meta-qt5/meta-qt5 I get cros=
s
> compiler badness warnings, it uses some includes from my host machine
> instead of from sysroot. I have seen this before when cross compiling qt5
> manually, and then the fix was to upgrade my host pkgconfig from 0.22 to
> 0.26 (I didn't really try the versions in between, just built a more rece=
nt
> version).
>
> I did a quick hack by building pkgconfig 0.26 in yocto by simply removing
> the patches and using upstream vanilla 0.26 and then qtbase builds proper=
ly
> without using host includes.
>
> But it feels kind of strange that a bug like this hasn't affected any oth=
er
> packages? Has anyone else seen something like this and can shed more ligh=
t
> on what's happening?

I think this is more suited to oe-core mailing list so people
maintaining pkgconfig can comment on it as well.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


