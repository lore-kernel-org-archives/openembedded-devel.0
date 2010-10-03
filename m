Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NPo-0002lX-Gr
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:11:41 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A4B121D363EB;
	Sun,  3 Oct 2010 14:11:22 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:11:20 +0200
Message-Id: <1286107883-10714-1-git-send-email-ynezz@true.cz>
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
Subject: [PATCH 0/3] Update Lua and add new recipes
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
X-List-Received-Date: Sun, 03 Oct 2010 12:11:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

this patchset is adding bitwise operator support to Lua, fixes wrong Lua
version in pkg-config file and adds two new recipes for LuaFilesystem lib=
rary
and luars232 library. Please apply. Thanks.

-- ynezz

Petr =C5=A0tetiar (3):
  lua5.1: add bitwise operators patch and fix version in pkg-config
    file
  lua-rs232: add new recipe
  lua-filesystem: add new recipe

 recipes/lua/lua-filesystem-1.5.0/makefile.patch |   23 +
 recipes/lua/lua-filesystem_1.5.0.bb             |   25 +
 recipes/lua/lua-rs232_1.0.0.bb                  |   26 +
 recipes/lua/lua5.1/bitwise_operators.patch      |  620 +++++++++++++++++=
++++++
 recipes/lua/lua5.1/lua5.1.pc                    |    2 +-
 recipes/lua/lua5.1_5.1.4.bb                     |    3 +-
 6 files changed, 697 insertions(+), 2 deletions(-)
 create mode 100644 recipes/lua/lua-filesystem-1.5.0/makefile.patch
 create mode 100644 recipes/lua/lua-filesystem_1.5.0.bb
 create mode 100644 recipes/lua/lua-rs232_1.0.0.bb
 create mode 100644 recipes/lua/lua5.1/bitwise_operators.patch



