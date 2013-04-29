Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001lN-Fx
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f181.google.com with SMTP id a11so2519904eae.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=MdkkwI62/3686BEG6yMDL2gsjiMonUfDq362endHZWU=;
	b=ZyogN0hiNj3/1aH7RCAN019oZ2hAoRDo/g3TpReVLQyJfhhC/0Qg1s89RSHIFY9YQx
	jaaWT6BkPmXRbwdYAdAaF6YWH7vNqzvDditONXx2/KyonQcnY74qoFKQIBQAQANa/btp
	66oZV3JfONkfyNxSbBDvP0O4rzssrtD/i0Ca4JUY9EtQNOmqvH0rERy2ZE+o0gp+r3Al
	ds7/eCJdKeNTdgcr1diHaBLhUbh2WiI5YIUh+KzmfFoQveR7y/nBmMgC9VolmWybAgZL
	5+pWI6vTeRv2l9e0LS5XDxUyF//CdLATwUityJ2sqr9xua2dkYuV0dvcfXhSJt6loEZp
	z+PQ==
X-Received: by 10.15.41.2 with SMTP id r2mr63159631eev.23.1367238828307;
	Mon, 29 Apr 2013 05:33:48 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:20 +0200
Message-Id: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome 0/5] gnome-world-fixes
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
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3c47bd59d0315c98364a175a686e8a4b8ba66867:

  apache2: fix multilib builds (2013-04-29 10:25:17 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git gnome-world-fixes

Andreas Müller (5):
      zenity: fix build
      libgnomecanvas: update 2.30.3 to fix build
      gnome-power-manager: fix configure
      gnome-power-manager: fix compile
      libgnome: fix compile

 .../0001-Makefile.am-don-t-build-help-man.patch    |   37 +++++++++++++++++++
 .../gnome-power-manager_2.32.0.bb                  |   15 ++++----
 ...nome-Makefile.am-allow-deprecated-symbols.patch |   35 ++++++++++++++++++
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |    3 +-
 ...mecanvas_2.26.0.bb => libgnomecanvas_2.30.3.bb} |    8 ++---
 .../files/0001-Makefile.am-don-t-build-help.patch  |   39 ++++++++++++++++++++
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |    3 +-
 7 files changed, 125 insertions(+), 15 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
 rename meta-gnome/recipes-gnome/libgnome/{libgnomecanvas_2.26.0.bb => libgnomecanvas_2.30.3.bb} (77%)
 create mode 100644 meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch

-- 
1.7.6.5



