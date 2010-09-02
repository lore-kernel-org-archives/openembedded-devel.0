Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or9Ow-0007xw-TY
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 15:00:23 +0200
Received: by yxk30 with SMTP id 30so122872yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=HW8aBfPNGO2UjbNNk1eh0OXMLCHA5ozDwoyTrxvOrLg=;
	b=fq7INSqNyrzxpXMFD8wQY6XO3bTi+zq92JPllc3F5x4psFfiF4+n5wHgiAZUPUjATG
	rAATl+f5YajuMfbghQqBypCb9Iup/Ypv7mw/i4JValQPkVFC35mFvoNH9fuLzRlcTRuU
	i7HcFTjky9bHqwfrRxaJfJoVJcXHPxAZLMIWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Q+hkaQelKG5fTMmCp9O30qacVyqi/eWnpUIQo7V8uS58k9IpAKy2BkqLVVeiAf/YYH
	o59MEP9gEHhFLT08rQxJJazjOj1akYiPMzwxmZhAWWk0R6zPb4qw2caqt/L0qGPZ9OuZ
	PZnduFnClN9Xrjan2e3F55F9uPW0hB1XcRv6M=
MIME-Version: 1.0
Received: by 10.151.26.3 with SMTP id d3mr319397ybj.291.1283432387073; Thu, 02
	Sep 2010 05:59:47 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 2 Sep 2010 05:59:46 -0700 (PDT)
Date: Thu, 2 Sep 2010 14:59:46 +0200
Message-ID: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: git issues
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
X-List-Received-Date: Thu, 02 Sep 2010 13:00:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

For some reason recently every once in a while on a git pull or git
clone I get an error like this:

git clone git://git.openembedded.net/openembedded openembedded
Initialized empty Git repository in
/home/frans/workspace/Linux/openembedded-test/openembedded/.git/
fatal: The remote end hung up unexpectedly
make: *** [all] Error 128

Repeating the command often makes it work.

Also I notice that the transfer rate is about 100-120 KB/s
I seem to recall Leon also reported something like this with irc.

Is this something others see as well?
Especially the hangup does not really help to set up an automated test system.

Frans


