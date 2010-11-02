Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PD5O9-0002FC-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 02:10:16 +0100
Received: by pva4 with SMTP id 4so691913pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 18:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=r5hB8TNlJ/xb6x/CKqruUur2VGGRTdQy3cJT3W+LUGg=;
	b=W7qT4FdqPIjOQXGWD6IQ5EWJXI70Vt6BYlQknzNF/eNSllnkEo2LgSyqhBawWekcq9
	Uu5KhUDQbygp8W4oo3nmIhgLYD9rk9MsEa44qk3tw41OPxRKPNzJaMSk7F1oEgtbD2JW
	zIRb81B/lM/rOH+mmeh8qBZ86cw7LnzN3EL94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FCvZW9Cnt88SlCcFmtI/YdKHXpgSuTaVGJR7Aw0a0R8VaNQkOj3dTa3TjplmTXxUuu
	lXl9VCU8Ubzj65ViNBeOuLf8gwXIyBMx80iv/7krqbWIUPuu/o0GqFKlVNDFA43KtHUs
	TruE7Y4enehddZjH9Rzi/rzb9BTJedcJ4SQIY=
Received: by 10.143.12.18 with SMTP id p18mr5261896wfi.59.1288660163445;
	Mon, 01 Nov 2010 18:09:23 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w22sm9838873wfd.7.2010.11.01.18.09.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 18:09:22 -0700 (PDT)
Message-ID: <4CCF64BD.4090500@gmail.com>
Date: Tue, 02 Nov 2010 11:39:17 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-cython_0.13.bb: Add python-native to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 01:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


/mnt/oe/tmp/work/x86_64-linux/python-cython-native-0.13-r0/temp/run.do_compile.28826: line 927: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
FATAL: python setup.py build_ext execution failed.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/python/python-cython_0.13.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-cython_0.13.bb b/recipes/python/python-cython_0.13.bb
index 61ad718..4e0411d 100644
--- a/recipes/python/python-cython_0.13.bb
+++ b/recipes/python/python-cython_0.13.bb
@@ -7,6 +7,7 @@ LICENSE = "GPL"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
 NATIVE_INSTALL_WORKS = "1"
+DEPENDS = "python-native"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.7.1



