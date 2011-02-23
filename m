Received: from mail-bw0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsF4o-0003QN-6b
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:48:22 +0100
Received: by bwz2 with SMTP id 2so82307bwz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=59BWWJGk4BHC+HrtZdXeQENOmcivmXzY5WfOYjuwPpk=;
	b=A4Zw1lNoWFAEE5KwE2BCZhTYpo4CPY2/3xuz2w59aXH0VxZlBfc3bKdAPDfh8NUleN
	lNnseDPLrEdiDMPzfQ1NKkEEPsFS+9AAEDLRVtHz0IBkIRIrUzMK+tFxEFayFP6oKDNN
	e76Apq519RHtcMQXv8pTiWzoHWMG9s59U/zIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=BEx0T6wFIbVXgAmmhEMHWl8F3yudvi+Q6LfJrxbI8LRu7qUiSX95oTNPQhWYeuY4MR
	p5VWzASsN+eS4hIVRVCoiAvVkPqQ+Slp70oVsHyLvbshTXB8dF+oJv/FuiI5SNA2SdUb
	/5DQ6XFoooStDehMAWl6aKtJlPqFswq1kxelM=
MIME-Version: 1.0
Received: by 10.204.47.227 with SMTP id o35mr3595652bkf.132.1298468822890;
	Wed, 23 Feb 2011 05:47:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 23 Feb 2011 05:47:02 -0800 (PST)
In-Reply-To: <1298468511.2178.430.camel@phil-desktop>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298468511.2178.430.camel@phil-desktop>
Date: Wed, 23 Feb 2011 13:47:02 +0000
X-Google-Sender-Auth: 7_39RlRlYBQQCPOcuOZQQVqCenQ
Message-ID: <AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/14] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Wed, 23 Feb 2011 13:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 13:41, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-02-23 at 13:07 +0000, Otavio Salvador wrote:
>> - =A0echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-=
2.6/Modules/ )" >> ${WORKDIR}/toolchain.cmake
>> + =A0echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-=
2.8/Modules/ )" >> ${WORKDIR}/toolchain.cmake
>
> This seems a bit fragile (and, presumably, is bad news for anybody who
> is still using cmake 2.6 for any reason). =A0Isn't there any way to
> automatically select the version that matches
> ${STAGING_BINDIR_NATIVE}/cmake or whatever?

I see noone using cmake 2.6.

In any case cmake will know the "internal" modules directory by itself
so it works even if this value doesn't match. This is where it is
going to look as fallback and I was using 2.8 without 2.6 for long
time without noticing any issue.

This seems safe. We could drop the CMAKE_MODULE_PATH if preferred. I
just fixed it to 2.8 to reflect the current default one.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


