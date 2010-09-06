Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1OsdQT-00082g-A6
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 17:16:06 +0200
Received: by ewy7 with SMTP id 7so2070714ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=71YdJxGn7RjVAu3UanuDY4Z9aVGVx8gOMbMH9MrywFk=;
	b=cgm1AGlRm80QKCtFzbctbPGwMhJ46TOsGTx9qxHgsCbuQVVuRX2kNy0NEr6p6WUi3s
	GnnbYdelZyYWmlEmlvBwbOCCM4s3U26OCxjpd1nzWT936CIjHpIECQvbmOduEu90Q1jk
	KCzSdQ0qZDXJMfhFdpMOq/A5U2BrFxCvvJZgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	b=uBkbhEI1QwYIHCXz7/i1iulEFhS2HHLeDTOiXxfQWmmdEBpQyIjb2gSfw5wzKLjlu5
	6MBMRwhiZgYUEsn6Wb6ujfGL9p1FpwrXzIQr08Q2qhrFzpjoiLy6VlzUYhTSVKiIYV8Y
	vFZeKAf+EKtCxOUAXyi9q47XLoiQCL/kjnNoE=
Received: by 10.216.51.212 with SMTP id b62mr727876wec.97.1283786127565;
	Mon, 06 Sep 2010 08:15:27 -0700 (PDT)
Received: from [192.168.1.134] (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id u11sm3416738weq.31.2010.09.06.08.15.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Sep 2010 08:15:26 -0700 (PDT)
Message-ID: <4C85058D.8070506@gmail.com>
Date: Mon, 06 Sep 2010 16:15:25 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Asterisk and termcap
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
X-List-Received-Date: Mon, 06 Sep 2010 15:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

was trying to build Asterisk for the OpenMoko Free runner and it failed
on a dependency on termcap so I tried to bitbake termcap first and that
failed. The termcap compile stage is working but it's when it tries to
install that the recipe seems to fail but I'm new to this.

I'm off to read the openembedded documentation again but in the mean
time if anybody can give me a hit that would be great.


