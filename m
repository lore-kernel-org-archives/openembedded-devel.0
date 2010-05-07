Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1OAWGx-0001VD-3t
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 00:43:55 +0200
Received: by pxi14 with SMTP id 14so689729pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=8wqjSrFOfhG0+8mI3ykXohnaGb211t+2oUP4mdntP/Y=;
	b=gme2xAGejEgr8GymRB+50rCES2kOGOnAkklJ2xoYwV+b44EkJxnnMY4rBw2YET1A2Y
	mlqEWEo9xWcx/989i0lY/ZB1R1BWCMjkuCHzH0Mlpi6Y6ZJH5iVD98dVPIO0WMpazcVW
	Tu8x5AeUThu35T5MD5K6JDPBfc+sWOpGxb38Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=MfUBE8nmI9mCRsPWgPo5A1KQDkKKYUS2Vy3oBKLOPvHG+n4e/weeUa3Hk10e1XxLxu
	8Dh8UA+4OosqkFEcwW/1H6JTZxfoXZ2e2y+StyFH0eFQ4CXC7lH51iMBTn6i6wTUPjxD
	1phdnj/b/FVMlBYxIQZLkqZl8POlOhxmeZZIA=
Received: by 10.140.247.20 with SMTP id u20mr349583rvh.122.1273272004200; Fri, 
	07 May 2010 15:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.208.6 with HTTP; Fri, 7 May 2010 15:39:44 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 7 May 2010 15:39:44 -0700
Message-ID: <z2qbd4a003f1005071539wbd18f0e5w531868565b953e2a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Understanding Bitbake Dependencies
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
X-List-Received-Date: Fri, 07 May 2010 22:43:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

When I change a recipe or configuration in OE, I often end up doing a
'bitbake <package-name> -c clean; bitbake <package-name>' to ensure
whatever it is I'm doing it gets rebuilt.  I realize there must be a
better way to do this in some cases---sometimes just a bitbake
<package-name> -c rebuild is sufficient though not always---other
times I can just get away with bitbake <package-name>.

--- What types of changes causes bitbake to rebuild a recipe?
--- Why is '-c clean, then rebuild' different than '-c rebuild'?
--- If I make changes to the kernel (e.g. enable a module), what else
do I need to bitbake to get an updated root file system|image?

Sorry for the simple questions but the dependencies can seem a little
magical at times. If anyone could point me to a reference or give me a
brief explanation of this, that'd be wonderful!

-Ash


