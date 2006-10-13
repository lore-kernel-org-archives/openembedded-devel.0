Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GYQLt-0007xZ-4d
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 18:57:41 +0200
Received: by py-out-1112.google.com with SMTP id i75so1105893pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 09:51:12 -0700 (PDT)
Received: by 10.35.103.1 with SMTP id f1mr6049428pym;
	Fri, 13 Oct 2006 09:51:11 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id 36sm664913nza.2006.10.13.09.51.10;
	Fri, 13 Oct 2006 09:51:10 -0700 (PDT)
Date: Fri, 13 Oct 2006 19:51:07 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <698474498.20061013195107@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 16:57:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Following the waves of cleanups happening this week, I'd like to
propose to rename handhelds-pxa-2.6*.bb which are recipes to build
kernels from Handhelds.org CVS tree. Reasons are:

1. There's a (newer) convention to have generic package name, i.e.
"linux" in name of kernel recipes.
2. "pxa" there is misleading, as 2.6 tree supports different
architectures. Handhelds.org tree as of now supports PXA, SA, and S3
(Samsung) devices. To the various degrees, but that's improving.

  So, I propose to rename the recipes in question to start with
"linux-handhelds-2.6" ("2.6" is stil important as there's 2.4 tree and
HH.org too).

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



