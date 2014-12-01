Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 37054721D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 09:41:49 +0000 (UTC)
Received: from ad.chargestorm.se (81.232.163.241) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 1 Dec 2014 10:41:47 +0100
Date: Mon, 1 Dec 2014 10:41:07 +0100
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20141201094107.GA15993@ad.chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1414409458.git.anders@chargestorm.se>
	<9a0b3d2f7e1ac7e854430fe1e93271c71f574083.1414409458.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <9a0b3d2f7e1ac7e854430fe1e93271c71f574083.1414409458.git.anders@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-qt5][PATCH 1/1] qmake5: set OE_QMAKE_INCDIR_QT
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
X-List-Received-Date: Mon, 01 Dec 2014 09:41:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ping


* Anders Darander <anders@chargestorm.se> [141027 12:32]:

> This is set when generation an SDK, and thus would be usefull to have also
> when bitbaking. That allows us to use this in *.prf files which is used
> both when bitbaking as well as when using the SDK.

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> (cherry picked from commit 96e8d29fdbdf6fa656c854d9b55c5b0c213166a7)
> ---
>  classes/qmake5_base.bbclass | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 3861cd0..f1a0945 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -32,6 +32,7 @@ EXTRA_OEMAKE = " \
>      OE_QMAKE_AR='${OE_QMAKE_AR}' \
>      OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
>      OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
> +    OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
>  "

>  OE_QMAKESPEC = "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFORM_NATIVE}"
-- 
Anders Darander
ChargeStorm AB / eStorm AB

