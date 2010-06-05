Received: from asmtpout025.mac.com ([17.148.16.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OKwyd-0007zN-SK
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 19:16:09 +0200
MIME-version: 1.0
Received: from [192.168.1.104] ([87.201.169.38])
	by asmtp025.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L3J007GFUAN6L90@asmtp025.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	05 Jun 2010 09:11:16 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1006050097
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=1.12.8161:2.4.5,1.2.40,4.0.166
	definitions=2010-06-05_01:2010-02-06, 2010-06-04,
	2010-06-04 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sat, 05 Jun 2010 20:11:08 +0400
Message-id: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 17.148.16.100
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: autologin recipe for gumstix Overo
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
X-List-Received-Date: Sat, 05 Jun 2010 17:16:09 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
       For the autologin.bb recipe that is shown below, the pkg_postinst and the pkg_prerm parts do not run correctly. the /etc/inittab file does not get modified. I've had to manually modify the inittab file by hand, and additionally create a text file /usr/autologin.profile with the text root in the autologin.profile file. 

Could someone suggest how this recipe can be modified so that 

a. the following text in the /etc/inittab file to be modified such that

S:2345:respawn:/sbin/getty 115200 ttyS2 

is changed to 

S:2345:respawn:/sbin/getty -n -l /usr/bin/autologin 115200 ttyS2

and 

1:2345:respawn:/sbin/getty 38400 tty1

is changed to 

1:2345:respawn:/sbin/getty -n -l /usr/bin/autologin 38400 tty1


b. Create a new text file called /usr/autologin.profile with the following text

root


Here are some links to the original instructions:

http://www.gumstix.net/wiki/index.php?title=AutoLogin
http://old.nabble.com/A-very-unique-auto-login-on-verdex-td28224459.html#a28517599
http://littlesvr.ca/linux-stuff/articles/autologinconsole/autologinconsole.php


Best regards,

Elvis Dowson



DESCRIPTION = "Automatically login to console as root user with no prompt"
SECTION = "bin"
LICENSE = "GPL"
RDEPENDS="tinylogin sed"
PACKAGES ="${PN}"
PR = "r0"

SRC_URI = " \
	file://src/autologin.c \ 
	"
	
S = "${WORKDIR}"

#inherit autotools_stage
#AUTOTOOLS_STAGE_PKGCONFIG = 1

#do_stage() {
#	autotools_stage_all
#}

do_compile () {
   ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/src/autologin.c -o autologin
}

do_install () {
   install -d ${D}${bindir}/
   install -m 0755 ${WORKDIR}/autologin ${D}${bindir}/
}

pkg_postinst_${PN} () {
  sed 's_S:2345:respawn:/sbin/getty_S:2345:respawn:/sbin/getty -n -l /usr/bin/autologin_' /etc/inittab > inittab.tmp
  mv inittab.tmp /etc/inittab
  passwd -d root
  echo 'NOTE: remove the password from the root account'
  rm inittab.tmp
}

pkg_prerm_${PN} () {
  sed 's_ -n -l /usr/bin/autologin__' /etc/inittab > inittab.tmp
  mv inittab.tmp /etc/inittab
  echo 'NOTE: there is still no password on the root account'
  rm inittab.tmp
}


PACKAGES = "${PN}"
FILES_${PN} = "${bindir}/autologin"






