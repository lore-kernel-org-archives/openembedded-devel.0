Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ebenard@free.fr>) id 1LUiKI-0007O1-Gi
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 15:02:02 +0100
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id F09254B0070
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 15:01:53 +0100 (CET)
Received: from [192.168.1.15] (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 083A34B00E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 15:01:50 +0100 (CET)
Message-ID: <49899FCE.3020900@free.fr>
Date: Wed, 04 Feb 2009 15:01:50 +0100
From: Eric BENARD <ebenard@free.fr>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: gnutls-2.4.2 & automake 1.10
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
X-List-Received-Date: Wed, 04 Feb 2009 14:02:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm building a "minimal" distro for arm926 and got a problem with 
gnutls-2.4.2 (see message below).
Running "bitbake automake-native-1.10" solved the problem by forcing the 
installation of a native automake 1.10.

How can we tell gnutls-2.4.2 to automatically require automake 1.10 
during it's build process ?

Thanks
Eric

| autoreconf: running: automake --foreign --add-missing --copy 
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| configure.in:28: require Automake 1.10, but have 1.9.3
| autom4te: closing standard output: Broken pipe
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed: 
/home/ebenard/WORK/OE/tmp/work/armv5te-linux/gnutls-2.4.2-r3/temp/log.do_configure.16995
NOTE: package gnutls-2.4.2-r3: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gnutls-2.4.2: failed


