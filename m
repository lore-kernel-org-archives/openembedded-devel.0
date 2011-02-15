Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpPqh-0003Hu-Fw
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 19:42:07 +0100
Received: by gwaa12 with SMTP id a12so233484gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K2So4MzJrYwRSq3S2edrW3AMH6TIm7IGphXyFsPYLtE=;
	b=M/VJiZoI3D22pR18pNJ4HK72/Q8mrx95ReiPri5yxZRZgbk6C/a0HiFLfGY2BUvPpn
	+zzq7m3wt4qTetlLF7KKwwteA4oWbJjRuBgbfHodMG1e9wyUtYVTV86Zt768Q0aG2JP0
	STSplTjVQj5tQ/BTOzDeRoAK8M4VuYOK4oRkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=x9nXVrUkwE+/gclile+83Ftmgq7k7YtG+13snRZWZyorG2bzVsYK8Zc/ecwMFxkksp
	TpDkHXfO1aETTrr1VYSADGCDv310AF7xQTzXhxfdmI6bYGDz9oMK3pydD3r9qHxr9n9S
	VGY9+jRXYgw6ODtwtaewxqJEbs11DBrNc0w9s=
MIME-Version: 1.0
Received: by 10.204.46.210 with SMTP id k18mr54465bkf.159.1297795251085; Tue,
	15 Feb 2011 10:40:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 10:40:51 -0800 (PST)
In-Reply-To: <AANLkTikkcjW1Rtt40Zt9+yZCQUJWh_P6Sdv5k8Dt=z=T@mail.gmail.com>
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
	<4D5ABB82.7000701@mentor.com>
	<AANLkTikkcjW1Rtt40Zt9+yZCQUJWh_P6Sdv5k8Dt=z=T@mail.gmail.com>
Date: Tue, 15 Feb 2011 18:40:51 +0000
X-Google-Sender-Auth: T1puu-fSM4GuCJpHlXDFPjTp3Zk
Message-ID: <AANLkTikw=CkmbBuvfqNQtJ+XF6ZFBZO9nVO+Jr3=Lpcg@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Feb 2011 18:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 18:35, Khem Raj <raj.khem@gmail.com> wrote:
> thats not it. Problem is happening when linking target libgcc using
> the freshly generated cross gcc. It should have looked for this
> library in sysroot but somehow its not looking in there
> check why is that happening.

Any idea why this is looking at the wrong path?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


