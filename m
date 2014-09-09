Return-Path: <marek.andrus@wp.pl>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Sep 2014 13:21:32 UTC
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA1571301
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:21:32 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 21566 invoked from network);
	9 Sep 2014 15:14:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
	t=1410268491; bh=UErIVgQ0J3xYvTjElx2aQdfnMed1lwQ9eq2Zth2ThZg=;
	h=From:To:Subject;
	b=BSypfcnly8ZjXjWY7SHG4kDkdADtLIscC4asZA1XBbvjZ565KO09PIR8w8+rVgrg1
	l96eFD84NC8soSzmAghg9H4uMbBn394TwY/P0BTTpsBVBMsmHxOOdbrOeV9uu2fuIs
	Dqlth8fdFjfd0oBXN4clqxaJE3RGdAFoIJF0L65o=
Received: from unknown (HELO [62.159.77.167]) (marek.andrus@[62.159.77.167])
	(envelope-sender <marek.andrus@wp.pl>)
	by smtp.wp.pl (WP-SMTPD) with AES128-SHA encrypted SMTP
	for <openembedded-devel@lists.openembedded.org>;
	9 Sep 2014 15:14:51 +0200
Message-ID: <540EFD49.8070202@wp.pl>
Date: Tue, 09 Sep 2014 15:14:49 +0200
From: Marek Andrus <marek.andrus@wp.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-WP-AV: skaner antywirusowy poczty Wirtualnej Polski S. A.
X-WP-SPAM: NO 0000000 [YdPX]                               
Subject: selecting a range of package versions that my package depends on
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Sep 2014 13:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I used to work with portage and expected possibility to specify what 
particular version (or range of versions) of package my package depends 
on. I found sth like:
DEPENDS += "libgcrypt (>= 1.4.2)"
in gnutls.inc file. Unfortunately it doesn't work for me.
I found only one way to choose version of package: to add:
PREFERRED_VERSION_package = "versionstring"
to some global conf file like local.conf. In addition this method 
doesn't work with ranges (like >=1.15) or I don't know how...

I'm package maintainer so I don't want to add anything to files like 
local.conf, but I'd like to specify exact dependencies.

1. Is there any other way to choose what version of package should be 
chosen?
2. Is there any way to specify range of preferred versions?
3. Is there any way to specify what version (or range) my package 
depends on (not touching global conf files)?

Best Regards,
Marek

