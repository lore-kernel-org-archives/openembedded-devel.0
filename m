Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kx5xb-0002pV-7k
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Nov 2008 21:23:39 +0100
Received: from gandalf.denix.org ([71.255.226.167])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K9R00CPSXWTXOK1@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	03 Nov 2008 14:22:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 113AC6B83A8; Mon,
	03 Nov 2008 15:22:05 -0500 (EST)
Date: Mon, 03 Nov 2008 15:22:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081103202204.GA11663@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [RFC] glibc fails with -march=i686 or pentiumpro or pentium3
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
X-List-Received-Date: Mon, 03 Nov 2008 20:23:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

glibc fails with -march=i686 or pentiumpro or pentium3 - it's a known issue
with glibc and has been discussed for long time, but glibc team refuses to fix
it. eglibc has been fixed by Khem Raj:

http://www.eglibc.org/archives/patches/msg00073.html

The same patch works for glibc. See Bug #4798:

http://bugs.openembedded.net/show_bug.cgi?id=4798

-- 
Denys


