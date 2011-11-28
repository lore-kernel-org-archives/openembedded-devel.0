Received: from mail.hopgarden.net ([91.84.199.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <row@hopgarden.net>) id 1RUpiN-0002YX-56
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 02:08:59 +0100
Received: from localhost (mail.hopgarden.net [127.0.0.1])
	by mail.hopgarden.net (Postfix) with ESMTP id 5E38A13B0191
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:33:38 +0000 (GMT)
Received: from mail.hopgarden.net ([127.0.0.1])
	by localhost (hazel.hopgarden.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wkeJg091phTf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:33:23 +0000 (GMT)
Received: from [127.0.0.1] (dynamic-109 [192.168.1.109])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.hopgarden.net (Postfix) with ESMTP id D42E813B006F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:33:23 +0000 (GMT)
Message-ID: <4ED2D6D2.1020308@hopgarden.net>
Date: Mon, 28 Nov 2011 00:33:22 +0000
From: Reuben Wells <row@hopgarden.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: New user build problem
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
X-List-Received-Date: Mon, 28 Nov 2011 01:08:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm new to OpenEmbedded and have searched the FAQ's and archives but 
have been unable to solve this problem.

I'm trying to build an image for the BeagleBoard Xm, using the 
instructions at:

http://www.angstrom-distribution.org/building-angstrom

I had built most of the packages and then hit a problem and tried to 
start again. I removed all files and then ran:

git clone git://git.angstrom-distribution.org/setup-scripts
MACHINE=beagleboard ./oebb.sh config beagleboard
MACHINE=beagleboard ./oebb.sh update
MACHINE=beagleboard ./oebb.sh bitbake virtual/kernel

Now I can't get past the "Parsing recipes", my cooker.log file just has:

NOTE: angstrom DOES NOT support libiconv because the eglibc provided 
iconv library is used
NOTE: angstrom DOES NOT support libiconv because the eglibc provided 
iconv library is used
ERROR: Could not include required file linux-2.6.39.inc
ERROR: Command execution failed: Exited with 1

I've since tried refreshing a number of times with no luck.

I'm not sure where the reference to "linux-2.6.39.inc" is coming from. I 
can't find any references to it.

Outside of the directory in which I unpacked the files and the file 
'~/.oe/environment-oecore' are there any other directories that could be 
maintaining some kind of state? I don't quite understand how it was 
working and now I can't get anywhere.

Build machine is an x86_64 running CentOS 6 (2.6.32-71.29.1.el6.x86_64).

Sorry in advance if I'm missing something very obvious.

Regards, Reuben




