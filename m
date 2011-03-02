Received: from na3sys009aog109.obsmtp.com ([74.125.149.201])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PupGo-000227-Af
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 17:51:26 +0100
Received: from source ([209.85.214.175]) (using TLSv1) by
	na3sys009aob109.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW51NjmthgM81JNyO9WhW9YyX8OAr68v@postini.com;
	Wed, 02 Mar 2011 08:50:01 PST
Received: by mail-iw0-f175.google.com with SMTP id 10so124790iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=FJ7y7dWiCQdCmDtmMqOUE4o3AZ2nH0209r45mDKXzgk=;
	b=KKqbyptc822ahFwmhlwbt7cv9c8WF53OpXKpe9e3nLVnYRWCoRcxeLd2QYEYONmZ8k
	ge9vWuO7rcKpQ2oR9MMg3q2LQhYou5I7vsN5QPu7JvawxUQCI8PfKJI1iibPMRv142U3
	4TO7X6ExFSJYJHNC0y6wxa5wFCzpCFpQi0s1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XbWzEAGjhqTt+vrwk5Y4Wv3ZZO+0Cz4XHQ8mPTTYaKdatXoEWrvvk4icNRA189UPlY
	3WnIi+TW+lKiU7PB0vKVQuvAY0ZBIJyXLB5naSqmTmf2H3aNYHgEqKnAePqtUquPTrTM
	ST2updIQ5LnLnjC8ZMW63mejP/+ueKuNz7mEQ=
Received: by 10.43.65.142 with SMTP id xm14mr8012004icb.304.1299078318345;
	Wed, 02 Mar 2011 07:05:18 -0800 (PST)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id z4sm17934ibg.19.2011.03.02.07.05.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 07:05:17 -0800 (PST)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Date: Wed,  2 Mar 2011 10:05:12 -0500
Message-Id: <cover.1299076392.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH v2 0/2] allow linux-lib-headers with external-toolchain-csl
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
X-List-Received-Date: Wed, 02 Mar 2011 16:51:26 -0000

This patch series enables the use of linux-libc-headers with
external CSL toolchain. This is useful when building userspace
applications to use ABI features not present in the headers bundled
with the CSL toolchain.

Version 1 of this patch was tested in arago [1] and found to work there.

Testing was performed there also by Andrea Galbusera <gizero@gmail.com>.
Who found that the changes enabled a couple of packages to pickup kernel
headers that were not bundled with the CSL toolchain.

I tested this series on 3dc72c4ca0a9ce677f6c3a56517626984b5eaaa0 of
git://git.openembedded.org/openembedded#master

Using the following local.conf (comment- and blank-lines trimmed):

SCRATCH ?= "${OEBASE}"
DL_DIR = "${SCRATCH}/downloads"
TMPDIR = "${SCRATCH}/arago-tmp"
BBFILES = "/media/unixdata/src/openembedded/openembedded-master/recipes/*/*.bb"
MACHINE = "da850-omapl138-evm"
DISTRO = "angstrom-2008.1"
ENABLE_BINARY_LOCALE_GENERATION = "0"
IMAGE_FSTYPES = "jffs2 tar.gz ext2.gz"
PARALLEL_MAKE = "-j 9"
BB_NUMBER_THREADS = "9"
BBINCLUDELOGS = "yes"
SOURCE_MIRROR_URL = "http://mirror/oe/"
INHERIT += "own-mirrors"
TOOLCHAIN_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"
TOOLCHAIN_PATH = "/opt/codesourcery-arm-none-eabi-2009q1"

'bitbake net-tools' fails with the familiar error [2] of 
'error: redefinition of 'struct iphdr'' which is caused by a missing
#ifdef in the 2.6.29 linux-headers ip.h bundled with the 2009q1
toolchain I am using. 

Whereas with the patches applied and the following added to local.conf:
PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"

'bitbake net-tools' is successful. Since specifying the
PREFERRED_PROVIDER in local.conf now results in installation of the
linux-lib-headers version 2.6.31 specified by angstrom conf.

Ben Gardiner (2):
  external-toolchain: allow override of linux-libc-headers provider
  external-toolchain-csl: allow linux-libc-headers

 conf/distro/include/toolchain-external.inc |    2 +-
 conf/local.conf.sample                     |    4 ++++
 recipes/meta/external-toolchain-csl.bb     |   15 ++++++++++-----
 3 files changed, 15 insertions(+), 6 deletions(-)

[1] https://gforge.ti.com/gf/project/arago/mailman/?_forum_action=ForumMessageBrowse&thread_id=4152&action=ListThreads&mailman_id=39
[2] http://www.gossamer-threads.com/lists/linux/kernel/1025676


