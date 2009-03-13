Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcos@2mi.com.br>) id 1LiAL1-00047p-7G
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 17:34:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 411EF503618D
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 13:38:47 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUgGdexSQKfV
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 13:38:42 -0300 (BRT)
Received: from [192.168.15.106] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id A1C45502762D
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 13:38:42 -0300 (BRT)
From: Marcos Amorim <marcos@2mi.com.br>
To: Openembedded-devel@lists.openembedded.org
Organization: 2MI Tecnologia
Date: Fri, 13 Mar 2009 13:34:00 -0300
Message-Id: <1236962040.9119.16.camel@faraday>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem with xserver-xorg
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
X-List-Received-Date: Fri, 13 Mar 2009 16:34:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm compile distro with xorg-xserver how to fix this problem?


openembedded/packages/xorg-xserver/xserver-xorg_1.5.3.bb, do_configure

checking for GL... configure: error: Package requirements (glproto >=
1.4.9 gl >= 7.1.0) were not met:
 
No package 'gl' found

I try with --disable-xgl and --disable-glx and unsuccessfully

This is my configure options

build/tmp/work/i486-linux/xserver-xorg-2_1.5.3-r4/xorg-server-1.5.3/configure --build=i686-linux --host=i486-linux --target=i486-linux --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/usr/com 	--localstatedir=/var 	--libdir=/usr/lib --includedir=/usr/include --oldincludedir=/usr/include --infodir=/usr/share/info --mandir=/usr/share/man --enable-xcalibrate --enable-kdrive --enable-xephyr  --disable-xfbdev --disable-xnest --disable-kdrive-vesa                   --with-default-font-path=/usr/share/fonts/X11/misc ac_cv_file__usr_share_sgml_X11_defs_ent=no



Marcos Amorim
Eq. de Desenvolvimento
2MI Tecnlogia

