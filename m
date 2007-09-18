Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IXhZS-0006xu-Ez
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 20:13:14 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8II9OxW019056 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2007 20:09:24 +0200
Message-ID: <46F01466.4080000@dominion.kabel.utwente.nl>
Date: Tue, 18 Sep 2007 20:09:42 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1190138099.46f010f33252b@imp.free.fr>
In-Reply-To: <1190138099.46f010f33252b@imp.free.fr>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: fortran and octave
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2007 18:13:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alain2210 schreef:
> Hello,
> 
> I would like to bitbake octave for org.openembedded.dev.
> But octave needs fortran ou f2c.
> It seems that fortran has been remove from gcc-cross_4.1.2.bb (or perhaps
> before).
> So I have tried to
> 1) add fortran in gcc-cross_4.1.2.bb but I get an error.
> 2) compile octave with f2c without success. (even with the f2c of the host)
> 
> So what is the good way to compile octave and/or fortran and/or f2c ?

For gcc 3.4 through 4.1.x fortran is broken for arm (gcc ICEs on compiling gcc), Lennert
Buytenhek had some patches for it, I don't know if they fix and and if yes, I don't know
if they are in 4.2.1. I'm firing of a build of 4.2.1 with fortran enabled anyway :)

regards,

Koen


