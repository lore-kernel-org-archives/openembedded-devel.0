Received: from mail-pz0-f183.google.com ([209.85.222.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NgJus-0004f3-8r
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 16:28:21 +0100
Received: by pzk13 with SMTP id 13so4137963pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=L31Q0g6NSy995LQR4GG/5u2YwzezL1/w0vzi7hnDsWQ=;
	b=IaUmE3Dwz7EvtD4UFeSx25lm/Fji2lI4LcpwR9pd64NPuMi8yGTbudYsW8E2SSGONc
	PcYhpNulxo39KSyT5P3GRsQmfw6EFa4BUGgYNOoIXA6QJ41kXOsHoYZD+6Tgq+bUsPMt
	jnWz5Kw4h8P4VDjWxqG2hF/2r4lamj6PUkGLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wHS4PMHlynqhgAFKTmffaPKAqprsDHrdZbV5h52WZGuQJyjyDr78NG7WtQxmXHO5Gm
	g0gbjzvY4BbBM56gWh6sCqbAw72DgHqfSKNYKtIztdkc26LgQHgUC8XP88XJJSY1hgrJ
	hym3ze2PMyT6YNoNcwN+kY708MLEBCE8/MCVw=
MIME-Version: 1.0
Received: by 10.114.249.38 with SMTP id w38mr1955904wah.111.1266074739340; 
	Sat, 13 Feb 2010 07:25:39 -0800 (PST)
In-Reply-To: <ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com>
References: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
	<ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com>
Date: Sat, 13 Feb 2010 16:25:39 +0100
Message-ID: <ac9c93b11002130725h19c5ee93t867da2d889811a9f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.183
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 15:28:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/13 Raffaele Recalcati <lamiaposta71@gmail.com>:
> Hi Frans,
>
> 2010/2/13 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Currently the rootfs ends up in ${TMPDIR}/work/rootfs/console-image
>> (at least if I bake console-image).
>> When dealing with multiple systems and either doing a parallel build
>> or keep the rootfs that could lead to inconsistent/faulty situations.
>> Shouldn't the dir be something like
>> ${TMPDIR}/work/rootfs/$DISTRO}-${MACHINE}/console-image or so
>> (or maybe $DISTRO/$MACHINE or the other way around).
>>
>> How do you feel about it (and what would be the preferred path?)
>
> My settings for rootfs are:
> ${TMPDIR}/deploy/glibc/images/${MACHINE}
>
> so the problem on deploy is not present I think, but I'm not an OE
> expert and maybe some staging or other intermediare files can give the
> problem you have.
>
> If I'm wrong please ignore my information.

That is also where it eventually ends up for me, but the image is
constructed in ${TMPDIR}/rootfs/console-image (without the work subdir
inbetween as I accidently wrote before).
That is where the clash is happening (especially if you keep rootfs,
but also if you don't and start parallel builds for different systems)

Frans.


