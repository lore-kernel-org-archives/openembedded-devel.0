Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NbcJH-0002d0-6z
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 17:06:06 +0100
Received: by gxk27 with SMTP id 27so3335064gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OGk0FBvTR8uPFMx33XImS1DKPB5elzV+yorPbJAP5x8=;
	b=BFGjc70aMtG3xjDIb6Ltq97VgMhD0Tb0Nst0CcvZvL0J79nwUTSZOahEbD1vDhN4ZW
	5DLw+f6InfdCIsW/Q4VLNzRVr5M8K6K3eiKr/eRbWcjWx/kYx1TRZe4dG58eol28KHfF
	FHXcJnpXL5nxluVK62/zAMF/7tSbNqoJmDIfQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EZsVb3ks9Vg4mYYWGbFdeExL+sVLweVwRD7vHgdWlTmQS2mSM4ZFIfbJ6K34jF9wWJ
	4gYSSlEQT2vjbtZqRh6BBmoDox/qg5CdVmxYpkO6/MenqQksDx1l3sy8cSLEZN2jIuUM
	I0VZUkfAMbnPSU18aqQaA/bOdKwxn9xBtHfc8=
MIME-Version: 1.0
Received: by 10.101.168.12 with SMTP id v12mr3782202ano.122.1264953816226; 
	Sun, 31 Jan 2010 08:03:36 -0800 (PST)
In-Reply-To: <op.u7dzok03mn1qzu@camelguo>
References: <op.u7dzok03mn1qzu@camelguo>
Date: Sun, 31 Jan 2010 17:03:35 +0100
Message-ID: <ac9c93b11001310803t19457602of9f46553065afda7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building linux-kirkwood_2.6.33-rc5.bb for openrd-base failed and it causes bitbake exception
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
X-List-Received-Date: Sun, 31 Jan 2010 16:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/31 Guo Hongruan <camelguo@gmail.com>:
> Hi guys,
> =A0I tried to build openembedded with the following configuration:
> MACHINE=3Dopenrd-base
> DISTRO=3Dmicro
> LIBC=3Dglibc
> But when building linux kernel ( linux-kirkwood_2.6.33-rc5.bb ), there ar=
e
> some patches failed to be applied and bitbake raised some exceptions with
> unknow reason. The attachment is the raw error information captured from =
the
> screen. Hope it is useful.
>
> Thanks a lot!
>
Thanks again for the report.

I have investigated the issue.
There are only two patches for openrd-base and this one:
openrd-base-enable-pcie.patch was already added to the git so it was
not needed any more.
However this patch only patches
arch/arm/mach-kirkwood/openrd_base-setup.c so it is not responsible
for all the fails you got when patching.
I have removed the pci patch from the recipe.
The other patch did also not apply any more as there was a part for
openrd_client-setup.c, which did not apply. As the client part is not
interesting for openrd-base, I've removed the client part from the
patch.
I am building as I write this. Can't test as I do not have a base
board.(I have a sheeva and an openrd client, so can test on just those
two; will definitely make sure to compile openrd base too if I change
things (and if someone (Marvell? eInfoChips?) wants to donate a base
board for testing feel free to email me :-) )

Anyway, the kernel is compiling for base; I don't expect any problems;
will rebuild for sheeva and openrd-client as well and then commit (or
report back here).
Expect it to be on the feed in an hour or two.

Frans.


