Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PKv1K-0004QN-IU
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 16:43:03 +0100
Received: by qyk7 with SMTP id 7so3319586qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:41:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.180.131 with SMTP id bu3mr6668359qab.11.1290526909397;
	Tue, 23 Nov 2010 07:41:49 -0800 (PST)
Received: by 10.220.178.204 with HTTP; Tue, 23 Nov 2010 07:41:49 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <4CEBDFF0.2070001@cbnco.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<4CEBDFF0.2070001@cbnco.com>
Date: Tue, 23 Nov 2010 10:41:49 -0500
Message-ID: <AANLkTike5K3is8FUg9CiBD4t-3FDQRveH00Y1UAxW479@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 15:43:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yea, in testing again, I am getting the same results now with num_cpu or
2*num_cpu.  All 4 cores are pegged at 100% either way.

Not sure what causes the hiccup in the number before, must have been
something else consuming CPU.

On Tue, Nov 23, 2010 at 10:38 AM, Michael Smith <msmith@cbnco.com> wrote:

> Chris Larson wrote:
>
>> Thanks for your time, and do let me know what you think, either of the
>> code, performance in general, or the new progress bar (shows an ETA),
>> or anything else :)
>>
>
> On a Xen VM with 3 vcpus, this is just brilliant. I used the default number
> of parse threads (i.e. 3). The CPUs are pretty much pegged.
>
> Mike
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

