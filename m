Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbQuC-0007yy-NM
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 04:55:28 +0100
Received: by pxi9 with SMTP id 9so2903761pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 19:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=3OHc9zaIfk/2KCEcfhjzk/XafaWza1/BpiVTdMLiFag=;
	b=t5RJeO0no1BDojr1gpKroejaiPq5QcK/3pCVHHBdOoqwcXXmTJuVQINntSj2TJgt1l
	IYH7N3U1X9FViDAyjac9ApkXhQUhUPs4jAu4QM3LSP9S6pUN9J61S6Kauovu6zE15Z/F
	1TQ+LgTaoFHMZ2FcvoAUS2TV++MuqylN54/TY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=OCxUpY9TJH3xvTpVo8yitzOaJSibo52+O1AUiBIPwz6AZoxS41i5lcwqSJw0wuwI/3
	4BnhBDC5IKLX19MV+jxX90g8Qpx1OLBY7L7UizRbh2087yahLNlENDoMhmOZZgKN7SyT
	jmftkiw4dsQbjNl5O28212fAFSDAmPDAB3VdM=
Received: by 10.141.105.20 with SMTP id h20mr1943971rvm.154.1264909978831;
	Sat, 30 Jan 2010 19:52:58 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3113766pzk.10.2010.01.30.19.52.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 19:52:58 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u7dnj4v0mn1qzu@camelguo>
	<201001310435.35312.holger+oe@freyther.de>
Date: Sun, 31 Jan 2010 11:52:50 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7do2cw1mn1qzu@camelguo>
In-Reply-To: <201001310435.35312.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 03:55:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 11:35:35 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> Now to the hint:
> 1.) The issue seems to be caused by using newer GCC?

I searched the error through google. It said that the error occurred usi=
ng  =

gcc-4.4.2, while using gcc-4.2, it works OK.

> 2.) Take it up with upstream uboot to see how they want it to be chang=
ed.
> 2.1.) E.g. removing the "inline" could work and it should not increase=
  =

> the
>        size of the text section
> 2.2) E.g. instead of using the alias it could call the inline function=
...

Someone said it can be solved by removing 'inline' keywords.


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


