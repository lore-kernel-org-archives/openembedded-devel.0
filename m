Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvPei-0007pz-9i
	for openembedded-devel@openembedded.org; Tue, 14 Sep 2010 09:10:42 +0200
Received: by iwn2 with SMTP id 2so5897857iwn.6
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Sep 2010 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=pV8ab475ThU/Rs/7JsOUt55BqeWG2WkSasasNhwECMo=;
	b=t+GMW/14pciXDu5ZLWHt70+mpzbsEn8X1G+ulM5XoJBHAl5pG2nqpwANX0KqfXu4Yx
	FpjIwAeZ5VM0cWwf6mmHMFV6V8BLRRr456jWtUGiOt5UATjAJ2h0nT7okmhr5C00KR8/
	vn4D9hV1GjFJpzufrSdzTQW/izvfqEuLfUyMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=knCBpImkzVoqxjcwqMIht+QSHafBqJed84tNo/bZ2XV+zi5cMOJfI1146iJLFMxyuf
	7At4qUxSwEtC5JMSl5s9C1AIr0T9pc3eFAsneiA4BCTPlm3rpJHXsOf90cxcTy2aRZIZ
	9mBt/0QOzvm9bGO6m9+iWDQJBbcI1Q+Y/Reh8=
MIME-Version: 1.0
Received: by 10.231.149.198 with SMTP id u6mr7551263ibv.7.1284448168907; Tue,
	14 Sep 2010 00:09:28 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 00:09:28 -0700 (PDT)
Date: Tue, 14 Sep 2010 09:09:28 +0200
Message-ID: <AANLkTi=KwCAU5f6WWAqx+hQ+-XD8W_7tbFauK5O9Kv8d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: beagleboard-demo-image fails on gnome-games
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
X-List-Received-Date: Tue, 14 Sep 2010 07:10:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

As I wanted to peek at beagleboard-demo-image, I gave it a stab
(machine: beagleboard, distro angstrom2008.1, bitbake 1.10, oe latest
testing-next version)
Unfortunately it does not build for me. Apparently there are some host
specific paths to docbook present when building gnome-games.
See the log snippet below, unfortunately this was not pushed to tinderbox.

Frans

[...]
|  CCLD   ar-cards-renderer
| /home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: libc.so, needed by
/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
not found (try using -rpath or -rpath-link)
| make[3]: Leaving directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/lib'
| Making all in help
| make[3]: Entering directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help'
| xsltproc -o aisleriot-C.omf --stringparam db2omf.basename aisleriot
--stringparam db2omf.format 'docbook' --stringparam db2omf.dtd
"-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang C
--stringparam db2omf.omf_dir "/usr/share/omf" --stringparam
db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in
"/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/aisleriot.omf.in"
 `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg-config
--variable db2omf gnome-doc-utils` C/aisleriot.xml || { rm -f
"aisleriot-C.omf"; exit 1; }
| xsltproc -o aisleriot-ca.omf --stringparam db2omf.basename aisleriot
--stringparam db2omf.format 'docbook' --stringparam db2omf.dtd
"-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang ca
--stringparam db2omf.omf_dir "/usr/share/omf" --stringparam
db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in
"/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/aisleriot.omf.in"
 `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg-config
--variable db2omf gnome-doc-utils` ca/aisleriot.xml || { rm -f
"aisleriot-ca.omf"; exit 1; }
| xsltproc -o aisleriot-de.omf --stringparam db2omf.basename aisleriot
--stringparam db2omf.format 'docbook' --stringparam db2omf.dtd
"-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang de
--stringparam db2omf.omf_dir "/usr/share/omf" --stringparam
db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in
"/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/aisleriot.omf.in"
 `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg-config
--variable db2omf gnome-doc-utils` de/aisleriot.xml || { rm -f
"aisleriot-de.omf"; exit 1; }
| xsltproc -o aisleriot-el.omf --stringparam db2omf.basename aisleriot
--stringparam db2omf.format 'docbook' --stringparam db2omf.dtd
"-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang el
--stringparam db2omf.omf_dir "/usr/share/omf" --stringparam
db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in
"/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/aisleriot.omf.in"
 `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg-config
--variable db2omf gnome-doc-utils` el/aisleriot.xml || { rm -f
"aisleriot-el.omf"; exit 1; }
| xsltproc -o aisleriot-en_GB.omf --stringparam db2omf.basename
aisleriot --stringparam db2omf.format 'docbook' --stringparam
db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam
db2omf.lang en_GB --stringparam db2omf.omf_dir "/usr/share/omf"
--stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam
db2omf.omf_in "/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/aisleriot.omf.in"
 `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg-config
--variable db2omf gnome-doc-utils` en_GB/aisleriot.xml || { rm -f
"aisleriot-en_GB.omf"; exit 1; }
| warning: failed to load external entity
"/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| warning: failed to load external entity
"/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| warning: failed to load external entity
"/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| make[3]: *** [aisleriot-C.omf] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [aisleriot-en_GB.omf] Error 1
| make[3]: *** [aisleriot-ca.omf] Error 1
| make[3]: *** [aisleriot-el.omf] Error 1
| make[3]: *** [aisleriot-de.omf] Error 1
| make[3]: Leaving directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: package gnome-games-2.30.0-r1: task do_compile: Failed


