Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh5rN-0005OY-2n
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 18:35:21 +0100
Received: by yx-out-1718.google.com with SMTP id 36so1106662yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=L2sEJ4HInOVo0AwMkosTonXkmP71HW78i1qhwEZz+RY=;
	b=D7hCb0xdsJyOT3vGiCftzWXx2EKwwOnE6IZNobDbhQqQTNop1fFPg0wdZ5GHKpsYJw
	EF4ihsMZntfPHe9zuBVhdbcR4acMaOq2FAR8K5LCFAcqH1J3d2G0ZDLKmW/w2HtBGwCX
	klLjL7SzsAleo6raBNc4RP/xGWwJesptwqA3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=H6yQREdL+O99yHYC9+He9okufPGhFkOypb4cCdLWEYEd9KvicwRcHRNvykgK3oTrwX
	aaL7SjrUyTgpfHgalYT9l0I20eDd+efZ0pRbi7x8olIETsQt6pDnjBU92nMRID9lLwOn
	eA8/KzOe2kxujca54XpU23ypAQrUPCUs5Dr3A=
MIME-Version: 1.0
Received: by 10.143.12.20 with SMTP id p20mr3176501wfi.169.1236706519155; Tue, 
	10 Mar 2009 10:35:19 -0700 (PDT)
In-Reply-To: <1236699601.29394.99.camel@cheeto.emacinc.com>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
Date: Tue, 10 Mar 2009 10:35:19 -0700
Message-ID: <19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Travis Stratman <tstratman@emacinc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Tue, 10 Mar 2009 17:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 10, 2009 at 8:40 AM, Travis Stratman <tstratman@emacinc.com> wrote:
> Thanks Khem.
>
> On Mon, 2009-03-09 at 15:35 -0700, Khem Raj wrote:
>> On Mon, Mar 9, 2009 at 3:18 PM, Travis Stratman <tstratman@emacinc.com> wrote:
>
>> snip
>>
>> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
>> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
>> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
>>
>> Can you try by removing above three
>>
>> Rest of the changes seems like should not have effect.
>
> This doesn't seem to change anything. I made the changes, cleaned all
> glibc and gcc packages, then tried to build and I still get the same
> issue.
>
> Any other ideas?

Hmm looking closely it seems that your cross compiler is from
i686-linux -> i686-linux which is native configuration and intl
configury  is then trying to use
your freshly built CC instead of the BUILD_CC. In short its not really
thinking if it is cross compiling. I have a x86_64 box thats why it
worked for me because I am cross'ing from x86_64-linux to i686-linux

I will give it a shot on x86 box too. Meanwhile can you also define
TARGET_VENDOR = "something" for your distr and rebuild


Thx

-Khem


