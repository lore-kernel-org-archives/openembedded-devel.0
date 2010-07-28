Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1Oe9gf-00077D-Eo
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:40:58 +0200
Received: by wyb38 with SMTP id 38so4567419wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:40:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.237.100 with SMTP id x78mr10754299weq.114.1280335238502; 
	Wed, 28 Jul 2010 09:40:38 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.216.236.97 with HTTP; Wed, 28 Jul 2010 09:40:38 -0700 (PDT)
Date: Wed, 28 Jul 2010 17:40:38 +0100
X-Google-Sender-Auth: fviB0EeBCVjpOTDTJjyv65dnGUg
Message-ID: <AANLkTintoXJZHPGxj1-sxHP31-VzOK3Washy+hZqbmgd@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Fix the compile failure of recode
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
X-List-Received-Date: Wed, 28 Jul 2010 16:40:58 -0000
Content-Type: text/plain; charset=UTF-8

The recode build fails because of CC/CXX environment variables being banged by:

TARGET_CC_ARCH_append = "${LDFLAGS}"

Adding a space fixes it:

From d792e217288ac56b1cc1f798c0ea67f749037f2a Mon Sep 17 00:00:00 2001
From: Alex Bennee <ajb@cbnl.com> Date: Wed, 28 Jul 2010 17:38:39 +0100
Subject: [PATCH] Add space to appended CC/CXX otherwise configure
fails ---  recipes/recode/recode_3.6.bb |    2 +-  1 files changed, 1
insertions(+), 1 deletions(-) diff --git
a/recipes/recode/recode_3.6.bb b/recipes/recode/recode_3.6.bb index
3e7c6cd..0cdd43d 100644 --- a/recipes/recode/recode_3.6.bb +++
b/recipes/recode/recode_3.6.bb @@ -8,7 +8,7 @@ SRC_URI =
"${GNU_MIRROR}/recode/recode-${PV}.tar.gz \    inherit autotools
-TARGET_CC_ARCH_append = "${LDFLAGS}" +TARGET_CC_ARCH_append = "
${LDFLAGS}"    do_configure() {  	gnu-configize --  1.7.2

-- 
Alex, homepage: http://www.bennee.com/~alex/
http://www.half-llama.co.uk


