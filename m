Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pp0qM-0003UE-AW
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 17:00:06 +0100
Received: by bwz10 with SMTP id 10so5330005bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AYgJm96ZJ3Fx5+gbWM5hm9ZgqKe5XtCOJS2q4VuDo5Q=;
	b=tjHfF/EIp6Fl0MwMVtikk4MIPOOMpce/r0hD4t+L2sSqQxfZryYnT79WTGCvHDPmkR
	TqsETbRyoRFwsQZe99vEt/KLwLh1V18xZrED2F25w7kL78On5q9l1QCChrQ8HRJ2kRF5
	56RSnaP19FWf2hu7VfshoP0wOIH+d7ubn4ojc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=TEz/t+QY7Bsra37wTIoRWYgDsqJYFZ2UL22+UJ6C/gCWlSo35kMb+xTR5ktrp9/zgp
	pIOwWA12WrHcDC12woITpcuWQaY81mHPURiS+Rh9bOMxWXAba3bWJ+1mwxJs3T/ZPQiq
	RYACYtMD38lqgbr3QGpbPjFfSKNOom4dnx//8=
MIME-Version: 1.0
Received: by 10.204.50.196 with SMTP id a4mr25119810bkg.213.1297699136436;
	Mon, 14 Feb 2011 07:58:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 14 Feb 2011 07:58:56 -0800 (PST)
In-Reply-To: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Mon, 14 Feb 2011 15:58:56 +0000
X-Google-Sender-Auth: oL3up5nHWTxpz6tcyql9TKITJDQ
Message-ID: <AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 16:00:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 13, 2011 at 14:08, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> The whole reposotiry is about 24MB in size and it's rarely needed
> whole. It is now splitted into bus specific subpackages (and some
> device-specific for devices on a bus like SPI or SBUS) all depended
> on by the linux-firmware package.

I agree that this ought to be split but I think that it should be done
by vendor:
realtek, ralink and so on.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


