Return-Path: <eduardo@monkey.io>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id A80E9703A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:43:01 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so400484wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 19:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=stQlwWBVfuQlUEPTRdYKYi47BGjdgAyaDFnkDwO9QWY=;
	b=Yhs1DScTQNrvmkJHlK3VEgG5ouSPIQdmQsqQhGoVDrEtWxPQ4YDIyTvR0bju0dTb/N
	F+29POBAvGmn6iUbXG+Dd9P+kDwN94/Az/iYjr4PIGyGqxSQfjh6hQdnspkbV0vUHCMA
	tYe0vw2YaEEJeRXGJvBAh91K17DV/WIK8Mq6ocvH+Lo2i6jXvW0NMxQZBa2eFBCTHRdN
	Z1RzHrdiPrcwklURnKhxPYWvyzOK3rykf2cRTpbx6lMtcOv75xu6fb0gPHxFnpKS7l+e
	ja1X89MR/mp4nfV2+9PZHjLE7Y+50B038/9HT3g//D8P3J5WT0wCoMFYvRGMpWkszX4F
	Drow==
X-Gm-Message-State: ALoCoQmheTZmInII2dwseDfU7KjudWD4b6Ps826ipRFPLdxM9+jsfg8p+bj/EXvXHdZWneBlAWY9
MIME-Version: 1.0
X-Received: by 10.180.36.225 with SMTP id t1mr1229534wij.38.1405046582677;
	Thu, 10 Jul 2014 19:43:02 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Thu, 10 Jul 2014 19:43:02 -0700 (PDT)
Date: Thu, 10 Jul 2014 20:43:02 -0600
Message-ID: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: systemd service failing at start
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
X-List-Received-Date: Fri, 11 Jul 2014 02:43:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

For some reason the systemd service that i plan to use for Monkey HTTP
Server in Yocto is not starting up when booting the core-image-sato image.
Once is booting it hangs saying:

  [  OK  ] Stopped Monkey HTTP Server
  [  ***   ] A Start job is running for Run pending postinsts (20min 12s...)

My service file looks like this:

--- start of monkey.service---

[Unit]
Description=Monkey HTTP Server
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=forking
ExecStart=/usr/bin/monkey --daemon
PIDFile=/var/run/monkey.pid.2001
TimeoutSec=10

[Install]
WantedBy=multi-user.target

-- end--

If i deploy Monkey RPM (cooked by bitbake) on the Sato image and i add this
service once the system is up, systemd can start the service without
problems, everything works: start, stop, status, etc. Do i am missing
something that can be generating some problems on the first boot ?

thanks for your help

-- 
Eduardo Silva
Monkey Software

