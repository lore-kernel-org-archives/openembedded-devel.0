Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Phqwo-000224-9y
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 23:01:10 +0100
Received: by iyj18 with SMTP id 18so6166334iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=GDPzn7P6XHbfI6kFiurVovWp28l5dwEcf/Pp+ZiNSMw=;
	b=Ew6+nDFuOi9Ri7cZfKW0SExqE9o1MnR+jazXTZK0s8I+FC2CwvfAp2W7ACQ9rIkP5g
	V0OcMe8jRzIILv/6djpJbQ6Sbo927YjuIsuAVFgs2Ay84tqP90P4PQW84ul2iNqtrvtv
	AN8VKvrJV2ugc9PU8ggo4iJBreP2jb51kW7Bc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fdWmeYfpbwMS1sTgD9tl3lx3oljLCF3vBcAFouOwVDtlWvDZYL8OSFICwdOdQi6UKH
	nHFXOJi7BnKwLxWgbc4i1mTxVJcD7zPpK9ysGQ/BzmGZj5cHhuAjinuEQeJJEoH/PXlh
	OPYA9Yw2fT44VVwrTvGkt9ip2eI4hytpqk0sU=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr7283141ibb.108.1295992818796;
	Tue, 25 Jan 2011 14:00:18 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 14:00:18 -0800 (PST)
In-Reply-To: <ihng8a$64q$1@dough.gmane.org>
References: <AANLkTin20N1KWTzWN6A3dX_ngmKW1oFPAsZ74RpUWTpR@mail.gmail.com>
	<ihng8a$64q$1@dough.gmane.org>
Date: Tue, 25 Jan 2011 23:00:18 +0100
Message-ID: <AANLkTikEBhmhy4LzLU9YW329bdW7wKazCpL-w6uJ7bqb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Full Archive of handhelds.org source repo?
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
X-List-Received-Date: Tue, 25 Jan 2011 22:01:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-01-11 22:07, Tom King wrote:
>> Does anyone have a full archive of the handhelds.org source repo?
>>
>> we keep seeing builds fail because we are missing pieces.
>>
>> if you have it an can upload it so we can all use it that would help a lot.
>
> Dunno if it's the full one, but the angstrom source mirror has:
>
> angstrom@discovery:~/website/demo/yocto$ ls ../../unstable/sources/ |
> grep handhelds | wc -l
> 584


Half of them are probably md5 files, but still a good collection.

The following recipes fetch from handhelds.org:

alsa/alsa-driver_0.9.6-hh4c.bb:SRC_URI =
"ftp://ftp.handhelds.org/packages/alsa-driver/alsa-driver-${PV}.tar.gz
\
gkdial/gkdial_1.8.1.bb:SRC_URI =
"http://familiar.handhelds.org/source/v0.8.2/${PN}-${PV}.tar.gz \
glibc/glibc_2.3.5+cvs20050627.bb:SRC_URI =
"http://familiar.handhelds.org/source/v0.8.3/stash_libc_sources.redhat.com__20050627.tar.gz;name=archive
\
glibc/glibc_2.3.5+cvs20050627.bb:	
http://familiar.handhelds.org/source/v0.8.3/stash_ports_sources.redhat.com__20050627.tar.gz;name=ports
\
gpe-autostarter/svn-build.patch:+	@printf "
ftp://ftp.handhelds.org/pub/projects/gpe/\n"
gpe-autostarter/svn-build.patch:+	@printf "
(handhelds.org:~ftp/pub/projects/gpe/source)\n"
ipkg/ipkg-native_0.99.163.bb:SRC_URI =
"http://www.handhelds.org/pub/packages/ipkg/ipkg-${PV}.tar.gz \
ipkg/ipkg_0.99.163.bb:SRC_URI =
"http://www.handhelds.org/pub/packages/ipkg/ipkg-${PV}.tar.gz \
libhal-nm/libhal-nm_0.0.2.bb:HOMEPAGE = "http://www.handhelds.org/~mmp"
libhal-nm/libhal-nm_0.0.2.bb:SRC_URI =
"http://www.handhelds.org/~mmp/files/libhal-nm-${PV}.tar.gz"
libopie/libopie2.inc:HOMEPAGE = "http://opie.handhelds.org"
libosip/libosip_0.9.7.bb:SRC_URI =
"http://handhelds.org/packages/libosip/libosip-0.9.7-hh2.tar.gz"
linphone/linphone-hh_0.12.2.hh1.bb:SRC_URI =
"http://handhelds.org/packages/linphone/linphone-${PV}.tar.gz \"
matchbox-panel/matchbox-panel_0.9.2.bb:
http://handhelds.org/~pb/mb-panel-0.9.2-polling.patch;name=patch1 \
matchbox-panel/matchbox-panel_0.9.2.bb:
http://handhelds.org/~pb/mb-panel-0.9.2-msgcancel.patch;name=patch2 \
minipredict/libdictionary.bb:SRC_URI =
"http://handhelds.org/~paxanima/files/${PN}.tar.gz"
minipredict/minipredict.bb:SRC_URI =
"http://handhelds.org/~paxanima/files/${PN}.tar.gz \
plinciv/plinciv_0.16.bb:HOMEPAGE =
"http://www.handhelds.org/moin/moin.cgi/PlinCiv"
python/python-pylinda_0.6.bb:SRC_URI =
"http://www.handhelds.org/~aquadran/distro/latest/sources/linda-${PV}.tar.gz
\
qpe-games/aliens-qt_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/aliens_V1.0.0.tar.gz \
qpe-games/atomic_1.0.1.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/atomic_V1.0.1.tar.gz \
qpe-games/checkers_1.0.5ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/checkers_V1.0.5ern.tar.gz \
qpe-games/crossword_0.0.3.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/crossword_V0.0.3.tar.gz \
qpe-games/fish_1.1.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/fish_V1.1.0.tar.gz \
qpe-games/glider_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/glider_V1.0.0.tar.gz \
qpe-games/hexatrolic_1.0beta3.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/hexatrolic-103beta3-zecke1.tar.bz2"
qpe-games/icebloxx_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/icebloxx_V1.0.0.tar.gz \
qpe-games/labyrinth_0.7.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/labyrinth-0.7-zecke1.tar.gz"
qpe-games/mahjongg_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/mahjongg_V1.0.0.tar.gz \
qpe-games/maki_1.0.4ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/maki_V1.0.4ern.tar.gz \
qpe-games/nmm_0.0.2.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/nmm_V0.0.2.tar.gz \
qpe-games/pairs_1.1.1.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/pairs_V1.1.1.tar.gz \
qpe-games/pdamaze_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/pdamaze_V1.0.0.tar.gz \
qpe-games/pipeman_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/pipeman_V1.0.0.tar.gz \
qpe-games/shisensho_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/shisensho_V1.0.0.tar.gz \
qpe-games/sokoban_1.3.8ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/sokoban_V1.3.8ern.tar.gz \
qpe-games/tron_1.0.0.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/tron_V1.0.0.tar.gz \
qpe-games/win4_1.0.1.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/win4_V1.0.1.tar.gz \
qpe-games/ziq_1.1ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/ziq_V1.1ern.tar.gz \
qpe-games/zrev7_1.0.1.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/zrev7_V1.0.1.tar.gz \
qpe-games/zsubhunt_1.0.0ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/zsubhunt_V1.0.0ern.tar.gz "
qpe-games/ztappy_0.9.3ern.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/ztappy_V0.9.3ern.tar.gz "
timesleuth/timesleuth_1.0.5.bb:SRC_URI =
"http://handhelds.org/~zecke/oe_packages/timesleuth_V1.05ern.tar.gz "
xmonobut/xmonobut_0.4.1.bb:
http://familiar.handhelds.org/source/v0.8.4-rc2/sources/xmonobut-${PV}.tar.gz
\
xmonobut/xmonobut_0.4.bb:SRC_URI =
"http://www.handhelds.org/~mallum/downloadables/xmonobut/xmonobut-${PV}.tar.gz
\


