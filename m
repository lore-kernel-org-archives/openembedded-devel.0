Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QLszF-0008IN-Kh
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 10:17:09 +0200
Received: (qmail 4385 invoked from network); 16 May 2011 10:14:19 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 16 May 2011 10:14:19 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id TfA9zUPg1mTi
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 10:14:07 +0200 (CEST)
Received: (Qmail 4337 invoked from network); 16 May 2011 10:14:06 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 16 May 2011 08:14:06 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QLswI-0006nE-Qb; Mon, 16 May 2011 10:14:06 +0200
Date: Mon, 16 May 2011 10:14:06 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110516081406.GA24971@mi.fu-berlin.de>
References: <E1QLsrb-0003on-41@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1QLsrb-0003on-41@melo.openembedded.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stefan Schmidt : llvm2.7_2.7: Add patch for build	errors on newer gcc / glibc combinations
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
X-List-Received-Date: Mon, 16 May 2011 08:17:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 16, 2011 at 08:09:15AM +0000, git version control wrote:
> +Index: llvm-2.7/include/llvm/ADT/SmallVector.h
> +===================================================================
> +--- llvm-2.7.orig/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:09.000000000 +0200
> ++++ llvm-2.7/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:25.000000000 +0200
> +@@ -19,6 +19,7 @@
> + #include <cassert>
> + #include <cstring>
> + #include <memory>
> ++#include <stddef.h>
> + 

Please use #include <cstddef> we are in c++ code here.

Bye Henning


