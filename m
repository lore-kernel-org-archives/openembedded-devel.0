Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JfxP0-0001ic-2z
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Mar 2008 15:16:50 +0200
Received: by an-out-0708.google.com with SMTP id b33so328664ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 06:16:33 -0700 (PDT)
Received: by 10.101.69.10 with SMTP id w10mr12736077ank.68.1206882991313;
	Sun, 30 Mar 2008 06:16:31 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 30 Mar 2008 06:16:31 -0700 (PDT)
Message-ID: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
Date: Sun, 30 Mar 2008 14:16:31 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: base.bbclass: Enable overwrite flag for unzip command
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
X-List-Received-Date: Sun, 30 Mar 2008 13:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

During rebuilds I noticed unpacking a zip a second time fails, whereas tar
silently succeeds, overwriting files.

A manual test confirms this:

leon@witty:/tmp$ unzip -q
/home/leon/sandbox/efika/openembedded/downloads/faad2-2.0.zip
leon@witty:/tmp$ unzip -q
/home/leon/sandbox/efika/openembedded/downloads/faad2-2.0.zip
replace faad2/aacDECdrop/aacDECdrop/aacDECdrop.dsp? [y]es, [n]o, [A]ll,
[N]one, [r]ename: leon@witty:/tmp$

leon@witty:/tmp$ tar xzf ~/sandbox/efika/openembedded/downloads/zeroconf-
0.9.tar.gz
leon@witty:/tmp$ tar xzf ~/sandbox/efika/openembedded/downloads/zeroconf-
0.9.tar.gz

I will shortly commit the following change (after a test), which enables
overwrite behaviour for unzip:

-base.bbclass:574:               cmd = 'unzip -q'
+base.bbclass:574:               cmd = 'unzip -q -o'

Regards,
-- 
Leon

