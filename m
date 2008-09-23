Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KiCva-0006IW-3s
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 20:48:02 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2926431rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=58OcyZP2Oto7GdyG7vJG2Ab3t/ov4XKsj7y8VT1Uc60=;
	b=FeVvIsk6tJisXM7fgqirhPn5/QuOIdUSyXSCOcdPOERVTBHIXVv/bMHRCSwsJbzkuB
	yNssbACsCOI/bs0UXOQs398XN2y4livRzTxzDfzWtggCtqVHPknqluhzcvVDyMQyMBJq
	r72Mc0xY5ItF193wSF0RYlKPIUELN5136EgKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=eD+QT2NaCsF1CVXDfCvIjAMSNNJJ9zJi5qL5Le9kJ6S3UOKGp251LPwbvD0tXJS2Qe
	TvuLVlBMtzMCySscTsFcUgdBVkCKjt1zzY2J1oEiphbk71dyatEwZPyBO+QlapCL4GAx
	ce5TeV6AM5O3QG/DFA8SDSG73waDLMiZ5qepM=
Received: by 10.141.76.21 with SMTP id d21mr2909347rvl.242.1222195467824;
	Tue, 23 Sep 2008 11:44:27 -0700 (PDT)
Received: by 10.140.174.2 with HTTP; Tue, 23 Sep 2008 11:44:27 -0700 (PDT)
Message-ID: <19c1b8a90809231144i35b4471ds9eb453f0abd5cc51@mail.gmail.com>
Date: Tue, 23 Sep 2008 11:44:27 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080923171632.GA28205@denix.org>
MIME-Version: 1.0
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com> <20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com> <gaggd6$86a$1@ger.gmane.org>
	<20080913190643.GA14530@gmail.com> <20080915071849.GA7168@denix.org>
	<20080919210118.GA4101@denix.org> <20080923171632.GA28205@denix.org>
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Tue, 23 Sep 2008 18:48:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have no problems with this patch.

-Khem

On Tue, Sep 23, 2008 at 10:16 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Sep 19, 2008 at 05:01:18PM -0400, Denys Dmytriyenko wrote:
>> Khem,
>>
>> On Mon, Sep 15, 2008 at 03:18:49AM -0400, Denys Dmytriyenko wrote:
>> > On Sat, Sep 13, 2008 at 12:06:43PM -0700, Khem Raj wrote:
>> > > >>> I agree that this is not a proper fix, but rather a hack. glibc has its own
>> > > >>> limits.h, which wants to include gcc's limits.h like this:
>> > > >>>
>> > > >>> This issue was brought up before, but as far as I can tell, it wasn't fixed
>> > > >>> properly.
>> > > >>> This is initial Koen's post about the issue:
>> > > >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
>> > > >>> And here is your own reply with one of the possible solutions:
>> > > >>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
>> > > >>
>> > > >> right. So can you try this patch and see if this fixes the problem ?
>> >
>> > The proper fix seems to work fine. Thanks for applying the patch.
>>
>> I see most of gcc-cross* recipes been cleaned removing the hack mentioned
>> above, but there are few more, mostly CodeSourcery ones. The patch for those
>> is in the ticket #4560:
>>
>> http://bugs.openembedded.net/show_bug.cgi?id=4560
>
> Any updates for this item? Please let me know if the patch needs more work.
> Thanks.
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


