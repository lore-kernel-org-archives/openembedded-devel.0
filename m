Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1K3zYO-00051L-7s
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2008 22:25:52 +0200
X-ASG-Debug-ID: 1212610874-2ef400330000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 2F903C4155
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2008 15:21:15 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id ZIwLiFDxwJbaU02b for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2008 15:21:15 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: No Python in STAGING_INCDIR. Forgot to build python-native ?
Date: Wed, 4 Jun 2008 15:21:47 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806041521.47324.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1212610875
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: No Python in STAGING_INCDIR. Forgot to build python-native ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 20:25:52 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I was just watching an OE build, and it spat out the message:

NOTE: package libxml2-native-2.6.29-r3: task do_setscene: started
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None while 
evaluating:
--with-python=/home/geoff/lrs/playpaq/tmp/staging/i686-linux/usr/include/${@libxml2_native_python_dir(d)}                 --without-debug --without-legacy --without-catalog --without-docbook --with-c14n
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None while 
evaluating:
        if [ -x ${S}/configure ] ; then
                cfgcmd="${S}/configure \
                    --build=${BUILD_SYS} \
                    --host=${HOST_SYS} \
                    --target=${TARGET_SYS} \
                    --prefix=${prefix} \
                    --exec_prefix=${exec_prefix} \
                    --bindir=${bindir} \
                    --sbindir=${sbindir} \
                    --libexecdir=${libexecdir} \
                    --datadir=${datadir} \
                    --sysconfdir=${sysconfdir} \
                    --sharedstatedir=${sharedstatedir} \
                    --localstatedir=${localstatedir} \
                    --libdir=${libdir} \
                    --includedir=${includedir} \
                    --oldincludedir=${oldincludedir} \
                    --infodir=${infodir} \
                    --mandir=${mandir} \
                        ${EXTRA_OECONF} \
                    $@"
                oenote "Running $cfgcmd..."
                $cfgcmd || oefatal "oe_runconf failed"
        else
                oefatal "no configure script found"
        fi

NOTE: Checking if staging package installed
NOTE: No. Manually removing any installed files
NOTE: package libxml2-native-2.6.29-r3: task do_setscene: completed

And then it kept on truckin'.  What does that mean?  Is it important?

TIA,
---
Geoffrey



And then


