Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte7R-0000e1-Fo
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:40:23 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c6StmWipTC3UmSBd6g/0ySDr+8T7nH@postini.com;
	Mon, 22 Mar 2010 02:37:16 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:09 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:08 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:24 +0000
Message-ID: <20100322093519.27540.67981.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.24
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/12] Modify location of coreutils executables
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
X-List-Received-Date: Mon, 22 Mar 2010 09:40:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Modify where the coreutils executables are put so that they conform more to
what we believe to be their standard location.
---

 recipes/coreutils/coreutils-target.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/coreutils/coreutils-target.inc b/recipes/coreutils/coreutils-target.inc
index 1dd1d36..5bab4b2 100644
--- a/recipes/coreutils/coreutils-target.inc
+++ b/recipes/coreutils/coreutils-target.inc
@@ -2,17 +2,17 @@ EXTRA_AUTORECONF += "-I ${S}/m4"
 SRC_URI += "file://onceonly.m4"
 
 # [ gets a special treatment and is not included in this
-bindir_progs = "basename cksum comm csplit cut df dir dircolors dirname du \
+bindir_progs = "basename cksum comm csplit cut dir dircolors dirname du \
 		env expand expr factor fmt fold groups head hostid id install \
-		join link logname md5sum mkfifo nice nl nohup od paste pathchk \
+		join link logname md5sum mkfifo nl nohup od paste pathchk \
 		pinky pr printenv printf ptx readlink seq sha1sum shred sort \
 		split stat sum tac tail tee test tr tsort tty unexpand uniq \
 		unlink users vdir wc who whoami yes \
 		"
 
 # hostname gets a special treatment and is not included in this
-base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill \
-		     ln ls mkdir mknod mv pwd rm rmdir sleep stty sync touch \
+base_bindir_progs = "cat chgrp chmod chown cp date dd df echo false kill \
+		     ln ls mkdir mknod mv nice pwd rm rmdir sleep stty sync touch \
 		     true uname \
 		     "
 


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


