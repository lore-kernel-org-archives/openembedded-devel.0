Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NQzbP-0002e6-VH
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 09:44:55 +0100
Received: by pxi13 with SMTP id 13so6324477pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 00:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=VrH709eRgNFVPq7Z3lOd1LxlodPDM/fFm0oVtZZCEN0=;
	b=py2/KpmNwwYf9pSP+m6iGGzdhA0VcLmGpLzj3aZ09tRfnxAN4D8io9zmMG124wEpAx
	HsJo6yc19OKAWGiErbBIAHpuBEeBDWTGJvLK94hLwV+ie14fdt+gq3bVEcLFFFkDUSFg
	MnH5PLybaNQ2RtWOuoJVYKA9r6QduShw/aJo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=bkgVaw2GCHyehAnRwRPoOPWVkVu5lL2cgTZUSh7OOIObh1+kPEtDIL2VlJ0BKdiVx+
	Bz2aJrgJFE6iOMlxTAHZQoar9Sy3JdE6ABSFI97l1mJnGdetE3E1xM5BCC0jyEZErTh0
	rPQw/NxiwQz+Y65ZV6iILtSwqOKaHdEegvOrE=
Received: by 10.143.20.21 with SMTP id x21mr14330945wfi.17.1262421770335;
	Sat, 02 Jan 2010 00:42:50 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm15991080pzk.1.2010.01.02.00.42.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 00:42:49 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262417674-26652-1-git-send-email-camelguo@gmail.com>
	<201001020935.04959.holger+oe@freyther.de>
Date: Sat, 02 Jan 2010 16:42:30 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5wc44txmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001020935.04959.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix compiling error of uclibc-initial-0.9.30.1 due to incorrect uClibc.machine for qemumips
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
X-List-Received-Date: Sat, 02 Jan 2010 08:44:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi,

=E5=9C=A8 Sat, 02 Jan 2010 16:35:04 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Saturday 02 January 2010 08:34:34 Guo Hongruan wrote:
>> 1. Add mips entry for linux-uclibc into package_qa_get_machine_dict o=
f
>>  insane.bbclass. Without it the insance check will fail due to key mi=
ss
>>  exception.
>
>>  2. Rewrite the complete qemumips/uClibc.machine, In the
>>  previous one, the TARGET_ARCH is set i386 (not mips). ---
>>  classes/insane.bbclass                             |    1 +
>
>
> Please split up the patch as there is no relationship between the two =
 =

> things.
Sorry, I will. I found these bugs using the same test case.

> The first one is a nice catch and I thought we already had this. I can=
't
> comment on the second one.

The second patch is obvious. The qemumips/uClibc.machine was copied from=
  =

qemux86/uClibc.machine without any modification. It causes the building =
 =

for qemumips + uclibc failed.
>
> The other bit is... use "Signed-off-by:" on your patches if you want t=
hem
> included in OE. Only if you use the above they will show up in
> patchwork.openembedded.org which people go through to look at outstand=
ing
> patches...

Signed-off-by? How to do it. Could you give me some links about this  =

topics? I will google it
>
> thanks
> 	z.!
>
> PS: keep up the nice work :)
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


