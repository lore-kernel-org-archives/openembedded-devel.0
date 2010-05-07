Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel.xntian@gmail.com>) id 1OAI29-0007pY-6J
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:33:49 +0200
Received: by vws13 with SMTP id 13so756129vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=/Kw9u9tSH+FlpPEPLh6KxTmdoIfykons1MW2zwZSz/w=;
	b=p4PvMMf+JQF9ZJDeJO+RF7K/RvybNu9JCuiIVxsPrL8Dg3u1QC2tPKWz8O9LrnxmjO
	yg4VVBOUs+u9u9IgxGfxYyPiDukHUASbikUjH8V3LAYTgO9Qau/Qjuu3l6yYNljUbTP0
	z1FwSkkSd+UxhfG2C9B9ao36ELQvRRUQ0tx/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=Sg67gRjaImey3eN6v2VuZZD4iNlvvpq2S0Y/208fKQVeTHYZ+rU/2NqFLcKdtkFXbg
	uzldJd9JWWdNUjyblGbACDxlQoC4WXO6aOqh6s7SCK4Eh4nfTwYizR5nHw7rHU5vxCfr
	IVSZ8jfJDmUJBgwsUnBhSMXrNL5m5W5zC+7Bc=
MIME-Version: 1.0
Received: by 10.220.61.139 with SMTP id t11mr6689509vch.203.1273217271011; 
	Fri, 07 May 2010 00:27:51 -0700 (PDT)
Received: by 10.220.100.140 with HTTP; Fri, 7 May 2010 00:27:50 -0700 (PDT)
Date: Fri, 7 May 2010 15:27:50 +0800
Message-ID: <q2u121fadb81005070027t9958a5e9m63e3648d364f006a@mail.gmail.com>
From: daniel tian <daniel.xntian@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: daniel.xntian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: peng.zheng@mavrixtech.com
Subject: X/Xorg can not run successfully
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
X-List-Received-Date: Fri, 07 May 2010 07:33:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello, all:
        I already built the openembedded code with "bitbake
e-image-core". but after the rootfs and kernel runs on mips24k board,
I can login with root in minicom.
        But after I run the 'X', the LCD screen becomes black.
        Here is the command I run, and the message shows on minicom:
        root@db1200:~# X

X.Org X Server 1.7.4
Release Date: 2010-01-08
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.31-20-generic i686
Current Operating System: Linux db1200 2.6.29.4 #1 PREEMPT Fri May 7
11:39:13 CST 2010 mips
Kernel command line: root=/dev/mmcblk0p1 rootdelay=8 rootfstype=ext2
rw console=ttyS0
Build Date: 06 May 2010  09:38:21PM

Current version of pixman: 0.18.0
       Before reporting problems, check http://wiki.x.org
       to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
       (++) from command line, (!!) notice, (II) informational,
       (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 00:00:55 1970
(==) Using config file: "/etc/X11/xorg.conf"
(EE) Failed to load module "glx" (module does not exist, 0)
(EE) Failed to load module "dri" (module does not exist, 0)
(EE) Failed to load module "dri2" (module does not exist, 0)
Primary device is not PCI

        By the way, the Poky can run on my board normally.

        Does your guys also encounter with this problem?
        Any suggestion is appreciated.
        Thanks very much.


                                     daniel


