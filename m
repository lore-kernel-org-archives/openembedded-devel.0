Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P7Z8g-0003tZ-Ce
	for openembedded-devel@openembedded.org; Sun, 17 Oct 2010 21:43:29 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id B2D2F1D360EE;
	Sun, 17 Oct 2010 21:42:50 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 21:42:48 +0200
Message-Id: <1287344571-13760-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] lua: use standard prefix for Lua libraries
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
X-List-Received-Date: Sun, 17 Oct 2010 19:43:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

this patch series should fix wrong path in default configuration of Lua, =
where
uses wrong /usr/local/{lib,share} in it's module/script search path. This
patch changes it to the usage of the standard /usr/{lib,share} directorie=
s.
Please apply. Thanks.

-- ynezz

Petr =C5=A0tetiar (3):
  lua5.1: use standard prefix for Lua libraries
  lua-filesystem: use standard prefix for Lua libraries
  lua-rs232: use standard prefix for Lua libraries

 recipes/lua/lua-filesystem_1.5.0.bb   |    8 +++++---
 recipes/lua/lua-rs232_1.0.0.bb        |    4 +++-
 recipes/lua/lua5.1/no-usr-local.patch |   13 +++++++++++++
 recipes/lua/lua5.1_5.1.4.bb           |    3 ++-
 4 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 recipes/lua/lua5.1/no-usr-local.patch



