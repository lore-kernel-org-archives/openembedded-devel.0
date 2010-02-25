Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NkfXn-0004HY-VC
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 16:22:32 +0100
Received: by iwn9 with SMTP id 9so5439295iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=3XlQWIOvwtlCfWsHFR6RhtB8WV2ClnuNyaQwO1Wm4Xk=;
	b=wcQo8euyTSTYbh3fqHXw93VvUk8CRusQOWDWN7yrwiVEoVSisFT9xtdHh8h5fOcE55
	I55/dZgU9AJ4Y/xzrTPeCVC5Rv4BxF8lK1AzlSPjVMM1kDj3C6ZPrtOjIeUMQ7tqftsb
	rAmuvdA8g1XE7u2sNAAusP9/YZ54SOLacqGn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=njUVuYycz4eQ85W/ImwVAo23hM08uT6LwPP/rMCO5knvUgt/+Rd2K/sALwpmlQsTfZ
	Yh6C6a6v61LVauGgIARvuC4vPxI+lZzwawbhaF2Te7erFn32ywa+krh+aEbYx4wTDJ/U
	zE8S37tGJamBifeWwwc7qSJe+cPPu8AfD3Hz8=
MIME-Version: 1.0
Received: by 10.231.191.147 with SMTP id dm19mr143969ibb.86.1267111179805; 
	Thu, 25 Feb 2010 07:19:39 -0800 (PST)
Date: Thu, 25 Feb 2010 10:19:39 -0500
Message-ID: <f96d234e1002250719v2c996ba4kd631051f29cba633@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: make explosion while building attr
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
X-List-Received-Date: Thu, 25 Feb 2010 15:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Has anyone seen anything like this:

http://bec-systems.com/oe/attr_make_explosion.txt

setup:
org.openembedded.dev
beagleboard machine
64-bit Ubuntu workstation
PARALLEL_MAKE = "-j 4"
BB_NUMBER_THREADS = "4"

It runs my workstation out of memory and is downright annoying!

Thanks,
Cliff


