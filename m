Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYFNt-0001vS-Q9
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:00:56 +0100
Received: by ywh33 with SMTP id 33so875334ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=OfNjqfwcKCyQghi/7tsRK0xaXyhzCcAs6DHtQrMznoA=;
	b=kVqie1XZBOrEReXet5i/YrJFVnFqGiCvNW/Gwx1x/hPe/CYIWoG3al2GCmfSvALlCn
	rYLWhwHDd1lNeUqH7Vxtgp+LJgx67tCD1Iw6wq7+1M5wRERyfqdNgY7eC2lb5aXXDlOA
	am4gOtFffuD/H3ZSrF7qczR+6YrIXnWcXoOtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=r/38yDiLRuTOG5daUGJ4Yu4HuxHWMddKqwKs9hqBmka1uaPCdNV9/pw0nwBR/Nu0vu
	yCsDNcRragVLehjBqJH01OT3YYZG2SSaoYvnKmi7EQyG8hE7CVj5PmIGbX8EC9rmHg3P
	OrTrNWXwliwE6oM5B4Ph1CZe1IP7n3jxjg+so=
Received: by 10.101.48.12 with SMTP id a12mr3383901ank.232.1264150715564;
	Fri, 22 Jan 2010 00:58:35 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 21sm732396ywh.16.2010.01.22.00.58.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 00:58:33 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
	<201001220937.43964.marcin@juszkiewicz.com.pl>
Date: Fri, 22 Jan 2010 16:58:23 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6xe7lubmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001220937.43964.marcin@juszkiewicz.com.pl>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why PREFERRED_PROVIDER_virtual/kernel in conf/machine/sun4cdm.conf does not work
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
X-List-Received-Date: Fri, 22 Jan 2010 09:00:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yes, you are correct. I have prepared a patch and send it out.

=E5=9C=A8 Fri, 22 Jan 2010 16:37:43 +0800=EF=BC=8CMarcin Juszkiewicz  =

<marcin@juszkiewicz.com.pl> =E5=86=99=E9=81=93:

> Dnia pi=C4=85tek, 22 stycznia 2010 o 07:41:30 Guo Hongruan napisa=C5=82=
(a):
>> Hi guys,
>>    I tried to build an openembedded project with the following settin=
g:
>> MACHINE=3Dsun4cdm  DISTRO=3Dmicro LIBC=3Deglibc
>> But I noticed the following warning message after parsing the bb file=
s:
>>
>> NOTE: multiple providers are available for virtual/kernel  =

>> (linux-palmpre,
>> linux-rt, gumstix-kernel, linux);
>> NOTE: consider defining PREFERRED_PROVIDER_virtual/kernel
>
>> My question is:
>> In the conf/machine/sun4cdm.conf, there is the defination of
>> PREFFERRED_PROVIDER_virtual/kernel, see the following line:
>> REFERRED_PROVIDER_virtual/kernel =3D "linux-sun4cdm"
>> Why did it not work at all?
>>
>> Anyone can give me some hints?
>
> edit recipes/linux/linux-sun4cdm_2.6.8.1.bb and remove COMPATIBLE_HOST=
  =

> line.
> Due to changes it is no longer sparc-linux when you do build for sparc=
  =

> arch.
> This line can be exchanged with (more proper one):
>
> COMPATIBLE_MACHINE =3D "sun4cdm"
>
> Regards,


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


