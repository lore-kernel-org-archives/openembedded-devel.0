Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0867877221
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 15:56:33 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id v81so29120960ywb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 07:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=h+WIO159zGi91vjP3Jv65GvCZI/xYpvMep+7snB8V4A=;
	b=dUVjhDPWqcsHeaq9PH2GEuLT6wFjhei0P2Z2xZxZwKM8kSz+1Oleu3IZp2SY/rZvfk
	hkDklIPy9fQKV3yQgQFSkGwKllVuqJZ9BqObem8Dqv6CCjdm2ue8DucJSltv2GejAuBf
	gffrgJF3hJQtuESPWW0AT9eqTyPIDNMWd7Lmvq2wMIPr+fMcKGqP/erwwbdIuBjBBxOI
	+mqDRrAWvdp2fw5qyUaYBTyMB+Ms0amQ1LHF1YsrcgrBAYNfyVao1Mj1iPslENquIGy5
	fE2P80LR8fwMxZXa0/AelqqlEZkV1YKLHilU6wtXIgHm7HwsBO2ylQOZFKOhnoHl5+Qx
	IcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=h+WIO159zGi91vjP3Jv65GvCZI/xYpvMep+7snB8V4A=;
	b=TcF91uBrsbgZSbbHjBmUfC4nf6wFwhH3bZ4OwUKb2Agr4an7arf6Z/pZwfR/mh3uxA
	VYzgOlRW2aqPMu7fe7mGDYVpenUS7fwtuU2WAsXGTqEhoNmrvYL36E+fD4e+RboLwPhz
	J4ijWV+dk/SgMzuokbNvrKqmdkpG6jqrZbFlIXF4QaHikbKxtrHm8XwSaiE6VGyd6r+q
	GNBLjP4Z0ii0qEj/gJMuPzxq4hLOLsFid2itwmtk3GAldsnH+G+iKK4eukOOPNUgxNs4
	gEA+xh/A92wbMcf3x/yFC85qoDm+1tHjL9iz/IsUlamRLtBq4iCDdjDsFnHuRe1CZSYb
	Da/Q==
X-Gm-Message-State: AIkVDXKaq4xVHbBxz6PE8ABUXmZSFo5qLVsTe3YvL4AY2bndKyw4jkD8Zk+0wo6fNv44uqdIe0rgMQdT0JwRbg==
X-Received: by 10.129.43.215 with SMTP id r206mr12034302ywr.274.1482508594947; 
	Fri, 23 Dec 2016 07:56:34 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Fri, 23 Dec 2016 07:56:34 -0800 (PST)
In-Reply-To: <be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
	<be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Fri, 23 Dec 2016 10:56:34 -0500
X-Google-Sender-Auth: PG3w-HbCfmO84KGettrhUP4VlPw
Message-ID: <CAPuovELANjs1goqXCb3RBSKLcwV3PLT+KqokjDxRGdXnEFp=kg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Fri, 23 Dec 2016 15:56:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2016 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> On 12/21/16 4:26 PM, Christopher Larson wrote:
>> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
>> mark.asselstine@windriver.com> wrote:
>>
>>> This release of apache2 is no longer found in the main downloads area
>>> but has been moved to the 'archives'. We should uprev apache2 but for
>>> now this will at least get the builds working again.
>>>
>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>>
>>
>> Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRRORS =
to
>> automatically fall back to the apache archive?
>>
>
> That seems wrong to me.  The recipe should point to the proper upstream l=
ocation
> for the archive.  If the archive moves, then the recipe should be updated=
 to match.
>
> I know you can easily do local workarounds for mirrors and such, but I wo=
uldn't
> consider putting them into a recipe directly as a good approach as it wil=
l hide
> problems from people and make it unclear where the official download loca=
tion is.
>
> --Mark

Agreed. I also think that the concept is a bad one as if our apache2
recipe is so far behind that the upstream has moved it to archived
that things should break just to give us a kick in the pants to get on
top of things and complete and uprev. So rather than mess around to
paper this over I hope my original change can be merged to allow
builds to complete and I will look to getting a review out for an
uprev after the holidays.

MarkA


> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

