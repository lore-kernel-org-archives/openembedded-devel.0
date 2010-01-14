Received: from qw-out-1920.google.com ([74.125.92.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVLtf-0007I5-3f
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 10:21:46 +0100
Received: by qw-out-1920.google.com with SMTP id 14so629789qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 01:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Iqnhmmu+RFMnfjrWzTZzfKFvPy7My7i0KjwNqWrfCNs=;
	b=wU3WlPjUJ7UuvZdsO9r7SfJrakw5MsZWDsHk0yLuVsU5x7B7DB6riD4HotRPJuKpwp
	tHSZXEBX4yYb1+KYs5WWCmTFUgbNPydY3s1WbMpDos/eA7WeuFCviueMH8iG/1d9wc6A
	lPRI/+GrTXV35j38h+oRp+L4JupiKEpFFhAD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=JyoFemZ78srSdX48l2sp5QU6nG1pk6mT5N7vf59ZcbpLmusHc5K0x0MMpa8Y5Inbs3
	ArFoj3KIzSTJV/JJAWFDAS/onYV5fPdTW84VAVCJBKbIE1yJjLxA89nEglNYa5V4selL
	ucIygzIt2aMZNj2dEi2Sev5xYZG+Sng43XHTM=
Received: by 10.220.47.214 with SMTP id o22mr377118vcf.54.1263460773370;
	Thu, 14 Jan 2010 01:19:33 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.75])
	by mx.google.com with ESMTPS id 7sm72236ywf.55.2010.01.14.01.19.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 01:19:32 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
Date: Thu, 14 Jan 2010 17:19:22 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001141014.53764.marcin@juszkiewicz.com.pl>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 74.125.92.145
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
X-List-Received-Date: Thu, 14 Jan 2010 09:21:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

After changing this way, the native tools can be shared with different  =

buildings.

=E5=9C=A8 Thu, 14 Jan 2010 17:14:53 +0800=EF=BC=8CMarcin Juszkiewicz  =

<marcin@juszkiewicz.com.pl> =E5=86=99=E9=81=93:

> Dnia czwartek, 14 stycznia 2010 o 08:55:39 Guo Hongruan napisa=C5=82(a=
):
>> * Append ${LIBC} to CACHE, STAMP, WORKDIR, STAGING_DIR and CROSS_DIR
>>  defination, so that package building with different libc will not  =

>> bother
>>  each other.
>
> How does it differ from TMPDIR =3D "tmp/${LIBC}/" setting in local.con=
f?  =

> End
> result is the same and you do not force all developers to restart thei=
r  =

> builds
> from scratch.
>
> Regards,


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


