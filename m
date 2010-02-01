Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Nc4JI-0000Uy-7k
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 22:59:59 +0100
Received: by ey-out-1920.google.com with SMTP id 13so1027576eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=NdFdMSwahBwTeTtNFjGI3QItQdQPiVmVNRWMYIknaJM=;
	b=JI5LFG0RJt4uO+Eq6WBupWMnFIfIXl1FfavRQbE0XR+Lg50bAKG1LX2DP6CyrWw79O
	Lo/PdaJIE70gx+xKy7P97waO9bEyt6X5FiG58E+84t7PTgD3HRsTrYe5cRIWgJ0A+GQS
	qjuiZDWaNfF7Z4CQPPGp8lpdwwM17SlHAjVjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HQlzGF+xGDhePDB3Tc9zy85/T4hFVn3OUag1IuPL2a0iMlVm6GypmVgS8lBhrMqJE4
	LwyvWew1CfpS64BSXxOobQ0iUHVpdPcsgQgxt7aVAZ7yprIDzJPkHAOGyN6f3I0wxFjy
	1ioIY/m0gGu1XHkbXxhJRCEyAKJs9DiJEzJvA=
MIME-Version: 1.0
Received: by 10.213.97.67 with SMTP id k3mr4214ebn.18.1265061451403; Mon, 01 
	Feb 2010 13:57:31 -0800 (PST)
In-Reply-To: <d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
	<201001172258.25258.jay4mail@gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
	<d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
	<d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
Date: Mon, 1 Feb 2010 22:57:31 +0100
Message-ID: <d1b08f941002011357y4285709w44dbed0b4e2c4b87@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Zaurus PDA developers list <zaurus-devel@lists.linuxtogo.org>
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Mon, 01 Feb 2010 21:59:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Well, I tested this patch on c7x0 and got two results:

1) we can avoid the pxa-linking-bug-r1 patch
2) we can boot 2.6.33-r6 (and some older too :)

Unexplicable (for me) unalignement issues...thx to Eric Miao for the hint!

I propose therefore to fix the updater.sh and fork the new minimal one
from this revised version.
I'd like just a couple of tests on spitz and tosa, then I'd push.

Regards

Andrea


