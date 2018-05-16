Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C61CF74849
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 16:47:50 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w202-v6so5643305lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2QrnUnKYoxBMuCrDoWJkMscl3cljksewAvq3IOim4Zw=;
	b=uHELwcs/fPt4BoiIJS4u2UEFBWS/aaaHMG0HbfqnisEIgjlx+BpERU3AbHCFb4kUko
	42kixHDX6APEksXzsb9+vpygc/+KZhidc4G3T63JORnp/1LBI32n06BRZZ8HnKsbB0SK
	evbvcJoRk9cNOJyg7DO9hxGVA0dwKc9e/6XUQ4jyvLnLiAF/x9BJE7pKu73gpV2rWmgV
	zME+aFJOeqVU9dMq5OaHYUJrSDOluIq9iQrbUhSgqx58f3ydxojdfOxt7Lh1ourKAljB
	u4ls4iEQQaoKspnzC30YTLgDvCCY9chdnVeCcRXcvKUftSPnG/rVRbB0JDwgLczu87D3
	VCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2QrnUnKYoxBMuCrDoWJkMscl3cljksewAvq3IOim4Zw=;
	b=Rymvy57/FrVXjMeQxekDzylKwfmVXhj67jbRQIMJBeXFOD5pdemzabXlg+6JG+h4Wl
	tt8TXA+8BlCKkqWUPj9X4VpudRVXOfYGjajA+/VJjJSkXwsM6+cIPYEyC/YzsPZtzpJE
	/RlaQOgdc3PdPzPtP0yQAV/CNnYw9twneF2fQNncG3EdlV14jT3aAnyKPc18q3W0lJzO
	IxMvnWnbpOg87PWb/C0kHg/pWGTAhzKtnE2OZRHKHHuolEOw5Q9v9BtxNfhYYpEuW89h
	b7TLoJXFG0UcI8aTBquTY1Q0OWNeVd/blNnTs33Wyd/xPEtPAWvWSC7gWiLsGHZ0ibDT
	yvZA==
X-Gm-Message-State: ALKqPwee/ac6opwW05peZS9ecYpTgzOH6zT1PC6ndBkvuvOc94iK9/mS
	0USOtvV8IXK5OryTLZca3ogcU4TZdji9GYkdkpQ=
X-Google-Smtp-Source: AB8JxZoRXQq6hHQJit71+RfphB9eS5XhvSAHR+w6NFIqdgxAK3f8sa83DFk5V8RntZad+4DXFn9m8W/GoDJTqaxh4Lc=
X-Received: by 2002:a19:a70f:: with SMTP id
	q15-v6mr5143056lfe.39.1526489271156; 
	Wed, 16 May 2018 09:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:17a1:0:0:0:0:0 with HTTP; Wed, 16 May 2018 09:47:50
	-0700 (PDT)
In-Reply-To: <b629ed74-5025-a418-ff68-8b8904fa90af@intel.com>
References: <20180510004908.26947-1-twoerner@gmail.com>
	<2d40764a-ff2e-06c1-898b-1f4f99fbda29@gmail.com>
	<CAHUNapT0E0S-7Dv51hcfkYbr0kBCq8RHTrkhucJzHtmkTfdDzg@mail.gmail.com>
	<b629ed74-5025-a418-ff68-8b8904fa90af@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 16 May 2018 12:47:50 -0400
Message-ID: <CAHUNapQPQRJ6z7y85Yena7OPCdvjj4uW0-5yOCdfcj9Mam3gJA@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 16:47:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

On Wed, May 16, 2018 at 5:05 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:

> On 05/16/2018 02:31 PM, Trevor Woerner wrote:
> > The existing recipe has provisions for i386. If I understand correctly,
> > qemux86 is i586 (?), and meta-intel's intel-core2-32 is i686 (?). Do I
> > duplicate the i386 provisions for i586 and i686? Is there an easier way
> to
> > specify all 32-bit IA systems?
>
> Does it work if you use _x86 instead of _i386?
>

Yes, that seems to help, thanks!

