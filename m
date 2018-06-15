Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D01F474B52
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 05:12:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5F5BgvV028367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2018 22:11:57 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 14 Jun 2018 22:11:32 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1529036584-91801-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sroZXMAyOoNB9Fw89tYied94_1XjmT8WKHiMM=Zn7JWVw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <1ae4712a-81a9-33e8-9b88-d4af699b13d9@windriver.com>
Date: Fri, 15 Jun 2018 13:11:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sroZXMAyOoNB9Fw89tYied94_1XjmT8WKHiMM=Zn7JWVw@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] syslog-ng: fix syslog-ng startup problem with systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 05:12:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

By the way,  I notice that there is no difference between master and 
master-next  for "meta-oe/recipes-support/syslog-ng"

Can I know why we need a patch based on master-next? Seems the patch 
will same for master and master-next.

Thanks.

On 06/15/2018 12:48 PM, Khem Raj wrote:
> Can you rebase and resend it on top of master-next please
>
> On Thu, Jun 14, 2018 at 9:23 PM Changqing Li <changqing.li@windriver.com> wrote:
>> There are one error and one fail when run "systemctl status syslog-ng"
>>
>> Error opening control socket, bind() failed; socket='/var/run/syslog-ng/syslog-ng.ctl', error='No such file or directory (2)'
>> Failed to acquire /run/systemd/journal/syslog socket, disabling systemd-syslog source;
>>
>> 1. To fix the error info:
>>     if config with "--with-pidfile-dir=${localstatedir}/run/${BPN}", according to syslog-ng code
>>     (define PATH_CONTROL_SOCKET    SYSLOG_NG_PATH_PIDFILEDIR "/syslog-ng.ctl"), path of control socket also
>>     will be /var/run/syslog-ng, but after boot, there is no directory syslog-ng under /var/run,  so this
>>     will not work for systemd. here change initscript to /var/lib/syslog-ng, and remove --with-pidfile,
>>     so that sysVinit and systemd all use /var/lib/syslog-ng,  and also remove pid config in the syslog-ng service
>>     patch to align the pid file path. so both systemd and sysvinit can work.
>>
>> 2. To fix the Failed info:
>>     According below content of admin guide of current version of syslog-ng, change source to systemd-journal
>>     of syslog-ng.conf for systemd.
>>     1) for linux, If the host is running under systemd, syslog-ng OSE reads directly from the systemd journal file using the
>> systemd-journal() source.
>>     2) If possible, use the more reliable systemd-journal() driver instead.
>>     3) The socket activation of systemd is buggy, causing some log messages to get lost during system startup.
>>
>>     but sysvinit not recognize systemd-journal, so seperate it to 2 conf, and install according to current config.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-support/syslog-ng/files/initscript |   2 +-
>>   .../recipes-support/syslog-ng/files/syslog-ng.conf | 155 --------------------
>>   .../syslog-ng/files/syslog-ng.conf.systemd         | 157 +++++++++++++++++++++
>>   .../syslog-ng/files/syslog-ng.conf.sysvinit        | 155 ++++++++++++++++++++
>>   .../syslog-ng.service-the-syslog-ng-service.patch  |   2 +-
>>   meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  10 +-
>>   6 files changed, 321 insertions(+), 160 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
>>
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
>> index 910030f..777e73c 100644
>> --- a/meta-oe/recipes-support/syslog-ng/files/initscript
>> +++ b/meta-oe/recipes-support/syslog-ng/files/initscript
>> @@ -11,7 +11,7 @@
>>   syslog_ng=/usr/sbin/syslog-ng
>>   test -x "$syslog_ng" || exit 0
>>
>> -PIDFILE=/var/run/syslog-ng/syslog-ng.pid
>> +PIDFILE=/var/lib/syslog-ng/syslog-ng.pid
>>
>>   create_xconsole() {
>>     test -e /dev/xconsole || mknod -m 640 /dev/xconsole p
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
>> deleted file mode 100644
>> index 0c6f543..0000000
>> --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
>> +++ /dev/null
>> @@ -1,155 +0,0 @@
>> -@version: 3.8
>> -#
>> -# Syslog-ng configuration file, compatible with default Debian syslogd
>> -# installation. Originally written by anonymous (I can't find his name)
>> -# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
>> -
>> -# First, set some global options.
>> -options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
>> -         owner("root"); group("adm"); perm(0640); stats_freq(0);
>> -         bad_hostname("^gconfd$");
>> -};
>> -
>> -########################
>> -# Sources
>> -########################
>> -# This is the default behavior of sysklogd package
>> -# Logs may come from unix stream, but not from another machine.
>> -#
>> -source s_src { unix-dgram("/dev/log"); internal();
>> -                    file("/proc/kmsg" program_override("kernel"));
>> -};
>> -
>> -# If you wish to get logs from remote machine you should uncomment
>> -# this and comment the above source line.
>> -#
>> -#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encrypt(allow)); };
>> -
>> -########################
>> -# Destinations
>> -########################
>> -# First some standard logfile
>> -#
>> -destination d_auth { file("/var/log/auth.log"); };
>> -destination d_cron { file("/var/log/cron.log"); };
>> -destination d_daemon { file("/var/log/daemon.log"); };
>> -destination d_kern { file("/var/log/kern.log"); };
>> -destination d_lpr { file("/var/log/lpr.log"); };
>> -destination d_mail { file("/var/log/mail.log"); };
>> -destination d_syslog { file("/var/log/syslog"); };
>> -destination d_user { file("/var/log/user.log"); };
>> -destination d_uucp { file("/var/log/uucp.log"); };
>> -
>> -# This files are the log come from the mail subsystem.
>> -#
>> -destination d_mailinfo { file("/var/log/mail/mail.info"); };
>> -destination d_mailwarn { file("/var/log/mail/mail.warn"); };
>> -destination d_mailerr { file("/var/log/mail/mail.err"); };
>> -
>> -# Logging for INN news system
>> -#
>> -destination d_newscrit { file("/var/log/news/news.crit"); };
>> -destination d_newserr { file("/var/log/news/news.err"); };
>> -destination d_newsnotice { file("/var/log/news/news.notice"); };
>> -
>> -# Some 'catch-all' logfiles.
>> -#
>> -destination d_debug { file("/var/log/debug"); };
>> -destination d_error { file("/var/log/error"); };
>> -destination d_messages { file("/var/log/messages"); };
>> -
>> -# The root's console.
>> -#
>> -destination d_console { usertty("root"); };
>> -
>> -# Virtual console.
>> -#
>> -destination d_console_all { file("/dev/tty10"); };
>> -
>> -# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
>> -# you must invoke nsole' with the -file' option:
>> -#
>> -#    $ xconsole -file /dev/xconsole [...]
>> -#
>> -destination d_xconsole { pipe("/dev/xconsole"); };
>> -
>> -# Send the messages to an other host
>> -#
>> -#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };
>> -
>> -# Debian only
>> -destination d_ppp { file("/var/log/ppp.log"); };
>> -
>> -########################
>> -# Filters
>> -########################
>> -# Here's come the filter options. With this rules, we can set which
>> -# message go where.
>> -
>> -filter f_dbg { level(debug); };
>> -filter f_info { level(info); };
>> -filter f_notice { level(notice); };
>> -filter f_warn { level(warn); };
>> -filter f_err { level(err); };
>> -filter f_crit { level(crit .. emerg); };
>> -
>> -filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
>> -filter f_error { level(err .. emerg) ; };
>> -filter f_messages { level(info,notice,warn) and
>> -                    not facility(auth,authpriv,cron,daemon,mail,news); };
>> -
>> -filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
>> -filter f_cron { facility(cron) and not filter(f_debug); };
>> -filter f_daemon { facility(daemon) and not filter(f_debug); };
>> -filter f_kern { facility(kern) and not filter(f_debug); };
>> -filter f_lpr { facility(lpr) and not filter(f_debug); };
>> -filter f_local { facility(local0, local1, local3, local4, local5,
>> -                        local6, local7) and not filter(f_debug); };
>> -filter f_mail { facility(mail) and not filter(f_debug); };
>> -filter f_news { facility(news) and not filter(f_debug); };
>> -filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_debug); };
>> -filter f_user { facility(user) and not filter(f_debug); };
>> -filter f_uucp { facility(uucp) and not filter(f_debug); };
>> -
>> -filter f_cnews { level(notice, err, crit) and facility(news); };
>> -filter f_cother { level(debug, info, notice, warn) or facility(daemon, mail); };
>> -
>> -filter f_ppp { facility(local2) and not filter(f_debug); };
>> -filter f_console { level(warn .. emerg); };
>> -
>> -########################
>> -# Log paths
>> -########################
>> -log { source(s_src); filter(f_auth); destination(d_auth); };
>> -log { source(s_src); filter(f_cron); destination(d_cron); };
>> -log { source(s_src); filter(f_daemon); destination(d_daemon); };
>> -log { source(s_src); filter(f_kern); destination(d_kern); };
>> -log { source(s_src); filter(f_lpr); destination(d_lpr); };
>> -log { source(s_src); filter(f_syslog3); destination(d_syslog); };
>> -log { source(s_src); filter(f_user); destination(d_user); };
>> -log { source(s_src); filter(f_uucp); destination(d_uucp); };
>> -
>> -log { source(s_src); filter(f_mail); destination(d_mail); };
>> -#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo); };
>> -#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwarn); };
>> -#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr); };
>> -
>> -log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscrit); };
>> -log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr); };
>> -log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsnotice); };
>> -#log { source(s_src); filter(f_cnews); destination(d_console_all); };
>> -#log { source(s_src); filter(f_cother); destination(d_console_all); };
>> -
>> -#log { source(s_src); filter(f_ppp); destination(d_ppp); };
>> -
>> -log { source(s_src); filter(f_debug); destination(d_debug); };
>> -log { source(s_src); filter(f_error); destination(d_error); };
>> -log { source(s_src); filter(f_messages); destination(d_messages); };
>> -
>> -log { source(s_src); filter(f_console); destination(d_console_all);
>> -                                   destination(d_xconsole); };
>> -log { source(s_src); filter(f_crit); destination(d_console); };
>> -
>> -# All messages send to a remote site
>> -#
>> -#log { source(s_src); destination(d_net); };
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
>> new file mode 100644
>> index 0000000..d21fa1f
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
>> @@ -0,0 +1,157 @@
>> +@version: 3.8
>> +#
>> +# Syslog-ng configuration file, compatible with default Debian syslogd
>> +# installation. Originally written by anonymous (I can't find his name)
>> +# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
>> +
>> +# First, set some global options.
>> +options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
>> +         owner("root"); group("adm"); perm(0640); stats_freq(0);
>> +         bad_hostname("^gconfd$");
>> +};
>> +
>> +########################
>> +# Sources
>> +########################
>> +# This is the default behavior of sysklogd package
>> +# Logs may come from unix stream, but not from another machine.
>> +#
>> +source s_src {
>> +  systemd-journal();
>> +  file("/proc/kmsg" program-override("kernel"));
>> +  internal();
>> +};
>> +
>> +# If you wish to get logs from remote machine you should uncomment
>> +# this and comment the above source line.
>> +#
>> +#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encrypt(allow)); };
>> +
>> +########################
>> +# Destinations
>> +########################
>> +# First some standard logfile
>> +#
>> +destination d_auth { file("/var/log/auth.log"); };
>> +destination d_cron { file("/var/log/cron.log"); };
>> +destination d_daemon { file("/var/log/daemon.log"); };
>> +destination d_kern { file("/var/log/kern.log"); };
>> +destination d_lpr { file("/var/log/lpr.log"); };
>> +destination d_mail { file("/var/log/mail.log"); };
>> +destination d_syslog { file("/var/log/syslog"); };
>> +destination d_user { file("/var/log/user.log"); };
>> +destination d_uucp { file("/var/log/uucp.log"); };
>> +
>> +# This files are the log come from the mail subsystem.
>> +#
>> +destination d_mailinfo { file("/var/log/mail/mail.info"); };
>> +destination d_mailwarn { file("/var/log/mail/mail.warn"); };
>> +destination d_mailerr { file("/var/log/mail/mail.err"); };
>> +
>> +# Logging for INN news system
>> +#
>> +destination d_newscrit { file("/var/log/news/news.crit"); };
>> +destination d_newserr { file("/var/log/news/news.err"); };
>> +destination d_newsnotice { file("/var/log/news/news.notice"); };
>> +
>> +# Some 'catch-all' logfiles.
>> +#
>> +destination d_debug { file("/var/log/debug"); };
>> +destination d_error { file("/var/log/error"); };
>> +destination d_messages { file("/var/log/messages"); };
>> +
>> +# The root's console.
>> +#
>> +destination d_console { usertty("root"); };
>> +
>> +# Virtual console.
>> +#
>> +destination d_console_all { file("/dev/tty10"); };
>> +
>> +# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
>> +# you must invoke nsole' with the -file' option:
>> +#
>> +#    $ xconsole -file /dev/xconsole [...]
>> +#
>> +destination d_xconsole { pipe("/dev/xconsole"); };
>> +
>> +# Send the messages to an other host
>> +#
>> +#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };
>> +
>> +# Debian only
>> +destination d_ppp { file("/var/log/ppp.log"); };
>> +
>> +########################
>> +# Filters
>> +########################
>> +# Here's come the filter options. With this rules, we can set which
>> +# message go where.
>> +
>> +filter f_dbg { level(debug); };
>> +filter f_info { level(info); };
>> +filter f_notice { level(notice); };
>> +filter f_warn { level(warn); };
>> +filter f_err { level(err); };
>> +filter f_crit { level(crit .. emerg); };
>> +
>> +filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
>> +filter f_error { level(err .. emerg) ; };
>> +filter f_messages { level(info,notice,warn) and
>> +                    not facility(auth,authpriv,cron,daemon,mail,news); };
>> +
>> +filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
>> +filter f_cron { facility(cron) and not filter(f_debug); };
>> +filter f_daemon { facility(daemon) and not filter(f_debug); };
>> +filter f_kern { facility(kern) and not filter(f_debug); };
>> +filter f_lpr { facility(lpr) and not filter(f_debug); };
>> +filter f_local { facility(local0, local1, local3, local4, local5,
>> +                        local6, local7) and not filter(f_debug); };
>> +filter f_mail { facility(mail) and not filter(f_debug); };
>> +filter f_news { facility(news) and not filter(f_debug); };
>> +filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_debug); };
>> +filter f_user { facility(user) and not filter(f_debug); };
>> +filter f_uucp { facility(uucp) and not filter(f_debug); };
>> +
>> +filter f_cnews { level(notice, err, crit) and facility(news); };
>> +filter f_cother { level(debug, info, notice, warn) or facility(daemon, mail); };
>> +
>> +filter f_ppp { facility(local2) and not filter(f_debug); };
>> +filter f_console { level(warn .. emerg); };
>> +
>> +########################
>> +# Log paths
>> +########################
>> +log { source(s_src); filter(f_auth); destination(d_auth); };
>> +log { source(s_src); filter(f_cron); destination(d_cron); };
>> +log { source(s_src); filter(f_daemon); destination(d_daemon); };
>> +log { source(s_src); filter(f_kern); destination(d_kern); };
>> +log { source(s_src); filter(f_lpr); destination(d_lpr); };
>> +log { source(s_src); filter(f_syslog3); destination(d_syslog); };
>> +log { source(s_src); filter(f_user); destination(d_user); };
>> +log { source(s_src); filter(f_uucp); destination(d_uucp); };
>> +
>> +log { source(s_src); filter(f_mail); destination(d_mail); };
>> +#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo); };
>> +#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwarn); };
>> +#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr); };
>> +
>> +log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscrit); };
>> +log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr); };
>> +log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsnotice); };
>> +#log { source(s_src); filter(f_cnews); destination(d_console_all); };
>> +#log { source(s_src); filter(f_cother); destination(d_console_all); };
>> +
>> +#log { source(s_src); filter(f_ppp); destination(d_ppp); };
>> +
>> +log { source(s_src); filter(f_debug); destination(d_debug); };
>> +log { source(s_src); filter(f_error); destination(d_error); };
>> +log { source(s_src); filter(f_messages); destination(d_messages); };
>> +
>> +log { source(s_src); filter(f_console); destination(d_console_all);
>> +                                   destination(d_xconsole); };
>> +log { source(s_src); filter(f_crit); destination(d_console); };
>> +
>> +# All messages send to a remote site
>> +#
>> +#log { source(s_src); destination(d_net); };
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
>> new file mode 100644
>> index 0000000..4a059d4
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
>> @@ -0,0 +1,155 @@
>> +@version: 3.8
>> +#
>> +# Syslog-ng configuration file, compatible with default Debian syslogd
>> +# installation. Originally written by anonymous (I can't find his name)
>> +# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
>> +
>> +# First, set some global options.
>> +options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
>> +         owner("root"); group("adm"); perm(0640); stats_freq(0);
>> +         bad_hostname("^gconfd$");
>> +};
>> +
>> +########################
>> +# Sources
>> +########################
>> +# This is the default behavior of sysklogd package
>> +# Logs may come from unix stream, but not from another machine.
>> +#
>> +source s_src { unix-dgram("/dev/log"); internal();
>> +         file("/proc/kmsg" program_override("kernel"));
>> +};
>> +
>> +# If you wish to get logs from remote machine you should uncomment
>> +# this and comment the above source line.
>> +#
>> +#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encrypt(allow)); };
>> +
>> +########################
>> +# Destinations
>> +########################
>> +# First some standard logfile
>> +#
>> +destination d_auth { file("/var/log/auth.log"); };
>> +destination d_cron { file("/var/log/cron.log"); };
>> +destination d_daemon { file("/var/log/daemon.log"); };
>> +destination d_kern { file("/var/log/kern.log"); };
>> +destination d_lpr { file("/var/log/lpr.log"); };
>> +destination d_mail { file("/var/log/mail.log"); };
>> +destination d_syslog { file("/var/log/syslog"); };
>> +destination d_user { file("/var/log/user.log"); };
>> +destination d_uucp { file("/var/log/uucp.log"); };
>> +
>> +# This files are the log come from the mail subsystem.
>> +#
>> +destination d_mailinfo { file("/var/log/mail/mail.info"); };
>> +destination d_mailwarn { file("/var/log/mail/mail.warn"); };
>> +destination d_mailerr { file("/var/log/mail/mail.err"); };
>> +
>> +# Logging for INN news system
>> +#
>> +destination d_newscrit { file("/var/log/news/news.crit"); };
>> +destination d_newserr { file("/var/log/news/news.err"); };
>> +destination d_newsnotice { file("/var/log/news/news.notice"); };
>> +
>> +# Some 'catch-all' logfiles.
>> +#
>> +destination d_debug { file("/var/log/debug"); };
>> +destination d_error { file("/var/log/error"); };
>> +destination d_messages { file("/var/log/messages"); };
>> +
>> +# The root's console.
>> +#
>> +destination d_console { usertty("root"); };
>> +
>> +# Virtual console.
>> +#
>> +destination d_console_all { file("/dev/tty10"); };
>> +
>> +# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
>> +# you must invoke nsole' with the -file' option:
>> +#
>> +#    $ xconsole -file /dev/xconsole [...]
>> +#
>> +destination d_xconsole { pipe("/dev/xconsole"); };
>> +
>> +# Send the messages to an other host
>> +#
>> +#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };
>> +
>> +# Debian only
>> +destination d_ppp { file("/var/log/ppp.log"); };
>> +
>> +########################
>> +# Filters
>> +########################
>> +# Here's come the filter options. With this rules, we can set which
>> +# message go where.
>> +
>> +filter f_dbg { level(debug); };
>> +filter f_info { level(info); };
>> +filter f_notice { level(notice); };
>> +filter f_warn { level(warn); };
>> +filter f_err { level(err); };
>> +filter f_crit { level(crit .. emerg); };
>> +
>> +filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
>> +filter f_error { level(err .. emerg) ; };
>> +filter f_messages { level(info,notice,warn) and
>> +                    not facility(auth,authpriv,cron,daemon,mail,news); };
>> +
>> +filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
>> +filter f_cron { facility(cron) and not filter(f_debug); };
>> +filter f_daemon { facility(daemon) and not filter(f_debug); };
>> +filter f_kern { facility(kern) and not filter(f_debug); };
>> +filter f_lpr { facility(lpr) and not filter(f_debug); };
>> +filter f_local { facility(local0, local1, local3, local4, local5,
>> +                        local6, local7) and not filter(f_debug); };
>> +filter f_mail { facility(mail) and not filter(f_debug); };
>> +filter f_news { facility(news) and not filter(f_debug); };
>> +filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_debug); };
>> +filter f_user { facility(user) and not filter(f_debug); };
>> +filter f_uucp { facility(uucp) and not filter(f_debug); };
>> +
>> +filter f_cnews { level(notice, err, crit) and facility(news); };
>> +filter f_cother { level(debug, info, notice, warn) or facility(daemon, mail); };
>> +
>> +filter f_ppp { facility(local2) and not filter(f_debug); };
>> +filter f_console { level(warn .. emerg); };
>> +
>> +########################
>> +# Log paths
>> +########################
>> +log { source(s_src); filter(f_auth); destination(d_auth); };
>> +log { source(s_src); filter(f_cron); destination(d_cron); };
>> +log { source(s_src); filter(f_daemon); destination(d_daemon); };
>> +log { source(s_src); filter(f_kern); destination(d_kern); };
>> +log { source(s_src); filter(f_lpr); destination(d_lpr); };
>> +log { source(s_src); filter(f_syslog3); destination(d_syslog); };
>> +log { source(s_src); filter(f_user); destination(d_user); };
>> +log { source(s_src); filter(f_uucp); destination(d_uucp); };
>> +
>> +log { source(s_src); filter(f_mail); destination(d_mail); };
>> +#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo); };
>> +#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwarn); };
>> +#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr); };
>> +
>> +log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscrit); };
>> +log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr); };
>> +log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsnotice); };
>> +#log { source(s_src); filter(f_cnews); destination(d_console_all); };
>> +#log { source(s_src); filter(f_cother); destination(d_console_all); };
>> +
>> +#log { source(s_src); filter(f_ppp); destination(d_ppp); };
>> +
>> +log { source(s_src); filter(f_debug); destination(d_debug); };
>> +log { source(s_src); filter(f_error); destination(d_error); };
>> +log { source(s_src); filter(f_messages); destination(d_messages); };
>> +
>> +log { source(s_src); filter(f_console); destination(d_console_all);
>> +                                   destination(d_xconsole); };
>> +log { source(s_src); filter(f_crit); destination(d_console); };
>> +
>> +# All messages send to a remote site
>> +#
>> +#log { source(s_src); destination(d_net); };
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
>> index 6b30c20..1a11ea8 100644
>> --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
>> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
>> @@ -21,7 +21,7 @@ index fc16f8d..8e09deb 100644
>>    Type=notify
>>   -ExecStart=/usr/sbin/syslog-ng -F $SYSLOGNG_OPTS
>>   -ExecReload=/bin/kill -HUP $MAINPID
>> -+ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS -p @LOCALSTATEDIR@/run/syslogd.pid
>> ++ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS
>>   +ExecReload=@BASEBINDIR@/kill -HUP $MAINPID
>>    EnvironmentFile=-/etc/default/syslog-ng
>>    EnvironmentFile=-/etc/sysconfig/syslog-ng
>> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>> index cb7ca31..feb2882 100644
>> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
>> @@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
>>   DEPENDS = "libpcre flex eventlog glib-2.0 openssl util-linux"
>>
>>   SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
>> -           file://syslog-ng.conf \
>> +           file://syslog-ng.conf.systemd \
>> +           file://syslog-ng.conf.sysvinit \
>>              file://initscript \
>>              file://volatiles.03_syslog-ng \
>>              file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
>> @@ -38,7 +39,6 @@ EXTRA_OECONF = " \
>>       --with-librabbitmq-client=no \
>>       --disable-python \
>>       --disable-java --disable-java-modules \
>> -    --with-pidfile-dir=${localstatedir}/run/${BPN} \
>>       ${CONFIG_TLS} \
>>   "
>>
>> @@ -77,7 +77,11 @@ do_install_prepend() {
>>
>>   do_install_append() {
>>       install -d ${D}/${sysconfdir}/${BPN}
>> -    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
>> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
>> +        install ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
>> +    else
>> +        install ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
>> +    fi
>>       install -d ${D}/${sysconfdir}/init.d
>>       install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog
>>       install -d ${D}/${sysconfdir}/default/volatiles/
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)
+861084778653


