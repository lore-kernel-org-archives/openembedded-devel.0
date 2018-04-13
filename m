Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71F7F744B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 20:25:45 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id p33-v6so11207374otp.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QY7ZNehXNTIFHUodEI1naqg41cckagptQYg7kNrrS4Y=;
	b=rBsqeiXcHlHwnPKEZO+6/e8IMEFZjrAUHf8IJgDcM1RWjq+RrIH0WvPILc6egvZj6c
	9rT9vbJ4h/SEAUajtB/BkGOKHxHBMrL9eVa4bLBxCQtDzGpHc1++S4oW70x08hsQKxK6
	+LaFKIRvVl6re/YPPdtGjoI9jChZa15Cdu0FimDbHGgfpsB98fub8j5ESxqHPLzcleSq
	YbaDDrUkoe5ESx+ztiozs0TriPf3xjR9E17qxTv+dapt54Rq/5Do0SEBouHwzVQBbhl/
	A/xz7c3nIL3LvnJlvZL5UfKThRRZcBkHMm+2egqf6XXZcZKrRahj+bcDuphcyHMuNUW4
	z27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QY7ZNehXNTIFHUodEI1naqg41cckagptQYg7kNrrS4Y=;
	b=eoYC8nX3VWdhfhp3gi387Uuz+n/n+3ORqyjSjeEqR43xsf/k67xKeEzRhrbcBSC7L9
	Jm0dOytReFe8T6zJjLIuEEdwDY0eYNyQgYN3Ak8vuJbWlWBkgL6MxhxT85ZZwVAK70SS
	3TD2wk0mgcYm2AxwsYiLnnJH4aLPiLUK0cTVw/K1ViD2zYaHjGvfRhhFONlWn3va5car
	pJL82D1ZGcvJCM8pnDkXkYSixnL/Hr0xEPd2opPSsojM885560BpFcBFk6g/gMI7thOj
	0HSsX5+kDpSw9grQPjo1h1cW5d+yDlg8n+2PCX1J657YYaiR4HaZzWCEyx9GzH5xltvD
	8nNw==
X-Gm-Message-State: ALQs6tDJKXPcouieAnCIKsK0f+ymG1dBllrUK1SfEgRioz/md0574aIy
	Nskg13pv5FH+Vwjq72BqoNPpoeHcDcyTytzwzRE=
X-Google-Smtp-Source: AIpwx4/2hTuBbn8Tq2jtC1xiuFmU2Ge7cAzCYMXZhtMPjWm0tctv1DmkaPeRELyWcWnRQ3Pi/cfB6XwLhfzNxd2HAAg=
X-Received: by 2002:a9d:34b6:: with SMTP id
	g51-v6mr4755246otc.180.1523651145906; 
	Fri, 13 Apr 2018 13:25:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Fri, 13 Apr 2018 13:25:45 -0700 (PDT)
In-Reply-To: <1522465461-19511-1-git-send-email-akuster808@gmail.com>
References: <1522465461-19511-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Apr 2018 22:25:45 +0200
Message-ID: <CALbNGRQhEfExsH2odx2r_NwQuAzzBN6bSV0GMhhX4nc7dDUKTg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix many typos in DISTRO_FEATURES PACKAGECONFIG decodes
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
X-List-Received-Date: Fri, 13 Apr 2018 20:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 31, 2018 at 5:04 AM, Armin Kuster <akuster808@gmail.com> wrote:
> fixes issues found with yocto-check-layer
>
>  File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_smar=
t.py", line 436, in DataSmart.expand(s=3D"nss ifupdown netconfig dhclient d=
nsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', ''=
, d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', =
d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', ''=
, d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ", varnam=
e=3D'PACKAGECONFIG'):
>          def expand(self, s, varname =3D None):
>     >        return self.expandWithRefs(s, varname).value
>
>   File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_sma=
rt.py", line 426, in DataSmart.expandWithRefs(s=3D"nss ifupdown netconfig d=
hclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'sys=
temd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolek=
it', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'blue=
z5', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ",=
 varname=3D'PACKAGECONFIG'):
>                  except Exception as exc:
>     >                raise ExpansionError(varname, s, exc) from exc
>
> bb.data_smart.ExpansionError: Failure expanding variable PACKAGECONFIG, e=
xpression was nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contai=
ns('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains=
('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}     ${@bb.utils.contains=
('DISTRO_FEATURES', 'wifi', '', d)}  which triggered exception TypeError: c=
ontains() missing 1 required positional argument: 'd'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb   | 7 +=
+++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.10.6.bb
> index f201a75..d90b782 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.10.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.10.6.bb
> @@ -59,11 +59,12 @@ do_compile_prepend() {
>  }
>
>  PACKAGECONFIG ??=3D "nss ifupdown netconfig dhclient dnsmasq \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d),=
 d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)=
} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}=
 \
^ Whatever magic scripts wants to tell us: I think this was OK before.

The patch turns the logic. Intended is:

For systemd in DISTRO_FEATURES: PACKAGAGECONFIG +=3Dsystemd
For systemd NOT in DISTRO_FEATURES *AND* x11 in DISTRO_FEATURES:
PACKAGAGECONFIG +=3Dconsolekit

By the way I did the similar mistake (+broke parsing really) in V1 of
gobject-introspection-patch. Checking logs I found

commit b55738ef8d30d6aa92e2e644a50f4b06ec541204
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Mon Nov 13 16:04:18 2017 +0800

    networkmanager: add consolekit only when x11 is enabled

    consolekit depends on virtual/libx11 then it requires x11
    distro feature, so add consolekit option only when x11
    is in DISTRO_FEATURES.

    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Armin Kuster <akuster808@gmail.com>
    Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

That helped me to remember what was intended.

To avoid this in the future I suggest to have systemd/consolekit in
one line. That should make it more clear.

Shall I send a patch on top of master-next?

Andreas

