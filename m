Received: from iwavesystems.com ([124.124.219.234] helo=mail.iwavesystems.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robinpv@iwavesystems.com>) id 1NX94H-00078C-N1
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 09:04:09 +0100
Received: from [192.168.2.45] (ABTS-KK-Static-ILP-150.152.181.122.airtel.in
	[122.181.152.150] (may be forged)) (authenticated bits=0)
	by mail.iwavesystems.com (8.13.6/8.13.6) with ESMTP id o0J822X6014927
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 13:32:03 +0530
From: robin <robinpv@iwavesystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 13:31:44 +0530
Message-ID: <1263888104.2678.15.camel@ubuntu-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-iwavesystems.com-MailScanner-Information: Please contact the ISP for more
	information
X-iwavesystems.com-MailScanner: Found to be clean
X-iwavesystems.com-MailScanner-From: robinpv@iwavesystems.com
X-SA-Exim-Connect-IP: 124.124.219.234
X-SA-Exim-Mail-From: robinpv@iwavesystems.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: git pull
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
X-List-Received-Date: Tue, 19 Jan 2010 08:04:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I am using the Openembedded for the beagleboard.
I had setup using below steps

export OETREE="${HOME}/OE" 
mkdir -p ${OETREE} && cd ${OETREE} 
git clone git://git.openembedded.org/openembedded.git openembedded 
cd openembedded git checkout origin/stable/2009 -b stable/2009
cd ${OETREE}/openembedded 
git pull

and then
bitbake beagleboard-demo-image

Now i wanted to update recipes folder.
git pull --rebase

It showed files which needs update. So i gave below command
git pull 

But the recipes/ti folder is not updated with latest files,
which command needs to be used to update recipes directory ?

Robin

------------------------------------------------------------------------------- 
DISCLAIMER: This e-mail and any attachment (s) is for authorised use by the
intended recipient (s) only. It may contain proprietary material, confidential
information and/or be subject to the legal privilege of iWave Systems
Technologies Private Limited. If you have received this message in error,
please notify the originator immediately. If you are not the intended
recipient, you are notified that you are strictly prohibited from retaining,
using, copying, alerting or disclosing the content of this message. Thank you
for your co-operation. 
------------------------------------------------------------------------------


