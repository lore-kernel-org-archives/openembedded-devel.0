Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1GvjUX-0006nv-Tz
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Dec 2006 01:02:58 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id BEB6D8CF56
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2006 11:00:56 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25931-01
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2006 11:00:55 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id AD6C149B2B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2006 11:00:55 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 9697E1654E56; Sun, 17 Dec 2006 11:00:55 +1100 (EST)
Date: Sun, 17 Dec 2006 11:00:55 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061217000055.GA30417@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: madwifi_ng: security issue, CVE-2006-6332
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
X-List-Received-Date: Sun, 17 Dec 2006 00:02:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Anyone using madwifi should upgrade to r1844-20061208 to get the fix for
CVE-2006-6332. From the announcement on madwifi.org:

 Release 0.9.2.1 fixes critical security issue

 A critical security flaw (CVE-2006-6332) has been discovered which can be
 exploited from remote and allows arbitrary code injection. The fix has been
 committed to trunk in r1842. In addition, we released v0.9.2.1 (v0.9.2 plus
 the fix for the issue), which is available for download from sf.net.

 All users should upgrade as soon as possible.


----- Forwarded message from "\"lenehan commit\"" <openembedded-commits@lists.openembedded.org> -----

From: openembedded-commits@lists.openembedded.org ("lenehan commit")
Subject: [oe-commits] org.oe.dev madwifi-ng r1844: Add svn snapshot 1844
	which is the same as the 0.9.2.1
Date: Sun, 17 Dec 2006 00:58:12 +0100

madwifi-ng r1844: Add svn snapshot 1844 which is the same as the 0.9.2.1
release. This includes a critical fix for CVE-2006-6332 which is a remotely
exploitable stack-based buffer overflow bug.

Author: lenehan@openembedded.org
Branch: org.openembedded.dev
Revision: af1d7cf6768b5e5205f07a7a63b6767971ccb1b7
ViewMTN: http://monotone.openembedded.org/revision.psp?id=af1d7cf6768b5e5205f07a7a63b6767971ccb1b7
Files:
1
packages/madwifi/madwifi-ng-r1844-20061208
packages/madwifi/madwifi-ng-r1844-20061208/10-xscale-be-elf-copts.patch
packages/madwifi/madwifi-ng-r1844-20061208/10-xscale-le-elf-copts.patch
packages/madwifi/madwifi-ng_r1844-20061208.bb
[...]
----- End forwarded message -----

-- 
 Jamie Lenehan <lenehan@twibble.org>


