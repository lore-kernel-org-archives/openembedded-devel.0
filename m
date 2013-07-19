Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2896B118
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 00:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J0UewX019397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 17:30:40 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Jul 2013 17:30:39 -0700
Message-ID: <51E888AE.4050201@windriver.com>
Date: Fri, 19 Jul 2013 08:30:38 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Joe MacDonald <Joe.MacDonald@windriver.com>
References: <1373979075-15576-1-git-send-email-rongqing.li@windriver.com>
	<20130717184315.GA31259@windriver.com>
	<51E7A5D5.90403@windriver.com>
	<20130718131752.GA7744@windriver.com>
In-Reply-To: <20130718131752.GA7744@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0
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
X-List-Received-Date: Fri, 19 Jul 2013 00:30:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/18/2013 09:17 PM, Joe MacDonald wrote:
> [Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0] On 13.07.18 (Thu 16:22) Rongqing Li wrote:
>
>>
>>
>> On 07/18/2013 02:43 AM, Joe MacDonald wrote:
>>> Hi Roy,
>>>
>>> I merged this into my tree yesterday and on review it turns out I did
>>> have a question for you (and for anyone else on the list with an
>>> opinion) and a bit of feedback.
>>>
>>> This adds (unconditional) support for tcp-wrappers and makes it a
>>> requirement for the upgraded vsftp.  Is this something we could make
>>> conditional based on tcp-wrappers being present?  Or does anyone think
>>> this is something worth doing?  tcp-wrappers is coming from oe-core and
>>> I don't have any systems where the new requirement would be a problem,
>>> but does anyone else have a system they'd want vsftp without
>>> tcp-wrappers?
>>>
>>> A couple of other things below ...
>>>
>>> [[meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0] On 13.07.16 (Tue 20:51) rongqing.li@windriver.com wrote:
>>>
>>>> From: "Roy.Li" <rongqing.li@windriver.com>
>>>>
>>>> Upgrade vsftpd to 3.0.0 with below modification:
>>>> 1. more strict access limitation, like: do not allow anonymous access
>>>> 2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
>>>> 3. enable pam if DISTRO_FEATURE includes pam
>>>> 4. enable tcp-wrapper
>>>> 5. install vsftpd.conf with 0600 permission, not 0755
>>>>
>>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>>> ---
>>>>   .../recipes-daemons/vsftpd/files/vsftpd.conf       |   43 +++++++++++++++++---
>>>>   .../recipes-daemons/vsftpd/files/vsftpd.ftpusers   |   15 +++++++
>>>>   .../recipes-daemons/vsftpd/files/vsftpd.user_list  |   20 +++++++++
>>>>   .../makefile-destdir.patch                         |    4 +-
>>>>   .../makefile-libs.patch                            |    2 +-
>>>>   .../makefile-strip.patch                           |    6 +--
>>>>   .../{vsftpd-2.3.5 => vsftpd-3.0.0}/nopam.patch     |    0
>>>>   .../vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch |   25 ++++++++++++
>>>>   .../vsftpd/{vsftpd_2.3.5.bb => vsftpd_3.0.0.bb}    |   36 +++++++++++++---
>>>>   9 files changed, 133 insertions(+), 18 deletions(-)
>>>>   mode change 100755 => 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>>>>   create mode 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
>>>>   create mode 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>>>>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 => vsftpd-3.0.0}/makefile-destdir.patch (95%)
>>>>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 => vsftpd-3.0.0}/makefile-libs.patch (92%)
>>>>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 => vsftpd-3.0.0}/makefile-strip.patch (68%)
>>>>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 => vsftpd-3.0.0}/nopam.patch (100%)
>>>>   create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch
>>>>   rename meta-networking/recipes-daemons/vsftpd/{vsftpd_2.3.5.bb => vsftpd_3.0.0.bb} (48%)
>>>>
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>>>> old mode 100755
>>>> new mode 100644
>>>> index 08f91e0..bb19294
>>>> --- a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
>>>> @@ -12,17 +12,17 @@
>>>>   listen=YES
>>>>
>>>>   # Allow anonymous FTP? (Beware - allowed by default if you comment this out).
>>>> -anonymous_enable=YES
>>>> +anonymous_enable=NO
>>>>   #
>>>>   # Uncomment this to allow local users to log in.
>>>> -#local_enable=YES
>>>> +local_enable=YES
>>>>   #
>>>>   # Uncomment this to enable any form of FTP write command.
>>>>   write_enable=YES
>>>>   #
>>>>   # Default umask for local users is 077. You may wish to change this to 022,
>>>>   # if your users expect that (022 is used by most other ftpd's)
>>>> -#local_umask=022
>>>> +local_umask=022
>>>>   #
>>>>   # Uncomment this to allow the anonymous FTP user to upload files. This only
>>>>   # has an effect if the above global write enable is activated. Also, you will
>>>> @@ -54,7 +54,7 @@ connect_from_port_20=YES
>>>>   #xferlog_file=/var/log/vsftpd.log
>>>>   #
>>>>   # If you want, you can have your log file in standard ftpd xferlog format
>>>> -#xferlog_std_format=YES
>>>> +xferlog_std_format=YES
>>>>   #
>>>>   # You may change the default value for timing out an idle session.
>>>>   #idle_session_timeout=600
>>>> @@ -64,7 +64,7 @@ connect_from_port_20=YES
>>>>   #
>>>>   # It is recommended that you define on your system a unique user which the
>>>>   # ftp server can use as a totally isolated and unprivileged user.
>>>> -#nopriv_user=ftpsecure
>>>> +#nopriv_user=ftp
>>>>   #
>>>>   # Enable this and the server will recognise asynchronous ABOR requests. Not
>>>>   # recommended for security (the code is non-trivial). Not enabling it,
>>>> @@ -105,4 +105,35 @@ connect_from_port_20=YES
>>>>   # sites. However, some broken FTP clients such as "ncftp" and "mirror" assume
>>>>   # the presence of the "-R" option, so there is a strong case for enabling it.
>>>>   #ls_recurse_enable=YES
>>>> -
>>>> +#
>>>> +# This string is the name of the PAM service vsftpd will use.
>>>> +pam_service_name=vsftpd
>>>
>>> I haven't tried this, does it do the right thing when PAM is not present
>>> on the system?  In particular, what's it do when nopam.patch is applied?
>>> In that same vein:
>>>
>> Yes, it works well when no pam.
>>
>> It only tells vsftpd should find which files to apply pam library.
>>
>> like: /etc/pam.d/vsftpd
>
> Okay, I'm mainly interested to know if it short-circuits anything in the
> configuration that would cause the non-PAM scenario to no longer allow
> anyone to log in when the above configuration says "no anonymous / local
> users allowed".  Sounds like not, so that's cool.
>
>>> ERROR: Command Error: exit status: 1  Output:
>>> Applying patch nopam.patch
>>> patching file builddefs.h
>>> Hunk #1 FAILED at 2.
>>> 1 out of 1 hunk FAILED -- rejects in file builddefs.h
>>> Patch nopam.patch does not apply (enforce with -f)
>>> ERROR: Function failed: patch_do_patch
>>> ERROR: Logfile of failure stored in: /home/jjm/yocto/yocto-build/tmp/work/core2-poky-linux/vsftpd/3.0.0-r0/temp/log.do_patch.26623
>>> ERROR: Task 1 (/home/jjm/yocto/meta-oe/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb, do_patch) failed with exit code '1'
>>>
>>> I had to refresh nopam.patch.  Can you send an updated version with a
>>> sign-off on it?
>>
>>
>> OK.
>>
>>>> +#
>>>> +# This option is examined if userlist_enable is activated. If you set this
>>>> +# setting to NO, then users will be denied login  unless  they are  explicitly
>>>> +# listed  in the file specified by userlist_file.  When login is denied, the
>>>> +# denial is issued before the user is asked for a password.
>>>> +userlist_deny=YES
>>>> +#
>>>> +# If enabled, vsftpd will load a list of usernames, from the filename given by
>>>> +# userlist_file.  If a user tries to log in using  a  name in  this  file,  they
>>>> +# will be denied before they are asked for a password. This may be useful in
>>>> +# preventing cleartext passwords being transmitted. See also userlist_deny.
>>>> +userlist_enable=YES
>>>
>>> I've always disliked these options in vsftpd.  They are confusing and
>>> lead to inconsistent configurations.  That said, the behaviour is
>>> predictable right up until we factor in the (unused?) vsftp.ftpusers
>>> file.  I think that was intended to be a whitelist and I think it's a
>>> redhatism, but I really don't know.  Can you confirm (a) it's needed and
>>> (b) it does something when we already have vsftp.user_list?  Or dump it
>> >from the commit?  I'd really rather not install both unless both are
>>> absolutely necessary.  The configuration you have with userlist_deny=YES
>>> is okay, though what's the behaviour of userlist_deny=NO, have an empty
>>> file and allow PAM logins?  That seems to be the safest default
>>> configuration here, since you also are disabling anonymous logins
>>> (something I think is a good plan).
>>>
>>> -J.
>>>
>>
>>
>> I think vsftpd.user_list has given a good comments.
>
> It does.  We're not looking to address how vsftpd implemented a solution
> that may or may not be simpler than hosts.allow/hosts.deny, I'm just
> saying that I'd like to see the default configuration as straightforward
> as possible.
>
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>>>> @@ -0,0 +1,20 @@
>>>> +# vsftpd userlist
>>>> +# If userlist_deny=NO, only allow users in this file
>>>> +# If userlist_deny=YES (default), never allow users in this file, and
>>>> +# do not even prompt for a password.
>>>> +# Note that the default vsftpd pam config also checks /etc/vsftpd/ftpusers
>>>> +# for users that are denied.
>>
>> They are not necessary, but I am keeping these configurations are same
>> as Fedora Core.
>
> I've not logged into a FC machine in a very long time, but if the
> comment above is to be taken at face value, then your install rule for
> vsftpd.ftpusers is incorrect.  It installs the file into
> /etc/vsftpd.ftpusers, not /etc/vsftpd/ftpusers.  I'd rather see ftpusers
> not installed at all, or left empty, but I'll be okay with this approach
> so long as the docs are accurate.
>
> -J.

Ok, I will fix it.

-Roy

>
>>
>>
>> -Roy
>>
>>
>>>> +#
>>>> +# If enabled,  vsftpd  will display directory listings with the time in your
>>>> +# local time zone. The default is to display GMT. The times returned by the
>>>> +# MDTM FTP command are also affected by this option.
>>>> +use_localtime=YES
>>>> +#
>>>> +# If set to YES, local users will be (by default) placed in a chroot() jail in
>>>> +# their home directory after login.  Warning: This  option has  security
>>>> +# implications,  especially  if  the users have upload permission, or shell access.
>>>> +# Only enable if you know what you are doing.  Note that these security implications
>>>> +# are not vsftpd specific. They apply to all FTP daemons which offer to put
>>>> +# local  users in chroot() jails.
>>>> +chroot_local_user=YES
>>>> +#
>>>> +allow_writeable_chroot=YES
>>>> +#
>>>> +tcp_wrappers=YES
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
>>>> new file mode 100644
>>>> index 0000000..096142f
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
>>>> @@ -0,0 +1,15 @@
>>>> +# Users that are not allowed to login via ftp
>>>> +root
>>>> +bin
>>>> +daemon
>>>> +adm
>>>> +lp
>>>> +sync
>>>> +shutdown
>>>> +halt
>>>> +mail
>>>> +news
>>>> +uucp
>>>> +operator
>>>> +games
>>>> +nobody
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>>>> new file mode 100644
>>>> index 0000000..3e2760f
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
>>>> @@ -0,0 +1,20 @@
>>>> +# vsftpd userlist
>>>> +# If userlist_deny=NO, only allow users in this file
>>>> +# If userlist_deny=YES (default), never allow users in this file, and
>>>> +# do not even prompt for a password.
>>>> +# Note that the default vsftpd pam config also checks /etc/vsftpd/ftpusers
>>>> +# for users that are denied.
>>>> +root
>>>> +bin
>>>> +daemon
>>>> +adm
>>>> +lp
>>>> +sync
>>>> +shutdown
>>>> +halt
>>>> +mail
>>>> +news
>>>> +uucp
>>>> +operator
>>>> +games
>>>> +nobody
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch
>>>> similarity index 95%
>>>> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
>>>> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch
>>>> index ee37f26..1980d09 100644
>>>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch
>>>> @@ -7,8 +7,8 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>>   diff --git a/Makefile b/Makefile
>>>>   --- a/Makefile
>>>>   +++ b/Makefile
>>>> -@@ -24,21 +24,21 @@ vsftpd: $(OBJS)
>>>> - 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS) $(LDFLAGS)
>>>> +@@ -24,21 +24,21 @@
>>>> + 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
>>>>
>>>>    install:
>>>>   -	if [ -x /usr/local/sbin ]; then \
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>>>> similarity index 92%
>>>> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>>>> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>>>> index 6a419db..9a10f72 100644
>>>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
>>>> @@ -10,7 +10,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>>   diff --git a/Makefile b/Makefile
>>>>   --- a/Makefile
>>>>   +++ b/Makefile
>>>> -@@ -5,7 +5,7 @@ IFLAGS  = -idirafter dummyinc
>>>> +@@ -5,7 +5,7 @@
>>>>    #CFLAGS = -g
>>>>    CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>>>>
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>>>> similarity index 68%
>>>> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>>>> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>>>> index a2e0cd0..fd31600 100644
>>>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
>>>> @@ -7,11 +7,11 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>>   diff --git a/Makefile b/Makefile
>>>>   --- a/Makefile
>>>>   +++ b/Makefile
>>>> -@@ -6,7 +6,6 @@ IFLAGS  = -idirafter dummyinc
>>>> - CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>>>> +@@ -9,7 +9,6 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
>>>> + 	#-pedantic -Wconversion
>>>>
>>>>    LIBS	=	-lssl -lcrypto -lnsl -lresolv
>>>>   -LINK	=	-Wl,-s
>>>> + LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
>>>>
>>>>    OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
>>>> - 		tunables.o ftpdataio.o secbuf.o ls.o \
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
>>>> similarity index 100%
>>>> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
>>>> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch
>>>> new file mode 100644
>>>> index 0000000..69745b3
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch
>>>> @@ -0,0 +1,25 @@
>>>> +Enable tcp_wrapper.
>>>> +
>>>> +Upstream-Status: Inappropriate [configuration]
>>>> +
>>>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>>> +---
>>>> + builddefs.h |    2 +-
>>>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>>>> +
>>>> +diff --git a/builddefs.h b/builddefs.h
>>>> +index e908352..0106d1a 100644
>>>> +--- a/builddefs.h
>>>> ++++ b/builddefs.h
>>>> +@@ -1,7 +1,7 @@
>>>> + #ifndef VSF_BUILDDEFS_H
>>>> + #define VSF_BUILDDEFS_H
>>>> +
>>>> +-#undef VSF_BUILD_TCPWRAPPERS
>>>> ++#define VSF_BUILD_TCPWRAPPERS
>>>> + #define VSF_BUILD_PAM
>>>> + #undef VSF_BUILD_SSL
>>>> +
>>>> +--
>>>> +1.7.1
>>>> +
>>>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>>>> similarity index 48%
>>>> rename from meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>>>> rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>>>> index f146910..0ea1359 100644
>>>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>>>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>>>> @@ -4,18 +4,29 @@ SECTION = "network"
>>>>   LICENSE = "GPLv2"
>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
>>>>
>>>> -DEPENDS = "libcap openssl"
>>>> +DEPENDS = "libcap openssl tcp-wrappers"
>>>>
>>>>   SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>>>>              file://makefile-destdir.patch \
>>>>              file://makefile-libs.patch \
>>>>              file://makefile-strip.patch \
>>>> -           file://nopam.patch \
>>>>              file://init \
>>>> -           file://vsftpd.conf"
>>>> +           file://vsftpd.conf \
>>>> +           file://vsftpd-tcp_wrappers-support.patch \
>>>> +           file://vsftpd.user_list \
>>>> +           file://vsftpd.ftpusers \
>>>> +"
>>>>
>>>> -SRC_URI[md5sum] = "01398a5bef8e85b6cf2c213a4b011eca"
>>>> -SRC_URI[sha256sum] = "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca965f6e2f60879e54f1"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
>>>> +                        file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
>>>> +                        file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
>>>> +SRC_URI[md5sum] = "ad9fa952558c2c5b0426ccaccff0f972"
>>>> +SRC_URI[sha256sum] = "ef70205dcd0c7f03b008b9578fb44c0cbe31e66daab8cfafb9904747c17fc2a8"
>>>> +
>>>> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>>> +RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
>>>> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '', 'file://nopam.patch', d)}"
>>>> +PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
>>>>
>>>>   inherit update-rc.d useradd
>>>>
>>>> @@ -29,15 +40,28 @@ do_configure() {
>>>>       mv tunables.c.new tunables.c
>>>>   }
>>>>
>>>> +do_compile() {
>>>> +   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
>>>> +}
>>>> +
>>>>   do_install() {
>>>>       install -d ${D}${sbindir}
>>>>       install -d ${D}${mandir}/man8
>>>>       install -d ${D}${mandir}/man5
>>>>       oe_runmake 'DESTDIR=${D}' install
>>>>       install -d ${D}${sysconfdir}
>>>> -    install -m 0755 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>>>> +    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>>>>       install -d ${D}${sysconfdir}/init.d/
>>>>       install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
>>>> +
>>>> +    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>>>> +    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
>>>> +    if ! test -z ${PAMLIB} ; then
>>>> +        install -d ${D}${sysconfdir}/pam.d/
>>>> +        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
>>>> +        sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
>>>> +        sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
>>>> +    fi
>>>>   }
>>>>
>>>>   INITSCRIPT_PACKAGES = "${PN}"
>>

-- 
Best Reagrds,
Roy | RongQing Li

