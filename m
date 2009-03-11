Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LhRq6-0007xW-Rv
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 18:03:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 44B0750277D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 14:01:32 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb5t8vw2vHsK
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 14:01:27 -0300 (BRT)
Received: from [192.168.15.100] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 9DFF6502762C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 14:01:27 -0300 (BRT)
From: Jader <jader@2mi.com.br>
To: Open Embedded <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Mar 2009 13:56:46 -0300
Message-Id: <1236790606.14496.4.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: tinylogin not found
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
X-List-Received-Date: Wed, 11 Mar 2009 17:03:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello.
I'm trying to compile minimal-image but I've got a tinylogin error.
It seems tinylogin is deprecated, http://tinylogin.busybox.net/
redirects to http://bugs.busybox.net/

How can I disable it from build?

Task output below:

NOTE: Running task 379 of 801 (ID:
210, /home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb,
do_fetch)
DEBUG:
Parsing /home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb
(full)
DEBUG: BB /home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb:
handle(data)
DEBUG: update_data()
DEBUG: update_data()
NOTE: package tinylogin-1.4: started
DEBUG: Executing task do_fetch
DEBUG: update_data()
NOTE: package tinylogin-1.4-r6: task do_fetch: started
DEBUG: mkdirhier(/home/vo/oe/build/source)
DEBUG: mkdirhier(/home/vo/oe/build/source)
DEBUG: update_data()
DEBUG: update_data()
NOTE: fetch http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
DEBUG: executing /usr/bin/env wget -t 5 --passive-ftp
--no-check-certificate -P /home/vo/oe/build/source
http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
--2009-03-11 13:26:48--
http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
Resolving tinylogin.busybox.net... 140.211.167.224
Connecting to tinylogin.busybox.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2
[following]
--2009-03-11 13:27:22--
https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2
Resolving bugs.busybox.net... 140.211.167.224
Connecting to bugs.busybox.net|140.211.167.224|:443... connected.
WARNING: cannot verify bugs.busybox.net's certificate, issued by
`/C=US/ST=OR/O=OSU Open Source Lab/CN=OSU Open Source Lab
CA/emailAddress=dnsadmin@osuosl.org':
  Unable to locally verify the issuer's authority.
HTTP request sent, awaiting response... 404 Not Found
2009-03-11 13:27:32 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed:
http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
NOTE: package tinylogin-1.4-r6: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package tinylogin-1.4: failed
ERROR: Build
of /home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb do_fetch
failed
ERROR: Task 210
(/home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb, do_fetch)
failed
NOTE: Tasks Summary: Attempted 378 tasks of which 378 didn't need to be
rerun and 1 failed.
ERROR: '/home/vo/oe/openembedded/packages/tinylogin/tinylogin_1.4.bb'
failed
NOTE: build 200903111325: completed




