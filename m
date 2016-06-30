Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B61F86FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 15:08:36 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id j2so95719981qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=OJSwsg9Micgcwn27MM0kCs2t6omuPS50EI4Kf/W8vI8=;
	b=Ez24/2HocMxnBH++57dKY+Sw2t8MR++odVv4wntOgZvCMXqDe83hcI0Ct8UJ1al+H4
	3mzPotnrzrQYu9dPPARYpfoapZIVO8vDR8S7F+/lHZRXc0AcefxzrzA8N5OAmNE2fRYl
	2EaqkkUQskttYvsiF327nFJ46bWhTy8Vt9vayqAGVZyNuqtACpocwbBVdTm6Hv+aTNYl
	JwDQz/+Umrd/PnQrTasNrzuW79mQUPhuvLChlWw5Lj8IRPWDRYRRZET+4b3HC5dUjMNH
	i/ZNsbrwtPmGRAlLsfNI1e6eioIbbfyXzN5uuk7pzB3drQJHwXqr6ISaLxQHBmRNlOjD
	FA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=OJSwsg9Micgcwn27MM0kCs2t6omuPS50EI4Kf/W8vI8=;
	b=eOKSjrP9Cv0H4zD4Izrxs/oRBVOz5E3y11PJCw8uXZMfmCnatEYOQIh8B9ROnBAZOC
	u+qvJ5HuhXjMjjERiwbMdyR3g3oasBwLpKulaDylLfYZ4+asbcBn+O7m/sr5awenI9+w
	x9hdcC6RvjJloDw3wckumcFl+o/cOhaUIJNLkmqU4lIfe17VNLUD5wewUgFOLB0yf5PB
	NND5hgpQwm7pUdfQwnQ/LfdVXxKZsTA8XLsLL1J0uzQjTnBjpQA2IYMTUJlY7t86zpwU
	fKjUCkZJ2WG/m/xtZcANfdoBqYdqZWO/msd1gX2iM4j1OAQ5q+9aAuJJsNpVGgvyLhZr
	KCvg==
X-Gm-Message-State: ALyK8tLpPdclR5M5Mwp2w6MeFRKjCiQFkYuUOTcLP0QIc7dhyOds+n0066ioOm8ArFLxVA==
X-Received: by 10.55.204.213 with SMTP id n82mr20520796qkl.40.1467299316633;
	Thu, 30 Jun 2016 08:08:36 -0700 (PDT)
Received: from localhost ([179.105.243.72]) by smtp.gmail.com with ESMTPSA id
	a195sm1780905qkc.24.2016.06.30.08.08.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 08:08:35 -0700 (PDT)
Message-ID: <577535f3.cc66370a.e9738.ffff9a3c@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 30 Jun 2016 12:08:29 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 30 Jun 2016 12:08:29 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.8
Subject: Updates to meta-java (master) in 2016-06-30
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
X-List-Received-Date: Thu, 30 Jun 2016 15:08:37 -0000

Hello,

I pushed following updates:

commit 33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (HEAD -> pending, yocto/master-next, yocto/master, m/master, m/krogoth)
Author: Daniel McGregor <daniel.mcgregor@vecima.com>
Date:   Wed Jun 22 10:38:45 2016 -0600

    openjdk-8: make GCC6 happy
    
    GCC 6 sets the default C++ standard to C++14 and introduces dead store
    elimination by default. OpenJDK 8 is not ready for either of these
    changes, so set the C++ standard back to gnu++98 and disable dead
    store elimination.
    
    Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
    patch fixes building when using those flags, and are needed to get
    CFLAGS into the JDK build in the native case.
    
    Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 6483010d92be7f6e1e0a268d1ca4b5fc4353c70e
Author: Daniel McGregor <daniel.mcgregor@vecima.com>
Date:   Tue Jun 21 15:07:07 2016 -0600

    icedtea7-native: make GCC 6 happy
    
    GCC 6 sets the default C++ standard to C++14 and introduces dead store
    elimination by default. icedtea7 is not ready for either of these
    changes, so just set the C++ standard back to gnu++98 and disable dead
    store elimination.
    
    Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
    Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 8ee871a86a9999a2272d103855033da4685165d8
Author: Bernhard Dick <bernhard@bdick.de>
Date:   Wed Jun 29 15:20:40 2016 +0200

    openjdk-8: Add update version and build number to the java binaries
    
    The OpenJDK builds did not include the update version and build number
    leading to problems when applications check for the minimum needed version.
    This commit fixes it by adding the update version and build number to the
    configure parameters.
    
    Signed-off-by: Bernhard Dick <bernhard@bdick.de>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

