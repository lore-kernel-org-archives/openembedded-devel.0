Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAZKU-0002Xi-38
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 02:55:14 +0200
Received: by an-out-0708.google.com with SMTP id b6so3747373ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YetkCaJDUdO1vxApCGHSYs5Rx4abpXguL6kcOSAYRv4=;
	b=IkUwEaYbzcxAT2t78jIGrZt1f6/bko1XJoF19iEh2mSjMJo56EXm8na7zS8io3odsd
	mYYG6y36ZXwt3bk9bSigUVZfyHqsCKP3MIjpxrHkHTw0FFEq0BaO6RALWgCBRVOGMB+/
	ueLb0QE6K8I55gBSKe8FJtm442xV8AqeftOtk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=uKwSswdT/8lKU85AUC6GUkkG6JNIYvKheY3cM0Tgjx8oLszxpehsRdVi94kULrz5gr
	XRXfBnMs5en0ogDm6y3KG8JGJWCEskfhKITTmGTaNmpm875VLNGfQPcu0zmOJlGCOIv9
	rQjIN4q6Nwqk9j/vliVvMeNZEFHtWnbDEcwuk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.201.11 with SMTP id y11mr5437154anf.135.1243730799241; 
	Sat, 30 May 2009 17:46:39 -0700 (PDT)
In-Reply-To: <1243726480.4869.98.camel@lenovo.internal.reciva.com>
References: <20090530215243.GS23842@smtp.west.cox.net>
	<be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
	<1243726480.4869.98.camel@lenovo.internal.reciva.com>
Date: Sat, 30 May 2009 21:46:39 -0300
X-Google-Sender-Auth: a0fc256e7c0726e4
Message-ID: <be7a9f3d0905301746tbec95a8pe14ea91d32ba19a9@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Sun, 31 May 2009 00:55:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 30, 2009 at 8:34 PM, Phil Blundell <philb@gnu.org> wrote:
> OLDEST_KERNEL is, at least partially, distro dependent: this was its
> original purpose, and it would be a shame to lose the ability to
> override it from DISTRO.conf. =A0But, moving the default definition from
> bitbake.conf to (e)glibc.inc would be fine if it's also changed to a
> weak assignment (?=3D) at the same time.

Mind to explain an use case where we'd need  to override it?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


