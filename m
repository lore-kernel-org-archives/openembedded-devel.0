Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 014036012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 15:25:37 +0000 (UTC)
Received: by qgec40 with SMTP id c40so115567007qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=TRuYQ4J2y7Z0Dn6oMv8bWgqwZOhhOjhoyf3CdeYGQ1Y=;
	b=rtEgd+QWE/Jaem4l8cVmbasN4LGmfWKVNs+RoNiodXNVewK+si960ugf43nG6pIziZ
	lHbXk/44ydzhOkDOywjKIa4C1SWo3f7Fuo3o6lDksEdWfPof5Q852+kLWiB4aIJU6WpD
	ZO998KdvufuI7gwpCDpzin4aiPKvPkUHpbFK4LLQBxx1qx+1j76gS2qkHfqwpNY/LqTc
	GcXmdQ8fH4Zr7gkkVLz6K+x9+OAjujmzx8rnLjqe0Abjfa/mMvct5NYOC2Wf4r8V46w8
	x/BlpL7mQD5kfmploGbuGxApKPu70KrVeLTqMNvioFpjLAWnUPpBsBS+l2XuRvci9JSh
	0EAw==
X-Received: by 10.140.30.68 with SMTP id c62mr28930410qgc.9.1448292338038;
	Mon, 23 Nov 2015 07:25:38 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	o20sm3117551qki.42.2015.11.23.07.25.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 07:25:36 -0800 (PST)
Message-ID: <56532ff0.14c0370a.7218c.2ca3@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 Nov 2015 13:25:31 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 23 Nov 2015 13:25:31 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master and jethro) in 2015-11-23
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
X-List-Received-Date: Mon, 23 Nov 2015 15:25:39 -0000

Hello,

I pushed following updates:

commit e114d625d4bd23a52cc1108a45d96ffd8dc0ab7f (HEAD -> pending, origin/master, origin/jethro, origin/HEAD)
Author: Fabio Berton <fabio.berton@ossystems.com.br>
Date:   Wed Sep 2 18:25:21 2015 -0300

    firefox: Update to version 38.2.1esr
    
    Update Firefox from 10.0.12esr to 38.2.1esr with the
    following changes:
    
    Add yasm-native, icu, pulseaudio as dependeies of Firefox.
    
    Update Debian patches debian-hacks, fixes, iceweasel-branding, porting and
    prefs from Debian release. This Debian patches can be found here:
    http://anonscm.debian.org/cgit/pkg-mozilla/iceweasel.git
    
    Add patches fix-python-path to fix python path used by mozilla build
    system, and freetype-2-6 to add some missing freetype headers.
    
    Update all languages for 38.2.1esr
    
    Add function do_install_append to install additional files needed by
    firefox.
    
    Set variable PN to match correct files
    
    Create a variable MOZ_APP_BASE_VERSION to append base version to package
    name. The installation path used by firefox is
    /usr/lib/firefox-{MOZ_APP_BASE_VERSION}
    
    Update mozconfig file with settings used by new Firefox.
    
    Series-to: meta-oe
    
    Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 56855bfdebe75e78306687be1ebc84307a38a0e5
Author: Fabio Berton <fabio.berton@ossystems.com.br>
Date:   Wed Sep 2 18:33:43 2015 -0300

    mozilla: Remove unused variables
    
    Change configure, compile and install functions
    
    Mozilla build system has changed compared to old Firefox version 10.
    For more information about new mozilla build system see
    https://developer.mozilla.org/en-US/Firefox
    
    Remove unused variables.
    
    Add SHELL to EXTRA_OEMAKE. Mozilla build system needs pass explicitly
    SHELL variable.
    
    Configure variables needed by mozconfig work properly.
    
    Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a7a470a7705487d3e35451e4b2ea46e7ef5fee35
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Wed Sep 23 16:21:22 2015 -0300

    scripts/firefox-gen-l10n-recipes: Use HTTP to fetch the xpi files
    
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

