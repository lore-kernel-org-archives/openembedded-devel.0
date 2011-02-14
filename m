Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pp20j-0001W5-Jh
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:14:53 +0100
Received: by bwz10 with SMTP id 10so5397553bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a2qyXAMnJOSCsd2atfEOamMQA+GjNVMrkH/V8UPm3GA=;
	b=aYWH5vk7wuecEUbhHRRf/yuhX/B/Yrgb9of5K6YnQC0M8Fbh36v9yHaAcu+XK3gxrk
	5MYfnKLJRTfF8pbwh1ZJD7PoWHF4uIl9is9ZOG1kaF8zzEcIeHDmhg30M0OYrM7zSVK3
	PbJ7Ez47YOzx5WqGtFEGNYIo7ijePgsQ3aoqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=khuPiKvrYPUlh6OEHMI6JjrYAhlPZLaQhNGfih2Y/lAa+TZxT8W8aOr60+z+bFy4Ln
	9UFx6RgnyaIbwYatHPrw6y72S1ZIyh2Za/vkbWqozBle+vbQh45sKbhYwylFPJ5amMz5
	w5+5pAy7VamlUMiNYjGq9r0QYaqd7cQSTDKko=
MIME-Version: 1.0
Received: by 10.204.124.6 with SMTP id s6mr3537677bkr.51.1297703621129; Mon,
	14 Feb 2011 09:13:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 14 Feb 2011 09:13:41 -0800 (PST)
In-Reply-To: <AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
	<AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
Date: Mon, 14 Feb 2011 17:13:41 +0000
X-Google-Sender-Auth: k58ICshxN3NbzjJ3hpOSongyhMU
Message-ID: <AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Feb 2011 17:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 17:08, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> On 2/14/11, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> I agree that this ought to be split but I think that it should be done
>> by vendor:
>> realtek, ralink and so on.
>
> What would be the point of such split?
>
> I have split it by buses, because currently having full support for
> PCMCIA devices on my Jornada 720, I have to install 13MB of PCI
> firmwares and 8.5MB of USB firmwares, which I will never use (because
> I have neither PCI nor USB bus on it) just to have available the 200kB
> of PCMCIA firmwares.
>
> Most of the firmwares in the repository are for removable devices - we
> (as the OE/distrubution maintainers) are by definition not able to
> know whose products will the user plug in.

Right but usually we'll have drivers/modules for one, two or three
vendors that are used or demanded to be supported and then those
firmware needs to be supported as well.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


