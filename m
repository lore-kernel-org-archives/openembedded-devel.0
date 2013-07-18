Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE8466AFF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:59:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6I7x7SL017614
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2013 00:59:08 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Jul 2013 00:59:06 -0700
Message-ID: <51E7A048.6010704@windriver.com>
Date: Thu, 18 Jul 2013 15:59:04 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1373979075-15576-1-git-send-email-rongqing.li@windriver.com>
	<20130717184315.GA31259@windriver.com> <12162896.r64JGkun5K@helios>
In-Reply-To: <12162896.r64JGkun5K@helios>
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0
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
X-List-Received-Date: Thu, 18 Jul 2013 07:59:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/18/2013 04:48 AM, Paul Eggleton wrote:
> On Wednesday 17 July 2013 14:43:16 Joe MacDonald wrote:
>> This adds (unconditional) support for tcp-wrappers and makes it a
>> requirement for the upgraded vsftp.  Is this something we could make
>> conditional based on tcp-wrappers being present?  Or does anyone think
>> this is something worth doing?  tcp-wrappers is coming from oe-core and
>> I don't have any systems where the new requirement would be a problem,
>> but does anyone else have a system they'd want vsftp without
>> tcp-wrappers?
>
> We've recently added tcp-wrappers to a number of recipes in OE-Core; at the
> time there was a discussion about a possible follow-up to add a
> DISTRO_FEATURES item to disable it system-wide. I guess whether or not it's
> worth it depends on what the overhead of having it enabled is.
>

I think the overhead is little.
I will enable it based on PACKAGECONFIG, as it has in oe-core.


-Roy


> Cheers,
> Paul
>

-- 
Best Reagrds,
Roy | RongQing Li

