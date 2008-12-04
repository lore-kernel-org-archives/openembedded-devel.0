Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L8E1D-0002kQ-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 14:13:24 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 23A7B6280BE;
	Thu,  4 Dec 2008 14:09:49 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gh8ge9$gff$1@ger.gmane.org>
References: <1228384295.14968.63.camel@hammer.suse.cz>
	<gh8ge9$gff$1@ger.gmane.org>
Date: Thu, 04 Dec 2008 14:09:48 +0100
Message-Id: <1228396188.14968.188.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: broken shared-mime-info and MIME typing
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
X-List-Received-Date: Thu, 04 Dec 2008 13:13:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> * shared-mime-info does *NOT* include freedesktop.org.xml to save space
> * mime.bbclass *DOES* check for /usr/bin/update-mime-info
> * mime.bbclass *DOES* add rdepends to freedesktop.org.xml when needed
> 
> This means that people not needing freedesktop.org.xml don't get it 
> installed and people that do need it get it installed automagically when 
> using mime.bbclass

NOTE: adding mime postinst and postrm scripts to libgeda
NOTE: adding shared-mime-info dependency to libgeda

This would not work. Without freedesktop.org.xml the command
"update-mime-database /usr/share/mime" will ruin the database.

I would like to propose following changes:

1. Move update-mime-database to freedesktop-mime-info.

2. RRECCOMMENDS="freedesktop-mime-info" in the class instead of RDEPENDS
   In fact, MIME database is required by its consumers, not packages
   provides XML files.

3. Implicit FILES_${PN} += "${datadir}/mime/packages"

4. Remove the warning and error in mime_.

5. shared-mime-info-locale-* should not depend on freedesktop-mime-info.
It should be probably named freedesktop-mime-info-locale-*, as
shared-mime-info itself does not need it.


-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



