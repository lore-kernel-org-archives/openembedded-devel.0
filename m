Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NHMwo-0005t2-Ba
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 20:39:15 +0100
Received: by yxe5 with SMTP id 5so1640410yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RrzBGpGzWmd5c6/mmF05TGwm7nwPr96jWV/G3dF5f2U=;
	b=cxfGsTB3wkCIsxEicKf27/O2x2hZ0fDejkdD6iIk9MjN/exrEwdCqRNUDyD3YosEid
	1uNf1p8C1rVwUzmvqLwAcXBUIz6W5PDBByyv7DYkr8kg1QhOkOp5wJ/Mh4Wj7lZYZnii
	dvyDqRmuzxa7wqsu7OrkO+NDbB9xIOB9Yyzgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GTwVHuYi4sW/OoMmKD7E2OUz3bMFYITboD1KFco+YF3JsMcwWpZnnkJ58N22K6q8rN
	CDufrw39rdlrIXDZJ3A8VPOudT1JEO0JRVZeR5ckczOhf3oTuqeygErknhutRI7XBbyC
	8xpulWet4DYpd69exFAEBj9bH7SyFo4TgAi/4=
MIME-Version: 1.0
Received: by 10.101.7.20 with SMTP id k20mr5142805ani.35.1260128250997; Sun, 
	06 Dec 2009 11:37:30 -0800 (PST)
In-Reply-To: <20091206120513.235ea20a@xora.org.uk>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
	<20091202114959.GA8668@zlo.nu>
	<ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
	<20091206075442.5eda3c23@xora.org.uk>
	<ac9c93b10912061051j6826faiaa2f3fcbdd5b850b@mail.gmail.com>
	<20091206120513.235ea20a@xora.org.uk>
Date: Sun, 6 Dec 2009 20:37:30 +0100
Message-ID: <ac9c93b10912061137j5dbffb32x12a0deaa772974c9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
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
X-List-Received-Date: Sun, 06 Dec 2009 19:39:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/6 Graeme Gregory <dp@xora.org.uk>:
> On Sun, 6 Dec 2009 19:51:21 +0100
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>
>> 2009/12/6 Graeme Gregory <dp@xora.org.uk>:
>> > On Sun, 6 Dec 2009 13:17:16 +0100
>> > Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> >
>> >> It would also be nice to be able to get the used by information.
>> >> E.g. if I change a package (especially wrt staging) I would like to
>> >> verify that the packages which use the modified package still
>> >> build.
>> >>
>> >> The current el-cheapo solution for a package XYZ is to do something
>> >> like a grep =A0DEPENDS.*XYZ */*.bb but of course that won't work if
>> >> DEPENDS spans multiple lines.
>> >>
>> > bitbake -g target will drop a dependency graph in the directory you
>> > run bitbake from.
>> >
>> > Graeme
>>
>> Graeme, I know but I would like to have exacty the reverse: a list of
>> packages that depend on the package at hand.
>> bitbake -g gives all packages a package depends on, but I would like
>> to have a list of packages that depend on a specific package.
>>
>> so e.g. I want to get a list of packages that depend on libxml (and
>> bitbake -g libxml gives me the packages libxml depends on).
>>
>> I hope that clarifies my question.
>>
> Still the same answer, bitbake -g world then parse the graph.
>

Ah ok, forgot that bitbake -g world would give me the complete graph <blush=
>

Thanks, FM


