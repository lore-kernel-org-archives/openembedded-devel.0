Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SI1Cv-0000QX-JM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 19:19:49 +0200
Received: by vbbfr13 with SMTP id fr13so860191vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=v65hTGef9Ur7ovkaWMbvlOVPEpE131J2WzbhgyvYTNU=;
	b=Ioajg4kRMnKDFVlgLj/8DO+IegDO4IpOVDM+c0/SUqifZvmF9Qy10IxQs/atqlmgpp
	ydYJc/jork3K+LWL2oI4Hup8K5vZis5HTKLq5fm1Zl9z9NM9aqSD68CctYxfaEAbqtHc
	cwxFt6v6Fe+Ly6NTMl0I+2O9zFN3bg+Ww4k2xTZXydJTptDgbx49U+hExWdg3ygMr7+f
	FTsJrUP1tmgvcD4jvRMN10QQ45rXDH7xFA7UhRjqr7J8U/ASUSqiiI+ASL+wdhKKdW5T
	Bm3zndabtb4koqnAGFfJibJ6J654EXvEeYm/YcDoinBJ6VanXA7QQATnBeZ+eZN69wTz
	O1Kw==
MIME-Version: 1.0
Received: by 10.220.107.208 with SMTP id c16mr8054904vcp.65.1334164230009;
	Wed, 11 Apr 2012 10:10:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Wed, 11 Apr 2012 10:10:29 -0700 (PDT)
In-Reply-To: <447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
References: <cover.1334037469.git.Martin.Jansa@gmail.com>
	<447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
Date: Wed, 11 Apr 2012 14:10:29 -0300
X-Google-Sender-Auth: fwu-aLfKh55gEaMfdTNcI-wRXmI
Message-ID: <CAP9ODKoOVXFWX074wkmy0pQ2-0KDO5AF-tM1E6U6qy+e5DNYtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] xserver-nodm-init: use /etc/X11/Xserver from service file instead of Xorg directly
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
X-List-Received-Date: Wed, 11 Apr 2012 17:19:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 02:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> * /etc/X11/Xserver is provided by xserver-common and sets correct DPI
> =A0before starting Xorg (or other xserver)

This breaks the images using systemd only as it depends on init.d/functions=
 now.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


