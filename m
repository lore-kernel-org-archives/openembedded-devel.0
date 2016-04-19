Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 603C560722
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 07:41:02 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id g184so8809394lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=i2TsETO2uckHsxrpmjIg0N7+W8oRd4yeMshL8892vgQ=;
	b=IcqDH92LXyHJDh8oxbnn4qGZdivSHmGQRdDc42LMhfxdwny3w1xW9lQg87/ZcPo5PB
	iCUqbcKaq5GaFMw7ZpE17dA3n0SMK7mtQAHm+zCZHU6cC2MKOUol91QtDfgpERtc3Foq
	i7+BYmIAieK45jqbvl9bGiZVaQ7bhtbev0ywncoZE8dsUI/kXMzPZ+sGgbhuTmjuQIFP
	qaM9PVHuBcioztuhtF/Y5xNwetw1Jm52UFvGvsOKZMiL1PQ9wXyLp3RsEoO+J3JeuLbf
	LnXti+cHLv4subav+MQ13l6FTMxHB5u07TEx4JxJRLfJYiLVGT3b6l3h2M00O4haapOj
	mBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=i2TsETO2uckHsxrpmjIg0N7+W8oRd4yeMshL8892vgQ=;
	b=HZKRLHiv60AwE+Ne7FQGZPJjw+zQEmUnXSvwpSHouqWWGIediTVvtcKdmz7p/xUu45
	CiFRAxSq/gcIhj1TC95znfdN2rkHkDVme++Ypl7KpcDDTBqBWh2B17UVrfFTir/TBKuV
	icv83finyGVPIzwjnZCAq2RBn7FSyLDVmQXjxynyqw7PABlsKnK/PmkJXz6IozF2weLo
	42CGJpZs4rQZakb8Y+aye6+pJPdWkPcAGOIankouVj5e+4e1FGEx1bi62P2TbUyAl+pq
	6QLyN+Od1NbinZCjYyXafG0mhqNMdRe1XJPL2/zjlFSKawpAJqJjLq/2blxU+SUjM5LI
	h+1w==
X-Gm-Message-State: AOPr4FXmMC/X6TlKaFIi3zFsWJgVnGlKvjqMlMI12swNqa/MOuHD9g5hyGWpwjpvA207OQ==
X-Received: by 10.112.47.232 with SMTP id g8mr724557lbn.55.1461051662489;
	Tue, 19 Apr 2016 00:41:02 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	lb8sm8041553lbc.32.2016.04.19.00.41.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2016 00:41:01 -0700 (PDT)
Date: Tue, 19 Apr 2016 09:41:00 +0200
From: Anders Darander <anders@chargestorm.se>
To: Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20160419074100.GA9350@ad.chargestorm.se>
Mail-Followup-To: Joe MacDonald <joe_macdonald@mentor.com>,
	mark.asselstine@windriver.com, rehsack@gmail.com,
	openembedded-devel@lists.openembedded.org
References: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: mark.asselstine@windriver.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 19 Apr 2016 07:41:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Joe MacDonald <joe_macdonald@mentor.com> [160419 05:29]:

> From: Mark Asselstine <mark.asselstine@windriver.com>

> The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> dnsmasq runtime. No sysvinit scripts are included in systemd only
> builds (and should not be) and the dnsmasq executable has not moved to
> /usr/sbin.

> Reverting to the previous version of the systemd service file. If
> folks want the local dnsmasq instance to be queried before going to
> an external DNS they should add 'nameserver 127.0.0.1' to
> /etc/resolv.conf. Or submit a change which will work with systemd.

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---

> Mark,

> Thanks for the patch.  In the interests of not causing any more hassle
> than I already have, I'm proposing this as an alternative to what you sent
> earlier today.  This hopefully preserves the resolvconf/start-stop
> functionality while not relying on any sysvinit-ness.  What do you think
> about this as a middle-ground?

> Anders,

> I trust that nothing Mark and I are discussing here changes the issue you
> noted about dnsmasq just falling over after a few minutes.  I propose we
> dig into that separately, since it looks like a different problem probably
> related to the uprev.  If it turns out that once we merge something to
> support systemd-only builds that resolves the 'dnsmasq vandalizes itself'
> issue, even better.

Well, I've tried this patch, but dnsmasq isn't running. Was it run-time
tested?

Isn't MAINPID the PID of the main process started by systemd? And -x
should specify a path to the pid-file?

Logs below.

Cheers,
Anders

[FAILED] Failed to start DNS forwarder and DHCP server.
See 'systemctl status dnsmasq.service' for details.

Running `systemctl status dnsmasq.service` gives:

[[0;1;31m=E2=97=8F[[0m dnsmasq.service - DNS forwarder and DHCP server    L=
oaded: loaded (/lib/systemd/system/dnsmasq.service; enabled; vendor preset:=
 enabled)
   Active: [[0;1;31mfailed[[0m (Result: exit-code) since Fri 2016-04-08 11:=
07:27 CEST; 8min ago
  Process: 384 ExecStart=3D/usr/bin/dnsmasq -x $MAINPID [[0;1;31m(code=3Dex=
ited, status=3D1/FAILURE)[[0m
  Process: 381 ExecStartPre=3D/usr/bin/dnsmasq --test (code=3Dexited, statu=
s=3D0/SUCCESS)

Apr 08 11:07:27 ccu systemd[1]: Starting DNS forwarder and DHCP server...
Apr 08 11:07:27 ccu dnsmasq[381]: dnsmasq: syntax check OK.
Apr 08 11:07:27 ccu dnsmasq[384]: dnsmasq: bad command line options: try --=
help
Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;31mbad command line options: try --=
help[[0m
Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;31mFAILED to start up[[0m=20
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Control process e=
xited, code=3Dexited status=3D1[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;31mFailed to start DNS forwarder and =
DHCP server.[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Unit entered fail=
ed state.[[0m
Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Failed with resul=
t 'exit-code'.[[0m

--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

