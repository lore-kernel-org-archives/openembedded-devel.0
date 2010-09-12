Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oum0m-0000Ux-Va
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:50:26 +0200
Received: by iwn2 with SMTP id 2so4133984iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=S25p0Lx083D2Kxo5PC3Upe0be4FQX137PN7xzN5rKp0=;
	b=LTXUoilAJEN20lV6+aciVOs05vaQw/aurJEa1ru+mqkyu5lOsICaV3gjI7UrtDjlNB
	Db8jYgJKilxViwEklZ3ISxsmdvm0pCMxRgn9i3+28tidzVZQBLCYvlxm9v2gqcLO8SQ2
	SNB387K2pdf/6eOlfvfGEKv+okRqil104CAZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j/1IQlC3GFdEf9Cz6qwc9AuN0gxzxXevc5JhuVRE3/RWzX7ZhajGQy5fUO1SPGtHVo
	wTlIhEBHbOhy/RhcIQUNCk6DIwm4G/YhowmIfXZDk2IommDoXYK1qNXL10EHEIzCaQ9w
	JxDqs2yc4NhIDTffHnniJBc+wUex8xAjO5QmA=
MIME-Version: 1.0
Received: by 10.231.182.196 with SMTP id cd4mr4264169ibb.191.1284295778693;
	Sun, 12 Sep 2010 05:49:38 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 05:49:38 -0700 (PDT)
In-Reply-To: <4C8CC749.5070306@balister.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>
	<i6i5g8$ums$1@dough.gmane.org>
	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
	<4C8CC749.5070306@balister.org>
Date: Sun, 12 Sep 2010 14:49:38 +0200
Message-ID: <AANLkTikqWixYAegBhiVamN2GpG_jMZCpRH=a-9NunbF7@mail.gmail.com>
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
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 12:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Philip Balister <philip@balister.org>:

> If the DISTRO is not maintained, maybe it should be cleaned up and left
> around to confuse people who think it should work well.
>

Philip,

I hope you wanted to say "...cleaned up and NOT left around..."
Otherwise it does not really make sense to me.

BTW: I already tried to identify distro maintainers and unmaintained
distros. See [1]
I still feel it is a good plan to either remove unmaintaned distros,
or move them (and the files that are specific to those distros) to an
unmaintained directory.
However it was even impossible to create consensus to remove files in
distro/include that were not used by any distro (and most likely not
maintained either) See [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022698.html
[2] http://thread.gmane.org/gmane.comp.handhelds.openembedded/35427/focus=35946

Frans.

PS: and if anyone would need it, it would still be availalble in git
as well as in the stable/2009 branch. I can also imagine that we
create a tag before actually cleaning up.


