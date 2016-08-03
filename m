Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Aug 2016 13:35:00 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id AE2E0700F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 13:35:00 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bUw5R-0001FH-Lj for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2016 15:19:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 3 Aug 2016 15:19:44 +0200
Message-ID: <nnsr1g$rto$1@blaine.gmane.org>
References: <1470148001-61634-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0Lb87euCxRhLR+LgqB2YUsfZoTsmdkD+4tCRmUzA0BxrBw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <CAJTo0Lb87euCxRhLR+LgqB2YUsfZoTsmdkD+4tCRmUzA0BxrBw@mail.gmail.com>
Subject: Re: [PATCH] cronie: 1.5.0 -> 1.5.1
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
X-List-Received-Date: Wed, 03 Aug 2016 13:35:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 02-08-16 om 10:20 schreef Burton, Ross:
> On 2 August 2016 at 15:26, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> 
>> Update cronie from 1.5.0 to 1.5.1
>>
> 
> This should be on the openembedded-core list, was already posted last week,
> and you made the same mistake that the previous patch did by not testing
> the PAM-specific patches (which fail to apply).

Speaking of cronie, does the recipe already include a proper crontab that
lists cron.{daily,hourly,weekly}? It ships the directories, but they won't run
anything due to said crontab entries missing.

regards,

Koen



