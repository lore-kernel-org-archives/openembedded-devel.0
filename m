Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Gox-0008I5-Qd
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:45:36 +0200
Received: by iwn7 with SMTP id 7so2579666iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=XqC65DOACkLTXMSMxQ/0j33yh7mPPEvcFbgQICzzH34=;
	b=F+rghE3xI1XEyFFMELqQPMK8SxePCV2okRQkuTmVLT39JzBf0sXQFpBvta8dk5Q0Zk
	e66Ak+KRWVIm9qyYfYByDmBDfPxDFy/LE1H6OimihKpZSet8CgUh8eX2oT0M4+eI5SYm
	BJYQixJFNU3EkxXosDUY2roiXL5xcndf3Uz3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=VfqTe11xt34YXu++w7DKdudAFQGLAdhtgLJ9qUgZa0wOTWNJbpvZGZuLHQSR60N/sq
	zzdC7MOatF9Bw1txlgdUWxA1A/behlAkAZoCJRBQBVkr1kOkK8tynIBMwsFaQCAG9iCm
	c/ZaQmyqS4yVbJcUqtWhNWIx7lOMdunH8YDPA=
MIME-Version: 1.0
Received: by 10.42.141.201 with SMTP id p9mr816694icu.368.1286797511547; Mon,
	11 Oct 2010 04:45:11 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:45:11 -0700 (PDT)
Date: Mon, 11 Oct 2010 13:45:11 +0200
Message-ID: <AANLkTimQBC0f8J-J_E+XADErZMAGzgNHRKwUemXThgPy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: git & SRCREV
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
X-List-Received-Date: Mon, 11 Oct 2010 11:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Roughly once a week i see a question on irc about someone getting a
git error: "fatal: not a valid object name 1"
this is because SRCREV is not defined for e.g. that machine.
What about extending bitbake (guess it is in there) with an error
message that more clearly explains the problem?

Frans


