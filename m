Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7464773D17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 22:00:21 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so120413445wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type; bh=68tWCEwMdxPbytL1P+qkWECUFBOzXnajSI2iIbD0SMY=;
	b=K3Gyi8466Tu4e0761kn1Sr7hl0xMBUKJrBqCqjYL3MnY7ONKGM0phJM7magG8cBHfd
	3ypxmJ4pFIJba5xaegfzxcVaBNWmLxY2FXuqGD2vF/+nCgd4nxrOkyyTcIgUZIFyz7uf
	PYNRKzUvKQSz/mXl6qlsoVK9rdnk6bvo2pudRaESSF5vtFCg64Qfq1p+MswBxLku4kpB
	a/0G8a7zDvQsX6Lt8Ymiyiig0okLD8eAwwT2huOwPnXhRMS6z8dERrfUORNMem3nhKBA
	TETQnDkK8dIe+KUut2yocNSc6VEzK4XlcsuGkLfmsFTDlV0awbkY7CbpVdtywvqBTaqi
	xLkw==
X-Received: by 10.180.105.98 with SMTP id gl2mr48681040wib.56.1439935221483;
	Tue, 18 Aug 2015 15:00:21 -0700 (PDT)
Received: from localhost (83-244-151-247.cust-83.exponential-e.net.
	[83.244.151.247])
	by smtp.gmail.com with ESMTPSA id j2sm28177519wjq.5.2015.08.18.15.00.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 15:00:18 -0700 (PDT)
Message-ID: <55d3aaf2.a239c20a.4c413.5596@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 18 Aug 2015 19:00:14 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 18 Aug 2015 19:00:14 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.4
MIME-Version: 1.0
Subject: Updates to meta-java (master) in 2015-08-18
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
X-List-Received-Date: Tue, 18 Aug 2015 22:00:24 -0000
Content-Type: text/plain; charset=US-ASCII

Hello,

I pushed following updates:

commit 3e5d59227c1370ca7ec5c5eb62af431699cd855c (HEAD -> pending, yocto/master, m/master)
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Aug 18 17:14:31 2015 -0300

    rxtx: drop dependency on fastjar-native; depend on virtual/javac-native
    
    fastjar-native must be provided by either virtual/javac-native itself
    or by a recipe virtual/javac-native depends on.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 24b98ac3a6ca7fadfba24709aac8d0b71316e299
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Aug 18 17:14:30 2015 -0300

    Avoid parse time errors due to dependency on x11, for distros without x11
    
    BitBake raises some errors when processing recipes that depend on x11
    for distros that don't have x11 in DISTRO_FEATURES. To work around
    that issue, REQUIRED_DISTRO_FEATURES = "x11" (from
    distro_features_check.bbclass) has been set for the following recipes:
    
    * cacao
    * classpath
    * jamvm
    * openjdk-6-release
    * openjdk-7-release
    
    That makes BitBake skip those recipes during the cache generation
    (they'd still be parsed, but ignored).
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 15ed9662e26ed4ac8d843fb9d2335a49a9c03088
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Aug 18 17:14:29 2015 -0300

    Don't depend on a hardcoded compiler
    
    The recipes below depended on a hardcoded native compile
    (ecj-initial-native).  Since we may use another native compiler to
    build them, we set the dependency in virtual/javac-native instead.
    
    * cacao
    * classpath-native
    * jamvm
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 5cdef85d4a3e06c0ce680a3bb115f4f060adc949
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Mon Aug 17 09:32:24 2015 +0200

    openjdk-7: remove IcedTea 2.5.4, OpenJDK 7u75b13
    
    OpenJDK 7 was previously updated to IcedTea 2.6.1, 7u85b01. Therefore
    the old version is removed now.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit fb083e7988460eba5d38a2f0eac21cf6114518ae
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Mon Aug 17 09:32:23 2015 +0200

    README: Update PREFERRED_VERSION to new openjdk-7 85b01-2.6.1
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 8fd9f955fced22983455c71e4a938a8a5492a297
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Aug 12 17:03:57 2015 +0200

    openjdk-7: Add IcedTea 2.6.1 OpenJDK 7u85b01
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 4672287555f730e21a9abf92aeb9607cc9f3b37d
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Aug 12 17:03:56 2015 +0200

    openjdk-7-common.inc: bump PR to 6
    
    Increment the PR of openjdk-7-common.inc due to the previous changes.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit bf72b4def141b46fc9b7b219cab28cd907bdf713
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Aug 12 17:03:55 2015 +0200

    openjdk-7-common: fix FILES_openjdk-7-jre_append
    
    Use the PN variable instead of the hardcoded "openjdk-7-jre" string.
    Furthermore fix the indentation of its content.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit b3cb5cbead26689e6328ff7f5035f19cba3030b6
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Aug 12 17:03:54 2015 +0200

    openjdk-7: move "--disable-pulse-java" from common to 75b13 only
    
    The "--disable-pulse-java" configuration is no longer available in
    IcedTea 2.6.1, therefore move it to the 2.5.4 (75b13) version only.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit e07c4666d008f2ec0c0dcfe28f9ea5c7d649f0fe
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Aug 12 17:03:53 2015 +0200

    openjdk-7-common: explicitely disable PCSC and SCTP
    
    PCSC default value was changed to true and SCTP was added during the 2.6.0
    IcedTea release so disable them both explicitely in openjdk-7-common.inc
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

