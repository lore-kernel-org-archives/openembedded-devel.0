Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkIsN-0002kl-Co
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:51:31 +0200
Received: by pbbrq2 with SMTP id rq2so3242623pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=jHAAWRiTjPmKRy7Xf89F3OfEpUoy/MGGQGLeOJDVhaw=;
	b=VdKLo1MtQmrZT1WKVmWHgoX3jKTuqlZIuVIt237D+Z+HH/M+tt/ZPFrWi3Yu38ha17
	a+ECndJEq5BZUaDX2MbDuRdZ81bpXssdkyIAAVjFeC1Xhv4oLK6qVN8rs/mJugxu/6vc
	BH50I1zg37SCCKemaAOQpzK7Y4wHjq7RaIWoX+XEgt4oQaKUcuoj7ZVYd+Q3gUMP6P/M
	2GkuMzXzv2Rky4jIXmQ1p3lLq1jIp5a8hifwX5tFLHMJOCmsvtB2ZkNFfejed3hEXsCX
	PvM/3t/kvIXYznTi/kzF3gxxg3iMtX2Wa14ZW48uG8/u5NEuZA9/b22R8xdKJIAb40E3
	/OhQ==
Received: by 10.68.225.9 with SMTP id rg9mr9440871pbc.137.1340905235946;
	Thu, 28 Jun 2012 10:40:35 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id pt2sm2700403pbb.58.2012.06.28.10.40.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:40:35 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Thu, 28 Jun 2012 21:40:29 +0400
In-Reply-To: <20120628173400.GA24537@localhost.jama.net>
To: openembedded-devel@lists.openembedded.org
References: <1340336931-7978-1-git-send-email-elvis.dowson@gmail.com>
	<AF874800-B131-47EF-81EF-07B7C98BCA0F@gmail.com>
	<20120628173400.GA24537@localhost.jama.net>
Message-Id: <0FAD4674-BCEE-476E-B7FE-26FDE45493DC@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-openembedded] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Thu, 28 Jun 2012 17:51:31 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

HI Martin,

On Jun 28, 2012, at 9:34 PM, Martin Jansa wrote:

> On Thu, Jun 28, 2012 at 09:09:37PM +0400, Elvis Dowson wrote:
>> I sent this patch a while back, and this still hasn't been applied. I =
just did a git pull and noticed this. Its a trivial patch, so would it =
be possible for someone to please apply it.
>=20
> It's trivial but if some image or task had lighttpd in RDEPENDS then =
it
> got also systemd support with it.. so those images/tasks need to be
> fixed too.

I did a full clean build, and the last three patches squashed all =
warnings for the following layers:

BBLAYERS ?=3D " \
  /tool/yocto/poky/meta \
  /tool/yocto/poky/meta-yocto \
  /tool/yocto/meta-openembedded/meta-oe \
  /tool/yocto/meta-xilinx \
  "

I guess if someone else encounters some issues, they can fix recipes in =
their meta-layers accordingly.

Best regards,

Elvis Dowson=

