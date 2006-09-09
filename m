Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GM8BN-0001zV-RE for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 21:08:02 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id BB30C401B2B; Sat,  9 Sep 2006 11:43:19 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060909184319.BB30C401B2B@tinman.treke.net>
Date: Sat,  9 Sep 2006 11:43:19 -0700 (PDT)
Subject: [Bug 1409] New: bitbake dbus-glib fails without PREFERRED_PROVIDER_dbus-glib
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
X-List-Received-Date: Sat, 09 Sep 2006 19:08:02 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1409

           Summary: bitbake dbus-glib fails without PREFERRED_PROVIDER_dbus-
                    glib
           Product: Openembedded
           Version: unspecified
          Platform: PC
               URL: http://handhelds.org/hypermail/oe/100/10074.html
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: yamaken@bp.iij4u.or.jp
         QAContact: tinderbox-oe@gmx.net


OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "38f8d73bd80424075b07707fb224234553155085"
TARGET_ARCH    = "i686"
TARGET_OS      = "linux"
MACHINE        = "native"
DISTRO         = "openzaurus"
DISTRO_VERSION = ".dev-snapshot-20060909"
TARGET_FPU     = "soft"

This problem is distinct from bug #1371. And there are two other
issues.

1. dbus_0.62-r1.bb fails to build due to the invalid dependency
   to dbus-native_0.92-r1 for dbus-glib

2. Should PREFERRED_PROVIDER_dbus-glib = "dbus-glib" be globally
   specified by default?

As written in the message of the URL, both dbus-0.62-r1 and
dbus-glib-0.71-r0 are providing dbus-glib. And default
local.conf without explicit PREFERRED_PROVIDER_dbus-glib
specification selects dbus-0.62-r1 as the dbus-glib provider.

In this case, dbus-0.62-r1 fails to build with clean tmpdir
(surely try with clean tmpdir) because its dependency
'dbus-native' selects dbus-0.92-r1 and it does not contain the
two files dbus-bus-introspect.xml and dbus-glib-bindings.h which
dbus-0.62-r1 requires by the 'dbus-native' dependency. Since the
files were split off into dbus-glib since dbus-0.92, dbus-0.62
must explicitly depend on dbus-native-0.62 to acquire the files.

Apart from above problem itself, specifying
PREFERRED_PROVIDER_dbus-glib = "dbus-glib" also resolves build
error by 'bitbake dbus-glib'. Is it going to be default? Or each
distribution should specify it independently?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


