Received: from [209.85.219.228] (helo=mail-ew0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1Mh9el-0001Wx-Vl
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 00:11:15 +0200
Received: by ewy28 with SMTP id 28so2540962ewy.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=65Y8b469lvCXqko9zr9VfAQUXN+pCbSfv0NCJR5Vq6M=;
	b=KWx2+qd5PDyUf2EGcM3lcYZ7qQgRRbo3TYKH7rE+LsmSXC/I8ny10nc05yewsgnf3P
	UHLBczHMLnMLryU92kzWZIzrNg3X4ohynZiQhCv7Yb23BCDapAztoG7mNdhFE2bktTWZ
	Wf3kUi72KW6SapwzZHBEnRxtfWDdDO9+ci0+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YUqBPUEuFroY/OLuHmhdlTtd24aouvF/n+t4QxT7MpIUuhD7ShJ75raFADshRfp5ci
	eGjCaSYpgcHS1m8Bl8DIZKOwbagUccW2t2Tj0xqobtHpLauo0SPEgXGkii00aiqphbKw
	JWVlhuZeg5WLztC25SPSLrfaIla9o5bOukDsE=
MIME-Version: 1.0
Received: by 10.216.73.85 with SMTP id u63mr346941wed.37.1251496356724; Fri, 
	28 Aug 2009 14:52:36 -0700 (PDT)
Date: Fri, 28 Aug 2009 18:52:36 -0300
Message-ID: <a63ecaf0908281452x12ab1a84w9df0b4a9e0f98163@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error with xterm_207.bb in Fedora
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
X-List-Received-Date: Fri, 28 Aug 2009 22:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

There are an error when try to select the mode for install:
A patch for sinstall.sh will be added
For example, changing line 120:

PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g'
-e 's/--[sxt]/1/g'`

for:

PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g'
-e 's/--[sxt]/1/g'|tr -d '.'`


I don't know to who send this "patch"
------------------------------------------------------

NOTE: Running task 8 of 8 (ID: 7,
/home/koan/devel/openembedded/recipes/xorg-app/xterm_207.bb, do_install)
ERROR: function do_install failed
ERROR: log data follows
(/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/temp/log.do_install.16329)
| NOTE: make
DESTDIR=/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image
install
| /bin/sh
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/xterm-207/mkdirs.sh
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image/usr/bin
| mkdir
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image/usr
| mkdir
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image/usr/bin
| /bin/sh
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/xterm-207/sinstall.sh
"/home/koan/devel/build/kaeilos/tmp/staging/x86_64-linux/usr/bin/install -c"
xterm  /usr/bin/xterm
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image/usr/bin/`echo
xterm|  sed 's/$//'|sed 's,x,x,'|sed 's/$//'`
| checking for presumed installation-mode
| ... if "/usr/bin/xterm" is null, try the ls -g option
| ... if "/usr/bin/xterm" is null, we do not look for group
| ... if we have date in proper columns (Mar 2 10:57), "" is null
| ... derived user "root", group "root" of previously-installed xterm
| ... see if mode "-rwxr-xr-x." has s-bit set
| ... installing xterm as user "emiliano", group "emiliano"
| /home/koan/devel/build/kaeilos/tmp/staging/x86_64-linux/usr/bin/install -c
-m 755.   xterm
/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/xterm-207-r0/image/usr/bin/xterm
| /home/koan/devel/build/kaeilos/tmp/staging/x86_64-linux/usr/bin/install:
invalid mode `755.'
| make: *** [install] Error 1
| FATAL: oe_runmake failed




-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

