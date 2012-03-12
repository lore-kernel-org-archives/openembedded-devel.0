Received: from nk11p03mm-asmtp995.mac.com ([17.158.233.226]
	helo=nk11p99mm-asmtpout005.mac.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.zauner@me.com>) id 1S7Cap-0002OB-AJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2012 22:15:47 +0100
MIME-version: 1.0
Received: from [10.0.1.2] (pD9F67E87.dip.t-dialin.net [217.246.126.135])
	by nk11p03mm-asmtp995.mac.com
	(Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit
	(built Aug
	10 2011)) with ESMTPSA id <0M0S00IA6INAMY80@nk11p03mm-asmtp995.mac.com>
	for openembedded-devel@lists.openembedded.org; Mon,
	12 Mar 2012 21:06:49 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.6.7498,1.0.260,0.0.0000
	definitions=2012-03-12_05:2012-03-12, 2012-03-12,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=1 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx scancount=1 engine=6.0.2-1012030000
	definitions=main-1203120246
From: Daniel Zauner <daniel.zauner@me.com>
In-reply-to: <20120312210046.GC9300@denix.org>
Date: Mon, 12 Mar 2012 22:06:45 +0100
Message-id: <CD70E85B-DF24-4844-8DD7-09D893416344@me.com>
References: <1331273267-17295-1-git-send-email-daniel.zauner@me.com>
	<20120312210046.GC9300@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
Subject: Re: [PATCH v2 [2011.03-maintenance]] Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org
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
X-List-Received-Date: Mon, 12 Mar 2012 21:15:47 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Thanks, will do. 
Do you want me to re-submit the patch?

Daniel

Am 12.03.2012 um 22:00 schrieb Denys Dmytriyenko:

> Two comments:
> 
> 1. The patch description got messed up and went all in the Subject. Don't use 
> nested square brackets [[]], use them in sequence [][] or just one of those.
> 
> 2. Use -M flag to git-format-patch so it catches the rename and makes the 
> patch readable again.
> 
> -- 
> Denys
> 
> 
> On Fri, Mar 09, 2012 at 07:07:47AM +0100, Daniel Zauner wrote:
>> Signed-off-by: Daniel Zauner <daniel.zauner@me.com>
>> ---
>> recipes/opkg-utils/opkg-utils_git.bb |   27 +++++++++++++++++++++++++++
>> recipes/opkg-utils/opkg-utils_svn.bb |   25 -------------------------
>> 2 files changed, 27 insertions(+), 25 deletions(-)
>> create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
>> delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
>> 
>> diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
>> new file mode 100644
>> index 0000000..6adc7c1
>> --- /dev/null
>> +++ b/recipes/opkg-utils/opkg-utils_git.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "OPKG Package Manager Utilities"
>> +SECTION = "base"
>> +HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
>> +PRIORITY = "optional"
>> +LICENSE = "GPLv2"
>> +RDEPENDS_${PN} = "python"
>> +RDEPENDS_${PN}_virtclass-native = ""
>> +SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
>> +PV = "0.1.8+gitr${SRCPV}"
>> +PR = "r0"
>> +
>> +SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
>> +           file://index-ignore-filenotfound.patch \
>> +           file://arfile_header_split.patch \
>> +           file://mtime-int.patch"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +# Avoid circular dependencies from package_ipk.bbclass
>> +PACKAGES_virtclass-native = ""
>> +
>> +do_install() {
>> +        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
>> deleted file mode 100644
>> index 6b8d3ea..0000000
>> --- a/recipes/opkg-utils/opkg-utils_svn.bb
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -DESCRIPTION = "OPKG Package Manager Utilities"
>> -SECTION = "base"
>> -HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
>> -PRIORITY = "optional"
>> -RDEPENDS_${PN} = "python"
>> -RDEPENDS_${PN}_virtclass-native = ""
>> -SRCREV = "4747"
>> -PV = "0.1.8+svnr${SRCPV}"
>> -PR = "r6"
>> -
>> -SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>> -           file://index-ignore-filenotfound.patch \
>> -           file://mtime-int.patch"
>> -
>> -S = "${WORKDIR}/opkg-utils"
>> -
>> -# Avoid circular dependencies from package_ipk.bbclass
>> -PACKAGES_virtclass-native = ""
>> -
>> -do_install() {
>> -        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>> -}
>> -
>> -BBCLASSEXTEND = "native"
>> -TARGET_CC_ARCH += "${LDFLAGS}"
>> -- 
>> 1.7.2.5
>> 
>> 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



