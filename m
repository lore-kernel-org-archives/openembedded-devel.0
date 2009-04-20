Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1LvvFn-0001Av-Tk
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:17:52 +0200
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n3KFCC5W014685
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 08:12:12 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 20 Apr 2009 15:13:29 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	20 Apr 2009 09:13:29 -0600
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
Organization: Atmel
Date: Mon, 20 Apr 2009 09:13:28 -0600
Message-Id: <1240240408.1220.2.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: at91sam9263ek default defconfig
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
X-List-Received-Date: Mon, 20 Apr 2009 15:17:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm not sure what the "typical" distro defconfig should look like, but
it seems to me like everything ought to work that's on a particular
board by default.  I found that the I2C_GPIO pins (pins 9 & 10) on the
9263ek don't work with a fresh build of the bootstrap-image.  I created
a patch with what I think are the only necessary changes to fix it.

--- defconfig.orig      2009-04-17 11:01:25.000000000 -0600
+++ defconfig   2009-04-16 14:10:32.000000000 -0600
@@ -779,7 +779,7 @@
#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
-# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_GPIO=y
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_SIMTEC is not set

Does anyone see any reason why this shouldn't be included in the default
kernel configuration?

-- 
Shane Dixon
Linux Engineer
Atmel Corporation
E-mail: shane.dixon@atmel.com


