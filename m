Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pq17q-0002IZ-AE
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 11:30:18 +0100
Received: by bwz10 with SMTP id 10so2343729bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=bUr/sEsddSEud0CfG+Som7uGb3qVEyCAPs8B4C6mNhs=;
	b=p6hAhqPWopmcp88ICZnlHWgumDNJZicM+3+/t4lRh1GOsbabHGW93IvlxBiB/27y+z
	NyLbmH4+1jgQhoe5bFITIsB+meDpTUtuatTRFnOg6lGxZ4EF07mB+iVKIwyDshyjVEd7
	feA36rw7t+h1gv7b4keUb7mb21zMqdkjBNjRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=Xi8JAK792OD5mszt2I8zwAgOAn9MjCsQSraQbMmLS+kHyzH4L17Pm5yJXt3QluipOa
	8y0imAHcEQ+ywUy60OCUDvwpNCMBWfjTuby5oFXTKsEfRYogOmwMDIgShYOR6FHcnePl
	UJe8tkd4Ba9nSfFXjM8cvWEzsCY6i5Fm3FdSI=
MIME-Version: 1.0
Received: by 10.204.46.210 with SMTP id k18mr1431528bkf.159.1297938527108;
	Thu, 17 Feb 2011 02:28:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Thu, 17 Feb 2011 02:28:47 -0800 (PST)
In-Reply-To: <AANLkTikm_vK8ygnO00w0__UsQ93_q=pAUaA4A4tpWUXb@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
	<20110216230953.GT14525@sakrah.homelinux.org>
	<AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
	<20110216231949.GY14525@sakrah.homelinux.org>
	<AANLkTikbG2APGZh53J3fv9sGZYx_C7M0kuRWNmKCfO1D@mail.gmail.com>
	<AANLkTikm_vK8ygnO00w0__UsQ93_q=pAUaA4A4tpWUXb@mail.gmail.com>
Date: Thu, 17 Feb 2011 10:28:47 +0000
X-Google-Sender-Auth: DNXAPh-E9I3vxbEb-7PJez1Py_g
Message-ID: <AANLkTi=ZjFjd-q59+UuFnvQGHUgtoHRD_3k-6v2ZO+_1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Thu, 17 Feb 2011 10:30:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2011 at 03:39, Khem Raj <raj.khem@gmail.com> wrote:
...
>>> Could you revert this and see if it fixes your i586 gcc-cross-sdk issue
>>> ?
>>
>> It doesn't since Jay has tested it and it failed to him for
>> i586-generic and qemux86.
>
> yes I can reproduce the problem. Its a gcc ICE in this case. I have
> few worarounds
> but let me first acertain the real cause.

I reverted it and it keeps failing.

The class change, can be acked-by? it is required by the qt-tools-sdk chang=
e.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


