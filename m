Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 492AB72EA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:34:00 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id a5-v6so6812261qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2018 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fWSbluS3YWLsf3RgYDNfOBalp5qoHEMpJ8EQTz2kOso=;
	b=vUZU/rik94h5xdv+zEcpgbZvCOj0yeIx+4AjTvty3hS0MTCfcdPtsFVZXs1+ZKHPpC
	udpuMyswtE0GapZ9KRJ/nrewZgBanwUwdSXM/TG+Ybac6DWp7dJJuzqkYFJo5BP/8ISp
	fT7rOJkYcgdYpTLv6GbRJ803e/mxj0tDHR526t3NYIU1IQMPmquwWM6cfyw8Yzs11Rhr
	/h/8xQQMFaOOn9JFVkQ2ddyXQGiVv1OEyu2QAfwFSmXhQkHzJWnEH4dB2N6G9jivNtNS
	winsfjVCQCzgBkH/q7SlFI/1tdO+REBxN0beYrQVrotaKYv0WUYZoCVha8WilhN7fTTQ
	upDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fWSbluS3YWLsf3RgYDNfOBalp5qoHEMpJ8EQTz2kOso=;
	b=E12ExmVNeJureTk6ZJ/in92xXz/xPof+qgMAK7KSI83CRwHdFc8yigRiHxAqSAeJEE
	X1MM8sL/VdYmeZW+p4cXi43jBvy7DCZHtVFjOkz7MYxswQDCrDvha/66JIW4KxfOVbll
	zNIWoKMb/hzNnrviECh66rTnlNPiaDgkcVS1BC/d5b0YcSkYaTJGqHAKNfF+jtkmONbE
	WTQjVE2jWCT3zqBpj4TS1F9hyi0R6FbGRmCL7Wx0UW73+iYDAxNCFxmxUmVNYHk4UPOg
	2jR0L+sD/jmAAOsqdUjUAHVeqIlVT7Ct60NWocP021PwzBfzsk6G+oUd27uOIc9b6jlA
	91Rg==
X-Gm-Message-State: AOUpUlFxTNoSbmbU90WHGVjZ09Axb6qv6wYR3IMxm1pXyAbhirSQBvMk
	1WIm7zhqxK05jop7lgFp3Bd6vZ4bOuO7C6eWMRU=
X-Google-Smtp-Source: AAOMgpfLFEY9YNS+sgkWx8lg46dAnhp9H3KoyAdIHzv4xDxiMJ3tJOi4EQzClfvJXghkMTjlaux1nrrMAN1nZ7T6coo=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr4785395qta.128.1533314040905; 
	Fri, 03 Aug 2018 09:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <1533290805-13421-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1533290805-13421-1-git-send-email-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 09:33:34 -0700
Message-ID: <CAMKF1sqRfR-JDwt+HiWJ8qDsAFnK92iKbNAJf2uF7Qxj-DZFDQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] rsyslog: fix configuration file for logrotate
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
X-List-Received-Date: Fri, 03 Aug 2018 16:34:00 -0000
Content-Type: text/plain; charset="UTF-8"

is this patch any different from last posted patch ?

https://patchwork.openembedded.org/patch/153125/

If not then there is no need to resend, if yes then please describe
the change and mark
patch as v2, v3 and so on. Save some time for reviewers
On Fri, Aug 3, 2018 at 3:02 AM <Qi.Chen@windriver.com> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The logrotate.rsyslog file uses 'cat /var/run/rsyslogd.pid' to
> determine the pid of rsyslogd daemon. This is incorrect, because
> rsyslogd may start in a way that does not create rsyslog.pid file.
>
> Failing to send HUP signal to rsyslogd daemon will result in
> unexpected behaviour. e.g. rsyslogd is writing to /var/log/messages-xxxx
> instead of /var/log/messages.
>
> We should really use pkill to send HUP signal to rsyslogd to ensure
> correct behaviour.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb         | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> index 94ec517..5f8568f 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> @@ -9,7 +9,7 @@
>          delaycompress
>          compress
>          postrotate
> -               /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
> +               @BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
>          endscript
>  }
>
> @@ -34,6 +34,6 @@
>          delaycompress
>          sharedscripts
>          postrotate
> -               /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
> +               @BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
>          endscript
>  }
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> index 9737892..d90695a 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> @@ -125,6 +125,7 @@ do_install_append() {
>      install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
>      install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>      install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
> +    sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>  }
>
>  FILES_${PN} += "${bindir}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

