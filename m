Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OOuPM-0002LR-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:20:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OOuL0-00012q-CE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 08:15:34 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 16 Jun 2010 08:15:34 -0700
Received: from [172.30.80.160] ([172.30.80.160]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Jun 2010 09:15:33 -0600
Message-ID: <4C18EA90.6040006@mentor.com>
Date: Wed, 16 Jun 2010 08:15:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C17FB97.1080505@mentor.com> <hv9thv$u7$1@dough.gmane.org>
In-Reply-To: <hv9thv$u7$1@dough.gmane.org>
X-OriginalArrivalTime: 16 Jun 2010 15:15:33.0375 (UTC)
	FILETIME=[C3D850F0:01CB0D66]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: perl-native, why again?
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
X-List-Received-Date: Wed, 16 Jun 2010 15:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 16-06-10 00:15, Tom Rini wrote:
>> Hey all,
>>
>> I was wondering, is there a reason for perl native aside from cpan?  If
>> no, have we tried setting things up such that system perl uses a local
>> to $TMPDIR cpan install spot?
>>
>> I ask since once perl-native exist, stuff can get very unfun (too long
>> #!/path/to/perl isn't fun at all).
> 
> You can only crosscompile $version of perl if your host is the same
> $version. You will get very strange bugs otherwise. That was for perl
> 5.6 or something, dunno if perl and/or our recipes have improved since.

OK, so that rings a vague bell as well, the crossperl thing.  Need to 
think a little bit about that one as well then, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


