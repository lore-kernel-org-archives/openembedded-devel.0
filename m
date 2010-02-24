Received: from cnsmtpr2.tom.com ([218.30.111.152] helo=tom.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <xydarcher@tom.com>) id 1NkGGJ-0008WP-51
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 13:22:46 +0100
Received: from china-53198c1e9 (unknown [172.24.192.61])
	by cnapp52 (Coremail) with SMTP id kMsXtZ6ahEubLZAF.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 11:18:54 +0800 (CST)
X-Originating-IP: [172.24.192.61]
Received: from china-53198c1e9([125.71.228.74])
	by cnapp31.tom.com(KBAS Gateway 2.1 2.127s39f(2009-08-22)) with ESMTP
	id local10450.1266981534 for
	<openembedded-devel@lists.openembedded.org>; 
	Wed, 24 Feb 2010 11:18:54 +0800 (CST)
X-Original-AuthLogin: xydarcher@tom.com
Date: Wed, 24 Feb 2010 11:18:47 +0800
From: "Readon Shaw" <xydarcher@tom.com>
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
Message-ID: <201002241118467818011@tom.com>
X-mailer: Foxmail 6, 15, 201, 22 [cn]
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 218.30.111.152
X-SA-Exim-Mail-From: xydarcher@tom.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: dbus postinst failed.
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
X-List-Received-Date: Wed, 24 Feb 2010 12:22:46 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

it report that messagebox is not a regular user while my image is booting. 
after tracing, i found that dbus package's postinst script was not executed.
the log shows that "offline root mode: not running dbus-1.postinst"
in order that adduser command in the .postinst file have no effect.

how to solve that? is it a bug?




