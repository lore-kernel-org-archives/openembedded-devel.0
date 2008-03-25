Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JeB08-0007sx-Qb
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 16:23:49 +0100
X-ASG-Debug-ID: 1206458626-33b800050000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 0E3A529FC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 10:23:47 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 34qKvpobZhsaCXqo for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 10:23:47 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: AVR32 can build "base-image" target
Date: Tue, 25 Mar 2008 10:23:51 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803251023.51386.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206458627
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: AVR32 can build "base-image" target
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
X-List-Received-Date: Tue, 25 Mar 2008 15:23:49 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I just submitted patches to the OpenEmbedded Bugzilla that will allow you to 
build the Angstrom 2008.1 "base-image" target for the AVR32.  Bug #4123 
(http://bugs.openembedded.net/show_bug.cgi?id=4123).


One of the patches is actually for gcc bug #32388 (ICE in reload1.c), which 
may be affecting other architectures.  I only applied the patch for the AVR32 
target.  This patch is included in the mainline gcc 4.2.3 release.  See 
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32889 for more info.

---
Geoffrey


