Return-Path: <s.christ@phytec.de>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Sep 2015 06:55:38 UTC
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED4565CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 06:55:38 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 2FFD3A00351
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:49:03 +0200 (CEST)
Received: from lws-christ ([172.16.11.68])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015090808490165-2890 ; Tue, 8 Sep 2015 08:49:01 +0200 
Date: Tue, 8 Sep 2015 08:49:01 +0200
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150908064901.GA2368@lws-christ>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 08.09.2015 08:49:01,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 08.09.2015 08:49:01
Subject: [meta-qt5] Backport fix for qt5-opengles2-test to fido?
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
X-List-Received-Date: Tue, 08 Sep 2015 06:55:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm currently using the fido branch of meta-qt5 and having troubles with the
qt5-opengles2-test program. It segfaults on start.

The problem is fixed by the following commit in the master branch.

    commit 6d9e2a6dfc21f7d9a3a11b4bcb426b5dfe6feaeb
    Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
    Date:   Sat Jun 13 09:02:55 2015 +0200
   =20
        qt5-opengles2-test: update to last commit
       =20
        * don't segfault in case qtsensors does not find accelerometer valu=
es
       =20
        Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
        Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Is it possible to backport this patch to fido?

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ


