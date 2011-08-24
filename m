Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QwInb-00062K-Cj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 21:07:39 +0200
Received: (qmail 24115 invoked by uid 1003); 24 Aug 2011 19:02:50 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Aug 2011 19:02:50 -0000
Message-ID: <4E554AD9.90607@balister.org>
Date: Wed, 24 Aug 2011 12:02:49 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Build failure for openjade in dev
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
X-List-Received-Date: Wed, 24 Aug 2011 19:07:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am seeing this building openjade. As near as I can see, there haven't 
been any changes to cause this. It does build in release-2011.3-maintenance.

Anyone have any clues?

Philip

| oe_libinstall: cp -P libogrove.so 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/image/home/balister/oe/tmp/sysroots/x86_64-linux/usr/lib/
| + cp -P libogrove.so 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/image/home/balister/oe/tmp/sysroots/x86_64-linux/usr/lib/
| + '[' -z libogrove.so.0.0.1 ']'
| + '[' -z 1 ']'
| + __runcmd cd 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/openjade-1.3.2
| + '[' -z '' ']'
| + echo 'oe_libinstall: cd 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/openjade-1.3.2'
| oe_libinstall: cd 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/openjade-1.3.2
| + cd 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/openjade-1.3.2
| + install -d 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/image/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2
| + install -m 644 dsssl/catalog 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/image/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2
| + install -m 644 dsssl/dsssl.dtd dsssl/fot.dtd dsssl/style-sheet.dtd 
dsssl/builtins.dsl dsssl/demo.dsl dsssl/extensions.dsl dsssl/demo.sgm 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/image/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2
| + install -d 
/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgmERROR: Function 
'do_install' failed (see 
/home/balister/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r5/temp/log.do_install.31853 
for further information)
| l/openjade-1.3.2
| + install -m 644 dsssl/catalog 
/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/catalog
| + install-catalog --add 
/home/balister/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat 
/home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/catalog
| install-catalog: unable to write in /etc/sgml.
NOTE: package openjade-native-1.3.2-r5: task do_install: Failed
ERROR: Task 2 
(virtual:native:/home/balister/oe/openembedded/recipes/openjade/openjade_1.3.2.bb, 
do_install) failed with exit code '1'
Waiting for 3 active tasks to finish:


