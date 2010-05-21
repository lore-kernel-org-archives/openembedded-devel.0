Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OFMy2-00046H-E9
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 09:48:27 +0200
Received: by bwz1 with SMTP id 1so47102bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ea6qorK3JzpPKWfuZF0w7kvbhQhZHsrmKHK0alFqP9w=;
	b=cNn6YBSJFVW2ei6JjXmfD0gYy8B56qpUB3HQQzJc0zE7MStoE/9gZyo/iaTTWsntpU
	HhVWy8rZOl0kro5LjEhpmXSXva4wk4SD4Y464+ObtSnTuBGiyQL7xo3l0jlssLgx7Idi
	XAtVoNqFd37KltXO0KxE5k+cEMdedQS2T1U5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LHrv45Y4YAdLPlPHpMKBWkGBzsFulrBROxtYkwL8cmxpU1m+BPZs9uui7g5jKwC0t7
	VhnPQJqfwMcmvfwIIKxQI1WJmsh6o7GNLGJ8o97x9E2OWmTnmkmdZvhG8cnuPXH7cXTA
	fLw/H6+5LpHDbGyqFs2GgM0KUkwJArP6N+Vqc=
MIME-Version: 1.0
Received: by 10.204.140.67 with SMTP id h3mr15895bku.137.1274427865637; Fri, 
	21 May 2010 00:44:25 -0700 (PDT)
Received: by 10.204.54.139 with HTTP; Fri, 21 May 2010 00:44:24 -0700 (PDT)
In-Reply-To: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
References: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
Date: Fri, 21 May 2010 09:44:24 +0200
Message-ID: <AANLkTinAOE1YAoEEqHuOQoIWuXDJ_SZZL4wcWe2D9tri@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with building glibc
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
X-List-Received-Date: Fri, 21 May 2010 07:48:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/20 Grzegorz Toporek <top.grzechu@gmail.com>:
> Hi all,
...
> I found this but I don't know how to apply it to my problem. I use Ubuntu
> 9.1, gcc 4.41.
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=5203

If you really want to mess around (which I won't recommend!), then you
could just do what the bug report suggests. Since -Os will probably be
the culprit, either change it two -O2, or remove the stated commit.
The file (io/sys/stat.h) can be found in
<oe-home>/tmp/work/<arch>-<distro>-*/glibc-*

Again, I would use Angstrom, as it has always been quite stable (for
me atleast).

Regards,
Michael


