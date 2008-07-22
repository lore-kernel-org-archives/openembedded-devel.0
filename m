Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KLCzZ-0005kN-CU
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 10:13:05 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1867885rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=qwCEixT0vRDrHhFzd+RlUbUxMmhpucVQPQN/wumg85Q=;
	b=BvfBj9fXKiqxogLjQSgo6gfQ5VHPv15MftZQvONJ5iX5RihwnU46Umeeb85TC2RyuZ
	CJyHI522rl1IAe1QbgYdIVCLfRI+dscqIcaYidndbe0GbMTc9QhJvM5txoT4m+aZ2a4z
	D6E5mvsC4hiBUuu8Og3yyLtsnq8aGqdYK/8HQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=FBjhG7PfuCknS/gBGTxShbju2k4968xL2+zJaQlHVmWOPzltnl7j9DPtN41tVCFAfc
	TA9nA+f47tMikZffLpEsCA3jZWxZyNGRKqQENjUJ2g3K+B0tirAD7VrhvXGmPWupFJOZ
	+SYgWfOdrYAtGjBGzARD50+wg1df2jBQGLs8U=
Received: by 10.141.170.10 with SMTP id x10mr2376675rvo.105.1216714318280;
	Tue, 22 Jul 2008 01:11:58 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Tue, 22 Jul 2008 01:11:58 -0700 (PDT)
Message-ID: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
Date: Tue, 22 Jul 2008 10:11:58 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 08:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

For some reason, some OSS projects does not offer persistent access to
old releases,
which continously give problems for OE and other similar distributions.

With the org.openembedded.stable branch, this problem is considerably worse.
The usual fix in .dev is to upgrade the recipes to a current release,
which of-course
is not what we want for a stable branch.

Take for example
http://bugs.openembedded.net/show_bug.cgi?id=4227

I think it is worth considering a permanent solution to this kind of problems.
We should have a download server which carries all sources referred to
by http and ftp URI's in org.openembedded.stable recipes.
Why not setup ftp://downloads.openembedded.org/org.openmbedded.stable
to mirror a copy of all sources referred to by current .stable recipes, and
when a bug is filed with a missing source, the solution is simply to change
the SRC_URI to use the ftp://downloads.openembedded.org URI instead.

Of-course, unless continous manual labor is to be required, we need to
write a script or something like that to maintain the mirror repository.

And we need a server with enough storage and a big fat pipe to the
Internet.

What do you think?

Best regards,
Esben Haabendal


