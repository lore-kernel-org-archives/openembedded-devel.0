Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1Mn0rC-0007ZW-Lo
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 03:59:57 +0200
Received: from [76.91.220.157] (helo=[192.168.1.21])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mn0qj-0006Bd-Bv
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Sep 2009 18:59:25 -0700
Message-ID: <4AADA377.6010005@symas.com>
Date: Sun, 13 Sep 2009 18:59:19 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090909 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.71.152.235
X-SA-Exim-Mail-From: hyc@symas.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: python-wpactrl
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
X-List-Received-Date: Mon, 14 Sep 2009 01:59:58 -0000
X-Groupsio-MsgNum: 13084
Content-Type: multipart/mixed; boundary="------------090506020600020503080201"

--------------090506020600020503080201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Here's a recipe file for the python-wpactrl module, which connects to 
wpa_supplicant's control interface. It works for me...

-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/

--------------090506020600020503080201
Content-Type: text/plain;
 name="python-wpactrl_1.0.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python-wpactrl_1.0.bb"

DESCRIPTION = "A Python extension for wpa_supplicant/hostapd control interface access"
HOMEPAGE = "http://projects.otaku42.de/wiki/PythonWpaCtrl"
SECTION = "devel/python"
LICENSE = "GPLv2"
PR = "r0"

SRC_URI = "svn://svn.otaku42.de;module=python-wpactrl;proto=http;rev=383"

S = "${WORKDIR}/python-wpactrl/trunk"

inherit distutils

--------------090506020600020503080201--
