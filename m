Return-Path: <ariel.dalessandro@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75E3C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 13:47:02 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
 by mx.groups.io with SMTP id smtpd.web11.52417.1743428817982316011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 06:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=ariel.dalessandro@collabora.com header.s=zohomail header.b=hkgP3j2B;
 spf=pass (domain: collabora.com, ip: 136.143.188.112, mailfrom: ariel.dalessandro@collabora.com)
ARC-Seal: i=1; a=rsa-sha256; t=1743428814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h12i9JvJG03o4C8uEGlwKDijdJe39jFjhpwSMejpxnacap3fNIGfyNJrBhT67A7ftmUhMMSzfjWrDD4TwWevG87uEAxdKDSyAl3ixBcNuzPfaSDnnMU5FBpS+d9DvxU1HfKj4CDbwt68Wzxx4ZRpdFEX6UU0LmyUkMDMOs/6kEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743428814; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YbzkdJbVfoktAL04flFKKO94tZDMDH/3hElb2o5Zssc=; 
	b=mKYrzlNlVT+oN6DXbIZblQfKX1fGPNR88Wn5qLgI6FuHepzFmn8fW8vcJnJ8veNGoyQ68EFi9tTcmWLnOth0PWiBHZ4LoSAk8R7YrTBdVw41WJ66mDGRCrFJzgOH/bNUtCBU/h4ibYC8HhyDO5uHtmzwdVYW8bk8VP50DlZJ0OY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743428814;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YbzkdJbVfoktAL04flFKKO94tZDMDH/3hElb2o5Zssc=;
	b=hkgP3j2Bfr/7u6P4s9LaqRHkt1rWv4ip3yQEB7AQ3pYL/VTqBZiloUjyN56ZAjdB
	ckrOnNm3PDJkNzuiBzJW81OgvAjQmZjszTlZVfiVvXMG51CUYzT81V6HMQ2hFEX/AZ6
	11QxIbvOmHEFkjZ/ReOjy3U+q/aIiOtftTMfgfYE=
Received: by mx.zohomail.com with SMTPS id 1743428812558154.5638655299316;
	Mon, 31 Mar 2025 06:46:52 -0700 (PDT)
Message-ID: <268ae4b7-cb2a-4e43-b27f-3c218c7d2294@collabora.com>
Date: Mon, 31 Mar 2025 10:46:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, schnitzeltony@gmail.com, akuster808@gmail.com
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [meta-multimedia] pipewire: Install missing ALSA config files
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 13:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116432

Hi,

This is a request to backport commit [0] to previous releases, mainly to 
scarthgap.

Details can be found in the related commit log and pull request [1]. 
This fixes issue [2].

Thanks in advance!

[0] 
https://github.com/openembedded/meta-openembedded/commit/134978803ec5f4e4ae5c1d3311896ccd52827851
[1] https://github.com/openembedded/meta-openembedded/pull/949
[2] https://github.com/openembedded/meta-openembedded/issues/704

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


