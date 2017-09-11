Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A97FB78221
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:04:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i130so2834278pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=hLEolIM97uS99wrC19EW0BNnyL4nKSs2a8fzX7WAOOc=;
	b=HTn0c/zD2B2ftAcPTZDkRD4r5BLG+8xJAYTJep1ZBvt+zDhWiZnLjiwTg+YhqWNtUS
	EnDqAg3dRLN07mt1iOBCaWJxQz3GmqKpMMeTEVHp3B8Kru6t4fhUviJq/Pgvmm9f8bb1
	rW3VuOs96w5KvAo4s9NwDVUmfIQ+Lk2WxDta5DY+H0x6VawNYplR+UYDxi7iQJzvaShH
	5usHWQMfgJxz7FVf0qQ++fjhMTw4fYlyvOYko5wP9zC5hh4SCKY55M4FKRVLBXom+iFO
	qeCc25XBLFqXui6d6+noMl7QnwPF8hJbdK7VuoX9g84oCyQDYEuMc9brkszRsTfa4OOW
	Kjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hLEolIM97uS99wrC19EW0BNnyL4nKSs2a8fzX7WAOOc=;
	b=GYBIIjYf4sjwJSlfmJoTWFEkKn6pqqmtXI+CCwesJVIM4bI0DaZiFVhDDQZPfUKHiV
	6cDKsoIk7ILQT28b17Q9HGnjCEr9qY9vJH/pVGQvpEsye46mVnzTesNFX42yIVvPRK25
	OBh3V0ecTQRmm7WkvELpfupf62ZscTe4xIcFTbahWTO/EO4DVrLC4onZT9WhZz5qG3Ig
	5m84ruBFoS2rfZE8+arsv4pMlpbVh4eRJJVZkGrsLGQH6nc0SOS83O0pXBlMRdXdU1kC
	NnRiSRQgzxMikHVc09Ozwndh1v18R9Upze8E00g3Bsv4YtARtsuxk3Sv1Ux1wTgcqx4e
	+BUA==
X-Gm-Message-State: AHPjjUj6o4HxCgb7G834yRQIDPR4q5pEMrJqW4NShzuI5RHZMmtSSq+l
	yy+g/70ZVNYxByWZ
X-Google-Smtp-Source: ADKCNb7A+cEsJfYbq5lv0/8IcgFzT9dzYhV2NSa/OyX58wDVtJti7H/rIO3PuQ4E2nWZWkOkXNHYAA==
X-Received: by 10.84.194.131 with SMTP id h3mr6169607pld.352.1505145892048;
	Mon, 11 Sep 2017 09:04:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d402:d3c9:ca3b:9b54?
	([2601:202:4001:9ea0:d402:d3c9:ca3b:9b54])
	by smtp.gmail.com with ESMTPSA id
	r22sm17752146pfe.78.2017.09.11.09.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 09:04:51 -0700 (PDT)
To: Alejandro Mery <amery@hanoverdisplays.com>,
	openembedded-devel@lists.openembedded.org
References: <20170803130518.6351-1-amery@hanoverdisplays.com>
	<20170803130518.6351-2-amery@hanoverdisplays.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d4b12e82-85ef-271d-2265-fbf2b92cae7e@gmail.com>
Date: Mon, 11 Sep 2017 09:04:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803130518.6351-2-amery@hanoverdisplays.com>
Subject: Re: [meta-oe][pyro][PATCH 1/3] gitver: extend class to use EXTERNALSRC if set
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
X-List-Received-Date: Mon, 11 Sep 2017 16:04:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in current pyro-next pull request.

thanks.

Armin


On 08/03/2017 06:05 AM, Alejandro Mery wrote:
> Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-oe/classes/gitver.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
> index a16429aa8..73521d538 100644
> --- a/meta-oe/classes/gitver.bbclass
> +++ b/meta-oe/classes/gitver.bbclass
> @@ -24,7 +24,8 @@ def get_git_pv(path, d, tagadjust=None):
>       import os
>       import bb.process
>   
> -    gitdir = os.path.abspath(os.path.join(d.getVar("S"), ".git"))
> +    srcdir = d.getVar("EXTERNALSRC") or d.getVar("S")
> +    gitdir = os.path.abspath(os.path.join(srcdir, ".git"))
>       try:
>           ver = gitrev_run("git describe --tags", gitdir)
>       except Exception as exc:
> @@ -71,5 +72,6 @@ def mark_recipe_dependencies(path, d):
>           mark_dependency(d, tagdir)
>   
>   python () {
> -    mark_recipe_dependencies(d.getVar("S"), d)
> +    srcdir = d.getVar("EXTERNALSRC") or d.getVar("S")
> +    mark_recipe_dependencies(srcdir, d)
>   }


