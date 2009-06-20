Received: from [17.148.16.91] (helo=asmtpout016.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI51E-0006Y4-W2
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 20:10:25 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp016.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ00C6ETYZ7R10@asmtp016.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 10:59:28 -0700 (PDT)
Message-id: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Sat, 20 Jun 2009 21:59:08 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 18:10:25 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I'm trying to create a recipe for libserial-0.6.0rc1. There is a  
folder called sip in the package. How can I modify the recipe to  
remove the sip folder from the list of files to be configured and  
compiled?

DESCRIPTION = "C++ library for serial port support."
SECTION = "libs"
LICENSE = "GPL"
HOMEPAGE = "http://libserial.sourceforge.net/mediawiki/index.php/Main_Page 
"

SRC_URI = "${SOURCEFORGE_MIRROR}/libserial/libserial-${PV}.tar.gz"

S = "${WORKDIR}/libserial-${PV}"

inherit autotools pkgconfig

do_stage() {
	autotools_stage_all
}

Best regards,

Elvis



