Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD7375E80
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:08:05 +0000 (UTC)
Received: by iodd200 with SMTP id d200so22113927iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mEIL+vUGGl8cU87O6VQO2xbah+vEx7sROqH5A0NN358=;
	b=u025i0vamUjiqjCo6px2/fqLS1PGUiPdtoQI4aEwM72Uivqo4x1uDdIgDKcyuuZWPi
	gZR6yHAlzke8x+nu9l6pCHr9PLBbfa+PvuTRl1A+691nAqA+3VisS9+AW5Wn/u7SV4b2
	ka9LNa3KAx7PIe03VAMtxtaQ72ckVH758HIwLHBngeMrIoe27ph7T/IP1f61ZsoYN4nt
	vEKnYOFXd6/pg8+GAQLWPDcBeYCSoC9QbTeSfAGph9x4JXod+7DoTeLesgZmOzxqIcep
	t2q+0KajmQkjNG3PfOqwB4gUfD3ocLvM1L981jygfyo/DX0bd5V2CaumrTFYQR2L7TOO
	6C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=mEIL+vUGGl8cU87O6VQO2xbah+vEx7sROqH5A0NN358=;
	b=KRWzByPjsRLV7hJtOM8GfUD71Nsnz9W+ByUGwPXQWP33m8ZcOHohE8wOOc/+WQ5lKC
	LDUrmjgE3ZKd93zFKsEaJDRTNe9kRLvh2+4jVuBnkj1xDE/eJptbV2gnMTaQ8lfPLxJH
	o5NiCN1rxXPXZXIVobpXhiUWUz7QNJKc2uf5CNiH9K6AfxjFbCjJuXVxD7YuXdarFHKx
	dUcAtbNzfA6xXFCnddZBAmcCZtlL3F0XuXEUWFi4nyHIvWKhit60aYxnjbMdZRg7GK3T
	jdOLw/kIKfsr0c7QThLQNBthwYSFH3h2frjEAQIn9+c6Cd3I32zh3LQsKLes2v4PTusN
	yxYg==
X-Gm-Message-State: ALoCoQmo6RfHADGiqO1HtyJOK4NfKIf91Gd/Ar/1H75eOXiuHQVdoivXBFQEI1UpkLH3AIah07lg
X-Received: by 10.107.3.72 with SMTP id 69mr34122244iod.75.1445864885435;
	Mon, 26 Oct 2015 06:08:05 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182]) by smtp.gmail.com with ESMTPSA id
	o74sm12986480ioo.8.2015.10.26.06.08.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 06:08:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofz202 with SMTP id z202so184521649iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 06:08:03 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr8925688ioi.192.1445864883838; 
	Mon, 26 Oct 2015 06:08:03 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 26 Oct 2015 06:08:03 -0700 (PDT)
In-Reply-To: <20151023075442.GA11357@mbabyjoh-mobl.fi.intel.com>
References: <1445420509-1807-1-git-send-email-erkka.kaaria@intel.com>
	<20151023075442.GA11357@mbabyjoh-mobl.fi.intel.com>
Date: Mon, 26 Oct 2015 11:08:03 -0200
Message-ID: <CAP9ODKoH_Pmij_u5YjnEZx4+YW-b5sswMeBGit=vPu5Vg=C03g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] cacao-initial-native: Fix undefined behaviour in gc
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
X-List-Received-Date: Mon, 26 Oct 2015 13:08:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 5:54 AM, Maxin B. John <maxin.john@intel.com> wrote=
:
> Hi Erkka,
>
> On Wed, Oct 21, 2015 at 12:41:49PM +0300, Erkka K=C3=A4=C3=A4ri=C3=A4 wro=
te:
>> Upstream-Status: Backport
>>
>> Fixes undefined behaviour in boehm GC used by cacao-initial-native
>> as suggested at
>> https://github.com/ivmai/bdwgc/commit/16780405c899f01119bc45167122b4242f=
6b34fb.
>>
>> The undefined behaviour at very least causes a segmentation fault during
>> classpath-native configure step with Fedora 22.
>
> Thanks for fixing it. Pushed to master.

The Upstream-Status in the commit log was wrong; it belongs to the
.patch file. Please follow the guidelines for the commit messages for
this layer.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

