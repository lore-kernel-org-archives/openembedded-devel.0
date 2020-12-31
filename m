Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.26265.1609446259615738085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Dec 2020 12:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gKmhKbZD;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 186so17136401qkj.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Dec 2020 12:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2LXOdC1dzYobj2OTHmLRRuNyoTNA+fn7Vuo7+hqpRn4=;
        b=gKmhKbZDqP2csF7szU/U/YkzPpzNkU/9Ec3lE+Xx8GVydPO5uziVWB4CwVmNQV89+H
         IBlDOkbk1AW+s1lBLQ3Lj80BntNdNtRBh5MA9jUzdCzdcSA2W7/luMGwE8nKMdsQBpMP
         GUlwyo1tlcC/+vjREwZAwUn0bP+BIJIdVUlKtBgjNEr7pAtzjFcLgS8eWzh8P7Rg/X00
         9aaJx+3GaaDxTrH0iZ7E4ADTxuSBiYaEsrkUjZ4TiOSrxyYAZA/PAfAyC3/GaSxTDYkg
         JzLqIP8aLoSwjSpzY+NopAmb2ZXvXyXl55/6X6dQgvwcLd/akT9x9iHpDuURs+i6+3qc
         7Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LXOdC1dzYobj2OTHmLRRuNyoTNA+fn7Vuo7+hqpRn4=;
        b=TVbaMby+w92pEOFhzKUqUEL9QYTlcwBYClnelKJJlBP8wAa55KwGSfk8Q+89n66xWb
         sFPxTQ5qlB9CftQu4zVEcrJS7X5GT+tpKtIe2vXOMNlFgxfG2Bwc8j4g2sa44wT2/dJh
         klv02BFlhaLr92YGCP4b7Q4EEu7PeHHabFLwv9yHV1QOnW0oo1MPYCSK5es78TydWiFV
         zIFLfm3fBkLWoW5+9skkIuNjpI9wwKyBi8QsEgS/MaRbj4/DDjimRcD2opWmY66KbKuQ
         QnEYsLxVhgRGWLjoQfm0rwwFd4WlyEKC4+qIVWrnXAgPxEUurfd5VB43SxOd6EmQ2ndX
         /AEA==
X-Gm-Message-State: AOAM533Gk94VubLbntufKUMH76PNPcmbWSNY4h5HOiyuzVb+cGZzjNrO
	SzAFnf6KyHgGeCawfcUIe0Wjao8RfEMfoLDtIp8=
X-Google-Smtp-Source: ABdhPJx9upf2Dpd5Cz9qW+ALbedCeEVpGnrRcQbHMvwigv/LphU2l8MtifnkXAuhKdlRq70irnawVoV1MoP/w/Y+PEQ=
X-Received: by 2002:a37:2f82:: with SMTP id v124mr42333992qkh.212.1609446258559;
 Thu, 31 Dec 2020 12:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20201231090331.223784-1-yi.zhao@windriver.com>
In-Reply-To: <20201231090331.223784-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 31 Dec 2020 12:23:52 -0800
Message-ID: <CAMKF1sphr4ZTmN5qE8M-XcTHsQx=bdTwgaopumwDu=2h=kgd5w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/3] ebtables: add missing file ebtables.common
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this series fails in do_install see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/838
https://errors.yoctoproject.org/Errors/Details/540440/

On Thu, Dec 31, 2020 at 1:03 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The ebtables.common is required by ebtables.service. Add it back.
>
> Fixes:
> systemd[660]: ebtables.service: Failed to locate executable /usr/sbin/ebtables.common: No such file or directory
> systemd[660]: ebtables.service: Failed at step EXEC spawning /usr/sbin/ebtables.common: No such file or directory
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../ebtables/ebtables-2.0.11/ebtables.common  | 163 ++++++++++++++++++
>  .../ebtables/ebtables_2.0.11.bb               |  10 +-
>  2 files changed, 170 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
>
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
> new file mode 100644
> index 000000000..d948422e9
> --- /dev/null
> +++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
> @@ -0,0 +1,163 @@
> +#!/bin/sh
> +
> +[ -x /usr/sbin/ebtables-legacy ] || exit 1
> +
> +EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
> +
> +RETVAL=0
> +prog="ebtables"
> +desc="Ethernet bridge filtering"
> +umask 0077
> +
> +#default configuration
> +EBTABLES_MODULES_UNLOAD="yes"
> +EBTABLES_LOAD_ON_START="no"
> +EBTABLES_SAVE_ON_STOP="no"
> +EBTABLES_SAVE_ON_RESTART="no"
> +EBTABLES_SAVE_COUNTER="no"
> +EBTABLES_BACKUP_SUFFIX="~"
> +
> +config=/etc/default/$prog
> +[ -f "$config" ] && . "$config"
> +
> +get_supported_tables() {
> +       EBTABLES_SUPPORTED_TABLES=
> +       /usr/sbin/ebtables-legacy -t filter -L 2>&1 1>/dev/null | grep -q permission
> +       if [ $? -eq 0 ]; then
> +               echo "Error: insufficient privileges to access the ebtables rulesets."
> +               exit 1
> +       fi
> +       for table in filter nat broute; do
> +               /usr/sbin/ebtables-legacy -t $table -L &> /dev/null
> +               if [ $? -eq 0 ]; then
> +                       EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
> +               fi
> +       done
> +}
> +
> +load() {
> +       RETVAL=0
> +       get_supported_tables
> +       echo -n "Restoring ebtables rulesets: "
> +       for table in $EBTABLES_SUPPORTED_TABLES; do
> +               echo -n "$table "
> +               if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
> +                       /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
> +                       RET=$?
> +                       if [ $RET -ne 0 ]; then
> +                               echo -n "(failed) "
> +                               RETVAL=$RET
> +                       fi
> +               else
> +                       echo -n "(no saved state) "
> +               fi
> +       done
> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +               echo -n "no kernel support. "
> +       else
> +               echo -n "done. "
> +       fi
> +       if [ $RETVAL -eq 0 ]; then
> +               echo "ok"
> +       else
> +               echo "fail"
> +       fi
> +}
> +
> +clear_rules() {
> +       RETVAL=0
> +       get_supported_tables
> +       echo -n "Clearing ebtables rulesets: "
> +       for table in $EBTABLES_SUPPORTED_TABLES; do
> +               echo -n "$table "
> +               /usr/sbin/ebtables-legacy -t $table --init-table
> +       done
> +
> +       if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
> +               for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
> +                       rmmod $mod 2> /dev/null
> +               done
> +       fi
> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +               echo -n "no kernel support. "
> +       else
> +               echo -n "done. "
> +       fi
> +       if [ $RETVAL -eq 0 ]; then
> +               echo "ok"
> +       else
> +               echo "fail"
> +       fi
> +}
> +
> +save() {
> +       RETVAL=0
> +       get_supported_tables
> +       echo -n "Saving ebtables rulesets: "
> +       for table in $EBTABLES_SUPPORTED_TABLES; do
> +               echo -n "$table "
> +               [ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
> +                       mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
> +               /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
> +               RET=$?
> +               if [ $RET -ne 0 ]; then
> +                       echo -n "(failed) "
> +                       RETVAL=$RET
> +               else
> +                       if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
> +                               /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
> +                       fi
> +               fi
> +       done
> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +               echo -n "no kernel support. "
> +       else
> +               echo -n "done. "
> +       fi
> +       if [ $RETVAL -eq 0 ]; then
> +               echo "ok"
> +       else
> +               echo "fail"
> +       fi
> +}
> +
> +case "$1" in
> +       start)
> +               [ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
> +               ;;
> +       stop)
> +               [ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
> +               clear_rules
> +               ;;
> +       restart|reload|force-reload)
> +               [ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
> +               clear_rules
> +               [ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
> +               ;;
> +       load)
> +               load
> +               ;;
> +       save)
> +               save
> +               ;;
> +       status)
> +               get_supported_tables
> +               if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> +                       echo "No kernel support for ebtables."
> +                       RETVAL=1
> +               else
> +                       echo -n "Ebtables support available, number of installed rules: "
> +                       for table in $EBTABLES_SUPPORTED_TABLES; do
> +                               COUNT=$(( $(/usr/sbin/ebtables-legacy -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
> +                               echo -n "$table($COUNT) "
> +                       done
> +                       echo ok
> +                       RETVAL=0
> +               fi
> +               ;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
> +               RETVAL=1
> +esac
> +
> +exit $RETVAL
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> index fc544e1b6..08d4d661d 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> @@ -13,6 +13,7 @@ RRECOMMENDS_${PN} += "kernel-module-ebtables \
>
>  SRC_URI = "http://ftp.netfilter.org/pub/ebtables/ebtables-${PV}.tar.gz \
>             file://ebtables-legacy-save \
> +           file://ebtables.common \
>             file://ebtables.service \
>             "
>
> @@ -33,9 +34,12 @@ do_install_append () {
>         install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${base_sbindir}/ebtables-legacy-save
>         sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-legacy-save
>         # Install systemd service files
> -       install -d ${D}${systemd_unitdir}/system
> -       install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
> -       sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +               install -d ${D}${systemd_unitdir}/system
> +               install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
> +               sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
> +               install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
> +       fi
>  }
>
>  do_configure_prepend () {
> --
> 2.25.1
>
>
> 
>
