Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8Fw3-0003is-V8
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:25:16 +0200
Received: by iwn2 with SMTP id 2so2780999iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MRG7DbVlQMy937n6/unCV+7e8VlIizgqStm/+LeluN0=;
	b=Smitfj6EZYKpN/cUKtH1ogcivN+tPWIRdP1jOmj1PnVzwrDdIEBaXQBc5grNfJLMUQ
	Fd8nhsQmhUr9gjlFt6QBS2LwS3dtyxD7WDJZE/PASGOIbQmuxb61thCHKKPx3Eles2t0
	yrkeVEXo1FjbFqKFDmx2mZTVQ4BKG/PL7Kd3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r3wkVrBdtqCqRFs/Zr4AZedej4bne/blKl1Kyla7aI4tt2fpjiFclofsysyoDiM58n
	ujJBM0l/jgDhpHx1t17/eQyB43SKwkI+UFqZQhLx/N5bAIl52VSGxC+3zFc9ii6f09aC
	ldzw3/C5BR+cZAaZbDMMFbHT03olhkSpeRuvU=
MIME-Version: 1.0
Received: by 10.231.19.136 with SMTP id a8mr5126400ibb.86.1287509079907; Tue,
	19 Oct 2010 10:24:39 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 10:24:39 -0700 (PDT)
In-Reply-To: <lylj5u3ycq.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<lypqv6492b.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
	<lylj5u3ycq.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 19 Oct 2010 19:24:39 +0200
Message-ID: <AANLkTim2CESiO-5vq-utS1=HZVYeSt=bGvLxg5v+E96m@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Tue, 19 Oct 2010 17:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/19 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:
>
>>>> + =A0 =A0 os.system('rm -rf %s/*' % (pkgcopy))
>>>
>>> Can be written as
>>>
>>> =A0os.system('rm -rf %s' % (pkgcopy))
>>> ...
>>>> + =A0 =A0 os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
>>>
>>
>> No this is not good. The rm command you give will also remove the dir.
>
> Why is this bad? =A0The dir is recreated by the 'cp'.
>
>
>> The cp command will copy %s/.
>
> Only the final permissions of <dstdir> may differ between
>
> =A0rm -rf <dstdir>
> =A0cp -pPR <srcdir>/. <dstdir>/
>
> and
>
> =A0rm -rf <dstdir>
> =A0mkdir <dstdir>
> =A0cp -pPR <srcdir>/. <dstdir>/
>
>
> In first case, <dstdir> gets permissions of <srcdir>. In the second it
> keeps the permissions from <dstdir>.
>
> Else, content (both the files and their attributes) of <dstdir> will be
> the same for both operations.

Yes, you're right. I accidenlty dropped off the / of the dstdir when I
tested this earlier.
Sorry for the noise.
Not sure if there is a gain though.

Frans.


