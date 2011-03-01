Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuNX7-0000LS-Vv
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:14:26 +0100
Received: by bwz10 with SMTP id 10so4448409bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=dFjHA9e3vHXPK2QVq99Vn2m0wjZAclc9YfUkPQOwafk=;
	b=Sq5Le4KTGe0OaIWFASRQhMLs0j35n46m/O34CrmtYVjrEIt6MKnl3o201KaplYWcyM
	vdJVvtSNEWi6NcqtWMoVMe7DZu3T76L+yQ2IJf5zTkiv9YF9F7xIVR/s0CAFHOn2pYps
	ctn8pMbN9WVwH4a8YTMmQZGXLhfXb3vbQemVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=gj6lLWa9XRb3KXw15ViZMHG0KZb0siYmAmu9lJmng1VHXnLVVTguoUwdH3TQDmOI2e
	HhTrQd1Land+uzdPN/TWjCNInhGF3LBWBJQaFrK2h1lG7oTF5jaEGc1BdWmsKgzqhfw8
	15lzYgOSfRlk4Hdkj+w9UJYK6eiTLgxjE7X1Q=
MIME-Version: 1.0
Received: by 10.204.140.208 with SMTP id j16mr5870340bku.151.1298977977435;
	Tue, 01 Mar 2011 03:12:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 03:12:57 -0800 (PST)
In-Reply-To: <20110301024025.GB651@sakrah.homelinux.org>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298468511.2178.430.camel@phil-desktop>
	<AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
	<20110301024025.GB651@sakrah.homelinux.org>
Date: Tue, 1 Mar 2011 11:12:57 +0000
X-Google-Sender-Auth: x_FYIpFFw9R9fUM5__C8IrjdB0M
Message-ID: <AANLkTikY6D008fHAkOh2zR7N+9a++5kOAB3S3bP2VWz9@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, Phil Blundell <philb@gnu.org>
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
X-List-Received-Date: Tue, 01 Mar 2011 11:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 02:40, Khem Raj <raj.khem@gmail.com> wrote:
> On (23/02/11 13:47), Otavio Salvador wrote:
...
>> I see noone using cmake 2.6.
>>
>> In any case cmake will know the "internal" modules directory by itself
>> so it works even if this value doesn't match. This is where it is
>> going to look as fallback and I was using 2.8 without 2.6 for long
>> time without noticing any issue.
>>
>> This seems safe. We could drop the CMAKE_MODULE_PATH if preferred. I
>> just fixed it to 2.8 to reflect the current default one.
>
> yeah make it portable for future if no one is using cmake 2.6

I did not understand what you meant. You mean to drop CMAKE_MODULE_PATH?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


