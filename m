Received: from [64.233.162.238] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HXCqM-000073-8n
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Mar 2007 10:52:22 +0200
Received: by nz-out-0506.google.com with SMTP id m22so326773nzf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2007 01:52:21 -0700 (PDT)
Received: by 10.65.151.6 with SMTP id d6mr3515005qbo.1175244741280;
	Fri, 30 Mar 2007 01:52:21 -0700 (PDT)
Received: from cube ( [77.123.185.1])
	by mx.google.com with ESMTP id 40sm2587188nzf.2007.03.30.01.52.20;
	Fri, 30 Mar 2007 01:52:21 -0700 (PDT)
Date: Fri, 30 Mar 2007 11:52:22 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <18310385162.20070330115222@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Solving ipkg-utils issues
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
X-List-Received-Date: Fri, 30 Mar 2007 08:52:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  For quite some time bugs in ipkg-utils package (mostly in
ipkg-make-index tool) plagued image creation process in OE. Many of
them are known to old-time developers, and being (manually) worked
around. I was working on resolving them for some time, and guess now
finally have both clear picture of the issues and their interaction
with each other, and fixes for them. So, I would like to push these
fixes to mainline, and am opening this thread for review of
them, as well as to collect any other concerns about ipkg-utils.

  In my list, there're 3 major issues:

1. Broken version comparison logic in ipkg-utils (note that this is
exactly ipkg-utils issues, nether bitbake nor ipkg is affected).

2. Inability of ipkg-make-index to detect packages which were updated,
while version stays the same.

3. Performance issues.


  Patch for p.1 is here: http://bugs.openembedded.org/show_bug.cgi?id=2061

  

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



