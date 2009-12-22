Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NNDCP-0001q9-4Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 23:27:28 +0100
Received: by yxe5 with SMTP id 5so2515749yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Gr/v/QyfVA3DI4pfT4F4gcS4chIv3NZzcMdbyfN1E8g=;
	b=bfDJXnndVZJz71nrp0IGYnZvucQoeY9jYvJ9WM7JvIsFudV77p10Ora8Q1gME8yDVE
	h++pWuVf4xXtmaCW9hLGZWl7fQHB167Z0pp5GJxHpqapkwOHBGJs1HAmmRYVDR09V4lJ
	tGOtbL4YXF1PRLDTXQpR7nZygmJjg6tHnRpW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rw67qG8kbKmMVbSZ3jlKQel1nzllW/6uhJTC4RU9+O+9Tz/XcfaHwAIGcpWmZu6j/S
	u9TUAIAMvB4KqxoHPa+U/KEFkr/fhgB1hpJWtl24VvY4U36mxWnh8kz1idCs+eUut/Oe
	T7rf7luGPMVm9y7JK7BDVK7VO5jOFMydhw7ww=
MIME-Version: 1.0
Received: by 10.101.7.39 with SMTP id k39mr14484148ani.161.1261520732494; Tue, 
	22 Dec 2009 14:25:32 -0800 (PST)
In-Reply-To: <20091222195157.GB2271@denix.org>
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
	<4B30E03B.1040500@mwester.net> <20091222195157.GB2271@denix.org>
Date: Tue, 22 Dec 2009 23:25:32 +0100
Message-ID: <ac9c93b10912221425g4fee3ca0kdc0257be7eb677bc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Tue, 22 Dec 2009 22:27:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/22 Denys Dmytriyenko <denis@denix.org>:
> On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
>> Guo Hongruan wrote:
>> > Hi guys,
>> > =A0 Today, I build an base-image using OE. And I want to check the con=
tent
>> > of rootfs, but I found the directory rootfs in building directory is
>> > empty. I remember there was the ontent of the target root filesystem.
>> > Why have to remove them? Does it means the rootfs directory is unusefu=
l?
>> >
>> > Thanks a lot!
>> >
>>
>> Add IMAGE_KEEPROOTFS =3D "1" to your local.conf file.
>> I'm not sure why the change was made to clean it out every build, though=
.
>
> To prevent people from using it as an NFS share and having problems.

Ehm, can you please clarify why this would cause a problem?
(btw if I recall correctly the rootfs is still there in the work dir,
and anyway you can build a rootfs in a tar.gz file and untar that).

Frans


