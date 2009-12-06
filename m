Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NHME9-0007HU-6y
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 19:53:04 +0100
Received: by ywh28 with SMTP id 28so4438170ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wiz77ACYwPy5Nobrt6ujdj+PgPr0tsl8KshSr/gfOfo=;
	b=wGZNepxKUmQVVviKin2gcfjdXk2WUMKP64nRZ7sjFR48Y6AMh0RkthGrG5BPvetBl8
	OWJYcwVfhOBBY4FoyU3QTrAFVwQHujZ7Jyah7fi3Y8FA4ixU3oy+hBRzhFPXdY9vs6SN
	aXMK9em00QVtIxb5QmMeTPAizs+4FvnufQm8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=K71XuLqI47vKN/j3Gvobz4763YXJ8WgsxpG4fSw8C+IWKyUlasyDUe3B5TX1Hq3t8d
	gab7+XZi3xaTzYhOfW2I+mhExfdz/Xb0WPXUn21f8zANpwN0QTCZwFoUtBUCuXZFlgvJ
	Wuc9TXUfO6etTTgrtqD+izCq1UsTqi/jUevfc=
MIME-Version: 1.0
Received: by 10.100.246.25 with SMTP id t25mr5122608anh.33.1260125481792; Sun, 
	06 Dec 2009 10:51:21 -0800 (PST)
In-Reply-To: <20091206075442.5eda3c23@xora.org.uk>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
	<20091202114959.GA8668@zlo.nu>
	<ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
	<20091206075442.5eda3c23@xora.org.uk>
Date: Sun, 6 Dec 2009 19:51:21 +0100
Message-ID: <ac9c93b10912061051j6826faiaa2f3fcbdd5b850b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.190
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Sun, 06 Dec 2009 18:53:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/6 Graeme Gregory <dp@xora.org.uk>:
> On Sun, 6 Dec 2009 13:17:16 +0100
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>
>> It would also be nice to be able to get the used by information.
>> E.g. if I change a package (especially wrt staging) I would like to
>> verify that the packages which use the modified package still build.
>>
>> The current el-cheapo solution for a package XYZ is to do something
>> like a grep =A0DEPENDS.*XYZ */*.bb but of course that won't work if
>> DEPENDS spans multiple lines.
>>
> bitbake -g target will drop a dependency graph in the directory you run
> bitbake from.
>
> Graeme

Graeme, I know but I would like to have exacty the reverse: a list of
packages that depend on the package at hand.
bitbake -g gives all packages a package depends on, but I would like
to have a list of packages that depend on a specific package.

so e.g. I want to get a list of packages that depend on libxml (and
bitbake -g libxml gives me the packages libxml depends on).

I hope that clarifies my question.

Frans


