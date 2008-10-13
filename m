Received: from [206.46.172.73] (helo=vms172073pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KpQoe-0002CK-Eo
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 19:02:44 +0200
Received: from gandalf.denix.org ([71.255.247.239]) by vms172073.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K8O006UJSFVUOS0@vms172073.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	13 Oct 2008 11:57:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 128196B83A8; Mon,
	13 Oct 2008 12:57:31 -0400 (EDT)
Date: Mon, 13 Oct 2008 12:57:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <200810111447.57212.zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081013165731.GA13656@denix.org>
MIME-version: 1.0
References: <200810111447.57212.zecke@selfish.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Final call for updating the name mapping script
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
X-List-Received-Date: Mon, 13 Oct 2008 17:02:44 -0000
X-Groupsio-MsgNum: 6181
Content-type: multipart/mixed; boundary=cWoXeonUoKmBZSoM
Content-disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 11, 2008 at 02:47:56PM +0200, Holger Freyther wrote:
> There are also some author names without realname or mail address, and some 
> real names without mail address, they got mapped to 
> name.unknown@unknown.openembedded.org.
> 
> Patches welcome. Please send the output as diff -U 0... Otherwise this will be 
> the list of mappings we use for the conversion.

Thanks for taking care of this. I got into the category of lost realname, so 
here is a patch to fix it. Thanks again.

-- 
Denys

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="denix-email.patch"

--- email.py-orig	2008-10-13 12:49:40.000000000 -0400
+++ email.py	2008-10-13 12:52:12.000000000 -0400
@@ -175 +175 @@
-    "denis"              : (["denis@denix.org"], "denis@denix.org"),
+    "Denys Dmytriyenko"  : (["denix", "denis@denix.org"], "denis@denix.org"),

--cWoXeonUoKmBZSoM--
