Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U6QRq-0001Id-Vu
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 19:55:51 +0100
Received: by mail-ie0-f173.google.com with SMTP id 9so5235339iec.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=uI4NCTyX0pTJjW00CAf7oJvgvqRIASx2zmkGIXTc9ns=;
	b=rSEOaHIgV2x8Xrb4vuMFlPVjou6aPNCFWzw7mkmUWvozuKzeRG9OHOHAGUkt7aHBfp
	Divf76K9IMyLWM3Gr4zifaDTDAOOl77PpYgFIDVAZ8MhyO/k+oLwQQ+K3WxvQ5HAaaR+
	fZlZzsOdxSvyPNnbCm5SnniMSUPdtfH1M2hyW85R+uaiw6gzHpsS4yAosdWDC9kOGtQ1
	gkkE+gJWzfx58ZO5mrR56AlEx8t072m1b729YQ/S6jLUq441AqyleQJd8TLN6db4ZZGP
	CQ1lk6vrd7q12tlQsSp2FrfDyTJ0Dnwd4U1PVCKuEyukiJu418fX/GFGaNa5T6xrCIwM
	9EBA==
X-Received: by 10.50.153.198 with SMTP id vi6mr3299981igb.112.1360953586672;
	Fri, 15 Feb 2013 10:39:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Fri, 15 Feb 2013 10:39:15 -0800 (PST)
In-Reply-To: <20130214074532.GI3300@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<1360776335-21633-2-git-send-email-raj.khem@gmail.com>
	<20130214074532.GI3300@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2013 10:39:15 -0800
Message-ID: <CAMKF1sqA=XarFcXewAJ7MjEG=ZtoLNQ6mvTjLHMGUQRVW8ZXig@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 2/2] meta-systemd: Append ${PN} to SYSTEMD_SERVICE
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
X-List-Received-Date: Fri, 15 Feb 2013 18:56:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 13, 2013 at 11:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm still getting missing RPROVIDER for openssh-sshd-systemd and bitbake
> -e shows interesting behavior:
>
> # $RPROVIDES_openssh-sshd [2 operations]
> #   append
> #   /OE/shr-core/meta-openembedded/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend:8
> #     "openssh-sshd-systemd"
> #   rename from RPROVIDES_${PN}-sshd data.py:161 [expandKeys]
> #     "sshd"
> # computed:
> #   "sshd"
> RPROVIDES_openssh-sshd="sshd"
>
> Any idea why?

hmmm I do not get it. Did you do a clean build or incremental ?


