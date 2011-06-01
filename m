Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QRpdC-0004im-Sr
	for Openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 19:54:59 +0200
Received: by gwb11 with SMTP id 11so20739gwb.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=EI1W/s8z2Fi30s/M0ZD1z4YnCs/pRYoTnTvgbIl8oN8=;
	b=Ko3dfWCDh3Jv7AJoNfzN8yFcOPyFFMNmUNzar9KA8yHUq+U16KpoC2FglTLjzfjjWw
	lXkmF+Tb8dPzoovThLdrzScrByMKfBfd/JMpzF+yV+bhI6UPMWensuo5i8zQ5SpsBXVG
	vs/+5a5wtz68eN0oKhhOTv9dEUnE2yeWh7S3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MJHO9rD0SeJOleWMXVMfeoBYCWJbTjVdveH9eOQFF87bCnhfJDmhwRyGxJBuo37pNs
	tFAzXdi7+0WPNdbrVYlUbC+dVjzn8QPgjvfjCXcZS76D2H17dWgBnEKQnqRb6MY+q+6K
	TYeEQwXYS/aXnAOm2x6m9LOP6bujqg5erkdFs=
MIME-Version: 1.0
Received: by 10.236.180.101 with SMTP id i65mr9631349yhm.493.1306950707436;
	Wed, 01 Jun 2011 10:51:47 -0700 (PDT)
Received: by 10.236.154.201 with HTTP; Wed, 1 Jun 2011 10:51:47 -0700 (PDT)
Date: Wed, 1 Jun 2011 13:51:47 -0400
Message-ID: <BANLkTik9khWBXixj=_LDj5pGdi=PO=0WbA@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] perl-native multilib patch for ubuntu 11.04
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
X-List-Received-Date: Wed, 01 Jun 2011 17:54:59 -0000
Content-Type: text/plain; charset=UTF-8

When I try to build perl-native under ubuntu 11.04 x86_64 from
2011.03-maintenance branch
it fails unless I cherry-pick
commit 86fde1fe0281cc8c9d2bf1012d8eff5e24a69e55  can we put this in
the 2011.03-maintenance branch?

cherry-pick: 86fde1fe0281cc8c9d2bf1012d8eff5e24a69e55
Tested-by: george huntington <george.huntingtoniii@gmail.com>




Original patch from Scott Ellis
Modified by US replacing `uname -m` by '*' to support non x86_64 targets
(based on recommendations on the mailing list)

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/perl/files/ubuntu-11.04-multiarch.patch |   12 ++++++++++++
 recipes/perl/perl-native_5.10.1.bb              |    3 +++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/recipes/perl/files/ubuntu-11.04-multiarch.patch
b/recipes/perl/files/ubuntu-11.04-multiarch.patch
new file mode 100644
index 0000000..4f51eb3
--- /dev/null
+++ b/recipes/perl/files/ubuntu-11.04-multiarch.patch
@@ -0,0 +1,12 @@
+diff --git perl-5.10.1/Configure-orig perl-5.10.1/Configure
+index 5508fd2..8ee7dae 100755
+--- perl-5.10.1/Configure-orig
++++ perl-5.10.1/Configure
+@@ -1311,6 +1311,7 @@ glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
+ glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
+ test -f /usr/shlib/libc.so && glibpth="/usr/shlib $glibpth"
+ test -f /shlib/libc.so     && glibpth="/shlib $glibpth"
++test -f /usr/lib/*-linux-gnu/libc.so && glibpth="/usr/lib/*-linux-gnu
$glibpth"
+ test -d /usr/lib64         && glibpth="$glibpth /lib64 /usr/lib64
/usr/local/lib64"
+
+ : Private path used by Configure to find libraries.  Its value
diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/
perl-native_5.10.1.bb
index 5aa0c7b..3dafc10 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "
http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
            file://native-nopacklist.patch \
            file://native-perlinc.patch \
    file://perl-fix-cross-library-check.patch \
+           file://ubuntu-11.04-multiarch.patch \
    "

 SRC_URI[perl-5.10.1.md5sum] = "b9b2fdb957f50ada62d73f43ee75d044"
@@ -29,6 +30,8 @@ S = "${WORKDIR}/perl-${PV}"

 inherit native

+export LD="${CC}"
+
 do_configure () {
     ./Configure \
         -Dcc="${CC}" \
-- 
1.7.4.1

