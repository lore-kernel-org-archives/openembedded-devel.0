Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1Oe8WN-0000MC-Eu
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 17:26:16 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Wed, 28 Jul 2010 11:25:55 -0400
Message-ID: <4C504C00.8080207@tycoelectronics.com>
Date: Wed, 28 Jul 2010 11:25:52 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.126.1280326040.17151.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.126.1280326040.17151.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Qt4 recipe fix; fixes configure so compiler is detected properly, and QXMLPatterns gets built
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
X-List-Received-Date: Wed, 28 Jul 2010 15:26:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please see this link for two files, a patch for the recipe, and also a 
new file:
http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix

http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix/configure-conf_compiler-fix.patch
patch file to go into the files/ directory of the recipe -- this file 
patches the configure program so that the tests of compiler capability 
work properly in OE

http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix/Qt4-recipe-compiler-fix.patch
patches to the various .inc and .bb files to include 
configure-conf_compiler-fix.patch in the list of patches used

More info:
The code the configure script which sets TEST_COMPILER uses the 
QMAKE_CONF_COMPILER variable from the Makefile to determine which 
compiler is being used.     This code  gets messed up by the use of the 
$(VARIABLE) construct used in a Makefile and doesn't set the compiler 
correctly.    I added a line which converts this to ${VARIABLE} to 
evaluate it, so that the correct value is extracted from the environment.

This was not preventing Qt4 from building, but was breaking some tests 
which are used to determine which features of Qt4 to enable and disable, 
one of which is the QtXmlPatterns library, which the application I am 
running on an OE system requires.

Please add these changes to the Qt4 recipe.

Regards,
Jay Snyder



