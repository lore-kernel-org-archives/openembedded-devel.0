Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BA3CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:32:02 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.web11.59106.1755459115131311181
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=iz6HTUsa;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 572A845CD3
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:31:54 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-blue-7.trex.outbound.svc.cluster.local [100.96.43.79])
	(Authenticated sender: hostingeremailsmtpin)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9D0B245327
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:31:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755459113; a=rsa-sha256;
	cv=none;
	b=DeWhZEZ/r0xFIveIy6xhCIaR9tCuIEb2Rr0abyOP5v8xKn8SIRxBv/7LQz6i1M8KDSt9Fu
	Sm902jEV20+nyGtlAe3nR/QQ6APbzS1l5lER6xMzc3niD51qlpX85HfnIZC0Yor1CWQyYk
	mOTWVoIDUoCfcX0OmlPiwx1rCUfqbHgVBJYAZKEizfOkrFWDR7AmG0fJYHunquQydmLb2S
	s/4yNXf55VMP6grh/KVrGsVxLVrB1J3Uh0g7CJmRXI6OYj7rn4r34xJnMj0UsQiq08347Y
	kliPgYwtI7Yp7fETzFjVI7qjLYHepP+J9Smt8yiBtn/DkwiiTdhM4vVm/GOC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755459113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=FduFDLjkWgR6RjLio4g1Y2Ueb9FLDN/7HXx7HnpSl4g=;
	b=J0ukwtnWhRYZ+GocJRlKxNITQYU07jFgc7pIfvWh5VDghA7Pon9BmMkKHI/uIsJWHgVt8j
	NtIN/AjQ3aPcjDRer+J3ytdtRpgzH0jWda0hIdceOuhdS790HKWaZZwoZFyJq3W5SRFCPp
	R09ySGussaYMzbyQlJnDnt3DIZjnuDTa7HVzCemf2pPHuGPislrhaF1vYi4l44OVPdC+Z+
	2aK26WCBw5y+DK4PqoDOdsnLwGzwp/eMdUcjjth/xCCor25KjuRk+bCQAi/tMhIz5/j3aD
	t8dZssHm/BDofyebTzUvdvfORxpoqVS5PsiqrbBtMa2zKelHF54IKCvSiMbxjw==
ARC-Authentication-Results: i=1;
	rspamd-697fb8bd44-8sr7s;
	auth=pass smtp.auth=hostingeremailsmtpin
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremailsmtpin
X-Minister-Shade: 1e81c39e1f108171_1755459114158_2839691164
X-MC-Loop-Signature: 1755459114158:2090629761
X-MC-Ingress-Time: 1755459114158
Received: from fr-int-smtpout18.hostinger.io ([UNAVAILABLE]. [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.43.79 (trex/7.1.3);
	Sun, 17 Aug 2025 19:31:54 +0000
Received: from [IPV6:2001:861:4448:6b00:1022:9db4:c2fd:5d60] (unknown [IPv6:2001:861:4448:6b00:1022:9db4:c2fd:5d60])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c4mF35dqRz1xnv;
	Sun, 17 Aug 2025 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755459111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FduFDLjkWgR6RjLio4g1Y2Ueb9FLDN/7HXx7HnpSl4g=;
	b=iz6HTUsarjZp4TRqqK5qpAeLSxHfsnOMp/MgfROB/ZSCe1aTm7pT4ZOmG31qj/uF2ojUcV
	Kej89RYS408XCwZO5djK56Ykx8qx5IDAkE8BPhfml1e1CRY25wjZKuwL7ESSyHJPoOgZay
	89BeU4H7SWkZRPTzSV0u2HsM5gVLVkku/lM9WljRgLMfviglmzHoFBYY4TuFk69fOTYlZo
	mrJyIAFG541EX0IolFp4xql5fMS+GZ1AhEGhEtRkQnmvtsPFOKi18nvxMzYM5STz/VLl2b
	Njaoq5q23RJB+3cqiyDAHPnkYGHQHmxsxA5VUrXXxq4dN1aZa0oGd0GGWYMWEg==
Message-ID: <127303b4-0fa2-48c6-a84f-d3bbcbb48b79@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [oe] [PATCH] kernel-hardening-checker: upgrade to 0.6.10.2
To: openembedded-devel@lists.openembedded.org
References: <185CA49A2B2B7F33.8958@lists.openembedded.org>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <185CA49A2B2B7F33.8958@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 17 Aug 2025 19:31:51 +0000 (UTC)
X-CM-Envelope: MS4xfA1ed+kY59w9dzOP80K9A+kGj0g6uFeW/w0rF2EO78qhzcI3BYEGckBUmnHN0kJ+0jVknBp44DGViq7s1JZOEWQ7XuoizyrWKsU7hR3g7YmtVl7niDMb e/GKICCLDzRNNg8vbehKbS1A+0PJ6lGwgDl3pknVEK4kavPmw1O8SYlOyV+otU519Q1Cz2M+azrEKDx8PcW2pH/eLUQm1/MYKLrL7JFC018a431qSSIZy5Ii g25xMp0Gd2BeYgK+gqSQF5NmhLHP5Ph4palmbtnIt1j70KmNsLtn1r18eAeQsQiGCz5iVRHS8Jehx9Ys3kq3EICgUdGo3qI9ry1kl8e9/9OSEtTzra9uq6V0 PAgoqed16Rq0bpwniymZq6Ge2kK8mZyzHKmXKRMKaVqOyupV+G4=
X-CM-Analysis: v=2.4 cv=LaRu6Sfi c=1 sm=1 tr=0 ts=68a22e27 a=/4B58YW+q9akEXzE1EpPGA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Q4-j1AaZAAAA:8 a=d70CFdQeAAAA:8 a=NEAV23lmAAAA:8 a=YPgLBU3A5ZlUvSzsw-YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 19:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118987

Sorry, wrong subject, resending....

On 8/17/25 21:28, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Major upstream changes (not a minor release update in terms of features):
> - RISCV support
> - New "-a" option: autodetect and check the security hardening options of the running kernel
>    You can now just run "kernel-hardening-checker -a"
> - Require Python 3.9
> - Replace setup.py by pyproject.toml
> - Many fixes and new features
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>   ...cker_0.6.10.bb => kernel-hardening-checker_0.6.10.2.bb} | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-security/kernel-hardening-checker/{kernel-hardening-checker_0.6.10.bb => kernel-hardening-checker_0.6.10.2.bb} (91%)
>
> diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
> similarity index 91%
> rename from meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
> rename to meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
> index e7610ac785..559a15a009 100644
> --- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
> +++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
> @@ -13,13 +13,14 @@ LICENSE = "GPL-3.0-only"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
>   
>   SRC_URI = "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=https;branch=master"
> -SRCREV = "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
> -
> +SRCREV = "0ebece346f187e7d3589883cc1d194fcd1c3cda8"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   RDEPENDS:${PN} = "\
>       python3-json \
> +    python3-misc \
> +    bash \
>   "
>   
>   # /boot/config is required for the analysis
> @@ -27,7 +28,7 @@ RRECOMMENDS:${PN}:class-target = "\
>       kernel-dev \
>   "
>   
> -inherit setuptools3
> +inherit python_setuptools_build_meta
>   
>   # allow to run on build host, if you don't want it in the image
>   # oe-run-native kernel-hardening-checker-native kernel-hardening-checker ...
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118986): https://lists.openembedded.org/g/openembedded-devel/message/118986
> Mute This Topic: https://lists.openembedded.org/mt/114752594/8981821
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [michael.opdenacker@rootcommit.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


