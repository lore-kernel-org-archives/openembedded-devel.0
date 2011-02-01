Received: from mail-qy0-f193.google.com ([209.85.216.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pk9tq-0007YA-77
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 07:39:38 +0100
Received: by qyl38 with SMTP id 38so867707qyl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 22:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=QvOgLeahB8w53ZViu/JNwt/TEDzFTsdb3YxTByuAGxg=;
	b=rSSkWBnBVJ+2SgeXkjbQ4iqyjgEEVhonS0N8fmNYXmwxT+1Uhc3KIrTW41gcdItsbv
	ulpiR8Ra1TYsFBgsgSz1AcNd54nJNEQsYvnB28VkgVDanJcvDec8S6QmewYfNEM6op7y
	aODbAxRtVUUUNuloQwVV8OlNf5d/DSkJ1b6H0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gpv2iEMmvz0PSyG4GfaS16UGmMtG/8uITZ77DTYjwL7ro5mvC1EqfnZX6BWBZQal3k
	k2Gc/njmZoBFFHp0Fyx0EBSZ+JLweA+I8pqYhlTHYVTykv3zn2+MifFnbFnDPUz0dLUA
	NguJYXGn+FVAEbs0ecYIeUwqqTM5CgbbdKRkY=
MIME-Version: 1.0
Received: by 10.224.37.77 with SMTP id w13mr7175229qad.367.1296542323511; Mon,
	31 Jan 2011 22:38:43 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Mon, 31 Jan 2011 22:38:43 -0800 (PST)
In-Reply-To: <20110131212130.GB10042@ibawizard.net>
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
	<20110129140758.GM2466@ibawizard.net>
	<AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>
	<20110131212130.GB10042@ibawizard.net>
Date: Tue, 1 Feb 2011 07:38:43 +0100
Message-ID: <AANLkTi=b8QHFgH9Bp4gEBa=rrJt9hQpaxKqdtHa7iAdt@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Tue, 01 Feb 2011 06:39:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2011 at 10:21 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:

> Marek Sujak <sujak.marek@gmail.com> [2011-01-31 09:43:58]:
>
> > > Duplicate DP=3D-1 and you can drop the comment also, it's wrong anywa=
y.
> >
> > Done.  Should be removed in Patch v3. I was unable to git cherry-pick .=
..
> so
> > i rather cloned whole repository and make patch again.
>
> And that's why you've made it wrong again :-)
>
> Yes, you've sent two patches, but with wrong content. It should be two
> patches,
> but first one should add generic support for Barebox 2010.10 as Eric
> suggested
> and the second one should contain support for your vmx25 machine for
> Barebox:
>
> [patch v4] barebox: add recipe for 2010.10 release
> [patch v4] barebox: add support for vmx25 machine
>
> Yes i did that, i forgot to merge machine support patches. And after firs=
t
commit it was to late for me to fix it.
 At least "[Patch v3] barebox: added recipe for barebox v 2010.10" should b=
e
ok.
Just machine support are divided to (1=3Dpatches + 2=3Drecipe update)
[PATCH v3] barebox: patches for barebox 2010.10 to support vmx25
[PATCH v3] barebox: update barebox 2010.10 to support vmx25

It is partially acceptable or should i rework it again?

Thanks

Best regards,
Marek

