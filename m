Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LzUWo-0003J1-O3
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 13:34:10 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1102309yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=eBxqTf7TN5Pw+4SkMBSLCggRGk0B68U1mEeGDNFtxS8=;
	b=A2HHLIeLU0kWlFaEdlbKV7gmKJs0+flxwwRZB3NA/7sEDBjdXFNgZvwsVkR+tM5ZOq
	ktVQJGSIZ5rheZmpLLrN8gLoxAyEPIMnSdaJZT1618f4jlC94tAI5I7SDYu/CbHm+HNN
	gRm3bCZDl8tybHbKSA7lW/CN9vsZCXY5DzHoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=mH9JQE3tPnOnHSv8w/LQB5W2oXezMXxjkIcCwONgHEeepUm9SqzZbq/M9bOr6TgxJY
	MuU67W4ewNGGVQE+RxEzDY9f3Runm2ciPaTTSCBrI3u3DJ4e0OkW4u6zBskOVD/jKGxA
	G5BCr2vGNnf90zIyITjZ+gsPehYLHE9/yiAdw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.30.198 with SMTP id v6mr1207724ibc.26.1241090929526; Thu, 
	30 Apr 2009 04:28:49 -0700 (PDT)
In-Reply-To: <1241079609-5912-3-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
	<1241079609-5912-2-git-send-email-khimov@altell.ru>
	<1241079609-5912-3-git-send-email-khimov@altell.ru>
Date: Thu, 30 Apr 2009 08:28:49 -0300
X-Google-Sender-Auth: bf2874e762691e68
Message-ID: <be7a9f3d0904300428w41789e17gdd036594d57a5cdb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/4] coreutils-native: make mandatory dep for all packages
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
X-List-Received-Date: Thu, 30 Apr 2009 11:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Apr 30, 2009 at 5:20 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Gives us guaranteed sane GNU coreutils on any host. Should greatly ease
> support for various non-GNU host systems and allow to safely remove some =
other
> native packages like 'install-native'.
> ---
> =A0classes/base.bbclass | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index e5fd814..270b05d 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -125,9 +125,11 @@ def base_dep_prepend(d):
> =A0 =A0 =A0 =A0# the case where host =3D=3D build =3D=3D target, for now =
we don't work in
> =A0 =A0 =A0 =A0# that case though.
> =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 deps =3D "shasum-native "
> - =A0 =A0 =A0 if bb.data.getVar('PN', d, True) =3D=3D "shasum-native":
> + =A0 =A0 =A0 deps =3D "shasum-native coreutils-native"
> + =A0 =A0 =A0 if bb.data.getVar('PN', d, True) =3D=3D "shasum-native" or =
bb.data.getVar('PN', d, True) =3D=3D "stagemanager-native":
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0deps =3D ""
> + =A0 =A0 =A0 if bb.data.getVar('PN', d, True) =3D=3D "coreutils-native":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 deps =3D "shasum-native"
>
> =A0 =A0 =A0 =A0# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.=
 =A0Whether or =A0not
> =A0 =A0 =A0 =A0# we need that built is the responsibility of the patch fu=
nction / class, not
> --
> 1.6.2.4
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


