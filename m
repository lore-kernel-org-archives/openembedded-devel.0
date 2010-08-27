Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Op0DH-0000BV-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:47:28 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7T004JRCXABM50@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	27 Aug 2010 08:46:22 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 0CDB6A; Fri, 27 Aug 2010 08:46:11 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Fri,
	27 Aug 2010 08:46:10 -0500
From: <openembedded@rkmorris.us>
Date: Fri, 27 Aug 2010 08:46:10 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282916770549933500@rkmorris.us>
In-reply-to: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
References: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Execution of Build Output Failing (Testing)
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
X-List-Received-Date: Fri, 27 Aug 2010 14:47:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
As I reported recently, I am having issues getting my OE output up and runn=
ing on my h1940 device. It seems to be some sort of issue between the kerne=
l and initrd files, so to debug this I figured that I'd build and test on Q=
EMU (hoping that the recent udev related issues were my problem, and to mak=
e sure that I could build "properly").
Given this, I went ahead and built console-image (angstrom 2008.1 distro) f=
or qemuarm, to see if it was perhaps just me having issues (which is still =
possible). However, I took the output from the qemuarm build and tried to r=
un it ... and still have issues (not the same as my h1940, but still fatal)=
.
On QEMU (verified to work with the QEMU provide example ARM images) I am ab=
le to boot, at least part way, but end up with a FATAL message about a miss=
ing directory ... /lib/modules/2.6.17-rc3.
Is this a known issue? Any proposed fixes or workarounds for this?
Thanks!
... Russell

