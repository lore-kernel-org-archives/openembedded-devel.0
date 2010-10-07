Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3pE4-00041X-3o
	for openembedded-devel@openembedded.org; Thu, 07 Oct 2010 14:05:33 +0200
Received: by iwn37 with SMTP id 37so92921iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 07 Oct 2010 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=7tXBWSVm93Qz6ODUpadJtlqNT9sDCIGQ2FmuEq/fuKE=;
	b=JKMTrTEnNgNyFvPbT/FgwZsYcpE4hHFCya6lJxULhIcC47jO5ewpYqefHKJtC2YFyE
	BfaNV7XRGI/lq5IfzD0qs6R5W3ja6p7/fsSrIJJmO6ZHiuFdEzZaDPg5GgkUH3dztDog
	jQTePm/TTMX91JkmNrU0f3gGHdo1iOXdY8heM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=odGinJ2AbyzGnYOs/qTqsuwxBlK4BvEVawp/byGJaEhbXVZ/uCiQZJxu7cdbclZhv5
	H06X1qGhNcog+B0Wv1f8yROXRj7cDK1D1O2q5j18bLSe2t/VPXuYRkcKhJjpeTvi4XpM
	uvxfT5U4OwZly6B0iWtuzKO5Acy8SUAXkyP2M=
MIME-Version: 1.0
Received: by 10.231.17.11 with SMTP id q11mr747946iba.63.1286453109396; Thu,
	07 Oct 2010 05:05:09 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 05:05:09 -0700 (PDT)
Date: Thu, 7 Oct 2010 14:05:09 +0200
Message-ID: <AANLkTi=gS-FkVTi7fUuzkQQ5uuudAbHGtp6ZPfr=YZSX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RDEPENDS/RRECOMMENDS/RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Thu, 07 Oct 2010 12:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

It is my understanding that all of
RDEPENDS/RRECOMMENDS/RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES should
have an _ suffix (most often _${PN} )

I did a quick grep for these and came up with the following
non-compliant recipes:

frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RDEPENDS */*
devilspie/devilspie_0.22.bb:RDEPENDS="glib-2.0 gtk+ libwnck"
fakeroot/fakeroot-native_1.9.6.bb:RDEPENDS="util-linux-native"
jikes/jikes_1.22.bb:RDEPENDS = "classpath"
libaio/libaio-oracle_0.3.0.bb:RDEPENDS="libaio"
meta/nylon-feed.bb:RDEPENDS = "${NYLON_FEED} \
mokomaze/mokomaze_0.5.5.bb:RDEPENDS="ttf-liberation-mono libpng"
pidgin/msn-pecan_git.bb:RDEPENDS="pidgin"
supertux/supertux_0.1.3.bb:RDEPENDS += "libmikmod"
xfce-base/xfce4-mixer_4.6.1.bb:RDEPENDS="xfce4-panel"
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w
RRECOMMENDS */*
nogravity/nogravity_2.0.bb:RRECOMMENDS+${PN} = "${PN}-data"
opie-reader/uqtreader_cvs.bb:RRECOMMENDS="${PN}-filter-html"
ttf-fonts/ttf.inc:RRECOMMENDS += "font-update-common"
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RPROVIDES */*
bootstream/bootstream-chumby-falconwing_1.bb:RPROVIDES = "virtual/bootloader"
opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.3.bb:RPROVIDES="opie-mediaplayer2-skin"
opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.4.bb:RPROVIDES="opie-mediaplayer2-skin"
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RCONFLICTS */*
tzdata/tzdata.inc:RCONFLICTS= "timezones timezone-africa
timezone-america timezone-antarctica \
wesnoth/wesnoth-wvga_1.8.4.bb:RCONFLICTS = "wesnoth"
wesnoth/wesnoth_1.8.4.bb:RCONFLICTS = "wesnoth-wvga"
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RREPLACES */*
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RSUGGESTS */*
frans@frans-desktop:~/workspace/openembedded.git/recipes$

Should these indeed get an _${PN} suffix. If so can someone add?
(I can make the edit, but can't test them, bu if people have
sufficient confidence in my editing skills I can also do the patches)

Btw there one special in the list above:
nogravity/nogravity_2.0.bb:RRECOMMENDS+${PN} = "${PN}-data"
Guess the + is not ok, but not 100% sure.

Best regards, Frans.


