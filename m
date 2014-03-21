Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E891E6F9CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:07:19 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so1549912eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 02:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=5paD5fZTCVWEC+XQOVdnJrT3Hsa0Ib574RyuvhQDrYo=;
	b=PCKkmF+sXvhZRnVHDpZG92dUolMcs/sHeD/7Cxf7V0GKDW4yPocs0RtZ2OQXuacETD
	wPycG+W40E2dgo5plkh1dCp8CpqqhIY4xFwGhPwqB5SvlwtuA8Mpr42K/jPBHgTSRbxP
	VdifaiflZD8xM9RZcJfGJgLUzM5MQj6f24YxdBY8cggLrcxZLD6ygAFIJGlGIAvtNaMF
	Ya2NEL8G/1IMj5Vus2FcZLKUGD8SV+L6+TtSJArIcUKcGNcBlJBX1Cz9U9+LQi0X/wdI
	ASZUd8tWuR8ejgcAMHQ+2gj+FU4GSCnKWuvw4udJsgdFGUndqRtQT+jhk3BeiOJ2/mqB
	rumA==
X-Gm-Message-State: ALoCoQk+U165dbfY82Elbz/oV+k27DKhas9uaFrchBo/SEOgGQpotxdUsqig+XdT1FlrfzXYHnUO
X-Received: by 10.14.194.133 with SMTP id m5mr46856631een.38.1395392839164;
	Fri, 21 Mar 2014 02:07:19 -0700 (PDT)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o4sm10253567eef.20.2014.03.21.02.07.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Mar 2014 02:07:18 -0700 (PDT)
Message-ID: <532C016C.2060309@dominion.thruhere.net>
Date: Fri, 21 Mar 2014 10:07:56 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1395386596-56931-1-git-send-email-george.nita@enea.com>
In-Reply-To: <1395386596-56931-1-git-send-email-george.nita@enea.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-filesystems] [PATCH] Add fusermount to fuse by default
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
X-List-Received-Date: Fri, 21 Mar 2014 09:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

George Nita schreef op 21-03-14 08:23:
> Without fusermount the '/etc/init.d/fuse status' command exits with
> error. Added fusermount to PACKAGES list and ensured it gets installed.

How are you ensuring it gets installed? You only added a new packages, you
haven't updated any R* variable to take the new package into account.

> 
> Signed-off-by: George Nita <george.nita@enea.com> --- 
> meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb |    5 ++++- 1 file
> changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
> b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb index
> a761932..1e8f958 100644 ---
> a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb +++
> b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb @@ -21,7 +21,8 @@
> inherit autotools pkgconfig
> 
> EXTRA_OECONF = "--disable-kernel-module"
> 
> -PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
> libulockmgr-dbg" +PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr
> libulockmgr-dev \ +             libulockmgr-dbg fusermount"
> 
> RRECOMMENDS_${PN} = "kernel-module-fuse"
> 
> @@ -40,4 +41,6 @@ DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
> 
> do_install_append() { rm -rf ${D}${base_prefix}/dev +    install -d
> ${D}${base_bindir} +    install -m 0755 ${B}/util/fusermount -t
> ${D}${base_bindir} }
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTLAFsMkyGM64RGpERAj7iAJ9imAv8fVGxLzkGfEY1M3iyyGbnHwCeKtaa
GyHWWpd05haNOE69NMQQLaA=
=XU/E
-----END PGP SIGNATURE-----

