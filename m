Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id BEFCD60673
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 14:43:27 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 23B2DF811DB; Thu, 11 Dec 2014 07:43:28 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 05122F811D8;
	Thu, 11 Dec 2014 07:43:27 -0700 (MST)
Message-ID: <5489AD94.8020907@mlbassoc.com>
Date: Thu, 11 Dec 2014 07:43:32 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Thu, 11 Dec 2014 14:43:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-11 07:39, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   recipes-qt/qt5/qtbase.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 4c7e86c..d6053be 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -80,6 +80,7 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
>   PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
>   PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
>   PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
> +PACKAGECONFIG[dbus] = "-cups,-no-cups,cups"

Shouldn't this be
   PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
                 ^^^^

>   PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>   PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>   PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

