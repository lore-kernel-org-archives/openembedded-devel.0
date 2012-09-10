Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB3li-0007nc-0T
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 15:11:14 +0200
Received: from localhost ([127.0.0.1]:58197 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB3ZZ-0001jY-HM
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 12:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=yt9KjdQA8qPUoRMzOlkPkz
	GvkuQ=; b=fGFB1CSHlKyiVJ5dWLbZo1qQsEoIV1CzB3Yg4Qg3H7/bY7d5LZAnbN
	U/0hv2JSi8UxJFZBmGJWOYz4HkC8Am0aXqGfxoHAwxK3rhZrdl6JOcz1legOC/in
	h7vMi74HjA+cvkQpRHEfNs6cYrD7SXFMEHZfCRUO5AWtnxUYlZZbE=
Received: from [195.171.99.130] (port=31985 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB3ZZ-0001jF-Aq
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 12:58:41 +0000
Message-ID: <504DE45C.2010202@communistcode.co.uk>
Date: Mon, 10 Sep 2012 14:00:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 13:11:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

First off:

| automake: warnings are treated as errors
| lib/Makefile.am:22: warning: ':='-style assignments are not portable
| lib/Makefile.am:23: warning: ':='-style assignments are not portable
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.

What is a portable version of ':=', maybe '+='? I can't get anything but 
unrelated hits from Google.

Secondly:

| autoreconf: running: aclocal -I 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 
-I 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/ 
-I 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 
-I 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libwebsockets-0.0.0-r0/git/aclocal-copy/ 
--force --warnings=cross
| aclocal: warning: unknown warning category 'cross'

Where does this warning=cross come from and how come it doesn't effect 
any other autotool builds?

I am attempting to compile libwebsockets which is located at: 
http://git.warmcat.com/cgi-bin/cgit/libwebsockets/tree/

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



