Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD0862134
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 10:21:58 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id r36so40612647ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hz0jUHK4j4db1Qnp9NRktZn+0VrC1bm9An9JMgLNinQ=;
	b=Q6yic31bYuSVPTA8/Im5zepDcoU8oLyj1IA7L21gJL9w5F8X8xVaGxkzOgpRaeeYf+
	+1+k5xRZ3isYxfdG9CL+OSOmhFR3ZThOYPtwAurMYhnFRVESUhbHLU4xtGUVzg8lNvOn
	yt/1pFlYe5PJKOZSVq1h3AxXRO4cf3O9WdsACVXnXLnFW5O1yMhtnD5TwRMbsGtZqHrA
	RrnEMLY72K/ibUWFCsNb36hda1uIrmIy+g/xUpa3dVRA/ot7PcYhp+0mjc1fOf6q2Cc1
	Qi3FVD7HwopYmhezHN9y+fDZSE9vduP5p4lVkLQcoWBxvoMZyYe1JhYELqc56gXZ+STA
	rCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hz0jUHK4j4db1Qnp9NRktZn+0VrC1bm9An9JMgLNinQ=;
	b=GF9bH4aBVP3qS5/iQmV5nNk3vfWUegYj98imNADOs3YMppnxQnHJx88F1eV6GUnmQC
	eMVG6n0oPOJqrk+fyCgSZD24y0eZz1/aLgoo0025h43ozjW6JLo1Cnpw8094ySZxDnkI
	GCWm9CjZGkH2lknEfzqp48x58UbGvUa/FzlQu/8wXxs6V6wP2/+TQr5O0ooBYksRXKbp
	p7GN/zCo8xb0UfR+9dQ9mLboQmxcBG2AyMA8J4+EjtBbGsHG+Pcl0ZIX7zjVkCs+PPVv
	PwcFv6bFqUyYVGqtKMZgh7bYbyvgYK7fSSl94np8xVHxm729jwDzSzv3gEo1htL+gAwn
	qHMA==
X-Gm-Message-State: AIVw111XViT+rTH8f9E0Due6xSWLcTXRVeg3DsmavRa4EUga9LF0y9vq
	VUXZa8Ismgl5cvLT3Nx4g5CudZxS1mIc
X-Received: by 10.107.6.23 with SMTP id 23mr17977079iog.122.1500286919749;
	Mon, 17 Jul 2017 03:21:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Mon, 17 Jul 2017 03:21:39 -0700 (PDT)
In-Reply-To: <1500256499-807-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1500256499-807-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jul 2017 11:21:39 +0100
Message-ID: <CAJTo0LbQS--Yks1DhGGC-POAUiMZcm5nrpPcVZQuA8O3mHWG5g@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bian Yaqin <bianyq@cn.fujitsu.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] openssl : By default, disable cryptodev.
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
X-List-Received-Date: Mon, 17 Jul 2017 10:21:59 -0000
Content-Type: text/plain; charset="UTF-8"

On 17 July 2017 at 02:54, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> Because according to the other Distros(e.g. Ubuntu, Fedora), cryptodev is
> not enabled.
> If users want enable cryptodev, just have to add "cryptodev-linux" into
> PACKAGECONFIG.
>

Wrong list, you meant oe-core@.

There was a discussion about this back in March ("openssl: disable
cryptodev by default") where Wind River reports that they see a number of
customers using hardware crypto.  I'm all for making this an option but
whether to enable/disable it by default isn't clear.


-DEPENDS += "cryptodev-linux"
+PACKAGECONFIG[cryptodev-linux] = ",,cryptodev-linux"

Just call this cryptodev, imho.

+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux',
'cryptodev-linux', '', d)}"

No need to do this, as that is what the third option to the PACKAGECONFIG
flag is for.

+CFLAG += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux',
'-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS', '', d)}"

If you add those to the first value in the PACKAGECONFIG flag list then you
could just add PACKAGECONFIG_CONFARGS to CFLAG, and using PACKAGECONFIG for
other options in the future is then trivial.

Ross

