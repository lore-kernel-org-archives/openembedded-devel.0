Received: from out103-7-vmse02.mailcluster.com.au (out103-7-vmse02.mailcluster.com.au [103.250.20.7])
 by mx.groups.io with SMTP id smtpd.web10.11257.1598353281959213382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 04:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cpdesign.com.au header.s=default header.b=v2jnAn59;
 spf=pass (domain: cpdesign.com.au, ip: 103.250.20.7, mailfrom: marc@cpdesign.com.au)
Received: from vmcp03.web-servers.com.au ([116.90.56.28])
	by vmse02.mailcluster.com.au with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kAWhU-0007CE-1R; Tue, 25 Aug 2020 21:01:19 +1000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cpdesign.com.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u6oYyzS7CA/9dFOIZ5P20TldRgQBMEdCCwjC6WPJPXY=; b=v2jnAn59qbhxZ1xa9SFH6bG3yw
	njgNxrZbqkFDnScO7S1iB0YoEZ7i8LA58zhDNv5+jiw3KCGkCwABNngknT7PNEbkeNE1whnM88uTc
	Jsnb4Qf1JcsjYtzVNKHE185pqdm0Copq/nd8dAr3agvVBh0dHTStLZQA6Q4LqH2Og3lJVuVOIXyjd
	/FX79WtybNdEHYHa206ojtHSm/pA6Ztyygpn5NUOxIHym/XzwQF+P2HReX+v9P7V98CidcMkmDmNp
	Ljknz1cPd0JAV/sDFYr3HTuV5czOdP9x102dWcTB/FZD/7/pRnhsO3f89ndATXIWxkn1DfHv1DnSt
	xKud6zEw==;
Received: from 14-201-30-55.tpgi.com.au ([14.201.30.55]:35942 helo=localhost.localdomain)
	by vmcp03.web-servers.com.au with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kAWhS-00HCzm-Ae; Tue, 25 Aug 2020 21:01:10 +1000
From: "Marc" <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: Marc Reilly <marc@cpdesign.com.au>
Subject: [oe][meta-oe][patch] openocd: Update to latest git version
Date: Tue, 25 Aug 2020 21:01:03 +1000
Message-Id: <20200825110103.15581-1-marc@cpdesign.com.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Authenticated-User: marc@cpdesign.com.au
X-Authenticator: dovecot_plain
X-Originating-IP: 116.90.56.28
X-SpamExperts-Domain: panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Username: 116.90.56.28
Authentication-Results: mailcluster.com.au; auth=pass smtp.auth=116.90.56.28@panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhV3MeA8KU5DQzP
 5qDsGcma9kTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KoWFgMvF+XPPkibGoK9ILBB00
 RFZrIi+ZJEJo7wxsO/7VAI0YaYoxzUzqeY0RKlIbl3vtzsnCjVjO/qBQZyPHPxtd7FIegon359AS
 01xfP6eDgc7Vb3QfNu2icdZfJzOocciY2z4hq7SqXAJrAGow5GfoFWZw01PZOinlBH25TcLuNaT6
 dAR4/fSS+hfMzDXVyZl6POixVpGcLrHJaCKcDQMZ3Rc1FPM37mYbhKZuZQPQzE4pWsN9DMOCoUO6
 aPH3rtVmombMJ4e2pn5C0yBMHei5BhbfeHQcd06QKJAOFJmwhlcqbDNsZPhW+lMvQRvnhtPcSzO8
 hsBsHZnLTV3/sheOR1N5VnaoZbH/AdGlfrxb2fBAlhZ0D8R9hqWf+kKKqZJPq0P98FvWTwEpOhyA
 dK6qvRqKQ68kD4O7N4Xhv7KbcCEbjbqaWJiQIcFmk6Cipzi4JDWEiJuf4ysgNjLZYIZYMS5b0REn
 ZGmIVtAcG/aSveeNuiyiQkzDHbUvbKlPLFpFCyJ/9hQbxd9VB27J3XoSKlHMxVnkurBPHtW+f1JW
 l9AKOV/fU5Ys3Y1o14XLLfhGslhYKK/sfF/fRFaJmwMVq4H8dzQN9370EyxvqlKgv8vGIZZ3psGE
 WQ0ryPo7B5hQ6nsDvccjqgmDvD9Wh4sC4748NNxQkbgitfLu1G7DEd6Yplvh+oay7O24oTPnqe0q
 vr5yub6t9+RpDpmA6KwgKjbYHfUJUUKcafJJuQ2qbx9cPcGR31mI6M1Ucaz2pASU8nI0l2AWwkUS
 z/3cxcPthAtaXTSEOzPo/xD0kzzkCcj7ATESLZldlzAWaP8bCk/DE5fFg7hstJ8HcxwFGIYvFZXA
 YhTAEtwFzZaTCjcQXthqiz/mhXA0HnCXMYPuNidR5jp3O3YsvRXBwVDa6GFSj8STIT4VWDZ0DnqG
 e0ozGQIXF34xVCWkjncR5jEdEcm/AptiAK3Qer0NdTIq388QeDWGJcf0znYZOiTaEd5Yym6kbCn7
 BSXwTeMoYKQDgVgNLOPm8IomEhRZ1VMkd2L9vCOdPQqzoaTMNwUi4CfJJ8slNEAaYitUH/s60iid
X-Report-Abuse-To: spam@vmse01.mailcluster.com.au
Content-Transfer-Encoding: 8bit

The 0001-Do-not-include-sysctrl.h-with-glibc.patch is no longer needed,
and is thus removed.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index e95f1cfa5..4f6aaa8a6 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,14 +9,13 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
-    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
+SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
-SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
+SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
+SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.26.2

