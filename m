Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9z1B-0000Qe-D7
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 13:45:42 +0200
Received: by wya21 with SMTP id 21so2379701wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=y5At/Qc9/PzO9I2xOBCy0rMv/CbQwM5xDL+5y3GhwMw=;
	b=UFYKH7e2eDCG1gowCGG3sZVuno/ahs6YPp1Z6+muH6WS0fwcWDUADOh3nxNO+T4OnR
	8/zT0Y2LiElAA9JKMRrNnmMKyZzpEjHF2bCk4gSCSf1AdQBRnwERGmNLxj6OORpseUoQ
	cT3WR92tEO5q/p3HsGWHRXOwTGOOZe6er3mmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=MfTGSzVUxGnLoRgTe2SDytApvkdwKZiMD8R/7FaMDrjAkkVwnclatATYFxgzjFcoGY
	/mb6ct6zriPe8kjU6ffeByUmAsFTBuZ4ERtNBj75QCWaDGD2jFOlw0zri8NrDu4nHG3p
	qJSon+Fw/lbQRJ1cmPbnPMc92I5kOVgMDVfQg=
MIME-Version: 1.0
Received: by 10.227.134.129 with SMTP id j1mr5175408wbt.67.1287920700318; Sun,
	24 Oct 2010 04:45:00 -0700 (PDT)
Received: by 10.227.154.13 with HTTP; Sun, 24 Oct 2010 04:45:00 -0700 (PDT)
In-Reply-To: <E1P986g-0002sB-Ki@melo.openembedded.org>
References: <E1P986g-0002sB-Ki@melo.openembedded.org>
Date: Sun, 24 Oct 2010 13:45:00 +0200
Message-ID: <AANLkTi=3CMJ9=t_cWDu9jYkE17NUZJUtQ3rgV4c4seoR@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Chris Larson : oe.patch: use oe.process
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
X-List-Received-Date: Sun, 24 Oct 2010 11:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2010 at 5:15 AM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: c7a68fe6ff738b86d6da5e55ce4927f8fb06b38c
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Dc7a68fe6ff738b86d6da5e55ce4927f8fb06b38c
>
> Author: Chris Larson <chris_larson@mentor.com>
> Date: =A0 Thu Oct 21 17:23:40 2010 -0700
>
> oe.patch: use oe.process
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Not sure if it's intended behavior or even result of this commit, but
now failing do_patch results in FATAL error and building with -k
doesn't continue now

noticed today in libvpx:

NOTE: Running task 4205 of 12912 (ID: 5817,
/OE/dev/recipes/webm/libvpx_0.9.2.bb, do_patch)
NOTE: package libvpx-0.9.2-r5.0: task do_patch: Started
NOTE: Applying patch 'libvpx-configure-support-blank-prefix.patch'
(dev/recipes/webm/libvpx/libvpx-configure-support-blank-prefix.patch)
FATAL: Execution of 'quilt
--quiltrc=3D/OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/quiltrc push'
failed with exit code 1:
Applying patch libvpx-configure-support-blank-prefix.patch
can't find file to patch at input line 7
Perhaps you used the wrong -p or --strip option?

and build stops here

BTW: also checksums error are FATAL and maybe with -k we should
continue to build all remaining runqueue if possible

Regards,


