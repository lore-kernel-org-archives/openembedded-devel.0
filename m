Received: from qmta04.westchester.pa.mail.comcast.net ([76.96.62.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bb1@halebob.net>) id 1QlO47-0000g0-Cx
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 18:31:35 +0200
Received: from omta17.westchester.pa.mail.comcast.net ([76.96.62.89])
	by qmta04.westchester.pa.mail.comcast.net with comcast
	id CGPy1h0041vXlb854GSN2u; Mon, 25 Jul 2011 16:26:22 +0000
Received: from smithers.halebob.net ([69.255.41.253])
	by omta17.westchester.pa.mail.comcast.net with comcast
	id CGSL1h00s5TjpzZ3dGSM3Q; Mon, 25 Jul 2011 16:26:21 +0000
Received: from www.halebob.net (smithers.halebob.net [192.168.1.6])
	by smithers.halebob.net (8.13.8/8.13.8) with ESMTP id p6PGQJmK018069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:26:19 -0400
MIME-Version: 1.0
Date: Mon, 25 Jul 2011 11:26:19 -0500
From: Robert Brick <bb1@halebob.net>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
X-Sender: bb1@halebob.net
User-Agent: Roundcube Webmail/0.4
Subject: i18n problems with eglibc
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
X-List-Received-Date: Mon, 25 Jul 2011 16:31:35 -0000
Content-Type: text/plain;
 charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello.

I'm trying to get the es_US.UTF-8 locale working with OE. I've 
included
nls support and IMAGE_LINGUAS="es_US.utf8" in my image and set
LANG=es_US.UTF-8 on the target, however I only get partial message
translation on the target when using coreutils's ls command. Here is 
the output from ls
when requesting the contents of a non-existent directory:

root@cpc3xx:/bin [1]# ls /nonexistent
ls: no se puede acceder a /nonexistent: No such file or directory
root@cpc3xx:/bin [2]#

I was expecting to see:
ls: no se puede acceder a /non: No existe el fichero o el directorio

The first part of the output has the es translation, but not the 
second
part.

Anyone have any idea why? Thanks in advance.



