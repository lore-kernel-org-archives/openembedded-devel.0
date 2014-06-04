Return-Path: <joe@deserted.net>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6088D60424
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 02:17:44 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so6714798iec.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 19:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0nvEY0xgVB1WMjSoSzd8SHhskNqdkvE6AKaJJbJo1gQ=;
	b=gGlNrZtK4aTb5a8qAsYMxesAdq9YB8zoEtiuxpSmuL+JZtrWB/LySm2QktqFtFDRxI
	u54tvzYoAZTPEVimUMwBi+Bg32LM5zsV10MlyY+J9ShdohrqZnaJjtkrPEw00Giu2eUg
	IQTXaLW/T2rXQNxlf3HxIjz+SuxQw0Cm+wd/TfTwFYb4icFCYU5U+bLdDxBzf+tLneND
	GeaEyVnQypCDwcCTfvwmIrXq2y+PR4QV/c7bvwxULdFsB5ack12YVhAEGtzGsyK+Ckqu
	+Boe94mKKA/sC3DfVM6bDuE4So2TUcIZPuccfQauzKxwFugnRAbdN6ZFZ1Z2eoN+ORW7
	4K1A==
X-Gm-Message-State: ALoCoQlOasofYNXs5ppQ4wGZR8EoZO1eiZ6AwZSwKyLHKHlKXf98S0ohEX/Kf4AZP2KUXVRjNT8T
MIME-Version: 1.0
X-Received: by 10.50.78.8 with SMTP id x8mr971995igw.45.1401848265354; Tue, 03
	Jun 2014 19:17:45 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.42.81.130 with HTTP; Tue, 3 Jun 2014 19:17:45 -0700 (PDT)
In-Reply-To: <1401720051-23378-1-git-send-email-ml@communistcode.co.uk>
References: <1401720051-23378-1-git-send-email-ml@communistcode.co.uk>
Date: Tue, 3 Jun 2014 22:17:45 -0400
X-Google-Sender-Auth: l6xu9VCUKbB_XvmDH_coiMdVDrk
Message-ID: <CANBf+V3_RJuXnr1b-gKKBVB-QnKOg3Do6nR74DB3pF2oQofXsA@mail.gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ntp: fix incorrect pidfile handling in ntpd init script
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
X-List-Received-Date: Wed, 04 Jun 2014 02:17:53 -0000
Content-Type: text/plain; charset=UTF-8

Merged, thanks.
-Joe.

On Mon, Jun 2, 2014 at 10:40 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
>
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntpd | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
> index a62b8ce..3cd1c6c 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpd
> +++ b/meta-networking/recipes-support/ntp/files/ntpd
> @@ -1,9 +1,22 @@
>  #! /bin/sh
> -#
> +
> +### BEGIN INIT INFO
> +# Provides:        ntp
> +# Required-Start:  $network $remote_fs $syslog
> +# Required-Stop:   $network $remote_fs $syslog
> +# Default-Start:   2 3 4 5
> +# Default-Stop:
> +# Short-Description: Start NTP daemon
> +### END INIT INFO
> +
>  PATH=/sbin:/bin:/usr/bin:/usr/sbin
>
> +DAEMON=/usr/sbin/ntpd
> +PIDFILE=/var/run/ntpd.pid
> +
>  # ntpd init.d script for ntpdc from ntp.isc.org
> -test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
> +test -x $DAEMON -a -r /etc/ntp.conf || exit 0
> +
>  # rcS contains TICKADJ
>  test -r /etc/default/rcS && . /etc/default/rcS
>
> @@ -23,12 +36,12 @@ startdaemon(){
>         # this.  If ntpd seems to disappear after a while assume TICKADJ
>         # above is set to a totally incorrect value.
>         echo -n "Starting ntpd: "
> -       start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
> +       start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --startas $DAEMON -- -u ntp:ntp -p $PIDFILE "$@"
>         echo "done"
>  }
>  stopdaemon(){
>         echo -n "Stopping ntpd: "
> -       start-stop-daemon --stop -p /var/run/ntp.pid
> +       start-stop-daemon --stop --quiet --oknodo -p $PIDFILE
>         echo "done"
>  }
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

