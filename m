Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUUw-0004if-W5
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:11 +0100
Received: by gwb11 with SMTP id 11so1380552gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=S54C2g4FGOprNmTPaJsWFMuwUHURbN1wMKsEqpm85Ww=;
	b=Fl6WN8KZ9+VF0i21voCzpJEj5ThDV4M667hFBsfzS6KzUHI/SyBSi+f+k4FM6BHgZp
	DYQsrg5OptMOZEGgsVdBKEyAEezowR2PVib1kgq1OOs8T/FGtI4JD+kDtt24TsnhFJZk
	Q5iFLxioGFEK/NRJNGwM1/bpl6I+xOxoiR+tw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=TfVVnTbnqxJEf1kd8TSGt9ajyxqIYwQBvz6LKQizC2jMbnno+ZGQCUkmgAUEOHiCuT
	oGr+oXwQ3FHBbqs2xC+ir9uCCFlqFjc5ScyMqwSnazLTEcW/qpH5gijHsG8jJvF+Q/U0
	8Gcq0UD3Q8dHRl3C7IkrUu0DRbC6QaLXI9ZTM=
Received: by 10.101.94.10 with SMTP id w10mr2203481anl.31.1299958050145;
	Sat, 12 Mar 2011 11:27:30 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:07 +0000
Message-Id: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 00/11] Patchset being in use on O.S. Systems internal tree
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:11 -0000

Hello,

This patchset has been in use in our internal tree and as usual we'd
like to have it synced with upstream so we're proposing those for
merging.

The patches that are included on this set are:

[PATCH 01/11] freerdp: workaround gcc linking bug forcing -lpthread
[PATCH 02/11] freerdp: add singleton support with PDU error handling
[PATCH 03/11] cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
[PATCH 04/11] bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
[PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
[PATCH 06/11] xkeyboard-config: use --with-xkb-rules-symlink=xorg option
[PATCH 07/11] xkeyboard-config (git): update to current version - 2.1 plus fixes
[PATCH 08/11] linux (2.6.37): update to 2.6.37.3 stable patch
[PATCH 09/11] libarchive: add
[PATCH 10/11] cmake: depends on libarchive
[PATCH 11/11] p910nd: update to 0.95 and improve packaging

The diffstat of whole series is:

 classes/cmake.bbclass                              |    2 -
 conf/bitbake.conf                                  |   10 +-
 recipes/cmake/cmake_2.8.3.bb                       |    4 +-
 recipes/freerdp/freerdp.inc                        |    7 +-
 recipes/freerdp/freerdp/singleton-mode.patch       |  208 ++++++++++++++++++++
 recipes/freerdp/freerdp_git.bb                     |    5 +-
 .../0001-Patch-from-upstream-revision-1990.patch   |   45 +++++
 .../0002-Patch-from-upstream-revision-1991.patch   |   34 ++++
 .../0003-Patch-from-upstream-rev-2516.patch        |   65 ++++++
 .../0004-Patch-from-upstream-rev-2514.patch        |   35 ++++
 .../0005-Patch-from-upstream-rev-2520.patch        |   33 +++
 .../0006-Patch-from-upstream-rev-2521.patch        |   30 +++
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   33 +++
 recipes/libarchive/libarchive_2.8.4.bb             |   20 ++
 recipes/linux/linux_2.6.37.bb                      |    8 +-
 recipes/p910nd/p910nd_0.92.bb                      |   45 -----
 recipes/p910nd/p910nd_0.95.bb                      |   49 +++++
 recipes/udev/udev_165.bb                           |    7 +-
 recipes/xkeyboard-config/xkeyboard-config.inc      |    9 +-
 recipes/xkeyboard-config/xkeyboard-config_git.bb   |    6 +-
 20 files changed, 584 insertions(+), 71 deletions(-)

Thanks in advance,
Otavio Salvador


