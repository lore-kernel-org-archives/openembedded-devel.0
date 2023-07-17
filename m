Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C108EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 17:15:11 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.589.1689614105451122265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 10:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org header.s=mesmtp header.b=lGtthAhv;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26, mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 664075C0046
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 13:15:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 17 Jul 2023 13:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1689614104; x=1689700504;
	 bh=0E9MgccMLkK1oMaZwOIjW8llnQf3URAUtE4+GGaYXQE=; b=lGtthAhvtICI
	s5Y4ZCcieU5ZUlu8Po0u5Q+LHqABuB2TlegG+DPnbKzfMCBgZJkVXBr8uhAuetan
	ktbMG8JI1LM0wPHQNCJJKFxiarMxT11SeSWWtaXwJ+CUB77E6zkVS7Krw8mrqEEZ
	mDXK55GThKNN44et5NvqX5quo+pSATs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689614104; x=1689700504; bh=0E9MgccMLkK1o
	MaZwOIjW8llnQf3URAUtE4+GGaYXQE=; b=Evk1nVDpnpROwPhMrodfdQDBKkcnP
	I5PQleUZ10ZtP+JvWe6oeD6mZJGiZFb37vskFgTYMLOt8dpAX9wzPK9vms+sfG1c
	0mAYb2ciGd+LaBLi+jojHoU2YjjKLPuKi3qtHuUAPBw6Q4WHXcs4nr+xG+EGx3SC
	pBAWqrlpxJhKw+2Q/RBStevVi6fCkCO6PIZCWuUTosIe6cQOqGuYoU8nicfzitRb
	/u/VhrDwqO5GA7OhoK0hxW6G4HwjBzpMjfurheGWCAaujk3lOsPj2xZ1C1fytEc7
	2pxRiAvFK8/G7eDhODLgmVTwpmU2pjcteD62uvjw7ocvkLUJ62p9kY2wQ==
X-ME-Sender: <xms:GHe1ZNgkrxD2UDo4UwWfxF0P0nHRFa633wxX-tqaYkUzcHE6iMd--g>
    <xme:GHe1ZCDcwgSig--BPGOlIsoLaD-Vs8ygT8azkdtitQnI4tKbKTQ-1G160vc_G24Bd
    u1msbQozrknuBgXJg>
X-ME-Received: <xmr:GHe1ZNHRnL20CzjbTMihVYKq98aAATTsRtwVF4wQwus1acKz6joJJzMLOl7Lc2TE8ImLlWP7hL7T_Qy7dm8m6hwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeelheelveffud
    etjeeuffeuvdehffejteehvddvveduieehgedtjeehheetuddtfeenucffohhmrghinhep
    ghhithhlrggsrdgtohhmpdhophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegt
    ohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:GHe1ZCSI1o-KbMNj33PsMrAdFSzXLf8QhNsYhlr-1Zn9qyO7-QPsgw>
    <xmx:GHe1ZKwTHPJJZlePUlJNmQFHmjqKPDLBd6HpwJ4UrS0V4agAyms72Q>
    <xmx:GHe1ZI6EFxs00ttG8Sq3dVbKv9gaMT-Hknxg567IngkT22zb8vkfPQ>
    <xmx:GHe1ZPtyOsQ02mLiMDwWLvJX3Hd7UGZibGhbNar7xu6TV9yYWZwmvQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 17 Jul 2023 13:15:04 -0400 (EDT)
Date: Mon, 17 Jul 2023 13:15:03 -0400
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: python3-asyncinotify: upgrade 3.0.1 -> 4.0.2
Message-ID: <ZLV3F0kY2U4JMlSl@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <1772B6E959A7EECD.27904@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1772B6E959A7EECD.27904@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 17:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103889

Apologies, there is no second patch; I fat-fingered git-send-email.

On 17/07/23 13:11 -0400, Justin Bronder wrote:
> c5590c5 Switch from GitHub to gitlab
> 22b0ed7 make pass all mypy type checks
> abd15f8 add __weakref__ to inotify and watch
> 5e57e0b add slots to all classes
> f907237 restore support to 3.6
> 5269b9d improve documentation
> 2512aa3 Merge branch '16-add-timeout-for-the-sync-version-of-get-sync_get' into 'master'
> 5beff57 add sync_timeout
> c8f8653 fix readthedocs
> 97056b9 remove package rule
> faebfa9 move test after package
> a75f116 version bump
> 6b4921f rework docs
> 35716a4 rework docs
> c51d603 fix test for deprecations
> ddd987c switch to pyproject.toml, test against all supported python versions
> 
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  ...n3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-asyncinotify_3.0.1.bb => python3-asyncinotify_4.0.2.bb} (75%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
> index 2f4adcea7a..08dc77bd17 100644
> --- a/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
> @@ -3,9 +3,9 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
>  
> -SRC_URI[sha256sum] = "da812bf2be6a76aac6670b766eec4564d9484da6595d3ce1f9bba8ba78c30445"
> +SRC_URI[sha256sum] = "bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829"
>  
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>  
>  RDEPENDS:${PN} += " \
>      python3-asyncio \
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103887): https://lists.openembedded.org/g/openembedded-devel/message/103887
> Mute This Topic: https://lists.openembedded.org/mt/100199246/4454694
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [jsbronder@cold-front.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Justin Bronder

