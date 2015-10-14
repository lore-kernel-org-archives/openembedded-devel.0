Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F50060125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:49:34 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so99664273wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9naWHKgT0Aerdfi0mgnSI9MMPScBprufFqfMTXN/xSI=;
	b=bJ/eAXTvaVVlsY1YcTWMQT7OH6mYCRWDRVqXpzXUDQ6fyAXuHf5w7iPVA9s6XiviMr
	AfnU8S1zG9G6jCNghxn69dwgfrWzAbSQL4KsaoqW1V7QrM2bQvu2g5/Gyq4FEHzhTMnW
	d9Eptoo2i3BKCTt95Dkg7QQA+8j8h8rqSHKnIVJjKiIJL52r64u/6H+CHRvampiZNuL6
	MmgPPmaIHDGfWD1U+U2t3moEdVQYyqa11jX25xO2wFFNfj+I1h5jojF768HHLzFCSIUc
	4AiK6m7a8gb6yPf4zXKHJm0nl20SnO6k2RB049+FMGn5Am72onnvnTcTsXQ4+Zai6IF/
	tXlQ==
X-Received: by 10.194.175.74 with SMTP id by10mr3828138wjc.78.1444826972949;
	Wed, 14 Oct 2015 05:49:32 -0700 (PDT)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	ub7sm7016051wib.17.2015.10.14.05.49.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 05:49:32 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
	<37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
	<20150824124512.GE2446@jama> <55DC1737.1070201@theqtcompany.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <561E4F86.10007@gmail.com>
Date: Wed, 14 Oct 2015 15:50:14 +0300
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
X-List-Received-Date: Wed, 14 Oct 2015 12:49:34 -0000
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

