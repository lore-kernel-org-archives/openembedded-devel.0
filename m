Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KjJB7-0006Nv-J1
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Sep 2008 21:40:37 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1DAB88400AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2008 21:36:51 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 249C38400A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2008 21:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178098069.adsl.alicedsl.de
	[85.178.98.69]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2008 21:36:50 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 61C173C1D7; Fri, 26 Sep 2008 21:36:49 +0200 (CEST)
Date: Fri, 26 Sep 2008 21:36:49 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080926193648.GA12460@rhein.zuhause.netz>
References: <20080925191451.GA17447@rhein.zuhause.netz>
	<200809260332.35358.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200809260332.35358.zecke@selfish.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Discussion about gettext.bbclass
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
X-List-Received-Date: Fri, 26 Sep 2008 19:40:37 -0000
X-Groupsio-MsgNum: 5980
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here is the patch now.

Bye Henning

--3V7upXqbjpZ4EhLz
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="gettext.diff"

#
# old_revision [6950cb0adadcf0fa171ec2fdd0751373a16fa294]
#
# patch "classes/gettext.bbclass"
#  from [a0ba1057eaf6a5619d05a1d4fe7e262095b34168]
#    to [46480807107b00b5b0a16442a461ddf95332bbb8]
#
============================================================
--- classes/gettext.bbclass	a0ba1057eaf6a5619d05a1d4fe7e262095b34168
+++ classes/gettext.bbclass	46480807107b00b5b0a16442a461ddf95332bbb8
@@ -1,16 +1,16 @@
+DEPENDS =+ "gettext-native virtual/libiconv virtual/libintl"
+EXTRA_OECONF += "--enable-nls"
+
 def gettext_after_parse(d):
     import bb
     # Remove the NLS bits if USE_NLS is no.
     if bb.data.getVar('USE_NLS', d, 1) == 'no':
         cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
         cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
         bb.data.setVar('EXTRA_OECONF', cfg, d)
+        depends = bb.data.getVar('DEPENDS', d, 1) or ""
+        bb.data.setVar('DEPENDS', oe_filter_out('^(gettext-native|virtual/libiconv|virtual/libintl)$', depends, d), d)
 
 python () {
     gettext_after_parse(d)
 }
-
-DEPENDS =+ "gettext-native"
-EXTRA_OECONF += "--enable-nls"

--3V7upXqbjpZ4EhLz--
