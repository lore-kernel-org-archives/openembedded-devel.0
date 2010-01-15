Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVb80-0003PB-Dy
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 02:37:35 +0100
Received: by gxk7 with SMTP id 7so158020gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 17:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=45c7vCQFD9atQOOaHkkNByCmCPKuVIHh4bwFc5XrEr0=;
	b=GvDOwr5M0rhBjprb0m5twq1K97TqKApcHX0WOCYw5wBI+ddAjDBLdT1OwBHhcegE+q
	iJZteIqgDzrEb3It5FTvbB63tOEH1gNebhywCMUYAZzB5gVjUnQjEEfQj6wcmll8bHab
	hWn8wxN0sfxSgZodrMAVBBd+aZysRgYC68524=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=aW52sb5V7iTe0Y12PYEC3R0DVteg/pwCYHriQQNn1rQSCnfyc0NITrBDVPfcsFXTOL
	eEBB1jEkA+MjzzN47Bj1/OTiCuyTZED14cKCMNMgSRnkwhUuSXSUyBp7ODIUTHKo81ZE
	jPLVHPUGDfOi0eXKEGmSanJ4NfUqiKaLoN77M=
Received: by 10.101.180.9 with SMTP id h9mr3100773anp.187.1263519320291;
	Thu, 14 Jan 2010 17:35:20 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.75])
	by mx.google.com with ESMTPS id 4sm478717ywd.29.2010.01.14.17.35.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 17:35:19 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
Date: Fri, 15 Jan 2010 09:35:13 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100114195301.GA3529@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 01:37:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 15 Jan 2010 03:53:01 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On (14/01/10 17:19), Guo Hongruan wrote:
>> After changing this way, the native tools can be shared with
>> different buildings.
>
> They get shared even now. I have my TMPDIR =3D /scratch/oe/build and
> DEPLOY_DIR =3D ${TMPDIR}/deploy/${LIBC}
>
> I share the native tools all the time

This way, the packages built in ${TMPDIR}/work/ will bother each other. =
It  =

is obvious that a binary package built based on uclibc is different with=
  =

the same one built base on glibc. So I think it's better to classify the=
m  =

using ${LIBC}.

After applying my patch, all everything built based on uclibc will be  =

placed in some directories different with glibc,eglibc. The stamps will =
be  =

placed in ${TMPDIR}/stamps/${LIBC}, the package data will be placed in  =

${TMPDIR}/pkgdata/${LIBC} and so on. So you can see, when I tried to bui=
ld  =

lots of projects (with different libc), their data will never bother eac=
h  =

other. In you way, we must select different TMPDIR for different libc,  =

that are very convenient for incremental building by QA.

And more, the native tools (quilt-native, qemu-native) are completely li=
bc  =

independent, so they could be shared with projects with different libc. =
 =

After applying the patch, native tools are shared. It will save my  =

building machine lots of time on building native tools.

>
> -Khem
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


