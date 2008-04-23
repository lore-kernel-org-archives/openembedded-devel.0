Received: from [213.207.90.162] (helo=daffy.sipo.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@t3i.nl>) id 1JolyS-0003BE-7b
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 22:53:52 +0200
Received: from nobody by daffy.sipo.nl with local (Exim 4.63)
	(envelope-from <lists@t3i.nl>) id 1JolyI-0002vH-TM
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 22:53:42 +0200
To: openembedded-devel@lists.openembedded.org
From: "RvP" <lists@t3i.nl>
Mime-Version: 1.0
X-Mailer: Mr.Mail 0.6alpha
X-Originating-IP: 83.83.2.224
X-MsgID: php480fa1d6c4360
Message-Id: <E1JolyI-0002vH-TM@daffy.sipo.nl>
Date: Wed, 23 Apr 2008 22:53:42 +0200
Subject: gcc & libssp disabled by default?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 20:53:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi,

gcc versions 4.0.0 and later are currently being built without libssp
support: EXTRA_OECONF_BASE contains "--disable-libssp" in those recipes.

Why is that? E.g. mpd (music player daemon) needs libssp. As a work-around I
manually changed the .bb files for gcc 4.1.2 in paclages/gcc/ and removed the
--disable-libssp switch. Gcc now builds with libssp and all seems to run
without problems (on a NSLU2).

BTW. did I really need to edit the recipes in packages/gcc/ or could I have
set a variable elsewhere to enable libssp?

Cheers,

Richard.



