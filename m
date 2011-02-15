Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpPFV-0005AJ-3B
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 19:03:41 +0100
Received: by bwz10 with SMTP id 10so676306bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rF4zqn7xVFp2vWSFsjk4IvTchT7pcieJESQx2+hCXNk=;
	b=s47KgYqLry+TVFzhRFPlLs/a2gAYb2QmD00nsmn9OKF6iYvnBfFrCY4mncb0NrgofD
	lLn0r1m4gVfqCWVZHA74IKe+27QTW+nkecMfSAXGojOm1T83Hv8s3tTMY5W3Be//PSf6
	BsApY30h5esS/5WU0URfKG9k4qFhDtyLOF3dI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=m+46Y2Y6YjlbnfH2HJni6KFd2NdgpaDiDKGaVfzoEh3/PoKqLr7INzATeHSUBesTtM
	kECbgN7Lv3+PPYq6O2G3QKnUFf91SQiaf7bq+ayxlL6ZgfIalcNDgdG5c3l050LlS3AO
	xbqjQTt6OHVw6Klwky0v61UFEj/tDJJytxLgI=
MIME-Version: 1.0
Received: by 10.204.122.198 with SMTP id m6mr26370746bkr.186.1297792947292;
	Tue, 15 Feb 2011 10:02:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 10:02:27 -0800 (PST)
In-Reply-To: <4D5ABB82.7000701@mentor.com>
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
	<4D5ABB82.7000701@mentor.com>
Date: Tue, 15 Feb 2011 18:02:27 +0000
X-Google-Sender-Auth: I4ERWAC4g7aTEGCpoHZecw4vcWc
Message-ID: <AANLkTi=w3MMa77WEx6H0PWSJifDmGS7F_t+yKCdJ47oT@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-sdk: fail to build with 20110215 OE
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
X-List-Received-Date: Tue, 15 Feb 2011 18:03:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 17:44, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/15/2011 10:26 AM, Otavio Salvador wrote:
>> Any idea why it fails?
>
> Missing host package, whatever provides libc_nonshared.a on your distro?

Seems wrong since I shouldn't depend on the host library for it, should I?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


