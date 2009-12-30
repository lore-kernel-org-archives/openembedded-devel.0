Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPu4Q-0005y8-0O
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:38:21 +0100
Received: by pwi18 with SMTP id 18so7235124pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=EMPC6ceKuCoYb+S6dAUiJk/Xhz+hBKLg5WiVNVpYm8Q=;
	b=iwXR6rOn0nSbPBXTZVf5lWV3gjinCuZeWo6wMvWykfw9CCx1rXfIAf9+BiSdt5wIET
	0eu50uM/Gh/aC1cwXTegYAATHyWpfapzERgzA/w5FmvifdAMvOKOir/5BYhxfbZ+G4QH
	SuxeGMFv/80J/zGKtMvdoQzgRes2yNAznGp+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=KY6+/YEd7y+RYOks9TZj3XOVBWag9mt8dESgyDJzNCXbNtfTAk69KxdF5UsFEb5Ru4
	1VXmFqHwZpZcaOa7wXZSSlB6FtmopEBBDQgMJWtHPy26tDshFEIlQ3K7jj4is2Ksj+q5
	EblYhYjfv2Ca/G6PPSvMBeUhgD4MMHjy+9Jg4=
Received: by 10.142.66.27 with SMTP id o27mr11358241wfa.216.1262162178075;
	Wed, 30 Dec 2009 00:36:18 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm13330102pzk.1.2009.12.30.00.36.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 00:36:17 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
Date: Wed, 30 Dec 2009 16:36:09 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912300930.12895.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 08:38:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

The micro/micro-uclibc specific check does cause the miss of the  =

/etc/default directory, which is required by the following installation.=
  =

So the installation of base-file failed when DISTRO=3Dmicro or  =

DISTRO=3Dmicro-uclibc.

On my site, the following check did work. I have verified on qemux86,  =

qemuarm and qemumips machine.

I am not sure the goal of this check.

=E5=9C=A8 Wed, 30 Dec 2009 16:30:12 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Wednesday 30 December 2009 09:15:36 Guo Hongruan wrote:
>> 1. Remove the *_micro variable overridding;
>> 2. Remove the micro/micro-uclibc specific installation decision, whic=
h
>>  causes the installation of base-file failed when
>
> Are you sure the initial goal of the check is still met? If so, it wou=
ld  =

> be
> nice to find this as explanation in the commit message.
>
> thanks
> 	z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


