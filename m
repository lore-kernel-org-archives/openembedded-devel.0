Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id AC8B3605D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:46:20 +0000 (UTC)
Received: by lffv3 with SMTP id v3so10705950lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9naWHKgT0Aerdfi0mgnSI9MMPScBprufFqfMTXN/xSI=;
	b=bUyElHPCDXBQci4/6yn3O3vMrMKsRhVx9Z+kssriaMdyeg6rbKPMedkc+Gv//ywHnf
	phxCoaqLrvFzIIPbzZbIFT/a28gd1Q7xrnOA8bfHn8/UoLrBLTko92p2MlJ6BF/gaXy5
	1KWWQidzXJQR9/A4Yxpf4zv62/iFCBlUQk43zD5RoyHN7YjLbA2AAmcRD81JMNsEHPcP
	j299kDP+vLa6T4HKdx9fZ2vtend3h2G17pVWqcNMYXlG2zK0f0QtdoApJJJCS8wdTuPE
	3D1oNcyT9V6bvRMeE7WBlnqvuYUIAyO8g11SUDIXlfmajOm4slcemLfEb2a6meboD+TM
	pjJw==
X-Received: by 10.25.43.9 with SMTP id r9mr999972lfr.45.1444826779946;
	Wed, 14 Oct 2015 05:46:19 -0700 (PDT)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	j189sm1321667lfg.48.2015.10.14.05.46.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 05:46:19 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
	<37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
	<20150824124512.GE2446@jama> <55DC1737.1070201@theqtcompany.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <561E4EC4.9020300@gmail.com>
Date: Wed, 14 Oct 2015 15:47:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55DC1737.1070201@theqtcompany.com>
Subject: Re: [meta-qt5][PATCH 06/11] qt5: make qt5.inc reusable qt5-module.bbclass
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
X-List-Received-Date: Wed, 14 Oct 2015 12:46:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 25.08.2015 10:20, Samuli Piippo wrote:
> On 24.08.2015 15:45, Martin Jansa wrote:
>> On Mon, Aug 24, 2015 at 12:13:52PM +0300, Samuli Piippo wrote:
>>> qt5.inc has common parts that can be used to build any Qt5 module.
>>> Make it a bbclass so that it is easily usable from other meta layers.
>>
>> require recipes-qt/qt5/qt5.inc
>>
>> can be used in other layers as well
>>
>
> It can, but as a bblclass it would make it clear that it's a supported
> thing to do, like qmake5 currently is.
> And maybe help guide further changes so that it remains usable from
> other layers as well.
>

Is this something that you can consider adding in?
I'll do a rebase for it, if it is.

-samuli

