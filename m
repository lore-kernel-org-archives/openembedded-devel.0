Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZ9Fv-0005cr-O6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:12:44 +0200
Received: by bwz10 with SMTP id 10so249008bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K3ZL6ug9iMGJvVx8GSBP0F2ZSeWcjBEMkdtKs2YwFeQ=;
	b=oIzy0iXYTKDZnqykCrxFynC8rMzQ80vJE1zxFzKeckZShADmPiq+qEf0k0we4yety8
	36ANIUcYOI7AlB/mKkL6qnpF0YE7OCeu4UA/nlbGiiQtW4Ay5ZGsRw954sPkW4/TzY62
	GwXXHS9e8p8NZMehqiTmpL9ts90mijOE0y6s8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Le3gLZCrhknwTVqqK5z8r/0B7EVT+whRN5HygMXfdTvqDeODc08/HUSU1O/pP8hyno
	xni7IAHd2GvXzyv0pjBXCVTSA2Ui8/hR0fODZLMU98LsFhRHHbKW1P3ihYnqZXq6q+xX
	ACzVf+wu0G5w63MESnBMNdhWV5OgozxiB1yn8=
MIME-Version: 1.0
Received: by 10.204.135.214 with SMTP id o22mr2885009bkt.56.1279141957979; 
	Wed, 14 Jul 2010 14:12:37 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 14:12:37 -0700 (PDT)
In-Reply-To: <1278963950-2587-7-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<1278963950-2587-7-git-send-email-aalonso00@gmail.com>
Date: Wed, 14 Jul 2010 23:12:37 +0200
Message-ID: <AANLkTilWuaSeqpNdl_Yenwl7FNl0V2deFIeXpXFLGG5i@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 7/9] xserver-kdrive-common: xilinx virtex5 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jul 2010 21:12:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/12 Adrian Alonso <aalonso00@gmail.com>

> * Add Xserver support for virtex5 platform
> * Increase PR
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  .../xserver-kdrive-common/Xserver                  |   11 ++++++++++-
>  .../xserver-kdrive-common_0.1.bb                   |    2 +-
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> index 347b005..235d349 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> @@ -34,7 +34,14 @@ module_id() {
>     # grep "Module ID" /proc/hal/assets | sed "s/.*://"
>     ## used to read from /proc/hal/model, but that is removed in 2.6
>     # echo ' iPAQ' `cat /proc/hal/model`
> -    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
> +    id=`awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
> +       if [ -n "$id" ]; then
> +               echo -n "${id}"
> +       fi
> +    id=`awk 'BEGIN { FS=": " } /platform/ { print $2 } ' </proc/cpuinfo`
> +       if [ -n "$id" ]; then
> +               echo -n "${id}"
> +       fi
>

Can you explain this part? It does not seem to be covered by the commit
message.

Frans

>  }
>
>  export USER=root
> @@ -171,6 +178,8 @@ case `module_id` in
>                  if [ "$XSERVER" = "/usr/bin/Xorg" ];then
>                       ARGS=""
>                  fi;; #TODO: handle kdrive
> +                "Xilinx Virtex440")
> +                                ARGS="$ARGS $PPM" ;;
>         *)
>                 # It is a device we do not know about, in which case we
> force
>                 # kdrive to use the current framebuffer geometry --
> otherwise
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bbb/recipes/xserver-kdrive-common/
> xserver-kdrive-common_0.1.bb
> index 52a88b8..04a3f13 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Common X11 scripts"
>  LICENSE = "GPL"
>  SECTION = "x11"
> -PR = "r45"
> +PR = "r46"
>
>  SRC_URI = "\
>   file://Xdefaults \
> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

