Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNmc1-0001OS-UM
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 14:20:46 +0100
Received: by iwn8 with SMTP id 8so5824411iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 05:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=FumtqIpacD2bHuVLT9rjnKj9eHyUv+ffRlHq3Ria8wI=;
	b=xgUPgo0hxOssa1el+YUtEmX7L/squiNPzdgo0CtBebuQpZtRP/3Abl+jiVOjIV4mD6
	b9cRL3xGy43pCPjKR1Qf/1UcJX44m+eKBn/sNwJAJJB5ER8dIMPjPeMGEZr4/9Uk5kB0
	SalS5ruhY1c0Bcj4hIH+spa2K0TrADOqKMJPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ea6q3DX71k5ZvK51zTZls562AaTsiQj3YJtkSc3C4EuMRXI/37A02EHBTjyqLahEX+
	BjSQUHjkQD4fKZL8kQUB5gV1uPz8B7ALVFO5SiwrMQET7/9BulOCpBZBpt4USqSpvCdB
	h3OVw9PjgBgSPkfCcnrTEyhP1Jdp4rmzy/6e8=
MIME-Version: 1.0
Received: by 10.231.35.75 with SMTP id o11mr8991552ibd.107.1291209564369; Wed,
	01 Dec 2010 05:19:24 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 05:19:24 -0800 (PST)
In-Reply-To: <AANLkTikSTUht-q5KgZXGuPYv91iXu7Q8Ls7f0OD2cek6@mail.gmail.com>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
	<20101127140200.GH10755@ibawizard.net>
	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
	<AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
	<4CF6346B.2060407@opensimpad.org>
	<20101201115806.GQ10755@ibawizard.net>
	<4CF63A8C.1040502@xora.org.uk>
	<AANLkTikSTUht-q5KgZXGuPYv91iXu7Q8Ls7f0OD2cek6@mail.gmail.com>
Date: Wed, 1 Dec 2010 14:19:24 +0100
Message-ID: <AANLkTikbC55+gFpuJc-oqSOewmXmG6b6D=pVC=e=ph5M@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Wed, 01 Dec 2010 13:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/1 Andrea Adami <andrea.adami@gmail.com>:
>>>> This is true. We could add some python foo and check for angstrom? In my
>>>> opinion the log2f patch is of no real harm. The tls support might be a
>>>> problem.
>
> About the tls:
>
> http://bugs.gentoo.org/204102
>
> ... in e2fsprogs-1.40.4 the way uuids are generated has changed
> (http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.40.4).
> e2fsprogs-1.40.3 works fine!
>
> Perhaps Angstrom-2008.1 could pin 1.40.3
>
> Andrea

You lost me here!

frans@frans-desktop:~/workspace/openembedded/recipes$ ls e2fs*
e2fsprogs_1.41.9.bb  e2fsprogs.inc

There is no 1.40.3 (git head master)

Frans


