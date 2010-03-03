Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jesmith@kaon.com>) id 1NmrLu-00005w-9T
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 17:23:15 +0100
Received: by qyk8 with SMTP id 8so959578qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 08:20:22 -0800 (PST)
Received: by 10.224.29.75 with SMTP id p11mr19805qac.167.1267633209123;
	Wed, 03 Mar 2010 08:20:09 -0800 (PST)
Received: from ?10.10.0.195? (216-230-77-82.client.cypresscom.net
	[216.230.77.82])
	by mx.google.com with ESMTPS id 8sm1848848yxg.24.2010.03.03.08.20.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 08:20:08 -0800 (PST)
From: Joshua Smith <jesmith@kaon.com>
Date: Wed, 3 Mar 2010 11:20:06 -0500
Message-Id: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1077)
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: jesmith@kaon.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Trying and Failing to enable Java with GCC 4.3.3
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
X-List-Received-Date: Wed, 03 Mar 2010 16:23:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,

I'm new to OE.  I'm trying to get GCJ compiled for the TouchBook (an =
ARM-based tablet).  After some searching and trial-and-error, I figured =
out that I need to add:

JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc

But now I'm getting an error when it tries to build gcc-cross-4.3.3:

make[4]: Entering directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
make[4]: *** No rule to make target `all'.  Stop.
make[4]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
make[3]: *** [multi-do] Error 1
make[3]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
make[2]: *** [all-multi] Error 2
make[2]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
make[1]: *** [all-zlib] Error 2

(I can give you more of the log if it would help, but this is the first =
error)

I can see why adding Java would cause GCC to need zlib when maybe it =
didn't before.  But I don't know what to change to get zlib configured =
as part of the gcc build process.

Help?

-Joshua Smith



