Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NFZgY-0002qU-Ex for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 21:51:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NFZf3-00039D-3o
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 21:49:25 +0100
Received: from 167.225.107.17 ([167.225.107.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 21:49:25 +0100
Received: from jerm7861 by 167.225.107.17 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 21:49:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Tue, 1 Dec 2009 20:49:12 +0000 (UTC)
Message-ID: <loom.20091201T214744-304@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 167.225.107.17 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091105 Fedora/3.5.5-1.fc11 Firefox/3.5.5)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: opkg-sdk svn r420 build failure
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
X-List-Received-Date: Tue, 01 Dec 2009 20:51:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

After git pull, noticed I could no longer build opkg 402 
(rev bumped on 11/30 by koen).

Found while attempting to build meta-toolchain.

Machine: Sequoia (PPC440)
Distro: Angstrom latest

Here is the log...

ERROR: log data follows
(/opt/OE/openembedded/tmp/work/i686-ppc440e-sdk-angstrom-linux/opkg-
sdk-0.1.6+svnr402-r16/temp/log.do_compile.12765)
| NOTE: make -j 2
| Making all in libbb
|   CC    gz_open.o
|   CC    unzip.o
|   CC    unarchive.o
|   CC    wfopen.o
|   CC    copy_file.o
|   CC    copy_file_chunk.o
|   CC    error_msg.o
|   CC    error_msg_and_die.o
|   CC    perror_msg.o
|   CC    perror_msg_and_die.o
|   CC    xreadlink.o
|   CC    concat_path_file.o
|   CC    verror_msg.o
|   CC    vperror_msg.o
|   CC    xfuncs.o
|   CC    messages.o
|   CC    last_char_is.o
|   CC    make_directory.o
|   CC    safe_strncpy.o
|   CC    parse_mode.o
|   CC    time_string.o
|   CC    all_read.o
|   CC    mode_string.o
|   LINK  libbb.la
| Making all in libopkg
|   CC    args.o
|   CC    libopkg.o
|   CC    user.o
|   CC    opkg.o
|   CC    opkg_cmd.o
|   CC    opkg_configure.o
|   CC    opkg_download.o
|   CC    opkg_install.o
|   CC    opkg_upgrade.o
|   CC    opkg_remove.o
| In file included from opkg_download.c:50:
| ../libbb/libbb.h:32:1: error: "FALSE" redefined
| In file included from /usr/include/krb5.h:7,
|                  from /usr/include/openssl/kssl.h:72,
|                  from /usr/include/openssl/ssl.h:192,
|                  from opkg_download.c:29:
| /usr/include/krb5/krb5.h:187:1: error: this is the location of
| the previous definition
| In file included from opkg_download.c:50:
| ../libbb/libbb.h:33:1: error: "TRUE" redefined
| In file included from /usr/include/krb5.h:7,
|                  from /usr/include/openssl/kssl.h:72,
|                  from /usr/include/openssl/ssl.h:192,
|                  from opkg_download.c:29:
| /usr/include/krb5/krb5.h:190:1: error: this is the location of 
| the previous definition
| make[2]: *** [opkg_download.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [all] Error 2
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed




