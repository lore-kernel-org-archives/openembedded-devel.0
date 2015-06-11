Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 710B17324E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 15:35:46 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Z34WB-0005Sx-3q
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2015 17:35:47 +0200
Received: from host-87-242-63-200.prtelecom.hu ([87.242.63.200]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1Z34W3-0007uV-Ut
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2015 17:35:45 +0200
Message-ID: <5579AAC9.8090508@pr.hu>
Date: Thu, 11 Jun 2015 17:35:37 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Score: 0.3 (/)
X-Scan-Signature: dda648b1d3e643e91fd1a0320e0a0c7d
X-Spam-Tracer: backend.mail.pr.hu 0.3 20150611153545Z
Subject: Bitbake 1.22 GIT fetcher problem with tags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jun 2015 15:35:49 -0000
X-Groupsio-MsgNum: 55858
Content-Type: multipart/mixed; boundary="------------060907030102030902090403"

--------------060907030102030902090403
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

when fetching a git:// source using SRCREV="tag_name", do_fetch often fails.
The attached patch solves it. We still use a Yocto 1.6 based system and it is a necessity.
Can you get this or the patch from bitbake's master branch backported into old bitbake
branches?

Thanks in advance and best regards,
Zoltán Böszörményi


--------------060907030102030902090403
Content-Type: text/x-patch;
 name="bitbake-1.22-git-tag-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bitbake-1.22-git-tag-fix.patch"

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 5d1a358..3897172 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -339,7 +339,7 @@ class Git(FetchMethod):
         """
         Compute the HEAD revision for the url
         """
-        search = "refs/heads/%s refs/tags/%s^{}" % (ud.unresolvedrev[name], ud.unresolvedrev[name])
+        search = "refs/heads/%s refs/tags/%s refs/tags/%s^{}" % (ud.unresolvedrev[name], ud.unresolvedrev[name], ud.unresolvedrev[name])
         output = self._lsremote(ud, d, search)
         return output.split()[0]
 

--------------060907030102030902090403--
