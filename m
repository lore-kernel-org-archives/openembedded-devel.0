Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IO8GH-00024w-6I
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 10:41:55 +0200
Received: by fk-out-0910.google.com with SMTP id 18so403452fks
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 01:40:42 -0700 (PDT)
Received: by 10.82.111.8 with SMTP id j8mr3634232buc.1187858442608;
	Thu, 23 Aug 2007 01:40:42 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Thu, 23 Aug 2007 01:40:42 -0700 (PDT)
Message-ID: <74d0deb30708230140p32b60295v9611f317f3931ae6@mail.gmail.com>
Date: Thu, 23 Aug 2007 10:40:42 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: package.bbclass: don't add self to recommends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 08:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, does this look about right?

--- classes/package.bbclass	a4793b3e861b8e79ae72fd8fb897b01aff983b38
+++ classes/package.bbclass	95993d7a94c96ec0b687e66d4ac193342e4ed901
@@ -848,7 +848,7 @@ python package_depchains() {

 		for depend in rdepends:
 			pkgname = getname(depend, suffix)
-			if not pkgname in rreclist and packaged(pkgname, d):
+			if pkgname != pkg and not pkgname in rreclist and packaged(pkgname, d):
 				rreclist.append(pkgname)

 		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))

cheers
Philipp


