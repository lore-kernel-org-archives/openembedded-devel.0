Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P5hhN-0002bA-3I
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 18:27:54 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P5hgv-0001vH-Dk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 09:27:05 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 12 Oct 2010 09:27:05 -0700
Received: from [172.30.80.109] ([172.30.80.109]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 12 Oct 2010 10:27:04 -0600
Message-ID: <4CB48C51.9000403@mentor.com>
Date: Tue, 12 Oct 2010 09:26:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 12 Oct 2010 16:27:04.0410 (UTC)
	FILETIME=[4E3ECBA0:01CB6A2A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Remove older freetype versions
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
X-List-Received-Date: Tue, 12 Oct 2010 16:28:21 -0000
X-List-Received-Date: Tue, 12 Oct 2010 16:28:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

I'd like to remove all versions of freetype before 2.4.3.  The only dist 
which is pinning freetype currently does so via
conf/distro/include/preferred-opie-versions.inc and that pins to a 
non-existent version (it's using OPIE_VERSION which seems wrong).  All 
of the previous versions have various security issues, including 
remotely exploitable ones.  Only the very oldest version we have as a 
D_P -1 so everyone was using 2.3.12 and will be going up to 2.4.3 
(libraries are compat).

-- 
Tom Rini
Mentor Graphics Corporation


