Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1Q9eis-0006SS-SE
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 16:37:43 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly11a.srv.mailcontrol.com (MailControl) with ESMTP id
	p3CE5U64002050 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 15:05:30 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 12 Apr 2011 16:05:29 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Tue, 12 Apr 2011 16:05:29 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Apr 2011 16:05:28 +0200
Thread-Topic: issue building the rule "gnome/gconf-dbus_svn.bb"
Thread-Index: Acv5Gq13KguNhpsARY6P5I0gQDsaHw==
Message-ID: <531B6536C9F737458807DF75064873C801CE0CD63514@mta-digimail.MTA.INT>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 12 Apr 2011 14:05:30.0030 (UTC)
	FILETIME=[AE61C4E0:01CBF91A]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.121
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: issue building the rule "gnome/gconf-dbus_svn.bb"
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
X-List-Received-Date: Tue, 12 Apr 2011 14:37:44 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guys,
I can't build the rule gcnf-dbus_svn.bb.

the problem seems to be that the svn server
svn://developer.imendio.com/svn/gconf-dbus
is not working anymore.

Does anyone know a mirror for this site? Or a fix for the not working rule?

This is the output I see on the terminal when I build

NOTE: Handling BitBake files: \ (6705/6705) [100 %]
NOTE: Parsing finished. 6405 cached, 0 parsed, 300 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 638 of 942 (ID: 1, /opt/OE/org.cnh_fred.dev/recipes/gnom=
e/gconf-dbus_svn.bb, do_setscene)
NOTE: Running task 639 of 942 (ID: 2, /opt/OE/org.cnh_fred.dev/recipes/gnom=
e/gconf-dbus_svn.bb, do_fetch)
NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=3Dtrunk;proto=
=3Dhttp
svn: Server sent unexpected return value (504 Gateway Time-out) in response=
 to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/trunk'
NOTE: Task failed: Fetch failed: Fetch command export SSH_AUTH_SOCK=3D/tmp/=
keyring-Clq4Sq/ssh; export PATH=3D/opt/OE/build_cnh_fred/tmp.1/staging/i686=
-linux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i686-li=
nux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux=
/usr/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/usr/bin:/opt/OE/b=
uild_cnh_fred/tmp.1/cross/ppce300c3/bin:/opt/OE/build_cnh_fred/tmp.1/stagin=
g/i686-linux/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/bin:/usr/=
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; /usr/bi=
n/env svn co -r 641 http://developer.imendio.com/svn/gconf-dbus/trunk@641 t=
runk failed with signal 1, output:
svn: Server sent unexpected return value (504 Gateway Time-out) in response=
 to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/trunk'

ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb do=
_fetch failed
ERROR: Task 2 (/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb, do=
_fetch) failed
NOTE: Tasks Summary: Attempted 638 tasks of which 637 didn't need to be rer=
un and 1 failed.
ERROR: '/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb' failed


Thanks in advance
Daniele


