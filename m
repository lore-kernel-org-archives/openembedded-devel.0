Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsxBw-0005V9-62
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:22:25 +0200
Received: by iwn2 with SMTP id 2so5183077iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gKgcZhvgw99+gm1DvxBIKi55jOnC7k7hEr7r9+nvMtU=;
	b=DMdU7TRA0oWTrpz4HNXeVoEfmkRVMiP7qwkYj9RD9intXfoXYH7M8/zlScu0GxiZSU
	9bT3GpjxndnwRKm9Z/4B2gr8ocC/gQN2P1/UodwfbS6Zm29Dhplnnjrtc+6ICAm18msW
	3i+w2ZWAZWr9otqnZYpd7NpdOGhw2u5zoYbaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WvjMOpFYbnrkDsrR+aejJmIgcammMcn8DqAGVrzJJtwaSJcYhwfsBV/d7cWrAbCo9U
	NYn7OKpIDgM+T9a7qsBwTg3f1r5zhUFfFV3JxOL0bpyZNqLlWO8givP4gFLThVVJ0djo
	dUEmPnXH5HVAms7/KQNXfButsQSlXeJcz9Kjk=
MIME-Version: 1.0
Received: by 10.231.148.83 with SMTP id o19mr7906824ibv.112.1283862101553;
	Tue, 07 Sep 2010 05:21:41 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 05:21:41 -0700 (PDT)
In-Reply-To: <BLU132-W8FA51733A7631FEA4FB63B0710@phx.gbl>
References: <BLU132-W8FA51733A7631FEA4FB63B0710@phx.gbl>
Date: Tue, 7 Sep 2010 14:21:41 +0200
Message-ID: <AANLkTi=Y90PWXBSsZmbtub-S519CdBaAEEDQ-dnTrsvN@mail.gmail.com>
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
Subject: Re: selecting needed applications only
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
X-List-Received-Date: Tue, 07 Sep 2010 12:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 mahmut g <mgcse@hotmail.com>:
>
>
> I am new at OE. Actually I heard from many people Openembedded is the bes=
t and decided to try. However I couldn't figure out how I can select applic=
ations just I want to be included to my image. There are too many files and=
 rules. I had tired to use with beagle board and finally given up. The main=
 reason for learning and using OE was that we wanted to use QT on our board=
. May someone advice any nice guide or documents which show how to select j=
ust wanted applications and how I can add a new application, it will be app=
reciated.
> Regards,
> MahmutG

If you want full control make your own image. E.g. start with
recipes/images/minimal-image.bb copy and rename that and add the
packages you want to add to IMAGE_INSTALL.

Good luck, Frans


