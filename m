Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <slapinid@gmail.com>) id 1HJD7T-0007QT-Dv
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 19:20:11 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2410873nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2007 10:20:10 -0800 (PST)
Received: by 10.48.210.20 with SMTP id i20mr5932164nfg.1171909210690;
	Mon, 19 Feb 2007 10:20:10 -0800 (PST)
Received: from ?192.168.11.22? ( [62.152.84.115])
	by mx.google.com with ESMTP id r34sm27575269nfc.2007.02.19.10.20.08;
	Mon, 19 Feb 2007 10:20:09 -0800 (PST)
Message-ID: <45D9EA57.20200@gmail.com>
Date: Mon, 19 Feb 2007 21:20:07 +0300
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: pango arm thumb incompatibility
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
X-List-Received-Date: Mon, 19 Feb 2007 18:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all!
pango package when it is build with "thumb" instruction set makes gpe-login segfault.

previous version seems to work.

When built with
DEBUG_BUILD = "1"
INHIBIT_PACKAGE_STRIP = "1"
it doesn't crash but becomes too large for device.



