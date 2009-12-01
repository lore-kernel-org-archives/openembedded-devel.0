Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NFZoO-0003Av-JM for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 21:59:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NFZms-0006cK-EL
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 21:57:30 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 21:57:30 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 21:57:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Dec 2009 21:57:03 +0100
Message-ID: <hf3vuv$db3$1@ger.gmane.org>
References: <loom.20091201T214744-304@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <loom.20091201T214744-304@post.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg-sdk svn r420 build failure
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
X-List-Received-Date: Tue, 01 Dec 2009 20:59:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-12-09 21:49, Jeremy Williams wrote:
> After git pull, noticed I could no longer build opkg 402
> (rev bumped on 11/30 by koen).
>
> Found while attempting to build meta-toolchain.

Could try bumping it to r413? That should have a fix for the TRUE/FALSE 
issue. Next time I'll check opkg-sdk as well when bumping SRCREV.

regards,

Koen

>
> Machine: Sequoia (PPC440)
> Distro: Angstrom latest
>
> Here is the log...
>
> ERROR: log data follows
> (/opt/OE/openembedded/tmp/work/i686-ppc440e-sdk-angstrom-linux/opkg-
> sdk-0.1.6+svnr402-r16/temp/log.do_compile.12765)
> | NOTE: make -j 2
> | Making all in libbb
> |   CC    gz_open.o
> |   CC    unzip.o
> |   CC    unarchive.o
> |   CC    wfopen.o
> |   CC    copy_file.o
> |   CC    copy_file_chunk.o
> |   CC    error_msg.o
> |   CC    error_msg_and_die.o
> |   CC    perror_msg.o
> |   CC    perror_msg_and_die.o
> |   CC    xreadlink.o
> |   CC    concat_path_file.o
> |   CC    verror_msg.o
> |   CC    vperror_msg.o
> |   CC    xfuncs.o
> |   CC    messages.o
> |   CC    last_char_is.o
> |   CC    make_directory.o
> |   CC    safe_strncpy.o
> |   CC    parse_mode.o
> |   CC    time_string.o
> |   CC    all_read.o
> |   CC    mode_string.o
> |   LINK  libbb.la
> | Making all in libopkg
> |   CC    args.o
> |   CC    libopkg.o
> |   CC    user.o
> |   CC    opkg.o
> |   CC    opkg_cmd.o
> |   CC    opkg_configure.o
> |   CC    opkg_download.o
> |   CC    opkg_install.o
> |   CC    opkg_upgrade.o
> |   CC    opkg_remove.o
> | In file included from opkg_download.c:50:
> | ../libbb/libbb.h:32:1: error: "FALSE" redefined
> | In file included from /usr/include/krb5.h:7,
> |                  from /usr/include/openssl/kssl.h:72,
> |                  from /usr/include/openssl/ssl.h:192,
> |                  from opkg_download.c:29:
> | /usr/include/krb5/krb5.h:187:1: error: this is the location of
> | the previous definition
> | In file included from opkg_download.c:50:
> | ../libbb/libbb.h:33:1: error: "TRUE" redefined
> | In file included from /usr/include/krb5.h:7,
> |                  from /usr/include/openssl/kssl.h:72,
> |                  from /usr/include/openssl/ssl.h:192,
> |                  from opkg_download.c:29:
> | /usr/include/krb5/krb5.h:190:1: error: this is the location of
> | the previous definition
> | make[2]: *** [opkg_download.lo] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[1]: *** [all] Error 2
> | make: *** [all-recursive] Error 1
> | FATAL: oe_runmake failed




