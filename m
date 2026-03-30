Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D03B10F3DFA
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 14:24:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52793.1774880660619241945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TuhqewJF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so56613355e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774880659; x=1775485459; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+1SZ8DNUywF/kaVxUUoEtWXrZMMwRijuVNmhxHNLuc=;
        b=TuhqewJF3d0S4sjr5vFygjzIEjBuqr5Hl0I/cRd3nEqfcK7Dre+v7thtosin7zzyfT
         vHWQOHul4zT3B09yFB993XNpBuZ94wjz3kVEr1mdXWRn6nw1QB/6ejLqhBG8xXgenud/
         Dnt95GCgi68a2kk7wMQqoQkyAM9XAzY4WYVdxsHYh46bjlKxSdr5I3BjiFd6zFVLq1AL
         TkYpXZLo0WiL8noSnBwYYoO4IAa+nJKxZiDbJJ/LbVKolueeDSexT7UoebeQE4nvBehD
         ISZ4O3HGc4xa81LXMYI8dVVR5L4jE/N70nHWEavp+FJ9KXpdmrOzYYxe+dKV/0PbOlJP
         PC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880659; x=1775485459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+1SZ8DNUywF/kaVxUUoEtWXrZMMwRijuVNmhxHNLuc=;
        b=Y3rdxo3XZZBrx7OL3REA7alJdSaJvlCM3W7XpYAf/6QaBeQ4v0JlqD4N9Rw9BdcNSS
         b0iXECcf/9BALHyGlf4PkcEbezNTc8nzhiqZr3TFj80kSJZan7ONdJ4lfgm7Zi3VX1/z
         qGkdK8rloLQiMK4VTXg9CkWhqhQSPGlhzVlR6ifVbcJWZPVnOsaHXl52lDnKbH+eVG2R
         2W6OqRgokE7NEBMnNn2u6JDlKaNpy4SpL/vZWAr4FLxr0Xun1uSuv8mtEFHuWTUR55u+
         2kuLgUhPiq/aBViHqxvgKierCdPdimHATBmHKz5K/lLWMUYro0pN27a87rYEcPBaVoZC
         PZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+DiYxve/uv4NxC2qZv2ehEPD9uEPiQT538A2qprubn/2B8inJppbtTg3089HdRr1gmK+DIHB35Ngs7ko8eDPCvY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1uOCrRJurfg1Z+UDYooni5c6Yv1G1XZHSPSEMaGtMXVtEq6Bm
	ID/nWXNNnORTfFvBa2stE3tlVWre08P5EmNPYBqyLQGgN2aLUxTKvIjt
X-Gm-Gg: ATEYQzzjLgm8nt9Q0D4aasp9vvPV6VoVhU1uhowCX3bpCM4BJAqTodrRVbGLjmJNnxG
	ZyQAnghUliDwGq/Gk7AGZBEKWV89JufHMXnWlanA+HuKCtXXoaik/YuBhIW7/tPRVrxvQ1fvXMb
	8jVRU04RvzZu4d86Z0PDMuwbw2hBCbZO9BxyMX/hIQEOKLGE3mePAOVsLjsLGIb3yFn04dFUesJ
	xX9Rw6APRaCOC1tXS7CvlhgjoVaH05HGnLm7unOPc7DpO9BDPiFU515ZFNNuq46zPZjDen+ESra
	bHa1/nVf6hFwhw7w55X8tpU6KT0gwpxNFHmqcZtnucPpZvPX9u+grJ/PzESTeac6LQ2vZmRglju
	sGF/diLfyOy6NpsTwi0r/Wh8Sh8NSrzM+sgGza6JgvG6jDFtEfOw0sx8VJvRdMik2j9GJbRs5aO
	0ROcddn76DKkX3D8MINzzf4vJWx1k3DmA=
X-Received: by 2002:a05:600c:6094:b0:486:fd71:e609 with SMTP id 5b1f17b1804b1-48727f1fc05mr200369965e9.25.1774880658571;
        Mon, 30 Mar 2026 07:24:18 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e2f6sm19925027f8f.18.2026.03.30.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:24:18 -0700 (PDT)
Message-ID: <c996e121-f1c2-4b6e-b739-1c6a708d839a@gmail.com>
Date: Mon, 30 Mar 2026 16:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [layerindexlib] Prevent loading unnecessary resources from
 layerindex-web
To: piotr@qbee.io, openembedded-devel@lists.openembedded.org
References: <20260330135112.27161-1-piotr@qbee.io>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260330135112.27161-1-piotr@qbee.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 14:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125867

I think probably you meant to send this to yocto-patches@ ML?


On 3/30/26 15:51, Piotr Buliński via lists.openembedded.org wrote:
> When I was using `bitbake-layers layerindex-fetch ...` I noticed it being quite
> slow. Upon further investigation, I found that the call to `load_layerindex()`
> inside layerindexlib was called with the deafult `load` argument.
> 
> The deafault was set to ['layerDependencies', 'recipes', 'machines', 'distros']
> where the `layerindex-fetch` effectively requires only ['layerDependencies'].
> 
> So whenever a `layerindex-fetch` is used, we pull for example 'recipes', which
> is about 18-20MB in size - it takes time to produce that response by the
> layerindex-web and ship over the internet, just to be discarded.
> 
> This change addresses the issue by setting a "sane" default (empty `load` list)
> and sets a correct, explicit `load` list whenever it's needed (e.g. toaster)
> by the caller.
> 
> Lastly, there seems to be an error when the cooker index is loaded in the
> process with the `load='layerDependencies'`, that's incorrect, as the
> implementation expects also a list, so that's corrected as well.
> 
> Signed-off-by: Piotr Buliński <piotr@qbee.io>
> ---
>  lib/bblayers/layerindex.py                       | 4 ++--
>  lib/layerindexlib/__init__.py                    | 6 +++---
>  lib/toaster/orm/management/commands/lsupdates.py | 3 ++-
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/bblayers/layerindex.py b/lib/bblayers/layerindex.py
> index 308a5532d..2ba1103a3 100644
> --- a/lib/bblayers/layerindex.py
> +++ b/lib/bblayers/layerindex.py
> @@ -116,7 +116,7 @@ class LayerIndexPlugin(ActionPlugin):
>  
>          # Load the cooker DB
>          cookerIndex = layerindexlib.LayerIndex(self.tinfoil.config_data)
> -        cookerIndex.load_layerindex('cooker://', load='layerDependencies')
> +        cookerIndex.load_layerindex('cooker://', load=['layerDependencies'])
>  
>          # Fast path, check if we already have what has been requested!
>          (dependencies, invalidnames) = cookerIndex.find_dependencies(names=args.layername, ignores=ignore_layers)
> @@ -137,7 +137,7 @@ class LayerIndexPlugin(ActionPlugin):
>  
>              for remoteurl in _construct_url(apiurl, branches):
>                  logger.plain("Loading %s..." % remoteurl)
> -                remoteIndex.load_layerindex(remoteurl)
> +                remoteIndex.load_layerindex(remoteurl, load=['layerDependencies'])
>  
>              if remoteIndex.is_empty():
>                  logger.error("Remote layer index %s is empty for branches %s" % (apiurl, branches))
> diff --git a/lib/layerindexlib/__init__.py b/lib/layerindexlib/__init__.py
> index c3265ddaa..e693e5c11 100644
> --- a/lib/layerindexlib/__init__.py
> +++ b/lib/layerindexlib/__init__.py
> @@ -174,15 +174,15 @@ class LayerIndex():
>          return res
>  
>  
> -    def load_layerindex(self, indexURI, load=['layerDependencies', 'recipes', 'machines', 'distros'], reload=False):
> +    def load_layerindex(self, indexURI, load=[], reload=False):
>          '''Load the layerindex.
>  
>             indexURI - An index to load.  (Use multiple calls to load multiple indexes)
>  
>             reload - If reload is True, then any previously loaded indexes will be forgotten.
>  
> -           load - List of elements to load.  Default loads all items.
> -                  Note: plugs may ignore this.
> +           load - List of elements to load. By default, an empty list is used to keep things lean.
> +                  Callers need to specify a minimal set of elements to load, such as ['layerDependencies'] for dependency resolution.
>  
>  The format of the indexURI:
>  
> diff --git a/lib/toaster/orm/management/commands/lsupdates.py b/lib/toaster/orm/management/commands/lsupdates.py
> index 0ee00aa15..153b26f60 100644
> --- a/lib/toaster/orm/management/commands/lsupdates.py
> +++ b/lib/toaster/orm/management/commands/lsupdates.py
> @@ -105,7 +105,8 @@ class Command(BaseCommand):
>              url_branches = ";branch=%s" % ','.join(allowed_branch_names)
>          else:
>              url_branches = ""
> -        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches))
> +        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches),
> +                                   load=['layerDependencies', 'recipes', 'machines', 'distros'])
>  
>          http_progress.stop()
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125866): https://lists.openembedded.org/g/openembedded-devel/message/125866
> Mute This Topic: https://lists.openembedded.org/mt/118578936/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


