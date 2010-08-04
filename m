Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjDT-0002IN-Tp
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:01:29 +0200
Received: by ywe9 with SMTP id 9so2243661ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=teXMtGwAT6Kniy2CfXkEkWJzyb64Dk9Fq/V3Fc+vmq0=;
	b=Qj4sGejjj8ymevwuPoT++N+qbR8yYwXyKmlVWiTQy6bOOg5FjxAwegNveau75Wde2a
	IEaHyPbFdKqUiKGasYaCKX34kNrtJMfTbK50vHCIkZuZFzwKCFppQIRL8p13NuRPxEJy
	q4ujARrB6XaP2mNm7j/FH3zI51hTt6eZicw9E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=HN1xWekfOODZq6FCfMAjnpNJEY9yskXoVfH3ajGIAGu8z5BvL1Mz8RDeTL9spEOvA9
	p+nEvVwBILBqKRYgKmLEcS5xlXZBeWG7Btl43dKaiDe8Is+FL3acJCVTxe7FrRI3aiDt
	rkwDKycPmxos8NtMulV+x7jdKR7sFqRC31vIc=
Received: by 10.231.170.21 with SMTP id b21mr10801969ibz.122.1280948479381; 
	Wed, 04 Aug 2010 12:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Wed, 4 Aug 2010 12:00:59 -0700 (PDT)
In-Reply-To: <1280932858.16235.165.camel@rex>
References: <1279290319.10837.1747.camel@rex> <1280842002.16235.83.camel@rex> 
	<20100804040949.GA7085@gmail.com> <1280932858.16235.165.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 12:00:59 -0700
Message-ID: <AANLkTi==huSpPxRb8ig219x5AKkPTAts8PgC16kf29vX@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Wed, 04 Aug 2010 19:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2010 at 7:40 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2010-08-03 at 21:09 -0700, Khem Raj wrote:
>> On (03/08/10 14:26), Richard Purdie wrote:
>> > Whilst I think there were some initial concerns the consensus seemed t=
o
>> > be that this was a good thing to have in bitbake, its something that h=
as
>> > been on the feature wishlist since day one so I've merged the patch in=
to
>> > bitbake master.
>>
>> Now this fails.
>>
>> $ bitbake -c clean -b virtual:native:/home/kraj/work/oe/openembedded/rec=
ipes/zlib/zlib_1.2.3.bb
>> Command execution failed: Traceback (most recent call last):
>> =A0 File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 88, in
>> runAsyncCommand
>> =A0 =A0 commandmethod(self.cmds_async, self, options)
>> =A0 File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 174, in
>> buildFile
>> =A0 =A0 command.cooker.buildFile(bfile, task)
>> =A0 File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 640, in
>> buildFile
>> =A0 =A0 the_data =3D self.bb_cache.loadDataFull(fn, self.get_file_append=
s(fn),
>> self.configuration.data)
>> =A0 File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 897, in
>> get_file_appends
>> =A0 =A0 if f in self.appendlist:
>> AttributeError: BBCooker instance has no attribute 'appendlist'
>
> Sorry, I'd tested with partial expressions in the -b option, not full
> paths. I've pushed a fix.

thanks works well now :)

>
> Cheers,
>
> Richard
>
>


