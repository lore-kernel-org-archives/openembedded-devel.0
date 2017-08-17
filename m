Return-Path: <idealsim@laposte.net>
X-Greylist: delayed 1439 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Aug 2017 17:45:15 UTC
Received: from smtp.laposte.net (smtpoutz298.laposte.net [178.22.154.198])
	by mail.openembedded.org (Postfix) with ESMTP id 9874778485
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 17:45:15 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout010 (Postfix) with ESMTP id 1852345D631
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1502990477; bh=Mp1UE5XR0qrTfauOQ/cgGQwJk/hUfGoR/b3/z3e9+uE=;
	h=Subject:References:To:From:Date:In-Reply-To;
	b=Dk78tzlf2pv0IEeRYScK9jUa/hppRKh4eyTh4+Zl8aFUWN2D0ZABzDT37j42FEPr/
	/NtzeHEFYx/EkPyDzJaoOYDb22ZywOErjyF6FtzHX7e7Mo6hkaao7d2Fo8QaNpOPRd
	pVngmK0W/nDdxi4Z7XF8lQr6/bosD7BTT6DGaDS16FUVNGeu9/mISSx8IJcvBX5xb4
	aNIsSbA6iBz6yRpNwzrcnB4gTPzYbo/E8xpLSJzWhxtJkofmtNJOQwVwQKjJcHGIEE
	wyRRpQfIoQsDgKlD5Yr32mQHQlWekV15znJC3Vff+sNDyObC7rAS2Yclq0nu8oX0+n
	cFqUcyGwHIKIQ==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout010 (Postfix) with ESMTP id 08E1C45D705
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:21:17 +0200 (CEST)
Received: from lpn-prd-vrin001 (lpn-prd-vrin001.prosodie [10.128.63.2])
	by lpn-prd-vrout010 (Postfix) with ESMTP id 02E6445D631
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:21:17 +0200 (CEST)
Received: from lpn-prd-vrin001 (localhost [127.0.0.1])
	by lpn-prd-vrin001 (Postfix) with ESMTP id E7EA236AEF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:21:16 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-262-25.w2-13.abo.wanadoo.fr
	[2.13.73.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin001 (Postfix) with ESMTPSA id A92BE36AE7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:21:16 +0200 (CEST)
References: <5d54504c-db22-0e0e-6a50-86a01702baac@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: idealsim <idealsim@laposte.net>
X-Forwarded-Message-Id: <5d54504c-db22-0e0e-6a50-86a01702baac@gmail.com>
Message-ID: <1679d779-cb3d-36cb-5ea3-808a04326609@laposte.net>
Date: Thu, 17 Aug 2017 19:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5d54504c-db22-0e0e-6a50-86a01702baac@gmail.com>
X-VR-SrcIP: 2.13.73.25
X-VR-FullState: 0
X-VR-Score: 0
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddtuddguddutdcutefuodetggdotefrodftvfcurfhr
X-VR-Cause-2: ohhfihhlvgemucfntefrqffuvffgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepufhfvffh
X-VR-Cause-3: kffffgggjggtsegrtderredtfeejnecuhfhrohhmpehiuggvrghlshhimhcuoehiuggvrghlshhimhes
X-VR-Cause-4: lhgrphhoshhtvgdrnhgvtheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfk
X-VR-Cause-5: phepvddrudefrdejfedrvdehnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghloheplgdu
X-VR-Cause-6: ledvrdduieekrddurddulegnpdhinhgvthepvddrudefrdejfedrvdehpdhmrghilhhfrhhomhepihgu
X-VR-Cause-7: vggrlhhsihhmsehlrghpohhsthgvrdhnvghtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgu
X-VR-Cause-8: vghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [php]backport request pyro branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 17:45:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, in pyro to build php we need this backport (pointed by Khem Ra, see 
under) :

http://git.openembedded.org/meta-openembedded/commit/?id=6cd249225ecdd0a4592afe1844541378acae6cea

regards,

Mickaël

-------- Message transféré --------
Sujet : 	Re: [yocto] [php7] packageconfig apache2 error
Date : 	Thu, 17 Aug 2017 08:32:01 -0700
De : 	Khem Raj <raj.khem@gmail.com>
Organisation : 	HIMVIS LLC
Pour : 	idealsim <idealsim@laposte.net>, Yocto list discussion 
<yocto@yoctoproject.org>



On 8/17/17 1:55 AM, idealsim wrote:
> Hi i would like to add modphp to my image (pyro branch). For this i add
> this to my local.conf :
>
> PACKAGECONFIG_append_pn-php = "apache2 pam"
> IMAGE_INSTALL_append = "\
> apache2 \
> php \
> php-cli \
> "
>
> But during the build of php (7.1.0 by default in pyro) i have this error
> during install :
>
> /|
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/php-7.1.0/build/shtool
> install -c ext/phar/phar.phar
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/bin//
> //|   page: php-config.1//
> //| ln -s -f phar.phar
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/bin/phar//
> //| Installing PDO headers:
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/include/php/ext/pdo///
> //| //
> //| Notice: unserialize(): Error at offset 394 of 2427 bytes in
> phar:///media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/build/pear/install-pear-nozlib.phar/PEAR/Config.php
> on line 1080//
> //| ERROR: One of /home/modjo/.pearrc or
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/recipe-sysroot-native/usr/bin/../../etc//pear.conf
> is corrupt, please remove them and try againInstalling header
> files:
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/image/usr/include/php///
> //| install: cannot stat 'libs/libphp5.so': No such file or directory//
> //| WARNING: exit code 1 from a shell command.//
> //| ERROR: Function failed: do_install (log file is located at
> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/7.1.0-r0/temp/log.do_install.31439)//
> //ERROR: Task
> (/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_install)
> failed with exit code '1'//
> //NOTE: Tasks Summary: Attempted 1283 tasks of which 1276 didn't need to
> be rerun and 1 failed./
>
> To resolve this i change this line (in php.inc) :
>
> /Line 179 install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules/
>
> by this one :
>
> /Line 179 install -m 755  libs/libphp7.so ${D}${libdir}/apache2/modules
>
> /Perhaps this recipe need a patch ?

yes. Backport
http://git.openembedded.org/meta-openembedded/commit/?id=6cd249225ecdd0a4592afe1844541378acae6cea

to pyro meta-openembedded repo.

Also send a backport request to openembedded-devel mailing list so that
the pyro maintainer for meta-openembedded notices it.
>
> Modjo
>


