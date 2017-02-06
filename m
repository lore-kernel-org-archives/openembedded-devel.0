Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Feb 2017 21:35:28 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27FCB719DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 21:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9F7A331E053A;
	Mon,  6 Feb 2017 22:28:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 4oJj0Zk4DDlO; Mon,  6 Feb 2017 22:28:12 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A61890.dip0.t-ipconnect.de
	[87.166.24.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 82A2031E0537;
	Mon,  6 Feb 2017 22:28:12 +0100 (CET)
Date: Mon, 6 Feb 2017 22:28:11 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170206222811.149afc17@t510.zcs.saftware.de>
In-Reply-To: <1485682404-2336-1-git-send-email-obi@opendreambox.org>
References: <1485682404-2336-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] qtwebkit: add necessary dependency on gperf-native
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
X-List-Received-Date: Mon, 06 Feb 2017 21:35:30 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping. In Patchwork this was archived, but it's not in master-next.

On Sun, 29 Jan 2017 10:33:24 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> QtWebKit refuses to build if gperf is not found in PATH.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes-qt/qt5/qtwebkit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
> index 2d69bb8..4845d0f 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
>      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee \
>  "
>  
> -DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
> +DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-native"
>  
>  # qemuarm build fails with:
>  # | {standard input}: Assembler messages:


