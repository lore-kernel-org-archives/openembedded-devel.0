Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 62B2A74622
	for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2018 02:31:18 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id a2so1906228pff.8
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Mar 2018 19:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tR5kzOP/BRa3lSIZkGeo5k4kK2TMivLAvIyP1OVv/Zc=;
	b=QuJpMLwWStwv+Hvrg38fq8yiwetI2dCKiJaUS+IsFq8cTlGcAnH+zs+TQipTxNSqcC
	W8c+qee8VQvrdg65zxR8YtEzNK9JMMiWEkp8o45F49mMppgrad7oSVKjep1nJDP3S3FX
	nYE+buC3Gei78d5v5CU+IQpEQ0aZXG/w9kYiaPLLTTp4m4AMxKH3R9oXnkHtIcOoQ3+a
	NmYJ824yA0TIG8nd6xTk/EnIwpLBRv169sFTJf2k8akt4vxN0d6EA+I+GuVW4Tj51yzm
	sK4Khb8ekRGkP1pOlwAMBcRlxVSbTeHe0mLg7+02VgcLxp4joEwLp0wZ7O8O/SEhHgZz
	e//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tR5kzOP/BRa3lSIZkGeo5k4kK2TMivLAvIyP1OVv/Zc=;
	b=JjDxo/TDR7XIm5jTRgGSbBERS99TXLA6A34V5r91h8LiUVaG51xQBWHj/yaZgfXw93
	ZkXUNxeylOk0ZIOEDRK2f3NbDVb4SvOnBS4fIUar88e7MMQ82VFcdO9KrDGFQ/ymXlwt
	zYuhmy9rCeoTin1L/YfZZVvV2qSOBYOprprrLRxPbJNn8MO6lYYDI5qjK2/HGh/OipwD
	UexxPn//E7oCAgvbqPJc+AHgw0qfGrjPhCy0RDn5cGz5XpHI7EsNpcmgSFAzVHKGxSLe
	nGA5elf2twDLbD/a2sTpggL17LbfVNMiZrTD0ZpQlR6K7xXMmup+840ABbvdn0vOpiOk
	zmEQ==
X-Gm-Message-State: AElRT7G24N3ugLZB/W5klVmTERdVOldxv5A/hHBVgP0xbTk0CXEnbznn
	FRFS/PcASkVlY6M9wboaCnYwo8o3sQi8qfeirS8=
X-Google-Smtp-Source: AIpwx4/APl7vGBGXOwNDDlFQGFS4wlsD78EhsPePKDZQ3X8DP+k1MnWFxJLzJsodfT3BOzGOlsM7Fy7gLWn3pS+OX20=
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr11047928plo.162.1522377079980; 
	Thu, 29 Mar 2018 19:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <007BD92917A2324FA403BCF9A464CF84F341D889@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F341D889@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Mar 2018 02:31:08 +0000
Message-ID: <CAMKF1sqsxiUqehW0=DHtzDbxPtg5pB+t7WuLafZp_7AQxF7MPw@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: geoip versions
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
X-List-Received-Date: Fri, 30 Mar 2018 02:31:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 6:13 PM Slater, Joseph <joe.slater@windriver.com>
wrote:

> The SRC_URIs for geoip source from maxmind are not versioned and are not a
> reliable source of the version you are trying to build.  I think the
> sources are mirrored on a yocto site, but, once again, lack version info,
> so they might or might not match what you want.


Send a message to Michael with the tarball so we can put it in oe source
mirror

>
>
> It would be easy enough to add a yocto(?) PREMIRROR with version info to
> the recipe, but I have no idea how to establish the physical mirror.  Also,
> the recipe versions and the versions of the source may well not be in sync
> because the source changes frequently, and I think, without notice.  I
> realize this is an odd case, but it would be nice to have some solution to
> this maintenance issue.
>
> Joe
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

