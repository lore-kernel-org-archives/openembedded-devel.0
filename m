Received: from [212.27.42.35] (helo=smtp5-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGzBf-0005pM-Hc
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 16:31:03 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp5-g19.free.fr (Postfix) with ESMTP id 04C771940F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 16:29:16 +0200 (CEST)
Message-ID: <44F06A3D.8030102@free.fr>
Date: Sat, 26 Aug 2006 17:35:25 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: sysvinit-2.86 fails
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
X-List-Received-Date: Sat, 26 Aug 2006 14:31:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I got this :

 ln: 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/at91sam9261-linux/sysvinit-2.86-r28/image/etc/rc2.d/S99stop-bootlogd': 
File exists

I tried to fix it in sysvinit-2.86.bb file but with no success.
I tried to replace ln -s ../init.d/stop-bootlogd 
${D}${sysconfdir}/rc$level.d/S99stop-bootlogd with ln -sf ....
but It doesn't work either. I mean It builds successfully but 
tmp/work/at91sam9261-linux/sysvinit-2.86-r28/image/etc/ is empty !!!

Any hint on that too please ?

Amine.


