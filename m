Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SswXf-0003TP-Ls
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 15:49:52 +0200
Received: by pbbrq2 with SMTP id rq2so8198647pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=a/EJ5EC/V4w7qdTqE2CwXxlelBQ2EOh5BnDD3kaM9qw=;
	b=yyK2Qds5pTGSbmMr+dBk9p4jBou1320dVonYZmCdCtGS2OxNB4P58aMJw8pyuaGHNm
	cFPnMLtNEkzJ82iYDYt0G0rycxV756Zz76TB0wnULX5lACHO4eNrufxelfxjsUylN7Jr
	2+ReMbHb2K3JfMf6Mcn7vhDMpicn40GJQdZ8koh+BJFPRRr//3rrwTqgAwys9XOppPkv
	/dYFxPNq/p4v2GycXLaYmNo7DS5MIezlLcfWDHJuxOqYriDEEKSGWK9L/4ch9J2lnboL
	sNAaPBk+F0sLuVU3dQ0Q64C63FXFK0+QgiPoagsWB5Bg+u2CnEtKyOPDcCnoU+w+UX4i
	/Ang==
Received: by 10.68.217.226 with SMTP id pb2mr27770483pbc.105.1342964305358;
	Sun, 22 Jul 2012 06:38:25 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id oi5sm7941189pbb.39.2012.07.22.06.38.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 06:38:24 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Sun, 22 Jul 2012 17:38:19 +0400
In-Reply-To: <6CD04095-FB33-40CA-9417-CF4208642BDC@gmail.com>
To: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
References: <6CD04095-FB33-40CA-9417-CF4208642BDC@gmail.com>
Message-Id: <36A04E8C-1673-4B9A-BA52-8486937FDD5D@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cmake-native-2.8.5-r2.1 compile error
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
X-List-Received-Date: Sun, 22 Jul 2012 13:49:52 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jul 22, 2012, at 6:32 AM, Elvis Dowson wrote:

> With the latest update to the yocto repos, as of today, I get a =
compile error for cmake-native-2.8.5-r2.1, when trying to bitbake =
core-image-sato.=20
>=20
> This had also happened yesterday, when I tried to build =
core-image-sato, from the master branch, which was updated 2 to 3 weeks =
ago. I tried with the latest updates, and still the error persists.=20
>=20
>=20
<snip>
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/x86_64-linux/cmake-native-2.8.5-r2.1/temp/=
log.do_compile.60499 for further information)

After updating the cmake and cmake-native recipes to v2.8.8, it compiles =
cleanly on Ubuntu 12.04 LTS 64-bit. I've sent patches to the =
openembedded developer mailing list.


Best regards,

Elvis Dowson=

