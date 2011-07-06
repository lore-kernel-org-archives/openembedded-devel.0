Received: from slow3-v.mail.gandi.net ([217.70.178.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1QeQ5P-0008QI-Mn
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 13:16:07 +0200
X-WhiteListed: mail was accepted with no delay
X-WhiteListed: mail was accepted with no delay
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 9619739389
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 13:12:19 +0200 (CEST)
X-Originating-IP: 217.70.178.129
Received: from mfilter12-d.gandi.net (mfilter12-d.gandi.net [217.70.178.129])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id 028C9172070;
	Wed,  6 Jul 2011 13:12:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter12-d.gandi.net
X-Amavis-Alert: BAD HEADER SECTION, MIME error: error: part did not end with
	expected boundary
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter12-d.gandi.net (mfilter12-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id bnT8mbESkDoO; Wed,  6 Jul 2011 13:12:17 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from localhost.localdomain (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E40BE17207E;
	Wed,  6 Jul 2011 13:12:16 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:12:09 +0200
Message-Id: <cover.1309949770.git.a.sappia@biotechware.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus-glib-native and dbus-glib corrected
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
X-List-Received-Date: Wed, 06 Jul 2011 11:16:07 -0000
Content-Type: multipart/mixed; boundary="------------1.7.4.1"

--------------1.7.4.1
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: quoted-printable

Hi all,
dbus-glib-native and dbus-glib were not compiling.=20
Reason were in how the dbus-glib.inc and dbus-glib_0.86.bb were wrote.
The patch clears what the recipe has to do for each target compilation.

More info from http://www.mail-archive.com/openembedded-devel@lists.opene=
mbedded.org/msg10184.html
[cut]
> I suspect that code could well have come from Poky. In this case the
> native recipe generates a file which is then used by the target builds.
> It can't be generated in the target recipe as that would mean running
> target binaries.
[cut]

Patch compiles and dbus-glib works on target device (tested with mini2440=
).

Regards,

Alessandro

Alessandro Sappia (1):
  dbus-glib-native and dbus-glib were not compiling. This patch
    corrects dbus-glib-native to install required files in order to let
    dbus-glib to compile on target.

 recipes/dbus/dbus-glib.inc     |    4 ++--
 recipes/dbus/dbus-glib_0.86.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--=20
1.7.4.1



--------------1.7.4.1--
