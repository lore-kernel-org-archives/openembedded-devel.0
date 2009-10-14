Received: from [147.32.9.3] (helo=mailgw1.fjfi.cvut.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1My5DQ-0007is-0V
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 16:52:39 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 1971C43C08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 16:51:43 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 1971C43C08
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1255531903; i=@fjfi.cvut.cz; bh=ED4KcD+34F4EKu2UUzyahvPC6j8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=sslcZcTVkKKSQY4evU32BtPtA9GMKgN8ZzpnNpCuj4bEjB1V+HzdwlA/j+zp1XjVu
	2irbdZP3+bywykDdAlTAg==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 0Kr8QQjNeXuj
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 16:51:37 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 911ED43C0A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 16:51:37 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 911ED43C0A
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 911ED43C0A
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 1689546774; Wed, 14 Oct 2009 16:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id 0877746773
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 16:51:37 +0200 (CEST)
Date: Wed, 14 Oct 2009 16:51:36 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LRH.2.00.0910140020030.5153@linux.fjfi.cvut.cz>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: glib-2.0_2.22.1 breaks build of mc
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
X-List-Received-Date: Wed, 14 Oct 2009 14:52:39 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hello,

I bumped into an issue with glib-2.0_2.22.1. (dev branch, 
MACHINE=omapzoom2, DISTRO=angstrom-2008.1)

The library itself builds ok, but then when building midnight commander, 
do_compile choes, with the error being:

In file included from 
/mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0/glib/gasyncqueue.h:34,
                  from 
/mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0/glib.h:34,
                  from glibcompat.c:29:
/mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0/glib/gthread.h: 
In function 'g_once_init_enter':
/mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0/glib/gthread.h:344: 
error: size of array 'type name' is negative

The error message still leaves me in the dark as for what actually 
happened. Anyway, the function in question looks like this:

G_INLINE_FUNC gboolean
g_once_init_enter (volatile gsize *value_location)
{
   if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) != NULL)
     return FALSE;
   else
     return g_once_init_enter_impl (value_location);
}

(line 344 is the g_atomic_pointer_get() call)

Changing the argument of g_atomic_pointer_get into:

 	(volatile gpointer *)value_location

seems to resolve the issue, but seeing the code for the first time - I 
wonder if it's ok.

Anyway I did some digging arount the glib headers, and I think the 
typecast is ok (as sizeof(gsize)==sizeof(gpointer), and that's hopefully 
garanteed).

The trivial patch is here:

http://linux.fjfi.cvut.cz/~zub/g_once_init_enter.patch

David


