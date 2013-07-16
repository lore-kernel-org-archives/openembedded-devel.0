Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01BD26B1D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:12:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6GACev2029382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2013 03:12:40 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 16 Jul 2013 03:12:39 -0700
Message-ID: <51E51C96.9070003@windriver.com>
Date: Tue, 16 Jul 2013 18:12:38 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1373866728-25591-1-git-send-email-rongqing.li@windriver.com>
	<1851800.D2rivkS0WA@helios>
In-Reply-To: <1851800.D2rivkS0WA@helios>
Cc: openembedded-devel@lists.openembedded.org, Joe.macdonald@windriver.com
Subject: Re: [PATCH] Upgrade vsftpd to 3.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 10:12:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/16/2013 05:32 PM, Paul Eggleton wrote:
> Hi Roy,
>
> On Monday 15 July 2013 13:38:48 rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   .../recipes-daemons/vsftpd/files/vsftpd.conf       |   43 +++++++++--
>>   .../recipes-daemons/vsftpd/files/vsftpd.ftpusers   |   15 ++++
>>   .../recipes-daemons/vsftpd/files/vsftpd.user_list  |   20 ++++++
>>   .../vsftpd/vsftpd-2.3.5/makefile-destdir.patch     |   44 ------------
>>   .../vsftpd/vsftpd-2.3.5/makefile-libs.patch        |   21 ------
>>   .../vsftpd/vsftpd-2.3.5/makefile-strip.patch       |   17 -----
>>   .../vsftpd/vsftpd-2.3.5/nopam.patch                |   16 -----
>>   .../vsftpd/vsftpd-3.0.0/makefile-destdir.patch     |   44 ++++++++++++
>>   .../vsftpd/vsftpd-3.0.0/makefile-libs.patch        |   21 ++++++
>>   .../vsftpd/vsftpd-3.0.0/makefile-strip.patch       |   17 +++++
>>   .../vsftpd/vsftpd-3.0.0/nopam.patch                |   16 +++++
>>   .../vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch |   25 +++++++
>>   .../recipes-daemons/vsftpd/vsftpd_2.3.5.bb         |   51 -------------
>>   .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |   75
>> ++++++++++++++++++++ 14 files changed, 270 insertions(+), 155 deletions(-)
>>   mode change 100755 => 100644
>> meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf create mode 100644
>> meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers create mode
>> 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list delete
>> mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
>> delete mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>> delete mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>> delete mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch create mode
>> 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch
>> create mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>> create mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>> create mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch create mode
>> 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-sup
>> port.patch delete mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb create mode 100644
>> meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>>
>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>> b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf old mode 100755
>> new mode 100644
>> index 08f91e0..bb19294
>> --- a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>> @@ -12,17 +12,17 @@
>>   listen=YES
>>
>>   # Allow anonymous FTP? (Beware - allowed by default if you comment this
>> out). -anonymous_enable=YES
>> +anonymous_enable=NO
>>   #
>>   # Uncomment this to allow local users to log in.
>> -#local_enable=YES
>> +local_enable=YES
>>   #
>>   # Uncomment this to enable any form of FTP write command.
>>   write_enable=YES
>>   #
>>   # Default umask for local users is 077. You may wish to change this to 022,
>> # if your users expect that (022 is used by most other ftpd's)
>> -#local_umask=022
>> +local_umask=022
>>   #
>>   # Uncomment this to allow the anonymous FTP user to upload files. This only
>> # has an effect if the above global write enable is activated. Also, you
>> will @@ -54,7 +54,7 @@ connect_from_port_20=YES
>>   #xferlog_file=/var/log/vsftpd.log
>>   #
>>   # If you want, you can have your log file in standard ftpd xferlog format
>> -#xferlog_std_format=YES
>> +xferlog_std_format=YES
>>   #
>>   # You may change the default value for timing out an idle session.
>>   #idle_session_timeout=600
>> @@ -64,7 +64,7 @@ connect_from_port_20=YES
>>   #
>>   # It is recommended that you define on your system a unique user which the
>>   # ftp server can use as a totally isolated and unprivileged user.
>> -#nopriv_user=ftpsecure
>> +#nopriv_user=ftp
>>   #
>>   # Enable this and the server will recognise asynchronous ABOR requests. Not
>> # recommended for security (the code is non-trivial). Not enabling it, @@
>> -105,4 +105,35 @@ connect_from_port_20=YES
>>   # sites. However, some broken FTP clients such as "ncftp" and "mirror"
>> assume # the presence of the "-R" option, so there is a strong case for
>> enabling it. #ls_recurse_enable=YES
>> -
>> +#
>> +# This string is the name of the PAM service vsftpd will use.
>> +pam_service_name=vsftpd
>> +#
>> +# This option is examined if userlist_enable is activated. If you set this
>> +# setting to NO, then users will be denied login  unless  they are
>> explicitly +# listed  in the file specified by userlist_file.  When login
>> is denied, the +# denial is issued before the user is asked for a password.
>> +userlist_deny=YES
>> +#
>> +# If enabled, vsftpd will load a list of usernames, from the filename given
>> by +# userlist_file.  If a user tries to log in using  a  name in  this
>> file,  they +# will be denied before they are asked for a password. This
>> may be useful in +# preventing cleartext passwords being transmitted. See
>> also userlist_deny. +userlist_enable=YES
>> +#
>> +# If enabled,  vsftpd  will display directory listings with the time in
>> your +# local time zone. The default is to display GMT. The times returned
>> by the +# MDTM FTP command are also affected by this option.
>> +use_localtime=YES
>> +#
>> +# If set to YES, local users will be (by default) placed in a chroot() jail
>> in +# their home directory after login.  Warning: This  option has
>> security +# implications,  especially  if  the users have upload
>> permission, or shell access. +# Only enable if you know what you are doing.
>>   Note that these security implications +# are not vsftpd specific. They
>> apply to all FTP daemons which offer to put +# local  users in chroot()
>> jails.
>> +chroot_local_user=YES
>> +#
>> +allow_writeable_chroot=YES
>> +#
>> +tcp_wrappers=YES
>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
>> b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers new file
>> mode 100644
>> index 0000000..096142f
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
>> @@ -0,0 +1,15 @@
>> +# Users that are not allowed to login via ftp
>> +root
>> +bin
>> +daemon
>> +adm
>> +lp
>> +sync
>> +shutdown
>> +halt
>> +mail
>> +news
>> +uucp
>> +operator
>> +games
>> +nobody
>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>> b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list new file
>> mode 100644
>> index 0000000..3e2760f
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>> @@ -0,0 +1,20 @@
>> +# vsftpd userlist
>> +# If userlist_deny=NO, only allow users in this file
>> +# If userlist_deny=YES (default), never allow users in this file, and
>> +# do not even prompt for a password.
>> +# Note that the default vsftpd pam config also checks /etc/vsftpd/ftpusers
>> +# for users that are denied.
>> +root
>> +bin
>> +daemon
>> +adm
>> +lp
>> +sync
>> +shutdown
>> +halt
>> +mail
>> +news
>> +uucp
>> +operator
>> +games
>> +nobody
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patc
>> h
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patc
>> h deleted file mode 100644
>> index ee37f26..0000000
>> ---
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patc
>> h +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -Use DESTDIR within install to allow installing under a prefix
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> -
>> -diff --git a/Makefile b/Makefile
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -24,21 +24,21 @@ vsftpd: $(OBJS)
>> - 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS) $(LDFLAGS)
>> -
>> - install:
>> --	if [ -x /usr/local/sbin ]; then \
>> --		$(INSTALL) -m 755 vsftpd /usr/local/sbin/vsftpd; \
>> -+	if [ -x ${DESTDIR}/usr/local/sbin ]; then \
>> -+		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/local/sbin/vsftpd; \
>> - 	else \
>> --		$(INSTALL) -m 755 vsftpd /usr/sbin/vsftpd; fi
>> --	if [ -x /usr/local/man ]; then \
>> --		$(INSTALL) -m 644 vsftpd.8 /usr/local/man/man8/vsftpd.8; \
>> --		$(INSTALL) -m 644 vsftpd.conf.5 /usr/local/man/man5/vsftpd.conf.5; \
>> --	elif [ -x /usr/share/man ]; then \
>> --		$(INSTALL) -m 644 vsftpd.8 /usr/share/man/man8/vsftpd.8; \
>> --		$(INSTALL) -m 644 vsftpd.conf.5 /usr/share/man/man5/vsftpd.conf.5; \
>> -+		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/sbin/vsftpd; fi
>> -+	if [ -x ${DESTDIR}/usr/local/man ]; then \
>> -+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/local/man/man8/vsftpd.8; \
>> -+		$(INSTALL) -m 644 vsftpd.conf.5
>> ${DESTDIR}/usr/local/man/man5/vsftpd.conf.5; \ -+	elif [ -x
>> ${DESTDIR}/usr/share/man ]; then \
>> -+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/share/man/man8/vsftpd.8; \
>> -+		$(INSTALL) -m 644 vsftpd.conf.5
>> ${DESTDIR}/usr/share/man/man5/vsftpd.conf.5; \ - 	else \
>> --		$(INSTALL) -m 644 vsftpd.8 /usr/man/man8/vsftpd.8; \
>> --		$(INSTALL) -m 644 vsftpd.conf.5 /usr/man/man5/vsftpd.conf.5; fi
>> --	if [ -x /etc/xinetd.d ]; then \
>> --		$(INSTALL) -m 644 xinetd.d/vsftpd /etc/xinetd.d/vsftpd; fi
>> -+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/man/man8/vsftpd.8; \
>> -+		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/man/man5/vsftpd.conf.5;
>> fi -+	if [ -x ${DESTDIR}/etc/xinetd.d ]; then \
>> -+		$(INSTALL) -m 644 xinetd.d/vsftpd ${DESTDIR}/etc/xinetd.d/vsftpd; fi
>> -
>> - clean:
>> - 	rm -f *.o *.swp vsftpd
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>> deleted file mode 100644
>> index 6a419db..0000000
>> ---
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -Hardcode LIBS instead of using a script to determine available libs
>> -
>> -We want to avoid this dynamic detection so we have a deterministic
>> -build.
>> -
>> -Upstream-Status: Inappropriate [config]
>> -
>> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> -
>> -diff --git a/Makefile b/Makefile
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -5,7 +5,7 @@ IFLAGS  = -idirafter dummyinc
>> - #CFLAGS = -g
>> - CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>> -
>> --LIBS	=	`./vsf_findlibs.sh`
>> -+LIBS	=	-lssl -lcrypto -lnsl -lresolv
>> - LINK	=	-Wl,-s
>> -
>> - OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>> deleted file mode 100644
>> index a2e0cd0..0000000
>> ---
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Disable stripping at link time
>> -
>> -Upstream-Status: Inappropriate [config]
>> -
>> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> -
>> -diff --git a/Makefile b/Makefile
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -6,7 +6,6 @@ IFLAGS  = -idirafter dummyinc
>> - CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>> -
>> - LIBS	=	-lssl -lcrypto -lnsl -lresolv
>> --LINK	=	-Wl,-s
>> -
>> - OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
>> - 		tunables.o ftpdataio.o secbuf.o ls.o \
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch deleted
>> file mode 100644
>> index cf0d68e..0000000
>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Disable PAM
>> -
>> -Upstream-Status: Inappropriate [config]
>> -
>> -diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
>> ---- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
>> -+++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
>> -@@ -2,7 +2,7 @@
>> - #define VSF_BUILDDEFS_H
>> -
>> - #undef VSF_BUILD_TCPWRAPPERS
>> --#define VSF_BUILD_PAM
>> -+#undef VSF_BUILD_PAM
>> - #undef VSF_BUILD_SSL
>> -
>> - #endif /* VSF_BUILDDEFS_H */
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patc
>> h
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patc
>> h new file mode 100644
>> index 0000000..1980d09
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patc
>> h @@ -0,0 +1,44 @@
>> +Use DESTDIR within install to allow installing under a prefix
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> +
>> +diff --git a/Makefile b/Makefile
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -24,21 +24,21 @@
>> + 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
>> +
>> + install:
>> +-	if [ -x /usr/local/sbin ]; then \
>> +-		$(INSTALL) -m 755 vsftpd /usr/local/sbin/vsftpd; \
>> ++	if [ -x ${DESTDIR}/usr/local/sbin ]; then \
>> ++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/local/sbin/vsftpd; \
>> + 	else \
>> +-		$(INSTALL) -m 755 vsftpd /usr/sbin/vsftpd; fi
>> +-	if [ -x /usr/local/man ]; then \
>> +-		$(INSTALL) -m 644 vsftpd.8 /usr/local/man/man8/vsftpd.8; \
>> +-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/local/man/man5/vsftpd.conf.5; \
>> +-	elif [ -x /usr/share/man ]; then \
>> +-		$(INSTALL) -m 644 vsftpd.8 /usr/share/man/man8/vsftpd.8; \
>> +-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/share/man/man5/vsftpd.conf.5; \
>> ++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/sbin/vsftpd; fi
>> ++	if [ -x ${DESTDIR}/usr/local/man ]; then \
>> ++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/local/man/man8/vsftpd.8; \
>> ++		$(INSTALL) -m 644 vsftpd.conf.5
>> ${DESTDIR}/usr/local/man/man5/vsftpd.conf.5; \ ++	elif [ -x
>> ${DESTDIR}/usr/share/man ]; then \
>> ++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/share/man/man8/vsftpd.8; \
>> ++		$(INSTALL) -m 644 vsftpd.conf.5
>> ${DESTDIR}/usr/share/man/man5/vsftpd.conf.5; \ + 	else \
>> +-		$(INSTALL) -m 644 vsftpd.8 /usr/man/man8/vsftpd.8; \
>> +-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/man/man5/vsftpd.conf.5; fi
>> +-	if [ -x /etc/xinetd.d ]; then \
>> +-		$(INSTALL) -m 644 xinetd.d/vsftpd /etc/xinetd.d/vsftpd; fi
>> ++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/man/man8/vsftpd.8; \
>> ++		$(INSTALL) -m 644 vsftpd.conf.5
> ${DESTDIR}/usr/man/man5/vsftpd.conf.5;
>> fi ++	if [ -x ${DESTDIR}/etc/xinetd.d ]; then \
>> ++		$(INSTALL) -m 644 xinetd.d/vsftpd ${DESTDIR}/etc/xinetd.d/vsftpd; fi
>> +
>> + clean:
>> + 	rm -f *.o *.swp vsftpd
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>> new file mode 100644
>> index 0000000..9a10f72
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>> @@ -0,0 +1,21 @@
>> +Hardcode LIBS instead of using a script to determine available libs
>> +
>> +We want to avoid this dynamic detection so we have a deterministic
>> +build.
>> +
>> +Upstream-Status: Inappropriate [config]
>> +
>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> +
>> +diff --git a/Makefile b/Makefile
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -5,7 +5,7 @@
>> + #CFLAGS = -g
>> + CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>> +
>> +-LIBS	=	`./vsf_findlibs.sh`
>> ++LIBS	=	-lssl -lcrypto -lnsl -lresolv
>> + LINK	=	-Wl,-s
>> +
>> + OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>> new file mode 100644
>> index 0000000..fd31600
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>> @@ -0,0 +1,17 @@
>> +Disable stripping at link time
>> +
>> +Upstream-Status: Inappropriate [config]
>> +
>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> +
>> +diff --git a/Makefile b/Makefile
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -9,7 +9,6 @@ CFLAGS	=	-O2 -fPIE -fstack-protector
>> --param=ssp-buffer-size=4 \ + 	#-pedantic -Wconversion
>> +
>> + LIBS	=	-lssl -lcrypto -lnsl -lresolv
>> +-LINK	=	-Wl,-s
>> + LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
>> +
>> + OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch new file
>> mode 100644
>> index 0000000..cf0d68e
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
>> @@ -0,0 +1,16 @@
>> +Disable PAM
>> +
>> +Upstream-Status: Inappropriate [config]
>> +
>> +diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
>> +--- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
>> ++++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
>> +@@ -2,7 +2,7 @@
>> + #define VSF_BUILDDEFS_H
>> +
>> + #undef VSF_BUILD_TCPWRAPPERS
>> +-#define VSF_BUILD_PAM
>> ++#undef VSF_BUILD_PAM
>> + #undef VSF_BUILD_SSL
>> +
>> + #endif /* VSF_BUILDDEFS_H */
>> diff --git
>> a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-s
>> upport.patch
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-s
>> upport.patch new file mode 100644
>> index 0000000..69745b3
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-s
>> upport.patch @@ -0,0 +1,25 @@
>> +Enable tcp_wrapper.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> +---
>> + builddefs.h |    2 +-
>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/builddefs.h b/builddefs.h
>> +index e908352..0106d1a 100644
>> +--- a/builddefs.h
>> ++++ b/builddefs.h
>> +@@ -1,7 +1,7 @@
>> + #ifndef VSF_BUILDDEFS_H
>> + #define VSF_BUILDDEFS_H
>> +
>> +-#undef VSF_BUILD_TCPWRAPPERS
>> ++#define VSF_BUILD_TCPWRAPPERS
>> + #define VSF_BUILD_PAM
>> + #undef VSF_BUILD_SSL
>> +
>> +--
>> +1.7.1
>> +
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb deleted file mode
>> 100644
>> index f146910..0000000
>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -SUMMARY = "Very Secure FTP server"
>> -HOMEPAGE = "https://security.appspot.com/vsftpd.html"
>> -SECTION = "network"
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
>> -
>> -DEPENDS = "libcap openssl"
>> -
>> -SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>> -           file://makefile-destdir.patch \
>> -           file://makefile-libs.patch \
>> -           file://makefile-strip.patch \
>> -           file://nopam.patch \
>> -           file://init \
>> -           file://vsftpd.conf"
>> -
>> -SRC_URI[md5sum] = "01398a5bef8e85b6cf2c213a4b011eca"
>> -SRC_URI[sha256sum] =
>> "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca965f6e2f60879e54f1" -
>> -inherit update-rc.d useradd
>> -
>> -CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
>> -LDFLAGS_append =" -lcrypt -lcap"
>> -
>> -do_configure() {
>> -    # Fix hardcoded /usr, /etc, /var mess.
>> -    cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed
>> s:\"/var:\"${localstatedir}:g \ -    |sed
>> s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed
>> s:\"/etc:\"${sysconfdir}:g > tunables.c.new -    mv tunables.c.new
>> tunables.c
>> -}
>> -
>> -do_install() {
>> -    install -d ${D}${sbindir}
>> -    install -d ${D}${mandir}/man8
>> -    install -d ${D}${mandir}/man5
>> -    oe_runmake 'DESTDIR=${D}' install
>> -    install -d ${D}${sysconfdir}
>> -    install -m 0755 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>> -    install -d ${D}${sysconfdir}/init.d/
>> -    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
>> -}
>> -
>> -INITSCRIPT_PACKAGES = "${PN}"
>> -INITSCRIPT_NAME_${PN} = "vsftpd"
>> -INITSCRIPT_PARAMS_${PN} = "defaults 80"
>> -
>> -USERADD_PACKAGES = "${PN}"
>> -USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g
>> ftp \ -                       --shell /bin/false ftp "
>> -GROUPADD_PARAM_${PN} = "-r ftp"
>> -
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>> b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb new file mode
>> 100644
>> index 0000000..843a213
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>> @@ -0,0 +1,75 @@
>> +SUMMARY = "Very Secure FTP server"
>> +HOMEPAGE = "https://security.appspot.com/vsftpd.html"
>> +SECTION = "network"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
>> +
>> +DEPENDS = "libcap openssl tcp-wrappers"
>> +
>> +SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>> +           file://makefile-destdir.patch \
>> +           file://makefile-libs.patch \
>> +           file://makefile-strip.patch \
>> +           file://vsftpd-tcp_wrappers-support.patch \
>> +           file://init \
>> +           file://vsftpd.conf \
>> +           file://vsftpd.user_list \
>> +           file://vsftpd.ftpusers \
>> +"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
>> +
>> file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \ +
>>       file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb" +SRC_URI[md5sum]
>> = "ad9fa952558c2c5b0426ccaccff0f972"
>> +SRC_URI[sha256sum] =
>> "ef70205dcd0c7f03b008b9578fb44c0cbe31e66daab8cfafb9904747c17fc2a8" +
>> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>> +RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam',
>> 'pam-plugin-listfile', '', d)}" +SRC_URI +=
>> "${@base_contains('DISTRO_FEATURES', 'pam', '', 'file://nopam.patch', d)}"
>> +PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam',
>> '-L${STAGING_BASELIBDIR} -lpam', '', d)}" +
>> +inherit update-rc.d useradd
>> +
>> +CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
>> +LDFLAGS_append =" -lcrypt -lcap"
>> +
>> +do_configure() {
>> +    # Fix hardcoded /usr, /etc, /var mess.
>> +    cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed
>> s:\"/var:\"${localstatedir}:g \ +    |sed
>> s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed
>> s:\"/etc:\"${sysconfdir}:g > tunables.c.new +    mv tunables.c.new
>> tunables.c
>> +}
>> +
>> +do_compile() {
>> +   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${sbindir}
>> +    install -d ${D}${mandir}/man8
>> +    install -d ${D}${mandir}/man5
>> +    oe_runmake 'DESTDIR=${D}' install
>> +    install -d ${D}${sysconfdir}
>> +    install -d ${D}${sysconfdir}/init.d/
>> +    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
>> +
>> +    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>> +    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>> +    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
>> +    if ! test -z ${PAMLIB} ; then
>> +        install -d ${D}${sysconfdir}/pam.d/
>> +        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
>> +        sed -i "s:/lib/security:${base_libdir}/security:"
>> ${D}${sysconfdir}/pam.d/vsftpd +        sed -i
>> "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd +    fi
>> +}
>> +
>> +INITSCRIPT_PACKAGES = "${PN}"
>> +INITSCRIPT_NAME_${PN} = "vsftpd"
>> +INITSCRIPT_PARAMS_${PN} = "defaults 80"
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g
>> ftp \ +                       --shell /bin/false ftp "
>> +GROUPADD_PARAM_${PN} = "-r ftp"
>> +
>
> Did you send this with -M? It's hard to see what the changes are. I can
> however see the changes to the example configuration, why were these done and
> not mentioned in the commit message?

Sorry, I will resend it with -M.

Thanks

-Roy

>
> Cheers,
> Paul
>

-- 
Best Reagrds,
Roy | RongQing Li

