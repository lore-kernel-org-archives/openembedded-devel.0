Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <john_lee@openmoko.com>) id 1Ixn81-0003QZ-EW
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 18:24:46 +0100
Received: from [172.16.42.164] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1Ixn4r-0005f2-J6 for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 01:21:40 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.68)
	(envelope-from <john_lee@openmoko.com>) id 1Ixn4l-0001TV-Te
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 01:21:23 +0800
Date: Fri, 30 Nov 2007 01:21:23 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20071129172123.GA29463@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17 (2007-11-01)
X-SA-Exim-Connect-IP: 172.16.42.164
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: OE/snapshots is not really for different mtn ver.
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
X-List-Received-Date: Thu, 29 Nov 2007 17:24:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi List,

I just found out that stuffs under
http://www.openembedded.org/snapshots/ are not really for different
version of monotone.

Actually, 0.33 and 0.34 are both for mtn 0.32

this script:

for V in 0.29 0.30 0.31 0.32 0.33 0.34 0.35
do
../bin/mtn-${V}-linux-x86 -d OE-this-is-for-mtn-${V}.mtn heads \
-b org.openembedded.dev
done

gave me the following result:

mtn-0.29-linux-x86: branch 'org.openembedded.dev' is currently merged:
aa44d626baaae40ee498aea453176a8aea90d9fc xora@openembedded.org 2007-07-10T23:18:21
mtn-0.30-linux-x86: branch 'org.openembedded.dev' is currently merged:
dbb50c1216fdeb2127d4ebde03ffed987a3a5d96 coredump2@openembedded.org 2007-11-21T04:10:31
mtn-0.31-linux-x86: branch 'org.openembedded.dev' is currently merged:
dbb50c1216fdeb2127d4ebde03ffed987a3a5d96 coredump2@openembedded.org 2007-11-21T04:10:31
mtn-0.32-linux-x86: branch 'org.openembedded.dev' is currently merged:
dbb50c1216fdeb2127d4ebde03ffed987a3a5d96 coredump2@openembedded.org 2007-11-21T04:10:31
mtn-0.33-linux-x86: misuse: database /home/downloads/mtn/db/OE-this-is-for-mtn-0.33.mtn is laid out according to an old schema
mtn-0.33-linux-x86: misuse: try 'mtn-0.33-linux-x86 db migrate' to upgrade
mtn-0.33-linux-x86: misuse: (this is irreversible; you may want to make a backup copy first)
mtn-0.34-linux-x86: misuse: database /home/downloads/mtn/db/OE-this-is-for-mtn-0.34.mtn is laid out according to an old schema
mtn-0.34-linux-x86: misuse: try 'mtn-0.34-linux-x86 db migrate' to upgrade
mtn-0.34-linux-x86: misuse: (this is irreversible; you may want to make a backup copy first)
mtn-0.35-linux-x86: branch 'org.openembedded.dev' is currently merged:
dbb50c1216fdeb2127d4ebde03ffed987a3a5d96 coredump2@openembedded.org 2007-11-21T04:10:31

I don't have mtn 0.36 and 0.37 on that machine so I didn't check the
rest.

Regards,
John


