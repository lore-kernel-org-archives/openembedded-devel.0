Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id E090560673
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 14:42:12 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B8756D40812
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:42:10 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 25D1CD40811
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:42:10 +0100 (CET)
Date: Thu, 11 Dec 2014 15:42:04 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141211144157.GB16779@mail.itconsulting-heinold.de>
References: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for cups
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
X-List-Received-Date: Thu, 11 Dec 2014 14:42:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 11, 2014 at 03:39:53PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtbase.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 4c7e86c..d6053be 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -80,6 +80,7 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
>  PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
>  PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
> +PACKAGECONFIG[dbus] = "-cups,-no-cups,cups"

Cut and paste error or does cups relay on dbus?

Bye Henning

