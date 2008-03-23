Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JdNts-0006IH-2c
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 11:58:04 +0100
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id E8F043EA0AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 11:58:03 +0100 (CET)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 562B73EA0E3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 11:58:03 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id ED37B184147
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 11:59:37 +0100 (CET)
Message-ID: <47E63819.9060806@bolloretelecom.eu>
Date: Sun, 23 Mar 2008 11:59:37 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.9) Gecko/20080109 Thunderbird/2.0.0.9 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
In-Reply-To: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Sun, 23 Mar 2008 10:58:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Some comments concerning the two following recipes:

- opkg-native_svn.bb
- opkg-sdk_svn.bb

They both add "-disable-gpg" (note the single dash) to EXTRA_OECONF. I
think this should be --disable-gpg if we actually want to disable GPG.

opkg-sdk_svn.bb also adds "--with-opkglibdir=${target_libdir}/opkg" to
EXTRA_OECONF, which looks wrong (I don't think the "opkg" bit should be
there). From the configure.ac:

--with-opkglibdir=DIR   specifies directory to put status and info
files. "/opkg" is always added so if you want your files to be in
/usr/lib/opkg you should indicate --with-opkglibdir=/usr/lib

Cheers,
Jeremy


