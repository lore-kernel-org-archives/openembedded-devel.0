Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 74E22719EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 17:19:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so2108858wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vg9fAs0l1FW/pZNlB+Z3fkbBv0cHqgY4qlKaa4LIOfA=;
	b=Btqtc64rGnAXPYzD2Qs1Fgx+En8sfoi9HqAKcyw20+dGFYQFTh5hb56Uyf32adnZ0n
	ey9lV/GgsdnSqBSPsS0fnscHt+UVh1Wbk67vO6/FjhCs07hrB6CA02AgDUWCMfFErxds
	VBpOPQpKxxIMZWtkqjoXAywLiy3Qb0/8xN4Y8NzZYAYFxkFgY6Ub57UzXZ4CPfWqZ+zC
	k9WJNWifkzdfj1uS7pcl1Ji4Dw+xVrAPJNfAjkDGrUM78KQaBer71kFTgIgOMKBCsH2g
	9DjEUkzmBrTNl15glCVrHFyYaINJrvYOf6cujywUrg8UPD/+XJgKFfQAaN5C9KmhveXo
	KQtQ==
X-Gm-Message-State: ABUngvd2rItS4rA0sreW6j2vqAZLvl8Z9Ehw1HUSBtEnn+2P42si5Yb3M6c/enbL1FDaow==
X-Received: by 10.28.230.72 with SMTP id d69mr5121892wmh.119.1479230363407;
	Tue, 15 Nov 2016 09:19:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	125sm5319386wmh.14.2016.11.15.09.19.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Nov 2016 09:19:22 -0800 (PST)
Message-ID: <1479230361.3131.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 17:19:21 +0000
In-Reply-To: <20161115154311.30118-1-git@andred.net>
References: <20161115154311.30118-1-git@andred.net>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH 0/2] ncp - a fast file copy tool for LANs
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
X-List-Received-Date: Tue, 15 Nov 2016 17:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-11-15 at 15:43 +0000, André Draszik wrote:
> "ncp" is a utility for copying files in a LAN. It has absolutely
> no security or integrity checking, no throttling, no features,
> except one:
>   you don't have to type the coordinates of your peer.

Hm, hold on. Something went wrong along the way. I can't actually install it
anymore:

root@poky:~# opkg update
Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp version 1.2.4-r0 has no valid architecture, ignoring.

root@poky:~# opkg install ncp
Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
Package ncp version 1.2.4-r0 has no valid architecture, ignoring.
Collected errors:
 * opkg_prepare_url_for_install: Couldn't find anything to satisfy 'ncp'.


a.


