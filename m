Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OstQe-0003Gq-8H
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 10:21:22 +0200
Received: by wwi14 with SMTP id 14so4948489wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zAhOpc1sizAnLb7J3OuyoYJshBnvRW1yqkbBED15Hd0=;
	b=koF962bB+aNBfY5GFUZgdbxsYfgPfy7O20n4AKLB5VwBADFmu7JbkvEYYKLbfJbUvW
	/1155NtFDlOPOrsULwUD10f5MSuv5hLYFiOJrcM/y4CgSFssM2SQHxF65YbOwObamPUJ
	UGvdusO6aJ3aHL1yln+/R+pGvgZeViVenDC70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FS4Spt7RtkV9OQeB1F3VwbOIYPDc/PZSLo2px0D6MXoUJkYhVJnZxsDsLVk9tWf59W
	n4d+hnZoBt9J7SsUcqlu9976DFH7oCq0SXkxnQBeijtPb49FQqCmCPVy+6IVIX17XzoH
	6OcnEXUe9xUiRmBbABI1FTaFq10VBynHQcnbg=
MIME-Version: 1.0
Received: by 10.216.49.212 with SMTP id x62mr4709698web.55.1283847633687; Tue,
	07 Sep 2010 01:20:33 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Tue, 7 Sep 2010 01:20:33 -0700 (PDT)
In-Reply-To: <AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
Date: Tue, 7 Sep 2010 01:20:33 -0700
Message-ID: <AANLkTim=6VYZbRWMywNMyU9=C+0ekanpoy_fCEKBBqJJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Tue, 07 Sep 2010 08:21:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 10:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 6, 2010 at 3:21 PM, Steve Sakoman <sakoman@gmail.com> wrote:
>> Using current top of tree to build some of my images I noticed that
>> quite a few apps seems to be broken at run time (Firefox, Epiphany,
>> Gnome-mplayer, and others).
>>
>> All were complaining about libstdc++6 being missing. =A0Manually
>> installing the libstdc++6 package fixed the issue.
>>
>> Any idea what changed that introduced this issue?
>
> Yes I have been seeing that and spent not so much time on the real cause
> but it seems that the depends get lost when we rename the pkgs in debian =
way
> may be thats not the real cause I dont know yet. but that something to lo=
ok at
> even libstdc++-dev ipks miss to have dependencies on libstdc++
>

building hal 0.5.14 is one example that gives off the libgcc that I
mentioned with this one. Though there are many that give both errors
or one or the other.

JL
>>
>> Steve
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


