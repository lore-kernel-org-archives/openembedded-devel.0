Received: from mail-qa0-f42.google.com ([209.85.216.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UNof9-0004BD-O7
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 20:13:31 +0200
Received: by mail-qa0-f42.google.com with SMTP id bv4so2723297qab.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=SxSFOOva9pxG8kotkj6i8CU2t6jRSYFAAT+a3/UTwcU=;
	b=GIiB2n/1qT6bAp80DAQpOWeaWfP1CIhHie8FGUP1JmHSsxNasnBmAAH0CfTvg8a+f3
	W1OxzvtFYg+ZcY0n+8d0RjUJums0j6wC/Z8aDdmhtj5NkmKoqFVZU9TSYjJY65tOw9UE
	z0hEwcBXn6wbkGtiNHlTEUhO1jPBYoNrKUrp49WILY/c276Itp8tQ1VLZWn89lDrknps
	g97jb+aGHv+xa9gIlIsjrBt01+039jkkfdUngz48sUpDxCuViSxorOYk36UT5E5d3WiC
	moHNFevap7ooqbwxlGjguR86Fkb2c/OA/pOdfBx/jVVz5U9t5VUQVBYpAtgvZ/OWBmf7
	Dpow==
X-Received: by 10.49.127.180 with SMTP id nh20mr6483214qeb.19.1365098174461;
	Thu, 04 Apr 2013 10:56:14 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-175-73.ronkva.east.verizon.net. [96.240.175.73])
	by mx.google.com with ESMTPS id hv6sm1042459qeb.1.2013.04.04.10.56.13
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 10:56:14 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 13:56:08 -0400
Message-Id: <1365098168-28749-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1365098168-28749-1-git-send-email-philip@balister.org>
References: <1365098168-28749-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] gnuradio : Update to version 3.6.4.1.
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
X-List-Received-Date: Thu, 04 Apr 2013 18:13:32 -0000

Tested on Cortex-A( based machine.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index 85f52fc..efecc64 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -60,11 +60,11 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
 		   "
 FILES_${PN}-examples = "${datadir}/gnuradio/examples"
 
-PV = "3.6.3"
+PV = "3.6.4.1"
 
 FILESPATHPKG_prepend = "gnuradio-git:"
 
-SRCREV = "607a6fa3f80e08298ce7b3ee74ffca1590c05164"
+SRCREV = "5f69899e059e9bea58f92af61f70fc3f63825087"
 
 # Make it easy to test against developer repos and branches
 GIT_REPO = "gnuradio.git"
-- 
1.7.11.7



