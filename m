Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3CD6CE9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 13:12:18 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so3104967lbh.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=adUx2tExg31KNQ9LxPKqdFSSzJ7B2srxVr22erxeTc8=;
	b=GVGxGgKwu15XQFTj/HntPQD2lj+x6P912kpby2rHg17H01PxXtYNs99lRTib7NA1h9
	boMRhAu6EYD6xWmS2CX4HNumtBFbVrPXspiX/Y/Ia62B383rlbmu0Q6yQ6Fn/B+9shv8
	mneEJbHWxEmS8GKAgPbv0mQDB/l0fdwpuaLu5I2X8tZsmEeErCnzXwHvCK4OGinMqH+V
	hH6rT6LbDFfnnpFgmAlcny5XogGDSAG7PQ5V+/t6fDltoTYg9kjmDGE1h7IRHH91Gtwa
	VzLEGXJky0LpLpzBSewyu8gtYq5W6JFQgpP2QowzPZ1i91SUWwEbCmYyidy+2uGKXRz+
	ZvKg==
MIME-Version: 1.0
X-Received: by 10.112.13.72 with SMTP id f8mr1392869lbc.40.1382101939326; Fri,
	18 Oct 2013 06:12:19 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Fri, 18 Oct 2013 06:12:19 -0700 (PDT)
In-Reply-To: <1382084579-341-1-git-send-email-liezhi.yang@windriver.com>
References: <1382084579-341-1-git-send-email-liezhi.yang@windriver.com>
Date: Fri, 18 Oct 2013 09:12:19 -0400
Message-ID: <CADkTA4PwTVaPaRR8L6VTQRMryXA_pY+Sq=N+_8EwChbHYo9Nxw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] conf/layer.conf: fix "No newline at end of file"
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
X-List-Received-Date: Fri, 18 Oct 2013 13:12:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

FYI: this should go to meta-virtualization@yoctoproject.org, but I can pick up
the patch from here.

Cheers,

Bruce

On Fri, Oct 18, 2013 at 4:22 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The last line lacked a newline (usually '\n', aka CR or CRLF) in the
> end, so there was a warning from git diff:
>
> \ No newline at end of file
>
> The last byte of the file should be a newline.
>
> Note:
> It seems that nothing is changed in this commit, but it does change the
> end of the last line.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  conf/layer.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 4c1fa19..15ed1df 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -9,4 +9,4 @@ BBFILE_PATTERN_virtualization-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_virtualization-layer = "7"
>
>  # Custom licenses used by some packages in this layer
> -LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
> \ No newline at end of file
> +LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

