Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>)
	id 1TtcMB-0001fE-AK; Fri, 11 Jan 2013 12:01:04 +0100
Received: by mail-oa0-f41.google.com with SMTP id k14so1650156oag.14
	for <multiple recipients>; Fri, 11 Jan 2013 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IzTO6TEUxCsxJU7gYJFhBIgoY9ew6kqJnVh1buKFwZ4=;
	b=iauAsIgT6NGvqLDG8IQRcNUqGB/+RuuJqNkZ7iU06Rh1YRVpVNbZq9i3FqeOfY0bQg
	ohTepS0oL4CCevyFXmloaUGiN4ovN+DdUL6Fnfpv/xq6DJ57YPWKGwg+OtvW/qLNTxR5
	8KLMEDd+BEi7anCO4fCJCBrmRvoVxj/osXMFPXsfusoO3fGMm3ZoRK4fFonyoyVBCjyf
	O8DjJhMAiCvgaLaQbJ6x38oAyVocNNegULH5dT+e1FcYFMHGF+aTMt15RRBsogkSfNDD
	49Y3rR5hZxyxJ1AiKmVhSp1aPJuIGfoGFy9wq0TKlDxqLSyDL0iKupczEQnEW4ydY8JS
	uZLA==
MIME-Version: 1.0
Received: by 10.60.31.8 with SMTP id w8mr45123583oeh.55.1357901148046; Fri, 11
	Jan 2013 02:45:48 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Fri, 11 Jan 2013 02:45:47 -0800 (PST)
In-Reply-To: <20130109101310.38A4C103A7@opal>
References: <20130109101310.38A4C103A7@opal>
Date: Fri, 11 Jan 2013 11:45:47 +0100
Message-ID: <CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : dhcp: Add systemd unit file for dhclient
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
X-List-Received-Date: Fri, 11 Jan 2013 11:01:26 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/9  <git@git.openembedded.org>:
> Module: meta-openembedded.git
> Branch: master
> Commit: 6f86cfec550105c60097b91434ab1ae54614265f
> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=6f86cfec550105c60097b91434ab1ae54614265f
>
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Oct 29 17:26:45 2012 -0700
>
> dhcp: Add systemd unit file for dhclient
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> ---
>
>  .../dhcp/dhcp/dhclient.service                     |   13 +++++++++++++
>  .../dhcp/dhcp_4.2.4-P2.bbappend                    |    7 +++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
> new file mode 100644
> index 0000000..76d64d5
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Dynamic Host Configuration Protocol (DHCP)
> +After=syslog.target network.target
> +
> +[Service]
> +Type=forking
> +PIDFile=/var/run/dhclient.pid
> +EnvironmentFile=-/etc/default/dhcp-client
> +ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
> index a18fda8..fde2426 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
> +++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
> @@ -5,9 +5,12 @@ inherit systemd
>
>  PRINC := "${@int(PRINC) + 1}"
>
> -SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
> +SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd dhcp-client-systemd"
>  SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
>  SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
> +SYSTEMD_SERVICE_dhcp-client-systemd = "dhclient.service"
>
>  SRC_URI += "file://dhcpd.service \
> -            file://dhcrelay.service"
> +            file://dhclient.service \
> +            file://dhcrelay.service \
> +           "
>

Hi,

this seems to miss a pid file:

Dynamic Host Configuration Protocol (DHCP)...
systemd[1]: PID file /var/run/dhclient.pid not readable (yet?) after start.
[FAILED] Failed to start Dynamic Host Configuration Protocol (DHCP).
See 'systemctl status dhclient.service' for details.


Any idea why it is missing?


--
Regards
Samuel


