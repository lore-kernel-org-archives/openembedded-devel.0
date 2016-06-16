Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id A59B3602D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 03:00:45 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id 92so3337087qgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 20:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xWeqNcI61Emns8DzsQy7ejQ3RBZYUBvMhhUaV3QEhRo=;
	b=XcDDMGu7mPifGeunALlN2VsWHeG3yIOVfw2RstCfR4cbWsX5zOo4+DO3eyDae7dLpn
	66Xno0RWUc6elDlxWE4/wdha9tzIi+reIFjaTuW9jJizSEW3j9HPy8a2lzmy3X+6InFg
	9eK5+0yEGMlnEo0scP1icmF9WHYY4jWw9nshsDBaLC/1icJk7kWReVd6LzromDCOp4h8
	g5/kG/RRTXcYwfz/WaTpzIQ0s0SvHUSYDdrA8cPSVFpBCic2gc0q+khoptJHSC/9N1lZ
	hVZl0XYjDWtNxQ7eLhR8hSzLIChkR3v+nR1Jqa27raCL4gXUHSMA/IGquXldcfriQPZB
	XcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xWeqNcI61Emns8DzsQy7ejQ3RBZYUBvMhhUaV3QEhRo=;
	b=TzIvQhRTXXQbcqdsB36DCX/vFBDoixtx/49LCRok+x0ihR8TAR514nLTxyr0Uh8BYM
	AKGMMDJZuVMtFLrS9wMOAHrOwqgkovEeSVM0o69QHs9UDmjWnyWZL56TDjROUuzTgzbl
	roT4FuhvIcyMxQFXrAx1J1M/FAo3amUJZnZ7IQbnPylPHTRI5VIGfhRh0fijNVTgZ15N
	uXCSieH1fQjIGt9JMFG/lsvSicFiFK6RHtLWos041TGJI+LjrrQetM0+DeQtYddqmkdq
	YAJVWpkLNTe47puqr9j+CpDYOwdH0oYk9IaID6bo4mgPu3T8xtVlIN07w/IM+/ymvUO8
	K69Q==
X-Gm-Message-State: ALyK8tI5bUeHE+mi2coqcsSGaMJasyHxW+jK8jWK965eZhQfHByfgbibFpHk6vSxbyEpC97SscRsSPk1bwGyeg==
X-Received: by 10.140.84.231 with SMTP id l94mr2192276qgd.44.1466046045756;
	Wed, 15 Jun 2016 20:00:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 20:00:16 -0700 (PDT)
In-Reply-To: <1465472602-10834-1-git-send-email-christoph.settgast@methodpark.de>
References: <1465472602-10834-1-git-send-email-christoph.settgast@methodpark.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 20:00:16 -0700
Message-ID: <CAMKF1sqaa62HyFfw212uviT7qMC-zd9UoDydzQ7Hps6bcLoW3g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for journald logging
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
X-List-Received-Date: Thu, 16 Jun 2016 03:00:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 4:43 AM, Christoph Settgast
<christoph.settgast@methodpark.de> wrote:
> Note from qtbase configure script:
>
>  If your users intend on developing applications if logging to journal
>  is enabled, ensure that the IDEs they use either set
>  QT_LOGGING_TO_CONSOLE to 1 or the IDE is able to read the logged
>  output from journald.
>
> Signed-off-by: Christoph Settgast <christoph.settgast@methodpark.de>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 72ef3ae..a2a865d 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -127,6 +127,7 @@ PACKAGECONFIG[nis] = "-nis,-no-nis"
>  PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
> +PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"

this should also check for systemd being in DISTRO_FEATURES

>
>  QT_CONFIG_FLAGS += " \
>      -shared \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

