Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv5FI-0006bj-ON
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 11:59:28 +0100
Received: by eaal10 with SMTP id l10so108528eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ZbAbN0XezKsro1NHJTc55z930vBx56WSqZcluQM1yrc=;
	b=Xrn4naU7ongEdefM0zlXcxKpNiK7zouVbtqWA9Ele33Acs8BOMplpklbmam2bQx2ta
	zw1nAm6cTaEf24iL8Iwj87yiuS2LM3abDIKpPcge75uSIAmyCT+Nw1QQcQRgXXInJctk
	44vRh7L1IP8rPZiOKVmZF5825M4j1COjH/gEA=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr6216721eeb.39.1328698283981; Wed,
	08 Feb 2012 02:51:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 02:51:23 -0800 (PST)
In-Reply-To: <CALbNGRT=M=x7dTr68hLVs37ZAOQ1EOerAn+AbbXveAz6AMcABg@mail.gmail.com>
References: <CALbNGRT=M=x7dTr68hLVs37ZAOQ1EOerAn+AbbXveAz6AMcABg@mail.gmail.com>
Date: Wed, 8 Feb 2012 08:51:23 -0200
X-Google-Sender-Auth: tOXOGRA-1f-QSRgiiplXNW8AUYc
Message-ID: <CAP9ODKoncRTJ8Au565YR5dE9sVk_ECH3eS6kFKGbsdXFKSEoLA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: IMAGE_FEATURES questions (was [meta-oe][RFC 00/27] systemd / initmanager rework)
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
X-List-Received-Date: Wed, 08 Feb 2012 10:59:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2012 at 08:40, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> If I understand this right, the angstrom default is kicked out by my
> local.conf. Since I use this configuration for a while now: What has
> changed causing the directories missing?
>

We are slowly fixing postinst scripts to work off-line and thus the code
that removes it in case all where runned fine is now run. Just that.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

