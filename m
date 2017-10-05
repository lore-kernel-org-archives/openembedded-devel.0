Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8E577E4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 00:43:14 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id o3so22612587qte.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Oct 2017 17:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a5m5ozGpwgdcq2uZZubhzRHX9bMWtZJyte+KRUShrh4=;
	b=q9Pk3hqC7PWY/N42NKRYY8F2SVx04obtWrNyQyvuDomRQS9bMEGyfSh07MN+hXF8nh
	f6xaoehkEqRN60rsAq+f7WUqiwzDrvXe7ReVhUbAq0+njgT8i0/Is6IzQSJ1FoJMaEEY
	qT4FksPutuj6HYDb3w/wmxJmFeU8l3BP9E6u9X6rn2ZDgMYMQhvjq1hC5uhCsoMPx+lR
	P7i570JmJBNaaFEjWqLOGcQL6eeC8l0wA1w+Dn18P1HQ+Wl4pYiLs+emVXK+1Tng56i+
	rvjiUG0N1LoMMTfua7aHCEOQ3gJsTrwjgv++BJczdxX4bRkXMwFzObP0xJq991d5Ns1T
	uzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a5m5ozGpwgdcq2uZZubhzRHX9bMWtZJyte+KRUShrh4=;
	b=Op8b6R8o2ZA30xIlpM3+26xrVcMIahVR6uhKIBE4kN9IdXF1epGdMiiRlzMh/cmLM6
	XnpLSDegG+4RAe1AlrT7cHH25bov433NXLPNnMTbwg7OuMKFWlP7cqbMAbhLPswshBMt
	gBSgNiaJ0Mt84cCekGNHSgZTyG7QuXmIKUcKwnV2S/tmcVvcbczimdap7E/IZr7vW3Ki
	t4JbAXCHCOql0VhI+wSkin7SHpUQ+NoyL+bZfMKNwB2ivFrcpDnPtArGNzRPZ4AdNsR/
	dXOBH+/zT01OpbvvFcfaNJ8ZPkDvuq4vfIQ61inhbJBOvsGDeDjhr0PoKWb3Z9peh9J1
	QqhQ==
X-Gm-Message-State: AMCzsaWu5XkKHXRAIWg4oHLYerWo8h3v5oD2oufznr+OZ3djSm+hjYZT
	0EKjymjhU/7XEhSLrVkREGdzKyZeg+mJzaHbdg4=
X-Google-Smtp-Source: AOwi7QB3eiF5qtMsild3O9EO3uu/D335V4GflU4/wN+COIBcoxcOLwTPmI4UGL1MsSVEZtdBQShRdd9/ZWOuBQpXd7g=
X-Received: by 10.200.63.173 with SMTP id d42mr1372401qtk.200.1507164195913;
	Wed, 04 Oct 2017 17:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.173 with HTTP; Wed, 4 Oct 2017 17:43:15 -0700 (PDT)
In-Reply-To: <CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 4 Oct 2017 20:43:15 -0400
Message-ID: <CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Thu, 05 Oct 2017 00:43:15 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jocobo,

Please have a look at
https://github.com/rakuco/meta-crosswalk/tree/chromium61/recipes-browser/chromium
from Raphael (CCed). It is an interesting and promising approach.

I have built against minnow (x86-64) and rpi3-32 (armv7ve)
successfully with pyro. I haven't had time to runtime test anything
yet. I'm still seeing a build issue with both MACHINEs against master.

It's been about two weeks since I've had time to tinker with it.

Best regards,
    Trevor

