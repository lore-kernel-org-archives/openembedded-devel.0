Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC1BE92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6480.1766835493252833445
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZiGl8wK;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3893320f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766835492; x=1767440292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=962kKWf0haKTMOavrUA/BJpv5S/0MvAlE7POT79ul7M=;
        b=XZiGl8wKj5jjK2CzcUDkgtwUy+Bp14BmckSdKTJn4rPDIQ+kjBS5WLzTwBzMAFMyoh
         kTKggE9ZJMplpE+DiJvsgCGdprT5o2C9ipL9anNxsfjOCV6hmJU6wj5wiFg7sufPDWGo
         qE741iH4Ui1Fj0jaGgBVVY2Zio3+DWs1RrNnjCODM3TFK8NZasi1etjzyGcZQz6wqTPq
         lGwhhu3xTwiW2ib/ATq9UX6X1oyRsFCbe2BrG47tYck4c1FifDQ47amuM0JFrLstSINf
         H4f/WHMtiED15qOdi+vHCmuoUKHeJSAQzuEPc5kd0heHtpkwWIuV/m2Y9vR4f2ZaNACy
         S43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766835492; x=1767440292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=962kKWf0haKTMOavrUA/BJpv5S/0MvAlE7POT79ul7M=;
        b=NjO1XNiru+hooQ1e8eBPF92me/nBe9uiU8zvaoHpvPAaH34Z5tXTMrLdoNECJ5PjAt
         /fsqaALhsV4GrJB6EBkmej98tdpvpq0WudOH+8D266s7I/NuK4l7u5y64nqD0MIGOJVS
         F8FRzIMGfQSjgmsiCa7Nog2+FHuD0QXhTQnOf91j09sYrNGd1ie3a31mCM4XKkfnYQRH
         SlUtaZYCywSIWESR5gFgKuL6RSUvnp0u9wJ0TK72YMlUOYU4ZqEpz2MPguGCXUPy18xb
         6xNfe5FP6zziZDjMOzs0UGY9+FtAqXWiil/uceeuzwPV+FTl8bpV3b5ocDQbd1xOwX6a
         fz9A==
X-Gm-Message-State: AOJu0YwO2aivJfRFnmg6FckcVvLs1QbPTSNEb5MEHgcRPAEBY/3KQdFX
	3Yw0KM9RoWbGqJeTOdPIYF3YVmpb4kuKlr0qKNHOUcM5kON1NP+PNzT1sBKKjA==
X-Gm-Gg: AY/fxX6uqB/PcABkfW51i0rB2Ac+zdrgk+2XX8GlsoOrnizu15tOwQopi8DreggFa5D
	8hOs1nsmBoQZsW3wO+mT6zDldZLII/hzsCOffbcEe/YekyovliUM8RlukWi7pjX2ddsAhLzDWZ9
	jjFjnbJ4UYwtm7HecAphBsQJ9ZEE2aw1f2Kxe0TAYdnmedpbLz5GYHotxP3ysAjXnwBdqGZdVS0
	UpkCY/CM8z74PoOMHrkh40ddo10WBB7CYAZCJeK3Iik/gBnZawI4gSOvkDaOiP+mx9VKelQtpUE
	pLifz2O+mzu7zJK0LK11Gh656zJk3jNFlDC4bUQ9r5w2QORWqN+1WQPVSgrVP/FwZoAjvQa508q
	yUxawvVGRKTwUBkg6kx55QZkYumjBR8S6ymLAFISaXRn+WioToC+sJ1GTz1ZifIjpwVymQRC4Au
	WHSXaRUOBT
X-Google-Smtp-Source: AGHT+IGeU5kSm4hnHZr61PMkGFiPvPZ20Qla2tlwqv6VE1UAYojfMu/DIQuRscweybxZm2J+TipEJg==
X-Received: by 2002:a05:6000:186e:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-4324e4cff0dmr32754071f8f.27.1766835491400;
        Sat, 27 Dec 2025 03:38:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b82a58sm17023023f8f.6.2025.12.27.03.38.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:38:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] logwatch: upgrade 7.11 -> 7.13
Date: Sat, 27 Dec 2025 12:38:07 +0100
Message-ID: <20251227113808.3304770-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227113808.3304770-1-skandigraun@gmail.com>
References: <20251227113808.3304770-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 11:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122952

Update SRC_URI because the previous one became inaccessible.

Slightly update do_install - now it is in line with the installation
script from the project's own RPM file (previous some files were not
installed)

Shortlog:
[logwatch] Preparation for Release 7.13
[rsyslogd] De-duplicate lines with time calculations
[sendmail] Removed invalid commented-out code.
[logstash] Remove script - needs update to Logwatph.pm
[sendmail] Improved detection of "Command unrecognized" strings.
[rsyslogd] Ignore "GnuTLS error: Error in the push function" - paired with other errors
[omsa] Handle peak power and new Unexpected sense messages
[systemd] Add ignore_messages option to ignore messages matching a regex
[kernel] Fix EDAC regex
[rsyslogd] Ignore additional rate-limiting message paired with other messages
[rsyslogd] Ignore additional omfwd messages paired with other messages
[nut] Ignore upsnotify message about tech that we already know about
[pam_unix] Add nx to services; Allow for username in session opened by messages for cron
[pam_unix] Add kde to dektop services; Hande "User info message"
[systemd] Update for newer systemd
[logstash] Initial version
[systemd] Ignore "Unnecessary job was removed for .*" - appears informational
[systemd] Ignore State timed out messages - followed by a failed message
[named] No need for unconfineds variable, not used
[clam-update] Added comments about syslog format.
[logwatch.8] Clarified use of debug.
Fix Dir glob issue Iridos2 bug report.
[postfix] Added support for postfix version 3.10
[zypp] Added support for patch statements; reported by leithh.
[dovecot] Added better detail granularity, and support logformat 2.3
[systemd] Relax LSM BPF program attached regex
[dirsrv] Relax ACL target does not exist regex; Ignore schema-compat-plugin info messages that are at ERR level
[dovecot] Script and configuration file updated with granular detail options and improved report grouping
[clam-update] Fixed typo.
[clam-update] Check for empty LogFile strings and adjust error messages
[onlyservice,removeheaders] Allow RFC 3164 Log Format with named facility.severity
[http] Setting default http_rc code for when not specified in LogFormat
[logwatch.pl,syslog-ng] Removed HTML Entity encoding for xml, as all strings are now UTF-8
(tag: 7.12) [logwatch] Updating release version
[http] Replace hyphen with "Unidentified agent,"
[named] Handle "zone not loaded due to errors; Handle "journal file is out of date; removed" separately;  Ignore "New key observered for zone"
[named] handle "TCP client quota reached" messages; Expand limit regex
Remove trailing whitespace
[nut] Handle battery needs to be replaced message
[nut] Update for 2.8.2
[postfix] Support for aliased mailboxes
[zz-zfs] Added 'Cap' column header
[sudo] Add sudo_detail
[omsa] Ignored Administrator stopped message
[omsa] Update Patrol Read regex
[sssd] Ignore "exec_child_ex command" messages
[secure] relax regex around "gkr-pam: no password is available for user"
[secure] Ignore sshd-session messages
[sendmail] Added filter for new pre-greeting message.
[postfix] Added DNSBL rank display
[sshd] Added 'drop connection' counter.
[rsyslogd] Handle stdout/stderr sent to journal which ends up with an extra prefix
[named] Add option to ignore denied zone trasfter; Move limit reporting to detail >= 1
[systemd] Handle new Watchdog and Reexecuting requested messages
[dnf-automatic] New script contributed by Clive Lin.
[mdadm] Check if hash of 'good devices' is undefined or empty.
[sshd,secure] Added support for OpenSSH 9.8 (sshd-session, port number), per tomop.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{logwatch_7.11.bb => logwatch_7.13.bb}    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.11.bb => logwatch_7.13.bb} (79%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.11.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.13.bb
similarity index 79%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.11.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.13.bb
index 89012f8852..13897590be 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.11.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.13.bb
@@ -11,17 +11,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
-SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "5eb42d983a9667003368b572149fce788c0d7e13daaf1f28ad1bf3a140b865cf"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "0c9a10c2d8e5bc0cb10e16dc86c83be60d71d8a52b97bca785c64a30ed642839"
 
 do_install() {
-    install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
+    install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts/services
     install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/logfiles
     install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/services
     install -m 0755 -d ${D}${localstatedir}/cache/logwatch
-    cp -r -f conf/ ${D}${datadir}/logwatch/default.conf
-    cp -r -f scripts/ ${D}${datadir}/logwatch/scripts
-    cp -r -f lib ${D}${datadir}/logwatch/lib
+    cp -r conf/ ${D}${datadir}/logwatch/default.conf
+    cp -r scripts/ ${D}${datadir}/logwatch/scripts
+    cp -r lib ${D}${datadir}/logwatch/lib
     chown -R root:root ${D}${datadir}/logwatch
 
     install -m 0755 -d ${D}${mandir}/man1
@@ -36,7 +36,7 @@ do_install() {
 
     install -m 0755 -d ${D}${sysconfdir}/cron.daily
     install -m 0755 -d ${D}${sbindir}
-    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sbindir}/logwatch
+    ln -sr  ${D}${datadir}/logwatch/scripts/logwatch.pl ${D}${sbindir}/logwatch
     cat > ${D}${sysconfdir}/cron.daily/0logwatch <<EOF
     DailyReport=\`grep -e "^[[:space:]]*DailyReport[[:space:]]*=[[:space:]]*" /usr/share/logwatch/default.conf/logwatch.conf | head -n1 | sed -e "s|^\s*DailyReport\s*=\s*||"\`
     if [ "\$DailyReport" != "No" ] && [ "\$DailyReport" != "no" ]
@@ -46,6 +46,13 @@ do_install() {
 EOF
     chmod 755 ${D}${sysconfdir}/cron.daily/0logwatch
 
+    for i in scripts/logfiles/*; do
+        if [ $(ls $i | wc -l) -ne 0 ]; then
+            install -d ${D}${datadir}/logwatch/$i
+            install -m 0644 $i/* ${D}${datadir}/logwatch/$i
+        fi
+    done
+
     install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/logfiles
     install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/services
     touch ${D}${sysconfdir}/logwatch/conf/logwatch.conf

