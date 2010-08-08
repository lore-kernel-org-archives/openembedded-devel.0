Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oi7ag-0000ae-U7
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 17:15:12 +0200
Received: by iwn38 with SMTP id 38so2882533iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ChhLI6NsSbXYTLF1/fEh44VzTQzV1p9kaxvZM08+MB0=;
	b=tvq85lTy1rR9xhTxMMSPzMKATyfxshTHKG4IbyKG0oqTfw17HOAECv0Qh5WjW1oEfg
	GUGlY2QlW2aAvgjrGqUo2Oex1GhoyzkfAAvHhYygTzc53WmXJqXN5mW9e4xVzwrOijp6
	w691+d6TvbDzgoA7Z0UKFpj4CTGy+1PREzIv4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=vN64BUh0vRj7EAeeMI5c93zcnZJGesVNYBVGB9OUgr47zG1UW//1nG+I1myaVm3m1/
	0lsW9EM9LNZNoX/29ec564/QgRzMnzg2k5P3jQpELCmlTQd/PXZjckzwdx4fOzB+JsSp
	yvbU+/hSsjKOBpat1kXGHKWmUht3dBLUBnFdk=
MIME-Version: 1.0
Received: by 10.231.39.134 with SMTP id g6mr17196285ibe.151.1281280503393; 
	Sun, 08 Aug 2010 08:15:03 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 8 Aug 2010 08:15:03 -0700 (PDT)
Date: Sun, 8 Aug 2010 17:15:03 +0200
Message-ID: <AANLkTikFmHGHARQ9Nab-JhgbfX=Ay2U-=9jWwpA7hYxq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: error message on missing patchfile
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
X-List-Received-Date: Sun, 08 Aug 2010 15:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

By accident I misplaced a patch file and I noticed that the build
process does not give an error for it during distribute_sources, but
only in do_patch.
It sems to me that the error should be given when distributing the sources.

I've checked in the logs and it says:
run.SRC_DISTRIBUTECOMMAND.4388:    ln -sf
"/home/frans/oe/openembedded/recipes/urjtag/urjtag-0.10/m4.patch"

This ln succeeds even if the file is not there.

I've tried to fix this and generate an error but apparenty my
knowledge of the build machinery is not enough.
Below is the patch that I produced.
The problem is that I get an error message saying unexpeced '(' on the line:
!         raise bb.build.FuncFailed("File does not exist: %s" % ${SRC})
Anyone a suggestion on what is wrong?


*** src_distribute_local.bbclass	Sun Aug  8 14:58:24 2010
--- src_distribute_local.bbclass.sav	Sun Aug  8 14:43:20 2010
***************
*** 7,27 ****
  # symlinks the files to the SRC_DISTRIBUTEDIR
  SRC_DISTRIBUTECOMMAND-symlink () {
      test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
!     ln -sf "${SRC}" .
  }

  # copies the files to the SRC_DISTRIBUTEDIR
  SRC_DISTRIBUTECOMMAND-copy () {
      test -e "${SRC}.md5" && cp -f "${SRC}.md5" .
!     cp -fr "${SRC}" .
  }

  # moves the files to the SRC_DISTRIBUTEDIR and symlinks them back
  SRC_DISTRIBUTECOMMAND-move+symlink () {
      if ! [ -L ${SRC} ]; then
!         src=`basename "${SRC}"`
!         mv ${SRC} .
!         ln -sf $src "${SRC}"
          if [ -e ${SRC}.md5 ]; then
              mv ${SRC}.md5 .
              ln -sf $src "${SRC}.md5"
--- 7,42 ----
  # symlinks the files to the SRC_DISTRIBUTEDIR
  SRC_DISTRIBUTECOMMAND-symlink () {
      test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
!     if test -e {SRC}
!     then
!         ln -sf "${SRC}" .
!     else
!         raise bb.build.FuncFailed("File does not exist: %s" % ${SRC})
!     fi
  }

  # copies the files to the SRC_DISTRIBUTEDIR
  SRC_DISTRIBUTECOMMAND-copy () {
      test -e "${SRC}.md5" && cp -f "${SRC}.md5" .
!     if test -e {SRC}
!     then
!         cp -fr "${SRC}" .
!     else
!         raise bb.build.FuncFailed("File does not exist: %s" % ${SRC})
!     fi
  }

  # moves the files to the SRC_DISTRIBUTEDIR and symlinks them back
  SRC_DISTRIBUTECOMMAND-move+symlink () {
      if ! [ -L ${SRC} ]; then
!         if test -e {SRC}
!         then
!             src=`basename "${SRC}"`
!             mv ${SRC} .
!             ln -sf $src "${SRC}"
!         else
!             raise bb.build.FuncFailed("File does not exist: %s" % ${SRC})
!         fi
          if [ -e ${SRC}.md5 ]; then
              mv ${SRC}.md5 .
              ln -sf $src "${SRC}.md5"


