Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 602BF76104
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 19:51:16 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so50860671wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=KM6EqkyYHJcEvlRETvLf7MTX3qOje+oP3tA0SENrCO4=;
	b=gYm84kua+zNZqeWKbPeeIf0B8PLqYtBVe1ETWsSJatLM9oS049kJbVhZhua4USdG4w
	EAJ4d0o0cUJ3dZh0EqWUHbN3y4zhohXEGLBWgnvAHwFmEfV3fshr1U4g7XVglcRM+xng
	6LbdDEpwCEZNcg0pgvaIhPE2M19xN1NjhQAPQgmKxeIXoTt0cmuGtgkOqiwOD0/lxqdG
	I30kvhSuPz+csRHguCri7xKws4KtAIowSKtN1P043kBOcqk3MJpKAML1zEnxBa08NlWG
	Xv3kYFrfCNW73bSNv69OuqIF6elSVAGLNzdHPLZpL16zNocj2Qp8+ytzCaXa3Iq5onOz
	6hKA==
X-Received: by 10.28.12.142 with SMTP id 136mr12064168wmm.19.1446839476664;
	Fri, 06 Nov 2015 11:51:16 -0800 (PST)
Received: from [192.168.0.7] (212-41-117-210.adsl.solnet.ch. [212.41.117.210])
	by smtp.gmail.com with ESMTPSA id
	jh4sm1591318wjb.33.2015.11.06.11.51.15
	(version=TLS1_2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 11:51:16 -0800 (PST)
Message-ID: <1446839474.2527.7.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 06 Nov 2015 20:51:14 +0100
In-Reply-To: <20151106171738.GF2550@jama>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
	<20151106171738.GF2550@jama>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Fri, 06 Nov 2015 19:51:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi
Am Freitag, den 06.11.2015, 18:17 +0100 schrieb Martin Jansa:

> After long time first successful chromium build in bitbake world..
> Thanks!
> 
> Can you apply the same fix for cef3 recipes?
> http://errors.yoctoproject.org/Errors/Details/21442/
> 
> cef3 for qemux86-64 doesn't even configure:
> http://errors.yoctoproject.org/Errors/Details/21501/
> 
I'll try to fix this.

It looks like this never worked for x86-64 because of a missing config
file.
One probably can reuse the i568 one.

There seem to be additional errors to the one fixed with the packages.
So
maybe I won't be able to fix it.

Regards
Max


