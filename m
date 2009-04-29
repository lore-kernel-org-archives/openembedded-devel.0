Received: from [195.160.190.3] (helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1Lz8qK-0004yz-Ti
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 14:24:52 +0200
Received: from acn.212.98.42.40.adslpremium.ch (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id D5AD93706D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 14:19:37 +0200 (CEST)
Received: from cruiser.hq.acn-group.ch ([172.16.145.92] helo=localhost)
	by van.hq.acn-group.ch with esmtp (Exim 3.36 #1 (Debian))
	id 1Lz8l7-00054N-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 14:19:30 +0200
Received: from localhost ([127.0.0.1]) by localhost with esmtp (Exim 4.63)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1Lz8o6-0004Eu-TR
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 14:22:34 +0200
Message-ID: <49F8468A.7060305@acn-group.ch>
Date: Wed, 29 Apr 2009 14:22:34 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
Organization: ACN S.A.
User-Agent: Icedove 1.5.0.14eol (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: do_rootfs : (offline root mode: not running openntpd.postinst)
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
X-List-Received-Date: Wed, 29 Apr 2009 12:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm facing a problem with the openntpd recipe (version 3.9p1). When I select 
this recipe to be build in my image it builds correctly and is present on my 
jffs2 image file which is great. But then it won't run on the target because 
openntpd requires a special user to be created and it is not. (as stated in the 
recipe by the build configuration this user should be named "ntpd").

By checking the recipe I saw that pkg_postinst is defined and should create the 
user in the passwd file after the package has been installed. So far so good. 
But then I realized that this function was never called when the do_rootfs is 
done for my image file.

It seems that when the packages are installed in the rootfs directory 
(do_rootfs) all the pkg_postinst functions of the recipes are skipped with the 
following message :

(offline root mode: not running base-passwd.postinst)
(offline root mode: not running busybox.postinst)
(offline root mode: not running dropbear.postinst)
[stripped]
(offline root mode: not running openntpd.postinst)
etc...

I guess that this a feature and not a bug but I'd like to understand why these 
functions are not called ?

Of course I can modify the recipe so it will change my passwd file during 
install or add some initialization script to check that this user is created 
before ntpd runs but I'm more curious about why we skip all the postinst scripts.

Thanks for any comments,

Christophe










