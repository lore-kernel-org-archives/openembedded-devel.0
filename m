Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4S5Z-0001lh-Nl
	for Openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 07:35:23 +0200
Received: by gwb17 with SMTP id 17so300644gwb.6
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=a9mfSesG9a8UAw1vZk5x9WUzPjZPzAWTS8UYm4u0+zU=;
	b=nVN2q0EpGl8QrNBVD09aFbagXnggo0BCkOjj+g8l+b++/BqZ2xf107KfNR0ny06cUH
	4a4KYeDrVFv5lV91ORr+W1r+JprcxcRhSDu5s4bmwae0yLme0tfvBdpJrgOv69XiMImE
	CP3qxAPPOfueaMGE3CugzypDudp7lwwNM+u3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=r3w5aKL2cUEXmfiEucz3QVGTGIwrYqWAqhYk/LoCfjf80Eh2zIXZ4ddfSwLv0bjPbH
	HkmPcwymA16xYQO9y5/9KWycWH0BzRPmgoato6km5Pex4purHjXcSlBzlexZy2GgR5OE
	U7ZW3OYLtW3f07nD53zaPAbPgis9xAt3m7WqY=
Received: by 10.90.93.9 with SMTP id q9mr2009539agb.103.1286602492974; Fri, 08
	Oct 2010 22:34:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Fri, 8 Oct 2010 22:34:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Oct 2010 22:34:32 -0700
Message-ID: <AANLkTikN6gTqrT76Bn2c_BWa=1MHE9cJd1v=5r2QGn8u@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Prefer wget 1.12 by default
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
X-List-Received-Date: Sat, 09 Oct 2010 05:35:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Right now we use wget_1.9.1.bb if someone did not pin wget to other
versions. We have recipes from later versions
like 1.12 but they have DEFAULT_PREFERENCE="-1"
1.9.1 has problems building with -j > 1 as many times build break with
Text File busy errors.

I would like to propose that we upgrade defaults to 1.12. If someone
has objections here is your chance.

Thanks
-Khem


