Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id CD4E96CC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:20:51 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q58so4322777wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 07:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=egcIfgWU+GSlOGAtUPRLubh6+l1bAJnG1WjG9G+gqSw=;
	b=DCaIloKoxyMsIzlidkan7mq1H+o+oqhBxEqKp2WgOyu2FGo0/32Xuz8ULD/0lygy7L
	W/Fdjd6uISs0dMK1MFX/Pp+pBNjpx2JwyuBbnAAXcXIYD6TEIPeoqNG4cS2UoaCzN6e5
	GjX9sJgDGdvi1sWkteMnTKWB9jyRxHqkgXG84p17nFYZ30KtvMYFBiasGx3n1A1Cr6yt
	G609OtT9PWeIa8scIuuWW8QGU6ZgWwR4cypmhD9k8dBG+dCavG4VGe+Az5LdgrpOqV2Z
	S3ubfRCvDo+6PnV4jQj8qA8KBDdRS6P3llsD9BlHoTZhlvXxZzucFh5DEf+9dudOUmBE
	/h5Q==
X-Gm-Message-State: ALoCoQmcpoV0whBKLET9g+TM5Yqe95GkLhicmVJzeo0n2hVWEq6/3vqWiyvEo9X15vEkacC+EWYQ
X-Received: by 10.194.94.101 with SMTP id db5mr775721wjb.67.1381501252740;
	Fri, 11 Oct 2013 07:20:52 -0700 (PDT)
Received: from iMac.local ([2001:610:612:0:d04:70cd:6d6d:11d0])
	by mx.google.com with ESMTPSA id b7sm6135386wiz.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 07:20:51 -0700 (PDT)
Message-ID: <52580927.90308@dominion.thruhere.net>
Date: Fri, 11 Oct 2013 16:20:23 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1381500055-11483-1-git-send-email-ml@communistcode.co.uk>
	<1381500055-11483-4-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1381500055-11483-4-git-send-email-ml@communistcode.co.uk>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCHv2 3/3] rsyslog: update to 7.4.4
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
X-List-Received-Date: Fri, 11 Oct 2013 14:20:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-10-13 16:00, Jack Mitchell schreef:
> From: Jack Mitchell <jmitchell@cbnl.com>
> 
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com> --- 
> .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  | 60
> ---------------------- meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
> |  5 -- .../rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb}      | 24
> ++++++--- 3 files changed, 16 insertions(+), 73 deletions(-) delete mode
> 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf delete mode
> 100644 meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb rename
> meta-oe/recipes-extended/rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb} (54%)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf deleted file mode
> 100644 index 47fc440..0000000 ---
> a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf +++ /dev/null @@
> -1,60 +0,0 @@ -# if you experience problems, check -#
> http://www.rsyslog.com/troubleshoot for assistance - -# rsyslog v3: load
> input modules -# If you do not load inputs, nothing happens! -# You may
> need to set the module load path if modules are not found. - -$ModLoad
> immark   # provides --MARK-- message capability -$ModLoad imuxsock #
> provides support for local system logging (e.g. via logger command) 
> -$ModLoad imklog   # kernel logging (formerly provided by rklogd) - -#
> Log all kernel messages to the console. -# Logging much else clutters up
> the screen. -#kern.*
> /dev/console - -# Log anything (except mail) of level info or higher. -#
> Don't log private authentication messages! 
> -*.info;mail.none;authpriv.none;cron.none
> -/var/log/messages - -# The authpriv file has restricted access. 
> -authpriv.*                                              /var/log/secure 
> - -# Log all the mail messages in one place. -mail.*
> -/var/log/maillog - - -# Log cron stuff -cron.*
> -/var/log/cron - -# Everybody gets emergency messages -*.emerg
> * - -# Save news errors of level crit and higher in a special file. 
> -uucp,news.crit
> -/var/log/spooler - -# Save boot messages also to boot.log -local7.*
> /var/log/boot.log - -# Remote Logging (we use TCP for reliable delivery) 
> -# An on-disk queue is created for this action. If the remote host is -#
> down, messages are spooled to disk and sent when it is up again. 
> -#$WorkDirectory /rsyslog/spool # where to place spool files 
> -#$ActionQueueFileName uniqName # unique name prefix for spool files 
> -#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as
> possible) -#$ActionQueueSaveOnShutdown on # save messages to disk on
> shutdown -#$ActionQueueType LinkedList   # run asynchronously 
> -#$ActionResumeRetryCount -1    # infinite retries if host is down -#
> remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional -#*.*
> @@remote-host:514 - - -# ######### Receiving Messages from Remote Hosts
> ########## -# TCP Syslog Server: -# provides TCP syslog reception and
> GSS-API (if compiled to support it) -#$ModLoad imtcp.so  # load module 
> -#$InputTCPServerRun 514 # start up TCP listener at port 514 - -# UDP
> Syslog Server: -#$ModLoad imudp.so  # provides UDP syslog reception 
> -#$UDPServerRun 514 # start a UDP syslog server at standard port 514 diff
> --git a/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
> b/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb deleted file mode
> 100644 index 3a6540d..0000000 ---
> a/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb +++ /dev/null @@ -1,5
> +0,0 @@ -require rsyslog.inc -PR = "${INC_PR}.0" - -SRC_URI[md5sum] =
> "37562d0e71a24938a9ed7f242bd32d35" -SRC_URI[sha256sum] =
> "e034b02473fd7e5313522173ec2f6c57e6fbcaec2c6b289edb968b1d64ae3ffd" diff
> --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb similarity index 54% 
> rename from meta-oe/recipes-extended/rsyslog/rsyslog.inc rename to
> meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb index 4b2935f..33cc1d5
> 100644 --- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc +++
> b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb @@ -1,24 +1,32 @@ 
> DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd" -DEPENDS =
> "zlib" +DEPENDS = "zlib libestr json-c" DEPENDS +=
> "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}" 
> HOMEPAGE = "http://www.rsyslog.com/" LICENSE = "GPLv3" LIC_FILES_CHKSUM =
> "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
> 
> -INC_PR = "r8" - SRC_URI =
> "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \ -
> file://rsyslog.conf" +	   file://initscript \

No tabs in SRC_URI please

> +" + +SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6" 
> +SRC_URI[sha256sum] =
> "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
> 
> -inherit autotools pkgconfig systemd +inherit autotools pkgconfig systemd
> update-rc.d
> 
> -EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}" +EXTRA_OECONF +=
> "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)} --enable-cached-man-pages"
> 
> do_install_append() { -    install -d ${D}/${sysconfdir}/${PN} -
> install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf +
> install -d "${D}${sysconfdir}/init.d" +    install -m 755
> ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/rsyslogd +    install -m
> 755 ${S}/platform/redhat/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf }
> 
> +FILES_${PN} += "/usr/bin"

${bindir}, which should already be in FILES_${PN}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSWAknMkyGM64RGpERAuHwAKCSHbt4fMXvMt4r0MHsxMTQPNAC0wCgjTCB
bguFCTjaQ1x17zcFrbInakY=
=ayon
-----END PGP SIGNATURE-----

