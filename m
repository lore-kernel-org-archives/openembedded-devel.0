Received: from [209.85.216.116] (helo=mail-px0-f116.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1Mtk71-0004vK-OD
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 17:32:07 +0200
Received: by pxi14 with SMTP id 14so70588pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 08:31:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.2.36 with SMTP id 36mr341844wfb.139.1254497474297; Fri, 02 
	Oct 2009 08:31:14 -0700 (PDT)
Date: Fri, 2 Oct 2009 23:31:14 +0800
Message-ID: <fd72b8f50910020831u16227c45wdca6fc9ed4bf8cb4@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.116
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Multiple .bb files are due to be built which each provide bluez-libs
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
X-List-Received-Date: Fri, 02 Oct 2009 15:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I got "Multiple .bb files" problms, but it seems not affects building. Could
some one give me some information about this multiple .bb files problems?
This is the log:

NOTE: Handling BitBake files: / (7315/7315) [100 %]
NOTE: Parsing finished. 0 cached, 7027 parsed, 288 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/libusb0 (libusb,
libusb-compat);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libusb0
NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
NOTE: preferred version 2.7.2 of libxml2-native not available (for item
libxml2-native)
NOTE: preferred version 2.7.2 of libxml2-native not available (for item
libxml2-native)
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide bluez-libs
(/home/derek/mini2440/oe/openembedded/recipes/bluez/bluez4_4.47.bb/home/derek/mini2440/oe/openembedded/recipes/bluez/
bluez-libs_3.33.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
bluez-utils-dbus (/home/derek/mini2440/oe/openembedded/recipes/bluez/
bluez4_4.47.bb /home/derek/mini2440/oe/openembedded/recipes/bluez/
bluez-utils_3.33.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide util-linux
(/home/derek/mini2440/oe/openembedded/recipes/util-linux/util-linux_2.12r.bb/home/derek/mini2440/oe/openembedded/recipes/util-linux-ng/
util-linux-ng_2.16.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide bluez-utils
(/home/derek/mini2440/oe/openembedded/recipes/bluez/bluez4_4.47.bb/home/derek/mini2440/oe/openembedded/recipes/bluez/
bluez-utils_3.33.bb).
 This usually means one provides something the other doesn't and should.
......

Thanks!

