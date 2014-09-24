Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D37660809
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 07:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8O7bNpx013256
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 00:37:23 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 00:37:22 -0700
Message-ID: <542274B2.7080300@windriver.com>
Date: Wed, 24 Sep 2014 15:37:22 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1411537323-29871-1-git-send-email-rongqing.li@windriver.com>
	<lvto7r$7em$1@ger.gmane.org>
In-Reply-To: <lvto7r$7em$1@ger.gmane.org>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] iscsi-initiator-utils: add recipe file
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
X-List-Received-Date: Wed, 24 Sep 2014 07:37:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I see there are two recipes for iscsi under meta-cloud-service,
one is called iscsi-initiator-utils, other is called open-iscsi.
and open-iscsi provides the systemd support and kernel modules,
so I will copy open-iscsi into meta-oe/meta-oe.


-Roy




On 09/24/2014 02:27 PM, Koen Kooi wrote:
> rongqing.li@windriver.com  schreef op 24-09-14 07:42:
>> >From: Roy Li<rongqing.li@windriver.com>
>> >
>> >The package provides the server daemon for the iSCSI protocol, as well as
>> >the utility programs used to manage it. iSCSI is a protocol for
>> >distributed disk access using SCSI commands sent over Internet Protocol
>> >networks
>> >
>> >It's a fairly basic utility, so copy it from meta-cloud-service to
>> >meta-oe
>> >
>> >Signed-off-by: Roy Li<rongqing.li@windriver.com>  ---
> [..]
>
>> >+++
>> >b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils.inc

-- 
Best Reagrds,
Roy | RongQing Li

