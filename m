Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D14E731ED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:11:37 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id x35so4475391ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dWzDkV73ID2gZ1j1PgYixVje3IBCFNBWMwZz/w1UlTs=;
	b=aIZGNvhRDaUxS28NZ8B9sLI7iPPIi83Ni9dfEIDAb2mlVHrl9TOHfKAufm7Vg3IF1y
	tjkQEbmDGGrImpCrFZq9EiD0B9zYgVENL8JFKQ6rm2Ha03/7To2sN2L55UwKOHdmkwmZ
	3at+z51TWCuFht2up8KMXbo7S4V3/MshJqFRkSB+sy/DKbFbzjyMTg27dZepBPUP+vRV
	SV8SUmFJfjgpWlcAjthNvpLBtSZspcAP2cnTw+AVJpN53zsX06NItC/z48ED8zvsmPwl
	9No1q/eXEc804SuookxBkLxBgBzrJMjo2G5Z5HpR7WfIOKMZURqCqujZx6ZdG/34pnPR
	YArA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dWzDkV73ID2gZ1j1PgYixVje3IBCFNBWMwZz/w1UlTs=;
	b=OEQkpS4j15sgjhQrDavti1T40RFXZvv2lc45rhuI2CAAtWdZyuA78JTiWk9VLZuKzf
	CtLSuNRftKyecztQ/FmMg3rp6zMxVHQmJCc5M7vVs9/WaY22QYKNPoKUYpg7GXsPS1OW
	qIqco/YwJkvmij6WTXCi7wgYJPFAnYcdaJFjhuP8g8jQiR85ZQcYQnviXH2YCPu3KCYx
	FMGPpAjSaMO5J/1sfvk9jpuY27nX7BrJqQX+2c7PzHr1AlSToowFt+db74naNzuS3xLm
	Vw3bE8szOMPoK8Ngz1V5nguwUggwuEE0ZnRtMScbKmMDvLARH+PMh7XFFABlfAaqbipt
	dn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dWzDkV73ID2gZ1j1PgYixVje3IBCFNBWMwZz/w1UlTs=;
	b=Qe+8FA78f9z70YzGbHirl07ontTyWuWRXa1mD0tww/ZXUGvItv6dkHeKQpCNN3u0Vp
	RES7IdjQFqJr/1/dgLDre39+HAVEZELn9mK8G9NoslXEtxivmNKhkiiiZTeqa2+GwAms
	699QtSdX/j6bRN7+ixzgOE9O/PNVFLNzK/SUkX5O5AYJbY1yjsYNYjGFYyA/gB3q2/xL
	sd3eNH+sh4TOIrVbSE/lsNiCBIzT7s0zDJ9S83UaObJ/ifBT8X+KBIn4H0GFYDxv/D4V
	w9fS3Im5dv8VKr6XFi7UceaoBZs7fS57juf1Cw1Yq2tjya0zPPJZTP4/FCG0NV4vkPfB
	aTXA==
X-Gm-Message-State: AOPr4FXYeMCuPCH/aIxq7mEAYJjmsmfHd6NeEF+ZstVx0P17ItQofK7l68gd+sVMcGXEgsL+HzRL/XxGG5QZ3Q==
X-Received: by 10.36.121.148 with SMTP id z142mr1792589itc.19.1463501498606;
	Tue, 17 May 2016 09:11:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Tue, 17 May 2016 09:11:19 -0700 (PDT)
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
	<3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 17 May 2016 09:11:19 -0700
X-Google-Sender-Auth: oC88I765dGWTifjbsmwkWQetFBs
Message-ID: <CABcZAN=4CLx1nNHHDsouiLsDYVPZEV9FZecfFvqxt-yaVG2hHw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 1/6] mg: stop relying on make -e
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
X-List-Received-Date: Tue, 17 May 2016 16:11:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 9:10 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Relying on 'make -e' isn't ideal, as it's less implicit behavior, relies on
> variable exports, and hides the variables being used from someone reading
> the
> recipe.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>


Erm, clearly meant 'explicit' here :)
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

