Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id C170373A05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 13:45:17 +0000 (UTC)
Received: by qgea108 with SMTP id a108so9925267qge.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=cOk6617VF9kWusrXsPMyqEo4jREMNATj0t9yLlkloQU=;
	b=GAfIvOEfSlD+828gvBTN5ieUU5tL2gwMk6jHM+9jNrwY1eFIJUZ6FgA9caK63Er6HB
	d9YEyC/bdymJvK+9BHvup0bsX7svVi+LvU1frIDsCxJ6zhZMNROgyIOtcCMtgvY8wElL
	1ynHIk/8VNTVPz0bKlq4rBXgsC9ZyfGuRSdPfrG8PMf4D77VKbMdE3dIGz/pzxfIW8OK
	MYKnIS5QvrQ3U0ecxHWBNuF6UAT/xv9S6pbaVZ/8NsaDFVboqqkf28y/uPA/6FXGxNON
	U/s+dk2zujXlCWUxDy1eqvcGLMvtQBh1vlZTA8yCAqyOfpYIMT58LIFNlLDn+HC2BXFN
	7PvQ==
X-Received: by 10.55.52.146 with SMTP id b140mr75063001qka.43.1426081518345;
	Wed, 11 Mar 2015 06:45:18 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	q193sm2570667qha.14.2015.03.11.06.45.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 06:45:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 50B121CD1A507; Wed, 11 Mar 2015 10:45:14 -0300 (BRT)
Date: Wed, 11 Mar 2015 10:45:14 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150311134514.50B121CD1A507@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-03-11
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
X-List-Received-Date: Wed, 11 Mar 2015 13:45:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit e977e9317f854be38c23fc72ffa2b250bca1cc3f (HEAD, origin/master, origin/HEAD, pending)
Author: Magnus Olsson <magnus@minimum.se>
Date:   Wed Mar 11 08:47:55 2015 +0100

    openjdk-7-jre: RDEPENDS openjdk-7-common
    
    -jre binaries such as keytool, policytool and more requires libjli.so
    so ensure there's a RDEPEND that provides it.
    
    Same goes for openjdk-7-java (java binary FILERDEPENDS libjli.so).
    
    Both of these already DEPENDS -common, so the build was not broken before
    but this patch will also silence the QA file-rdeps issue.
    
    Signed-off-by: Magnus Olsson <magnus@minimum.se>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 1b6a492c6e04673864204bcbeb14215c1b462e7d
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 10 18:10:21 2015 -0300

    rxtx: add patch to support i.MX serial ports
    
    Support for /dev/ttymxc* devices.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a3ede8721f19af849c6a23e3f8e60485ef9f30df
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 10 18:10:20 2015 -0300

    rxtx: update to the latest Debian patchset
    
    Update the recipe to apply all patches available from
    git://anonscm.debian.org/pkg-java/rxtx.git as of
    a4cd13e04254cea7842df2e30e9d12e9765a3ef9.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit bd9c60238c4c62d9a0f2d60b89aef429a1b71e34
Author: Magnus Olsson <magnus@minimum.se>
Date:   Tue Mar 10 13:19:54 2015 +0100

    initials: silence "populate_sysroot manifest not found" warnings
    
    A number of recipes in meta-java use autotools.bbclass for building; internally
    it uses the sstate-control populate_sysroot manifests to locate and copy
    aslocals for configure dependencies as part of the do_configure step.
    The manifest path differs depending on if it's a native package or not so
    autotools.bbclass looks at the package name to determine if its native or not
    (it's native if it ends with "-native").
    
    The warnings are emitted because a few (native) recipes in meta-java (such as
    cacao-initial, classpath-initial and more) are incorrectly being classified as
    non-native by autotools.bbclass, which makes it look for the manifest in the
    wrong place and finally gives up with the warning:
    
    WARNING: /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot not found
    
    This happens for cacao-initial, classpath-initial, ecj-initial, libecj-boostrap,
    jamvm-initial and jikes-initial since they are all native and rely on autotools.
    
    This patch renames the recipes so they end with -native, e.g ecj-initial-native.
    It also updates the recipes so they DEPEND on the corresponding new name. This
    helps autotools.bbclass to properly classify the recipes are native and silence
    the warnings.
    
    Signed-off-by: Magnus Olsson <magnus@minimum.se>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

