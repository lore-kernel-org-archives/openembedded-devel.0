Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REoeK-0000F6-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 22:46:36 +0200
Received: by pzk33 with SMTP id 33so2201641pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=PKrJLD0H870egyAzIORCQ8Psl3xXwqvg/Y15MGfb+DU=;
	b=kkH0RLWxTLJe8RWfQaEpSU8rVh59ZVi4QhyH23NWBEObhdgo87k0bBi6XXm430YnLn
	By5i6PRBCoQ8vItNqZGProH5mx8QXgOxG4bK1nvWAgoj6gz0vpANeGoeL+rKvPFvuWYr
	oxjs8m03Uq1hcwilcw337tnsOLwdXf0WwWpn4=
Received: by 10.68.74.4 with SMTP id p4mr19024490pbv.47.1318624850062; Fri, 14
	Oct 2011 13:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 13:40:20 -0700 (PDT)
In-Reply-To: <20111014055842.GM26170@denix.org>
References: <1318535732-16028-1-git-send-email-denis@denix.org>
	<CAMKF1sqaW3169pRDurhA+G+fD86Et0BFvf_j4zZBt2_1oOwUKQ@mail.gmail.com>
	<20111014055842.GM26170@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 13:40:20 -0700
Message-ID: <CAMKF1sqCJV8rV7-jB1-HVMbgT1U6zXdxxKVjzuJ+P0Azp8Rbtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ltp-ddt: import initial version 0.0.4 plus fixes
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
X-List-Received-Date: Fri, 14 Oct 2011 20:46:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 10:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 13, 2011 at 05:10:24PM -0700, Khem Raj wrote:
>> On Thu, Oct 13, 2011 at 12:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > +
>> > +TARGET_CC_ARCH += "${LDFLAGS}"
>> > +
>>
>> why is this needed ?
>
> In Classic OE it was used to pass global LDFLAGS with things like GNU_HASH and
> optimizations down to the app's build command, so all the QA checks are in
> balance :) Not sure if it's still needed with oe-core/meta-oe...
>

It would be nice to test it if it still is needed.
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


