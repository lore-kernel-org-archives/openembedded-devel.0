Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1H5WYO-00078C-A0
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jan 2007 01:15:24 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id E760828C012; Sat, 13 Jan 2007 01:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180132211.adsl.alicedsl.de [85.180.132.211])
	by srv043.dedi23.de (Postfix) with ESMTP id 0018B28C011
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jan 2007 01:09:08 +0100 (CET)
Date: Sat, 13 Jan 2007 01:13:17 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <571137222.20070113011317@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A7EED3.9040701@dominion.kabel.utwente.nl>
References: <1888834532.20070112204308@vanille-media.de>
	<45A7EED3.9040701@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Gtk+ 2.6.10 w/ newer Glibs
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
X-List-Received-Date: Sat, 13 Jan 2007 00:15:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Michael 'Mickey' Lauer schreef:
>> Since .dev upgraded gnome-vfs and removed gnome-vfs-dbus, gnome-vfs is
>> no longer buildable against an old (<= 2.9.4) glib. Gtk+ 2.6.10 (which is still
>> in wide use today) again is not buildable against newer glib variants.
>> 
>> Any glib / Gtk+ experts to fix the problem? The first issue out is
>> here:

>> | ../../../gtk/gtkclist.h:155: error: expected specifier-qualifier-list before 'GMemChunk'

> I think this is caused by the work done on g_slice. You could have a look at backporting
> those changes[1].
[...]
> [1] Or use the maemo patches that do that :)

Heh, I'd like to, but how am I supposed to do that.
They don't seem to maintain patchsets or do they?

I'm afraid digging the proper changes out of their dozens of tags and
branches is way over my capabilities.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



