Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB8F770EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:45:50 +0000 (UTC)
Received: by qgt47 with SMTP id 47so70926350qgt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=YYz29A4a5HHZfC69JuUm7jGQCh9pSHqasIRxAjOUxYY=;
	b=B0A/30BTlGXKGfNHr7J5yVSZ4WJh5BCNAt3rihH39sAnqagQksR9d/FdCW+FDGFH7N
	Jk/hM/cmB3Hyu6piEJXt2+Dq0FomSFx6427f46sNFPQNuQ5kMaIjrBMzHkIz/TH4g5pZ
	+udNHaIYtTzdf2A7zcE5/PLiyTWtAFTW/hQx9Ph/clV3TI5nlOalKBvpVdFADHE1Enk5
	e+AEw8o9/jElLar2/jpshw2TKpkwgE+CumN28dnY8V3obVVLvrX6Ex3BnXuz/BnAXqbl
	tJgXNq4elltwqBEYIS6QcwX4pAPXwHqhHfjXYclYWU7Oj52MmwLiVWx/pv8UofiYSJrR
	Pd7w==
X-Received: by 10.140.34.83 with SMTP id k77mr6621978qgk.23.1444916751100;
	Thu, 15 Oct 2015 06:45:51 -0700 (PDT)
Received: from localhost ([177.194.195.186]) by smtp.gmail.com with ESMTPSA id
	s19sm5478529qgd.27.2015.10.15.06.45.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 06:45:50 -0700 (PDT)
Message-ID: <561fae0e.13588c0a.315af.ffffad15@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 15 Oct 2015 10:45:43 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 15 Oct 2015 10:45:43 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-15
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
X-List-Received-Date: Thu, 15 Oct 2015 13:45:55 -0000

Hello,

I pushed following updates:

commit 573c9b4e706467fe974a026dbbc5309e66071edd (HEAD -> pending, yocto/master, m/master)
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Thu Oct 15 13:54:41 2015 +0200

    openjdk: Avoid extra-noise because of self-satisfying dependency
    
    I realized one small issue last days: the dependency of openjdk-*-demos on java2-vm, which is
    provided by the current recipe (eg. openjdk-7) causes bitbake scan for alternatives (eg. java2-vm
    provided by openjdk-6) without any need.
    
    I would recommend to remove such a generic dependency:
    * openjdk-6-demos require openjdk-6-jre, period.
    * openjdk-7-demos require openjdk-7-jre, period.
    * openjdk-8-demos require openjdk-8-jre, period.
    
    There is no sense in satisfying openjdk-8-demos with openjdk-6-jre (even if it might be possible).
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit fd9529fb70fb9621e2563427e1ba7b8a504b6fd0
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Thu Oct 15 13:54:04 2015 +0200

    meta-java: avoid garbadge files making noise when gitting around :)
    
    Adding a .gitignore file ignoring the typical noise when applying patches,
    working with common editors and so on. Based on .gitignore of meta-openembedded.
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit b331dec1d8c18e48b39b3c9e5d0c547e066f1d15
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Thu Oct 15 13:52:09 2015 +0200

    icedtea7-native: compiling without x11
    
    Allow building icedtea7 without any X11 dependency.
    
    This affects the native part only which is required to bootstrap openjdk-8-native
    for cross-compiling openjdk-8, but should be adoptable for cross-compiled recipe
    as well as for openjdk-6.
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

