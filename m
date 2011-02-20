Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqxyW-0004eq-5B
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 02:20:36 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqxxD-0002vr-NS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 17:19:15 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 19 Feb 2011 17:19:15 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Feb 2011 18:19:14 -0700
Message-ID: <4D606C0B.5080508@mentor.com>
Date: Sat, 19 Feb 2011 18:19:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5FFF05.5050603@freyther.de>
In-Reply-To: <4D5FFF05.5050603@freyther.de>
X-OriginalArrivalTime: 20 Feb 2011 01:19:14.0384 (UTC)
	FILETIME=[2FB1AD00:01CBD09C]
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Feb 2011 01:20:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2011 10:33 AM, Holger Freyther wrote:
> On 02/18/2011 08:26 PM, Tom Rini wrote:
>> In order to make the user experience better we now use bb.warn
>> on non-fatal QA errors and bb.error on fatal errors.
>
>
> hmm. for every binary with a bad RPATH in your distribution your product can
> get bad press very fast. I think the commit message should reflect this in a
> way that we are aware of this and don't care.

Agreed, I will update the RPATH wording when I push this.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


