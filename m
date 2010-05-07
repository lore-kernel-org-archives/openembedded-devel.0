Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAVIY-0008Eg-OD
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 23:41:31 +0200
Received: by fg-out-1718.google.com with SMTP id 19so702556fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=w0juEGKqzqAeZFnJczBeUE1MImU5Q4uLlYuvu2HxyU4=;
	b=MnMk7WbrcOhYxqBes4osXkvUtTN/Ih3HT/otE8fOhkp4N8r5jV4P8/nJKaA/78zXCS
	zLtX/+WZzZIHjMexI07BFnoHnLnXZo16oJA9i9cBqE/cAx4sYw81MvFLir2yCIuUi8g3
	oBN9YDEA7b6xs6hBcSgbzQq0EKgOSxoVC66k0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DIzV4/BEztcP0Zs1rzQGFTUcqgRwRJ3LZ+x8LvvVYg5IgznLYC34Lr2EeSDcckyiRC
	X8OZJ3rrmcsHvFMibdcl29TmN1CIKgs9Jv/cgcUAH2ISILGS2IzLQBuC6jGTLOdnAbLb
	9YptseIGLO6GBjVEh3vknO4jRvaT0GIwtzQro=
MIME-Version: 1.0
Received: by 10.239.173.205 with SMTP id g13mr56015hbf.145.1273268262951; Fri, 
	07 May 2010 14:37:42 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Fri, 7 May 2010 14:37:42 -0700 (PDT)
In-Reply-To: <1273248787.457.324.camel@trini-m4400>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
	<1273175555.457.296.camel@trini-m4400>
	<s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
	<1273248787.457.324.camel@trini-m4400>
Date: Fri, 7 May 2010 23:37:42 +0200
Message-ID: <p2pd1b08f941005071437o2f204e22jdf93ac2db58d6572@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 21:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

If someone can find it useful:

andrea@mizar /oe $ grep -n 'inherit gettext' oelog -B1
494-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/i686-linux/coreutils-native-7.2-r1/coreutils-7.2/configure.ac.
495:Missing inherit gettext?
--
5755-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/intl/configure.ac.
5756:Missing inherit gettext?
--
6202-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-intermediate-4.3.3-r11.1/gcc-4.3.3/intl/configure.ac.
6203:Missing inherit gettext?
--
9241-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.3.3-r11.1/gcc-4.3.3/intl/configure.ac.
9242:Missing inherit gettext?
--
23576-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gstreamer-0.10.28-r0/gstreamer-0.10.28/configure.ac.
23577:Missing inherit gettext?
--
25826-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gst-plugins-base-0.10.28-r8.1/gst-plugins-base-0.10.28/configure.ac.
25827:Missing inherit gettext?
25828-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gst-plugins-base-0.10.28-r8.1/gst-plugins-base-0.10.28/.pc/gst-plugins-base_rowstride.patch/configure.ac.
25829:Missing inherit gettext?
--
34842-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/alsa-utils-1.0.20-r1/alsa-utils-1.0.20/configure.in.
34843:Missing inherit gettext?
--
35009-NOTE: Gettext required but not in DEPENDS for file
/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.41.9-r23/e2fsprogs-1.41.9/configure.in.
35010:Missing inherit gettext?
andrea@mizar /oe $


