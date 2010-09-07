Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1OsvWP-0008Bl-Cq
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 12:35:28 +0200
Received: by gxk2 with SMTP id 2so2027931gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=U5EYHA9P4dcBnAq0itL5705hWMPT8rMCuf2ei8JRgSg=;
	b=oAS19AIgWBqDLXg/AI+RCbCb+LRIpRjfVJXGPVcUoNM0jbHlhfVunCxOVEMA1O7QmK
	ddZzVXsliuQZV9ALjM1k5Ox0hFYJY7E6b5+drGlUdpn57cFxbuu3krYTvNf8ncULgNFt
	rWGa1QGwnQBRsqHNjA7YRe2UKwjvsjxweRnnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=q7EFMptgAo6JGCHI3/w1YcxIBW4r2fNJtfjM3p9A4YnfTvKU0nZxqaSClpBNveeHKQ
	1c+tM++IO3RsisrSLeIMb4kGP5+p8aS16ak5RfP7mDPuKkAQBkxeXOXmn7RvRxePyaQ/
	MNwkmdhbxlXFnWqVHLeUWvtnm9h/WYgS0gPeU=
MIME-Version: 1.0
Received: by 10.90.68.16 with SMTP id q16mr2238053aga.0.1283855684183; Tue, 07
	Sep 2010 03:34:44 -0700 (PDT)
Received: by 10.231.142.90 with HTTP; Tue, 7 Sep 2010 03:34:44 -0700 (PDT)
Date: Tue, 7 Sep 2010 12:34:44 +0200
Message-ID: <AANLkTim0DYp1mx4Z+TNicU12-p8GZ-+DysPYDce0b2Df@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Building/testing in the EC2 cloud
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
X-List-Received-Date: Tue, 07 Sep 2010 10:35:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi folks,

In the light of testing discussion recently I wanted to try building
OE image on Amazon EC2 infrastructure. I documented the process and
results on the WiKi
http://wiki.openembedded.net/index.php/EC2CloudBuild .

Basically, building angstrom minimal-image took 2 hours 20 minutes for
the c1.medium virtual machine. I used the spot instance with average
price 0.06$ per hour, so for 3 hours it costed me around $0.20 + VAT.

The supplied script installs all required software and fires the build
automatically. This is basically as "dry" testing as it goes.

Why do you want to use this ?

1. Not having linux is a good reason. The build could be run
completely from the browser and resulting images are downloadable as
well.

2. Extending this procedure to get "Continuous Integration". I could
imagine someone wanting to fire up builds for 20 architectures
simultenously. Here is the time for some corporation to jump and
sponsor testing. It's just credit card away :)

This was just an proof of concept. Do you guys interested in more
research in this area ?

Cheers,
Maksym Parkachov.


