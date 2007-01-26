Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1HAVYr-0004nB-Ta
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jan 2007 19:12:30 +0100
Received: by wr-out-0506.google.com with SMTP id i7so690307wra
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2007 10:12:28 -0800 (PST)
Received: by 10.78.133.10 with SMTP id g10mr2431507hud.1169835146585;
	Fri, 26 Jan 2007 10:12:26 -0800 (PST)
Received: by 10.78.166.11 with HTTP; Fri, 26 Jan 2007 10:12:26 -0800 (PST)
Message-ID: <d46153c40701261012s4de0c2aag659d75cbaadd237c@mail.gmail.com>
Date: Fri, 26 Jan 2007 12:12:26 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: btsco-module naming
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2007 18:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can build the snd-bt-sco.ko module with
 $ bitbake btsco-module

but if I want ipkg to find it, I have to use
 btsco-module-${KERNEL_VERSION}

Which doesn't play nicely for images like GPE that use the same
variables for RDEPENDS and PACKAGE_INSTALL.  I used the following
patch to get around this, but I'm not sure if this is correct style or
not.

--- packages/btsco/btsco-module.inc~    2007-01-26 11:59:41.000000000 -0600
+++ packages/btsco/btsco-module.inc     2007-01-26 11:37:36.000000000 -0600
@@ -3,6 +3,7 @@
 HOMEPAGE = "http://bluetooth-alsa.sourceforge.net/"
 LICENSE = "GPL"
 DEPENDS = "alsa-lib bluez-libs"
+RPROVIDES = "${PN}-${KERNEL_VERSION}"

 inherit module


Is this an ok thing to do or am I missing something?


