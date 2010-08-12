Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ojcxy-0001OU-KF
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 20:57:28 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ojcxk-0002eX-6s from Tom_Rini@mentor.com ;
	Thu, 12 Aug 2010 11:57:12 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 12 Aug 2010 11:57:12 -0700
Received: from [172.30.80.91] ([172.30.80.91]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 12 Aug 2010 12:57:10 -0600
Message-ID: <4C644400.5050806@mentor.com>
Date: Thu, 12 Aug 2010 11:57:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>	<1281627336-686-2-git-send-email-kernel-hacker@bennee.com>	<4C64298E.3060509@mentor.com>
	<AANLkTin-=7FuDRhnt77hy_tfvBM5xCKkQcx2EWBuc14u@mail.gmail.com>
In-Reply-To: <AANLkTin-=7FuDRhnt77hy_tfvBM5xCKkQcx2EWBuc14u@mail.gmail.com>
X-OriginalArrivalTime: 12 Aug 2010 18:57:10.0942 (UTC)
	FILETIME=[2B5BC3E0:01CB3A50]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Bennee <ajb@cbnl.com>
Subject: Re: [PATCH 1/2] freetype: include perl-native dependancy
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
X-List-Received-Date: Thu, 12 Aug 2010 18:57:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Alex Bennee wrote:
> On 12 August 2010 18:04, Tom Rini <tom_rini@mentor.com> wrote:
>> kernel-hacker@bennee.com wrote:
>>> From: Alex Bennee <ajb@cbnl.com>
>>>
>>> Freetype requires a native perl to build during it's configure step.
>>> I'm unsure how it built before unless other uses had brought in
>>> perl-native through another dependancy (our GTK setup is fairly
>>> minimal).
>>>
>>> Signed-off-by: Alex Bennee <ajb@cbnl.com>
>> OE assumes that there is a host perl already.  perl-native is mainly
>> provided for some very special cases (such as building perl for the target).
> 
> How odd, I couldn't get configure to run without a perl-native. Maybe
> because I was building for i686 on an x86_64. I guess it relegates
> that patch to a "works for us" status.

So, were you building for say MACHINE=qemux86

-- 
Tom Rini
Mentor Graphics Corporation


