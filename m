Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3649877093
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:49:46 +0000 (UTC)
Received: by wijp11 with SMTP id p11so7282248wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=rJpXfQBMnvItDmVeF9ISMYT/QS6cko9l+DdU3byr+Ew=;
	b=Dzfskd0hdYvDkNti/ck+KE8k0TpqZeIJgFpoPo5kiEm9qy2snFjuan7iKDkv4psgfn
	8nrfNOvwCyg71GF3P2VqGZ6dcnuphwG/BRrdtBHAarcIsLIpi5ya31wzJ5/mUZg4YwFk
	ZvfPyt+gtyuJg7+RHBgA+p4u1yDr4wOAi6eOIlfoRRVp20eLNpeWZGgkmpHT7Fa9J0Lv
	bikAI5LUZD87CWQQlT4L5VNmS3HrlR0uzshImxWJVzcMxO7QM21BmMeHbDelGe5B6HQZ
	mgrsYU2tN7d7BUBoUuG/7A81paVGpJI3egsZMyJ7LzF+OHQvuPm9l900zS5EU/v7C5Bi
	7Lhg==
X-Received: by 10.194.185.16 with SMTP id ey16mr6686011wjc.32.1444848586401;
	Wed, 14 Oct 2015 11:49:46 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pb4sm11665531wjb.8.2015.10.14.11.49.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:49:45 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Wed, 14 Oct 2015 20:49:45 +0200
Message-Id: <5696C5AF-1958-45D8-BFAB-D0D4AE56DADE@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 2/6] rrdtool: adding the capability of native-builds to get rrdtool-oo in meta-cpan running
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
X-List-Received-Date: Wed, 14 Oct 2015 18:49:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


An additional layer for Perl modules from cpan =
(https://github.com/rehsack/meta-cpan)
provides additional modules for dealing with rrd files: RRDTool::OO from =
Michael Schili.
This extension requires an executable version of rrdtool.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb =
b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 91a30cf..aba342b 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -17,6 +17,8 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep gettext pythonnative perlnative python-dir =
cpan-base
=20
+BBCLASSEXTEND =3D "native"
+
 EXTRA_AUTORECONF =3D "-I m4"
=20
 PACKAGECONFIG ??=3D "python perl"
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


