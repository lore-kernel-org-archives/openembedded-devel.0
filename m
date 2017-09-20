Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 93B4777EAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:11:48 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id v36so4231744ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GD+1ev/7CL/0TEdR5uujizVtG97sU19Ifpw4RDvF9fM=;
	b=vohKRKq8PNnh1+CyBiHQsMxqG2J355ZpVIIqjrnJMrYx0f8NSxcfDJ5h38UWvAqaRf
	hvXxF4qIcVcqXk9eW35BSN3I1jwVznATtiX6MGoJiBYIQ9NGl2PTPCPQZUdpMeFwFYIs
	p+XfbUIAtiIJfe3MXOJo/5m1clb+z1aIyyNI3pNJnQLP69aDtUTp8RdRITfwtWYDg82K
	sNhKCmunjI+EEy0moAagl0w4Of5Rtk2yXa0KKqNhTGN1Y6ZcEFsUBuie/DBP3Ji4y7It
	IXIh+J/ZBF+X/PCtkJb2A6MmHHmPVYBzSI5eUpIcifJ4hscwagFEKIp9juTlFaZKE5iz
	kPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GD+1ev/7CL/0TEdR5uujizVtG97sU19Ifpw4RDvF9fM=;
	b=OzUtamWL4OvAiWnZ8hNFK5RxNI95kir9qCs5W32x4xmOM3rxCiiborzU1B2r5iATGy
	bjK/PwJPvOJ2YDAB6PMRC3dqHdYu7M+LOUkYTrRS3n+P6TVS5EVBPyT9I3qapSCls9Bh
	dKhBVMdkEWhZsh7nTEB8SNCNluYEBW8bHet6+PMVIT47Db7zYxBCEKnqquVT4OV6HIwT
	VUaGlNztAsANsuoFhGxNuA+dzog1/KiYkTGa6RO/R9V5ROPt+TIaTb65pvdlFalNyYIW
	PFki60QwcVRaM/QHwlaYLQIRTJQCEX7+XVdQvVyPh1OCNzbocNrrbgmB9bcNiKoCs3qT
	wRUQ==
X-Gm-Message-State: AHPjjUiGqiJOpu1sZkc7DXX9ZunrjCdDBn3JG2lCjAxt8b4f6SmIr+Zl
	3BLhc7yADDveF4NQpDkiYBtUKAGT6ibr6ynCPA/P8w==
X-Google-Smtp-Source: AOwi7QCSNASMHlb4sjukoefXcL82gle1W8wgXN7/uScXk8H4AF6dQQ1rPLZYubzT+JFeqapv04s3fOjjm6aGZwoMyco=
X-Received: by 10.107.135.72 with SMTP id j69mr7352645iod.210.1505916709324;
	Wed, 20 Sep 2017 07:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 20 Sep 2017 07:11:28 -0700 (PDT)
In-Reply-To: <1505916567-19611-1-git-send-email-derek@asterius.io>
References: <1505916567-19611-1-git-send-email-derek@asterius.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Sep 2017 15:11:28 +0100
Message-ID: <CAJTo0La+DNTtgcGrO2gZ9Kgy6D5=n+7N=tetnweMVdEweupt4w@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] jsoncpp: update to version 1.8.3
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
X-List-Received-Date: Wed, 20 Sep 2017 14:11:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 September 2017 at 15:09, Derek Straka <derek@asterius.io> wrote:

> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>

Always explain why the checksum needs to change in the commit message (so a
v2, not just a reply to this message).

Ross

