Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9593B78200
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:22:52 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id f80so7134819pfa.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=O2R22i8qYxnKUnaM8Oy8juLEeO0+7y+Scyl0mqTMV/A=;
	b=U53W/d+9/qRWPJxqiIn0qV+/1KLJZ1soZGyJ9hyJj5rQSA71XycgfyQ7yMMztNapY9
	efi9137OMDa05ZzLohZ8+8/MkGnn6iCDFlfdXKKzJWf/qohzmVl9RBAlA9zwo0GmnnMA
	SjRhinpkrxY07vB7TpOdiD6IsfoXrujmHVGIs7xsvsYpgZlFoA5TVVgrrg1lQ8WWDGYL
	ZlFgCIMssF6VhXISOj1w+psPpTw+QIXsd9I1HS4B82HiHRcrAyC1nIkX5U7QkEN8EdKZ
	P7OH4dZ6XkDP87GZLjJ6/G6kcNYHHSGLL7qPO+Dawu15Q7R3j7dNS4aXDpshqd+6e54p
	IrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=O2R22i8qYxnKUnaM8Oy8juLEeO0+7y+Scyl0mqTMV/A=;
	b=IpvDFtCjLQEEYzXV515kYbc/qS2fGrExpFnRXR0U5VazjZwPZ3Hjt2sun9QyUJNoxW
	qBeiQmTzVOEdXvgq6OTMz7rtZ00mPDtYqK0Fg0+Ih2VXy+TgkNaKMtQEohyqUk8XmOka
	JhhmVqofU3kDNlbxfiq5zP+S/uhlZmdvbvqOSXBZXaMFXdNAREC0Kd9EqA7mcsT35UwE
	YG9NuwKr4MXKAOg5zAcPWh4mySvRfL8x3cst957d6dd/sac70UdLsfwZJLThHJCees36
	CcG5Rsvf2cRKnmIX/IOrRt5Hy3ia4oCZ45i4CRDpxNw9n8WfZzMzp2mBBVMgS2LVqvGe
	hIsQ==
X-Gm-Message-State: AElRT7H7wX9rLHcrMVdyimqdzWrztIp9p8WI11EYGWlmpLsLiIPcH4wA
	ut/J8OfmASCGBiHvt6nM4UnntQ==
X-Google-Smtp-Source: AG47ELs/K9qWeiWBQ2S5ghaiTtHIsO8jTp4D0DwtQ0pKhq1TFRGiphZuNiFl5+CJHpgInQHyLsZE7w==
X-Received: by 10.99.132.72 with SMTP id k69mr9442818pgd.367.1521472973406;
	Mon, 19 Mar 2018 08:22:53 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:4088:e426:a566:fc98?
	([2601:202:4000:1184:4088:e426:a566:fc98])
	by smtp.gmail.com with ESMTPSA id u18sm378684pfm.48.2018.03.19.08.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 08:22:52 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<CAMKF1sqJhAeFwH22g-0CA0T1=i_fg6CTQym8xBCYefw+vfSRhQ@mail.gmail.com>
	<CA+chaQfh5zOSjGMTyDQdQSkMb4aCUOqHGTs=H4gM2QTQvDWYmA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6eda4c89-ede2-e465-a969-07b8d4a045f5@gmail.com>
Date: Mon, 19 Mar 2018 08:22:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfh5zOSjGMTyDQdQSkMb4aCUOqHGTs=H4gM2QTQvDWYmA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Mon, 19 Mar 2018 15:22:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 03/19/2018 03:47 AM, Martin Jansa wrote:
> >=C2=A02) I plan removing meta-filesystem and moving recipes to other l=
ayers.
>
> I don't have a strong opinion about this, but why meta-filesystems?
It was an easy on to pick on. Mostly because of its size. smbnetfs has a
dependency on samba which is in meta-networking, so it has to move, IMHO

> In previous discussion there were some requests for smaller, better
> manageable layers and this one with 19 recipes and only dependency on
> oe-core and meta-oe doesn't look too bad from that POV.

I don't recall that conversation but thanks for the context. I am just
trying to shake the tree to see what makes sense to change. There are
currently 7 maintainers listed, many in-active.
>
> If you move some recipes from it to meta-oe, then some people might
> complain even more that meta-oe has too many recipes and doesn't serve
> any specific purpose.

Thanks for the questions and feedback.
- armin
>
> Regards,
>
> On Sun, Mar 18, 2018 at 10:38 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Sun, Mar 18, 2018 at 2:32 PM, akuster808 <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>> wrote:
>     > Hello all,
>     >
>     > I have been reviewing the meta-openembedded sub-layers and I plan=
 on
>     > taking the following actions:
>     >
>     > Please keep your comments focused on the 3 items below.
>     >
>     >
>     > 1) I plan on resetting the sub-layer maintainers. Several
>     maintainers
>     > listed have been inactive.
>     >
>     > If a currently listed maintainer is interested in continuing, ple=
ase
>     > send me an email.=C2=A0 I plan on removing in-active maintainers =
in
>     12 days (
>     > March 30th).
>     >
>
>     This sounds like a good plan.
>
>     >
>     > 2) I plan removing meta-filesystem and moving recipes to other
>     layers.
>     >
>
>     LGTM, this also means some changes in external layers who might
>     depends on this layer explicitly. I hope those layer maintainers wi=
ll
>     take needed action.
>
>     >
>     > 3)=C2=A0 Meta-gnome, I have heard feed back regarding this layer.=
 Does it
>     > make sense to remove it and push needed recipes out to=C2=A0 othe=
r
>     layers?
>     >
>
>     Agreed here again, I have only fixed this layer in past to keep it
>     afloat to
>     reduce compile failures e.g. with clang or musl.
>
>     >
>     > I want to get any restructuring done prior to sumo release to les=
sen
>     > impact on the Sumo maintainer.
>     >
>     >
>     > regards,
>     >
>     > Armin
>     >
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     >
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>=

>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>=

>
>


