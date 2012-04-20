Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SLDIK-0004Di-Ra
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 14:50:36 +0200
Received: by bkcjk7 with SMTP id jk7so1210257bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=DR0CQvOJH02mO9uE9oh27CyXdxdSmXoWXIQh8y2DP+w=;
	b=vDmxrYHCR3XBvg88T4t0CqA4XcY6EC138faJHR7ZGy1xMfOhMfMDaNiGcYYX57JC45
	kJEIvXLJwxo4XTr0pghf49p1mnUgv3gku0nEoLOZLjUuOhIGt4tUyMUnyOr8iKQQOj4a
	NAmDr3og5aAiOsxsrmmZpUz3Fn+L5SdePLIaPRHael4/rHiV7kQxK+l2vysWx5wEHNy3
	mDN+3Rw7TcyfvsuGgk3Mqf1/hUpYKKAW92rN2b4s9Zb9pMZiuM6IFexZ4mcEgDa0/dYN
	xEg2vK9IBzC9+lw59oosG/ozQvvluJV9DS0B6T9NPirGNWKT6GCIkWLDzRVUCH3Fcau3
	j+QA==
Received: by 10.205.138.9 with SMTP id iq9mr1854780bkc.139.1334925667175;
	Fri, 20 Apr 2012 05:41:07 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id f11sm9834418bkw.6.2012.04.20.05.41.04
	(version=SSLv3 cipher=OTHER); Fri, 20 Apr 2012 05:41:05 -0700 (PDT)
Message-ID: <4F9158F3.8000702@gmail.com>
Date: Fri, 20 Apr 2012 14:39:15 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problems building parts of python using openembedded
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
X-List-Received-Date: Fri, 20 Apr 2012 12:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

I'm using OE to build for OMAP4, when compiling python, OE reports
success, however only the core python seems to be built successfully.
Looking at the log files however, we see a lot of ld errors, when it
tries to link to x86_64 libraries. As an example, the following is
output with ncurses:

Looking in ncursesw for
['/home/martin/Cisco/openembedded/oe/build/tmp-nimbus_2012_x-eglibc/sysroots/nimbus-panda/usr/lib']

Found
/home/martin/Cisco/openembedded/oe/build/tmp-nimbus_2012_x-eglibc/sysroots/nimbus-panda/usr/lib/libncursesw.so

...
...
/home/martin/Cisco/openembedded/oe/build/tmp-nimbus_2012_x-eglibc/sysroots/x86_64-linux/usr/lib/libncursesw.so.5:
file not recognized: File format not recognized

Any ideas why this happens, and what we can do to fix it?

Best Regards
Martin Ertsaas


