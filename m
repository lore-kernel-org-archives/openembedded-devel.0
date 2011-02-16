Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpjKp-0004zY-PI
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 16:30:32 +0100
Received: by bwz10 with SMTP id 10so1583425bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DpPqqzaPJXAk9MZYXvb2n7sgjwF6gjm7onqFe/fOEu4=;
	b=SVs6se5DHv2q0v21kQ3r8/gh9FRbTWsQFJBrEMjfKJGzsFG4BJsaEj+bBE7qFnRsnH
	ULEQltYebd8bIj3QD7HuT4IpAl4mZIM4Ducd3qF6t+AS6ScOH2zQOx7RRv+murRQfEmC
	QJmFpieBz4sjieTXJUN4fdGT2CWnhK8HjqL7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=lAWA1MbGoX7kjkcC2UfSf3kAjvkTD5aW6pS2CaBMaYf4UtReztJ3L3UL3LYMmMJvGC
	3rCQgeBKNlXFX662GzSjv0IumJDypmySRYrQ1GYaY7OevXr/rJ6ODpf7JBDkVKCPAZFq
	2X60S9UxvQdYaM/PFug1YmpfmWe16HRtyyyH8=
MIME-Version: 1.0
Received: by 10.204.15.83 with SMTP id j19mr583105bka.105.1297870155987; Wed,
	16 Feb 2011 07:29:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 07:29:15 -0800 (PST)
In-Reply-To: <AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
	<AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
Date: Wed, 16 Feb 2011 15:29:15 +0000
X-Google-Sender-Auth: StnWjKVJrPvyO23j2JQgJNiWVNg
Message-ID: <AANLkTinqrwAjKLk3rDNXNVdt1sAJd+J1R-xdAjtD2Dzg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 08/13] cdparanoia (svn): use build variables to fix packaging when using empty prefix
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
X-List-Received-Date: Wed, 16 Feb 2011 15:30:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 14:48, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
...
> Did a quick check. We have 24 other recipes that refer to ${D}/usr/bin:
...

Yes; they all need fixing otherwise micro based devices are going to
fail to use them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


