Received: from [216.32.181.16] (helo=outbound6-wa4-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Timothy.Bird@am.sony.com>) id 1JZ7Td-0002Eo-40
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 17:37:53 +0100
Received: from outbound6-wa4.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound6-wa4-R.bigfish.com (Postfix) with ESMTP id 510AD1869B07;
	Tue, 11 Mar 2008 16:35:20 +0000 (UTC)
Received: from mail167-wa4-R.bigfish.com (si1-wa4 [10.8.14.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by outbound6-wa4.bigfish.com (Postfix) with ESMTP id 4E80F168079;
	Tue, 11 Mar 2008 16:35:20 +0000 (UTC)
Received: from mail167-wa4 (localhost.localdomain [127.0.0.1])
	by mail167-wa4-R.bigfish.com (Postfix) with ESMTP id F29D56808F1;
	Tue, 11 Mar 2008 16:14:33 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.66.75;Service: EHS
Received: by mail167-wa4 (MessageSwitch) id 1205252071232443_17890;
	Tue, 11 Mar 2008 16:14:31 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	by mail167-wa4.bigfish.com (Postfix) with ESMTP id 0B0BB62810C;
	Tue, 11 Mar 2008 16:14:30 +0000 (UTC)
Received: from mail3.sjc.in.sel.sony.com (mail3.sjc.in.sel.sony.com
	[43.134.1.211])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id m2BGEUfF028545; 
	Tue, 11 Mar 2008 16:14:30 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail3.sjc.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	m2BGETg9011902; Tue, 11 Mar 2008 16:14:29 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 11 Mar 2008 09:14:25 -0700
Received: from timdesk.am.sony.com ([43.135.148.222]) by
	ussdixms03.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 11 Mar 2008 09:14:19 -0700
Message-ID: <47D6AF65.1020007@am.sony.com>
Date: Tue, 11 Mar 2008 09:12:21 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>	<200803111126.04715.openembedded@haerwu.biz>	<fr5ntp$n0v$1@ger.gmane.org>	<1205233201.4521.30.camel@dax.rpnet.com>	<20080311143030.68d6341b@widy.localdomain>	<1205239153.4521.53.camel@dax.rpnet.com>	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
In-Reply-To: <1205243052.4521.82.camel@dax.rpnet.com>
X-OriginalArrivalTime: 11 Mar 2008 16:14:19.0936 (UTC)
	FILETIME=[F6379200:01C88392]
X-SA-Exim-Connect-IP: 216.32.181.16
X-SA-Exim-Mail-From: Timothy.Bird@am.sony.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=RCVD_IN_DNSWL_LOW,RDNS_NONE
	autolearn=unavailable version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 16:37:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Tue, 2008-03-11 at 15:03 +0200, Paul Sokolovsky wrote:
>> It's nice to have that said explicit - different. Supposedly it's more
>> powerful for developers, but how good it is for end users? How many
>> industry entities select git as their in-house SCM? I doubt that too
>> many, knowing too well that many still select just CVS.



> Regarding industrial entities, hopefully we call agree CVS is a pretty
> bad SCM and that proves said industrial entities don't know what they're
> doing, usually since it often it comes down to politics rather than
> technical merit. I know of a few surprising companies using git FWIW
> although I know of a few abominations in use too.

Just a data point...
Sony uses git as its in-house SCM for Linux-related work.
We also use quilt.

 > Also, I think more end users coming fresh to OE will know how to do this
 > with git in the current climate than with monotone, hg or any other
 > distributed SCM.

I would agree with this.  monotone is a big reason I'm still
an observer of OE rather than an active participant.
As such, I shouldn't really have a vote.  But if I did it would
be for git, purely for personal economy of training.

  -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



