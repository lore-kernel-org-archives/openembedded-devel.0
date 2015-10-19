Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id E983277129
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:13:31 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so49512784qgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 05:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=CieqsdInmRFSoj3Gl7vIQGSy39d38X0qzKDhtkXjOCg=;
	b=XSMD3/SrOlWCD4GILYGupNNQBEPVzWzr7lVNFGeX4dR5bJg1tnZ9a7R77xw8k3FgAZ
	71rxE8IrB3B+HTA7rxvnkJQKwcl/4IkstUCQrOTOsv8zB7i33CZxesNQNbFmwHI3VcDu
	lF8ywlfZduIDgoca+rl4FgSU/wC69nsC01fv5VG6JA4qz7h1LphOZbXn3W7uOM/Rd8Qq
	DR3RwULHgipf8Tv+DwWmb9wp8qtqMNGhS4A2mjozva3pVUxcM4KPWxKjrH5xi1KaZCfh
	Fma1kVb9ArQ/ZdHYQ58/RhIed4JZLEdQHYDVOMj7lboQt1mLk1fqgG9PnV7w6fB9hnx1
	rK+g==
X-Received: by 10.140.237.209 with SMTP id i200mr36555123qhc.92.1445256812068; 
	Mon, 19 Oct 2015 05:13:32 -0700 (PDT)
Received: from localhost ([177.194.195.186])
	by smtp.gmail.com with ESMTPSA id m73sm2358638qkl.6.2015.10.19.05.13.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 05:13:31 -0700 (PDT)
Message-ID: <5624de6b.ccc9370a.6d22.ffff90a3@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 19 Oct 2015 10:13:26 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 19 Oct 2015 10:13:26 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-19
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 12:13:34 -0000

Hello,

I pushed following updates:

commit 38f4c1365c11c0c369e297ec53591439be589fb0 (HEAD -> pending, yocto/master, m/master)
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Fri Oct 16 19:31:09 2015 +0200

    openjdk7: remove broken/unsupported VM's
    
    Since Shark is utterly broken and cacao and jamvm are terrible slow compared
    to zero, it's pointless to support them for targets with limited resources
    unless there is active maintainership taken by responsible person.
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 63a37fad0c8a049788765babe10f6934e76c44f4
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Fri Oct 16 19:30:32 2015 +0200

    icedtea7: allow modern Linux being used, either
    
    Since Yocto Project has a reasonable definition of supported build hosts, we
    shouldn't restrict to e.g. pre 4.x kernels as icedtea7 expects.
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 2dcff5266a6c1ed39e49b24b8d2984a165ad9c35
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Fri Oct 16 19:29:38 2015 +0200

    openjdk-6: remove
    
    Since OpenJDK-6 is not maintained anymore, it's more reasonable to move to OpenJDK-8 instead
    of sticking at unmaintained, upstream not supported VM version.
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

