Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 665407459B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 08:47:04 +0000 (UTC)
Received: from [IPv6:2001:16b8:46d6:c000:2748:4d8c:cfb:6e3d]
	(200116b846d6c00027484d8c0cfb6e3d.dip.versatel-1u1.de
	[IPv6:2001:16b8:46d6:c000:2748:4d8c:cfb:6e3d])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 49109287A73;
	Fri, 13 Apr 2018 08:45:14 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180412190931.4057-1-daniel@zonque.org>
	<CA+chaQeW=C8ZAhUSyNBH8r1ptnotA_o3Chj-ysNUxVSGH3sXcg@mail.gmail.com>
	<CA+chaQfSC_iBD6osNhz1zmOZiuxFEpVBFjtn-AHNmeDwn3-6XQ@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <e3b7d598-e033-b698-0a4b-1b961e69c12b@zonque.org>
Date: Fri, 13 Apr 2018 10:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfSC_iBD6osNhz1zmOZiuxFEpVBFjtn-AHNmeDwn3-6XQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Remove license files that were dropped in 5.9.5
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
X-List-Received-Date: Fri, 13 Apr 2018 08:47:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On Thursday, April 12, 2018 11:21 PM, Martin Jansa wrote:
> Included in rocko-next and jansa/rocko branches now, thanks.

qtdeclarative needs a bump as well ...

diff --git a/recipes-qt/qt5/qtdeclarative_git.bb
b/recipes-qt/qt5/qtdeclarative_git.bb
index 827745d..0f1a30f 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {

 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"

-SRCREV = "317908e72a6ea0b4ca179690539cb352bbf60832"
+SRCREV = "dfbe91853737ff8ab548925bbd40fc9183a6e05d"

 BBCLASSEXTEND =+ "native nativesdk"


