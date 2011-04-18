Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QBuDO-0004wk-Q6
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 21:34:31 +0200
Received: by bwz5 with SMTP id 5so4533947bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=q7SLJgzOWpDdC+GoY4V/q92tZAuo3j+ACbbi/8gjVgU=;
	b=jXmlKuYC47JfUPwLPa+tIZXdka+PHUT7fCnw5iceb6PyvtaUDXBZ/a+5xRBJzSu5zK
	Nt2VM+nirb9sbPhcDAblFraURqZOFPKSUG2rJEK6NSpt/ec+WJZXrZ6L4HpJXbeMwaWh
	l1vNwmlWnA+dts/8LxVrLM90mO+/jhkUtrOqg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ASgMMbfyo655EfTUwudGB7BcMHKMCNWvi5qRsH73RQodZaI6QaaA+gVbV4FbMII5AZ
	vlzp6Y1ns8ZKmmceBhfMTQFIU6ulcj3hFUE6OT/n2RCtn79RqyhxqGq0ATqKJHRrpEBa
	qO6sMqKdTdmcGn0Qy8G0e3oB998R80SGxtcio=
Received: by 10.204.57.135 with SMTP id c7mr4402633bkh.88.1303155129782;
	Mon, 18 Apr 2011 12:32:09 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-150-236.dynamic.xdsl-line.inode.at [85.127.150.236])
	by mx.google.com with ESMTPS id b6sm3436921bkb.10.2011.04.18.12.32.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 12:32:06 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 21:32:03 +0200
Message-Id: <cover.1303154850.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [oe-meta 0/2] pull request: vim, wget
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
X-List-Received-Date: Mon, 18 Apr 2011 19:34:31 -0000

Re-import of vim/gvim/vim-tiny and wget.

* Clean vim recipe and update to 7.2.446 (446=patchset)
* Clean wget (ssl check using staging_dir)

Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
  Branch: master
  Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/master

Thanks,
    Michael Lippautz <michael.lippautz@gmail.com>
---


Michael Lippautz (2):
  wget: Add version 1.11.4
  vim: Add vim/tiny-vim/gvim 7.2 (patchset 446)

 meta-oe/recipes-connectivity/wget/wget.inc         |   30 +
 meta-oe/recipes-connectivity/wget/wget_1.11.4.bb   |    7 +
 meta-oe/recipes-support/vim/files/401-446.diff     | 5426 ++++++++++++++++++++
 .../vim/files/configure.in_remove_CC_quotes.patch  |   17 +
 meta-oe/recipes-support/vim/files/vimrc            |   96 +
 meta-oe/recipes-support/vim/gvim_7.2.446.bb        |   10 +
 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb    |    5 +
 meta-oe/recipes-support/vim/vim.inc                |   77 +
 meta-oe/recipes-support/vim/vim_7.2.446.bb         |   41 +
 9 files changed, 5709 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wget/wget.inc
 create mode 100644 meta-oe/recipes-connectivity/wget/wget_1.11.4.bb
 create mode 100644 meta-oe/recipes-support/vim/files/401-446.diff
 create mode 100644 meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.patch
 create mode 100644 meta-oe/recipes-support/vim/files/vimrc
 create mode 100644 meta-oe/recipes-support/vim/gvim_7.2.446.bb
 create mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb
 create mode 100644 meta-oe/recipes-support/vim/vim.inc
 create mode 100644 meta-oe/recipes-support/vim/vim_7.2.446.bb

-- 
1.7.3.4



