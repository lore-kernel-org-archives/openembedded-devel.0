Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GS9yf-0001x1-RO for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 12:15:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 7D18EC04
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 12:11:02 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27065-06 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 12:10:56 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id E6EB8C03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 12:10:56 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4518B426.6070905@mitac-mtc.com.tw>
References: <4518B426.6070905@mitac-mtc.com.tw>
Organization: VanilleMedia
Date: Tue, 26 Sep 2006 12:10:56 +0200
Message-Id: <1159265456.18705.53.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Failed to build gpe-image ( mainstone/generic )
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 10:15:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Dienstag, den 26.09.2006, 13:01 +0800 schrieb Axel.Lin:
> hi,
> I tried to build gpe-image with generic distro and mainstone machine
> setting.
> I got below error message.
> Could you kindly give me some hints to fix this?

I'm afraid GPE is not in the best state of maintenance in OE atm.

Try rebuilding (bitbake -c rebuild -b <filename) dbus 0.9x and dbus-glib
0.7x, then rebuild gpe-conf. It should then pick up the new dbus
versions from pkgconfig. To be safe, remove
the old versions of dbus*.pc from PKG_CONFIG_PATH.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




