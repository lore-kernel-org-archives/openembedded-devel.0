Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1C3677B27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:37:01 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id g65so2843785pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/VoJmXTlt/RyyzVtcIZZCRFmxVNz4AzJFoZ1hrVJ0KM=;
	b=Q1NDeOlDDpdiZ52m/x1Eex9pTzh4YAraSvaCmaQzFHmjn1sTH7xwoPt55kaviCrDRE
	peNdtmCA+J6Fg0bJIkfzGdGUDI9WkCidwAMx17YfbOZ24fyRE6awq24pU9BqMMt4pxRD
	ftONur0D+vOnNej7sDTLK1IAiIbHIPHfp+F5EC5j3PJzPNoy+4SCdQFLaZeXIIHfj668
	ByjSAkOMJeK286CePJ67Ot+ciaMCnyzrO30Optj0WOcyxmhGqSuA/bxUdUW3dErrXfWK
	1SCd5ZsUkrVVmXmuhMOxQBxcsa3Yw8cwZFz8Ze+UnS98mu0uTgAxMExMmzihkkb2En8e
	0l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/VoJmXTlt/RyyzVtcIZZCRFmxVNz4AzJFoZ1hrVJ0KM=;
	b=SLUigR0akRgHyzyXnpI4kfv60/uF5Pv50tk0FM3Tbldk+jbSyClhZXI1LPOJrgxNt1
	8wfOpLoKlqNTKBG4KfMDnF/k+GiJ61pwjFZVavIir6rRQzQQm2x6LsviDsAR8R9/ZVAP
	2zt/iQJoCw8KezwURZ1GQzJOqS6qYTG8Wmme2t4n6o/nuJSKE0rjsAK7A3QKGZ8R8jHU
	l6TGuOToxNmt3Z/UwhTyqavxRnUNWAXbYpkW0pFH8jHmwW9AT5pMrfcFsVjGhDxNZX+7
	kR6Ux3fvCtlVbJPJi9dTD9ovgguWUdqfvRFl4Jg0tmevjbqx4eO7GaCgDaus8UnWksWN
	f5Xg==
X-Gm-Message-State: AHPjjUgdj5+kxo9wQCWHHL/Ko3Uo1pTLnc6HhROjGSAyWFVpor35G/f8
	mwFadISFeyJ3Q0o1PtoQ4lFMj+KdP3JKLuL0tSw=
X-Google-Smtp-Source: AOwi7QD74FBjlJv1/6fG2Yj7oJnw7UXfS9+h8NxrDEkHyjIU9orEThArovkuKO1yHafW8w/tm2YLWeiSbyPK4MxruTs=
X-Received: by 10.98.156.152 with SMTP id u24mr2881868pfk.255.1505576223090;
	Sat, 16 Sep 2017 08:37:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Sat, 16 Sep 2017 08:36:32 -0700 (PDT)
In-Reply-To: <CA+chaQe2qmx+Fxh9YJ0DzkK0meZRakOq5T06wWiAW-h5AKxOBg@mail.gmail.com>
References: <20170915225827.12328-1-raj.khem@gmail.com>
	<20170915225827.12328-2-raj.khem@gmail.com>
	<CA+chaQdWxaCLaqr24=EGSueJgSEa7oPHzLHu4aWmOQh_320WZA@mail.gmail.com>
	<CAMKF1sq8eEWfgafvELHuh4VvrDxyo7CjNkUmN28+X1vuax_Rcg@mail.gmail.com>
	<CA+chaQczkk9De2yw=4nc=xEBEDsT6TgqmxD6mnspQk6SXEuO3w@mail.gmail.com>
	<CAMKF1so+mQq7fBB9Y1XgwopCO5FJsiXG-oura0ROR5=FhBXZVQ@mail.gmail.com>
	<CA+chaQe2qmx+Fxh9YJ0DzkK0meZRakOq5T06wWiAW-h5AKxOBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Sep 2017 08:36:32 -0700
Message-ID: <CAMKF1sq_B0RR5qc8kE9iHfTNbWTGrbgMY3ucFAxyYh8KadyxqA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] android-tools: Fix build with musl
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
X-List-Received-Date: Sat, 16 Sep 2017 15:37:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 16, 2017 at 8:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> That was 1st thing I've checked and it's already using arm as the
> meta-android version did:
>
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb#n47
>

OK. then I think it needs to be debugged a bit,  since I dont have a qemuarm
build handy, it will be a while I can look into it myself.

