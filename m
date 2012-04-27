Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SNkcD-0005lY-6H
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 14:49:37 +0200
Received: by eekc1 with SMTP id c1so144939eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=j1xhImOUjDirlP5gYZJgyiF2EWVagUd4exJ8HLXUWN4=;
	b=YVmWA5lHmQUhxw09IDwo7MZiQYITDB7R+sutPt7h1Sy0dpHGaPzu928X8fqvODcfVO
	L4bZsCjgtgXdeNbq0tcIK5BGWpY7IXRF87RX0xb61+oPEZGdJHxsKxdfyDos/dHo4P19
	DGe13no0lPTd/HzUe6MKG+cCbI0b9mKXoSQgU5zNQ8fNOOI+aTnfDpF82La7x8MI14KM
	Yp8NcbB0ZD1rdTQumylMl1x0MfXF17S2hkDGtF6vyCzcLRj8cjhj4H2e/XavKuHXx6eF
	biq8rhzcTnkQhLOMdvfT0yquYv4xk0nibpS9c4HyBAmLuPZzPxSoNgZA6Ha+EUVP1NqP
	JsYQ==
Received: by 10.14.185.143 with SMTP id u15mr2742130eem.94.1335530399077;
	Fri, 27 Apr 2012 05:39:59 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id y53sm29930127eea.3.2012.04.27.05.39.57
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 05:39:57 -0700 (PDT)
Message-ID: <4F9A932F.1020400@gmail.com>
Date: Fri, 27 Apr 2012 14:38:07 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Fri, 27 Apr 2012 12:49:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

I'm working on a pandaboard with OMAP4460. Were trying to use the newest
PVR drivers, which conforms to the result that arose from
https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012

We have applied the patch at the bottom of that page gcc, and also a
patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
instead of ld-linux. Problem is, this gives us a kernel panic when it
tries to run init. Linking ld-linux.so.3 to ld-linux-armhf.so.3 does not
work, and we're kind of in the dark as to what is missing.

We tried fixing this by renaming the toolchain to be
arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we heard
this might be a problem with hardfloats, but this needed a lot of extra
patches, and some patchwork on other packages like openssl and shadow.

My question is, are there any ongoing plans to fix this, and make sure
that if we have set hard float we make ld-linux-armhf in openembedded?

For the record we are using eglibc2.15 and gcc4.6 from openembedded-core.

Best regards
Martin Ertsaas


