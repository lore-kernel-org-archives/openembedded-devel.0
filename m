Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OqVI2-0006gB-8L
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 20:10:38 +0200
Received: by fxm6 with SMTP id 6so4458059fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=5WTaRLnqsNK3hOoynczP0/XaqhBjMjTSW++rJ94tPXQ=;
	b=DvCrhcuTOjgfE+X7LR1NjHTVPBzohZexqLNlov8JW8gJf9y+Y/wl3WuV98Q2JBnpsG
	EnIXKe/6FhsAYxFV2TO7J+Cv6kIls972dIX+cOEtaRMgdaek4CIGumZ+kfUWdGQvutf6
	N6nLvQS0cPrqG8wD15zk8NjnS1KZakr+n2aqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=GtFHA0Doo8MQLS43MncXD3hAwcvmLt+A4zj08AAPwApfl3BTVuYWyGXS+xun3S3uNB
	0qosgvBCYTCSt42i0y81NOx6sVNHLZfhgcTLxmTr6jMZHZMQXbUkPkjklpIwbYvRnYPX
	2PToO+em2Ql8cwBZw08nhnsF3NYxrlP8BE77o=
Received: by 10.223.125.142 with SMTP id y14mr1363388far.2.1283278201179; Tue,
	31 Aug 2010 11:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.81 with HTTP; Tue, 31 Aug 2010 11:09:41 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Tue, 31 Aug 2010 12:09:41 -0600
Message-ID: <AANLkTi=gi0VPPLGTJ+ZuV4akF5DA+qtYGBvuVsfe5Any@mail.gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: aufs2-util fails to compile
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
X-List-Received-Date: Tue, 31 Aug 2010 18:10:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

NOTE: Running task 472 of 672 (ID: 9,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/aufs/aufs2-util_git.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/coolaj86/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/aufs2-util-git-r1/temp/log.do_compile.21597)
| c2tmac.c:21:29: error: linux/aufs_type.h: No such file or directory
| c2tmac.c: In function 'main':
| c2tmac.c:29: error: 'AUFS_VERSION' undeclared (first use in this function)
| c2tmac.c:29: error: (Each undeclared identifier is reported only once
| c2tmac.c:29: error: for each function it appears in.)
| c2tmac.c:30: error: 'AUFS_XINO_FNAME' undeclared (first use in this
function)
| c2tmac.c:31: error: 'AUFS_XINO_DEFPATH' undeclared (first use in this
function)
| c2tmac.c:32: error: 'AUFS_DIRWH_DEF' undeclared (first use in this
function)
| c2tmac.c:33: error: 'AUFS_WH_PFX' undeclared (first use in this function)
| c2tmac.c:34: error: 'AUFS_WH_PFX_LEN' undeclared (first use in this
function)
| c2tmac.c:35: error: 'AUFS_WKQ_NAME' undeclared (first use in this
function)
| c2tmac.c:36: error: 'AUFS_NWKQ_DEF' undeclared (first use in this
function)
| c2tmac.c:37: error: 'AUFS_WH_DIROPQ' undeclared (first use in this
function)
| c2tmac.c:38: error: 'AUFS_WH_BASE' undeclared (first use in this function)
| c2tmac.c:39: error: 'AUFS_WH_PLINKDIR' undeclared (first use in this
function)
| c2tmac.c:40: error: 'AUFS_MFS_SECOND_DEF' undeclared (first use in this
function)
| c2tmac.c:41: error: 'AUFS_RDBLK_DEF' undeclared (first use in this
function)
| c2tmac.c:42: error: 'AUFS_RDHASH_DEF' undeclared (first use in this
function)
NOTE: Task failed:
/home/coolaj86/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/aufs2-util-git-r1/temp/log.do_compile.21597
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/coolaj86/overo-oe/org.openembedded.dev/recipes/aufs/
aufs2-util_git.bb do_compile failed
ERROR: Task 9 (/home/coolaj86/overo-oe/org.openembedded.dev/recipes/aufs/
aufs2-util_git.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 471 tasks of which 297 didn't need to be
rerun and 1 failed.
ERROR: '/home/coolaj86/overo-oe/org.openembedded.dev/recipes/aufs/
aufs2-util_git.bb' failed

AJ ONeal

