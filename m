Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jtrnx-0003Rl-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 00:08:06 +0200
Received: by an-out-0708.google.com with SMTP id b38so105405ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=bUQe6n1HTUgkevzrP4zQmYLQZy/10iqk2L5onEe2dDI=;
	b=E1nJQxc3ttRzu/xNzIf11IIXyd2v2eJSDjaDbREgiuWp+k3SzdZUkJwQufocP96fy+EF0HVp9uJFjGtc2BMSbs2yDgsUvda8+Io0MaWP/bIJCr/tBksg7qzobr+eFtk44gxbxQfL8RI50JTo6YGR9MmajN2a+rrpD1d2c3XRMdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ug1BZSnXrwKuFfLLnLj9LPYORi1drgDKOWHWd6oJyt3/BK7tldBRc0UoNO2iv491mAlvHtlPOLXF8+pcWztCZM2Ay5qC6QVUnK6qMggC8Db9VxiqP2+vGvm/6c3p+8a2Hf54GMUa/aw+BmFvTj0rkc2rKD2AnGIw6UkKMNvpDKA=
Received: by 10.100.122.8 with SMTP id u8mr3607479anc.103.1210198049855;
	Wed, 07 May 2008 15:07:29 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 7 May 2008 15:07:29 -0700 (PDT)
Message-ID: <c384c5ea0805071507u747f820fga7e797c26243a367@mail.gmail.com>
Date: Thu, 8 May 2008 00:07:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [RFC] Auto bi-sect build server idea
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 22:08:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,


I typically run a from scratch build once a day, typically a
combination of {uc,eg,g}libc and targets {ixp4xx, powerpc, avr32}.

Today my avr32/uclibc build stopped with bug #1380 which has been
reported 2 months ago but never occurred to me.

When I fixed that, I then ran into bug #4065 which has been
opened/fixed/closed and reopened.

So, I think we have a regression at hand (which might be already fixed
when I send this email, but that's not the point).

Then I thought about the idea of having a build server automatically
doing an automatic bi-sect towards the commit that breaks things.

Define a few local.conf's that are known-good.
Build each of them,
if the build completes, tag the revision as "last known good".
if the build fails, tag the revision as "latest known bad", and
bi-sect, selecting a "candidate" and iterate to the breaking commit.

I'm mainly interested in a helloworld-image, I'm not much interested
in package recipes, but mostly in the toolchain/libc
stuff/rootfs/image stuff, for now.

Has this been done earlier? Ideas?

Regards,
-- 
Leon


