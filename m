Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <fischer@4g-systems.com>) id 1H7wV4-0003gM-38
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jan 2007 17:21:58 +0100
Received: from [213.238.49.68] (helo=dehamox1a.intra.4g-systems.com)
	by mrelayeu.kundenserver.de (node=mrelayeu6) with ESMTP (Nemesis),
	id 0ML29c-1H7wV234FZ-0006lE; Fri, 19 Jan 2007 17:21:57 +0100
Received: from [172.31.20.70] (deham-pc1070.intra.4g-systems.com
	[172.31.20.70])
	by dehamox1a.intra.4g-systems.com (Postfix) with ESMTP id ED67E610B20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2007 17:21:49 +0100 (CET)
Message-ID: <45B0F024.7060402@4g-systems.com>
Date: Fri, 19 Jan 2007 17:21:56 +0100
From: Patrick Fischer <fischer@4g-systems.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:2073f051fc1b72daa8cde2c9d21098b2
Subject: striping some libs and modules
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
X-List-Received-Date: Fri, 19 Jan 2007 16:21:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello
I would like to discuss about striping some libs and modules.

I know i can't stip everything like object symbols,
but here is my stip suggestion:

mipsel-linux-strip -g -S -d --strip-debug $FILES
mipsel-linux-strip --remove-section=.comment --remove-section=.note 
--strip-unneeded $FILES

It will remove all debug, comment, note and unnedded code.


First of all there is the libstdc++

#ls -l tmp/rootfs/usr/lib/libstdc++.so.5.0.6
-rwxr-xr-x 1 pf pf 4636996 Jan 19 16:41 
tmp/rootfs/usr/lib/libstdc++.so.5.0.6
#mipsel-linux-strip -g -S -d --strip-debug tmp/rootfs/usr/lib/libstdc++.so.5
#ls -l tmp/rootfs/usr/lib/libstdc++.so.5.0.6
-rwxr-xr-x 1 pf pf 1249844 Jan 19 16:41 
tmp/rootfs/usr/lib/libstdc++.so.5.0.6
#mipsel-linux-strip --remove-section=.comment --remove-section=.note 
--strip-unneeded tmp/rootfs/usr/lib/libstdc++.so.5.0.6
#ls -l tmp/rootfs/usr/lib/libstdc++.so.5.0.6
-rwxr-xr-x 1 pf pf 1029184 Jan 19 16:41 
tmp/rootfs/usr/lib/libstdc++.so.5.0.6

it was 4636996 byte, after striping it is only  1029184 byte

This is very much!
Can any body tell my why i shouldn't do this?

There are a log of libs and modules which are not stiped.
Go to your rootfs and call this line to see which files are not stiped:
find . -exec file '{}' \; | grep "not stripped"

I think there is potential. I have tested it quickly. Works fine until now.

Best regards
Patrick Fischer



