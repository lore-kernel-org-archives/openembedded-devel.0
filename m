Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OPEDn-0005XD-Hn
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:29:31 +0200
Received: by gyg10 with SMTP id 10so5159065gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=GQGuvXZhsVNytqbWqKj00yNoLVfW+dZ6yLOWA4cmrRI=;
	b=jYTphNt+Fxfsv916AFolL+07AZjI6QhFB3NK9txopk5mDSXVwRgASWEUzsYUvFIDG1
	2Ya2bJdDFdkseBZjqbrast6RDCNUu8EopEJj+v4SvQ4qzwqQb+ePWjdy1QMC3TfNE3ZA
	96LwoJrfiz7IAWZ01PhLIeTvBzquTU2Uutpek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SL2BSKjtTVOt6b60930fCkjX9R1eHUk8tBpDIPNFGmUVEyMah8wt40xjfKqqoGhXt1
	F4vbdbsSgBpY94fRzOnLfuohE1hYJfI4U6BFDE1u4+q1RXOEnHmvvFbDquxQwxWUit/i
	a8agpHl/7m8RVFAHqrM7XvDzVyrR7tON1mK9I=
MIME-Version: 1.0
Received: by 10.101.210.31 with SMTP id m31mr8338676anq.205.1276777491171; 
	Thu, 17 Jun 2010 05:24:51 -0700 (PDT)
Received: by 10.100.194.6 with HTTP; Thu, 17 Jun 2010 05:24:51 -0700 (PDT)
Date: Thu, 17 Jun 2010 14:24:51 +0200
Message-ID: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Thu, 17 Jun 2010 12:29:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I plan to move soon the kernel recipes of linux-kexecboot in the
standard recipes/linux location.

Being that the kernel directory is already overpopulated I was
thinking to remove some obsolete versions before moving the recipes.
I know that obsolete != unused, that's why I'm asking:

Who is using linux-kexecboot kernels?
Which machines apart some Zaurus are needing older 2.6.2x kernels?

If it's only about Zaurus I'd *only* keep an older version (still to
decide if 2.6.24 or 2.6.26) for a while and the latest 2.6.34.

Please make your comments.

Thanks

Andrea


