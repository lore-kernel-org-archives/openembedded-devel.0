Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GL5MF-0002Gd-Hk for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 23:54:55 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 8B60E401B46; Wed,  6 Sep 2006 14:30:57 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906213057.8B60E401B46@tinman.treke.net>
Date: Wed,  6 Sep 2006 14:30:57 -0700 (PDT)
Subject: [Bug 1115] libgcrypt_1.2.2.bb fails to compile with MACHINE=native
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
X-List-Received-Date: Wed, 06 Sep 2006 21:54:56 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1115


yamaken@bp.iij4u.or.jp changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




------- Comment #3 from yamaken@bp.iij4u.or.jp  2006-09-06 14:30 -------
libgcrypt-1.2.2-r0 has successfully been built with clean tmp on
not-locally-modified recent OE tree. Thanks for responding.

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "5c42f9ce62648e7c8f6308ada5e7d7d7eb900b36"
TARGET_ARCH    = "i686"
TARGET_OS      = "linux"
MACHINE        = "native"
DISTRO         = "openzaurus"
DISTRO_VERSION = ".dev-snapshot-20060906"
TARGET_FPU     = "soft"

This build has succeeded all four AC_CHECK_SIZEOF previously failed (= set to
zero). I don't know what affected previous failure of AC_CHECK_SIZEOF. The
latent bug of original libgcrypt-1.2.2 source (which my patch works on) will
re-appear only if OE build environment failed to AC_CHECK_SIZEOF.

tmp/work/i686-linux/libgcrypt-1.2.2-r0/libgcrypt-1.2.2/config.h (previous
build):
----------------------------------------------------------------
/* The size of a `unsigned int', as computed by sizeof. */
#define SIZEOF_UNSIGNED_INT 0

/* The size of a `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 0

/* The size of a `unsigned long long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG_LONG 0

/* The size of a `unsigned short', as computed by sizeof. */
#define SIZEOF_UNSIGNED_SHORT 0
----------------------------------------------------------------


tmp/work/i686-linux/libgcrypt-1.2.2-r0/libgcrypt-1.2.2/config.h (current
build):
----------------------------------------------------------------
/* The size of a `unsigned int', as computed by sizeof. */
#define SIZEOF_UNSIGNED_INT 4

/* The size of a `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 4

/* The size of a `unsigned long long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG_LONG 8

/* The size of a `unsigned short', as computed by sizeof. */
#define SIZEOF_UNSIGNED_SHORT 2
----------------------------------------------------------------


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


