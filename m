Received: from [64.233.162.238] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IOdxK-0003KB-KM
	for Openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2007 20:32:29 +0200
Received: by nz-out-0506.google.com with SMTP id j2so569613nzf
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2007 11:31:08 -0700 (PDT)
Received: by 10.114.127.1 with SMTP id z1mr1705290wac.1187980267283;
	Fri, 24 Aug 2007 11:31:07 -0700 (PDT)
Received: by 10.115.73.16 with HTTP; Fri, 24 Aug 2007 11:31:07 -0700 (PDT)
Message-ID: <19c1b8a90708241131u63b66f97w4eb7e65e9a6cb7e@mail.gmail.com>
Date: Fri, 24 Aug 2007 11:31:07 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Commit 6951a4bf0c57a677b8f2cdf1144402fe1358e3e1
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
X-List-Received-Date: Fri, 24 Aug 2007 18:32:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

The commit here
http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-August/007999.html

should have been made conditional.

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "glibc-initial"

should be

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"

It can be overwritten for other libcs e.g. eglibc when selected would
have eglibc-initial

Thanks

-Khem


