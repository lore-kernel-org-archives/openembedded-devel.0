Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78CA365C78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2015 06:52:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D6quCq022598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2015 23:52:56 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 12 Jul 2015 23:52:55 -0700
Message-ID: <55A36046.6030508@windriver.com>
Date: Mon, 13 Jul 2015 14:52:54 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1436520866-18584-1-git-send-email-wenzong.fan@windriver.com>
	<CAMKF1srTMRj=YHJWH99AvySmbbEDOdEVzopsu74ry_PFd_jmjg@mail.gmail.com>
In-Reply-To: <CAMKF1srTMRj=YHJWH99AvySmbbEDOdEVzopsu74ry_PFd_jmjg@mail.gmail.com>
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Mon, 13 Jul 2015 06:52:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2015 07:43 AM, Khem Raj wrote:
> On Fri, Jul 10, 2015 at 2:34 AM,  <wenzong.fan@windriver.com> wrote:
>> +do_configure_prepend() {
>> +       rm -rf ${S}/.pc/*
>> +}
>> +
>
> why is this needed. And please use -M -C option with git format-patch
> in future so git can detect renames.

This logic is from the old recipe file. I cleaned it and run a test 
build, there's not any issue.

Please refer to:

[oe] [PATCH v2] libxml-libxml-perl: update from 2.0116 to 2.0121

Thanks
Wenzong

>

