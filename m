Received: from qmta06.westchester.pa.mail.comcast.net ([76.96.62.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bb1@halebob.net>) id 1QlRw6-0004Dp-7l
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 22:39:34 +0200
Received: from omta21.westchester.pa.mail.comcast.net ([76.96.62.72])
	by qmta06.westchester.pa.mail.comcast.net with comcast
	id CLN01h0031ZXKqc56LaMTA; Mon, 25 Jul 2011 20:34:21 +0000
Received: from smithers.halebob.net ([69.255.41.253])
	by omta21.westchester.pa.mail.comcast.net with comcast
	id CLaA1h0365TjpzZ3hLaDDj; Mon, 25 Jul 2011 20:34:18 +0000
Received: from www.halebob.net (smithers.halebob.net [192.168.1.6])
	by smithers.halebob.net (8.13.8/8.13.8) with ESMTP id p6PKY9mq020172
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:34:09 -0400
MIME-Version: 1.0
Date: Mon, 25 Jul 2011 15:34:09 -0500
From: Robert Brick <bb1@halebob.net>
To: <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1311624488.3098.14.camel@lenovo.internal.reciva.com>
References: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
	<1311624488.3098.14.camel@lenovo.internal.reciva.com>
Message-ID: <c1ad379acab6c0bbe50c200c46bd7951@smithers>
X-Sender: bb1@halebob.net
User-Agent: Roundcube Webmail/0.4
Subject: Re: i18n problems with eglibc
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
X-List-Received-Date: Mon, 25 Jul 2011 20:39:34 -0000
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 25 Jul 2011 21:08:08 +0100, Phil Blundell <philb@gnu.org>
wrote:
> On Mon, 2011-07-25 at 11:26 -0500, Robert Brick wrote:
>> root@cpc3xx:/bin [1]# ls /nonexistent
>> ls: no se puede acceder a /nonexistent: No such file or directory
>> root@cpc3xx:/bin [2]#
>>
>> I was expecting to see:
>> ls: no se puede acceder a /non: No existe el fichero o el directorio
>>
>> The first part of the output has the es translation, but not the
>> second
>> part.
>>
>> Anyone have any idea why? Thanks in advance.
> 
> It sounds as though the message catalogs for glibc itself aren't getting
> installed for some reason.  The first step would be to check whether
> that's really the case, and then I guess the second step would be to
> debug rootfs_ipk to find out why not.
I should have mentioned it in my initial mail.  I believe that the
glibc message catalog is installed correctly.

root@cpc3xx:/bin# ls -l /usr/share/locale/es/LC_MESSAGES/
total 232
-rw-r--r-- 1 root root 110655 jul 23 13:57 coreutils.mo
-rw-r--r-- 1 root root 120808 jul 21 01:15 libc.mo
root@cpc3xx:/bin#

Is there any other file other than .../es/LC_MESSAGES/libc.mo that make
up the message catalog?
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



