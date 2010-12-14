Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSYQx-0006XX-Cw
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 18:13:03 +0100
Received: by yxd5 with SMTP id 5so498203yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZhWsngE1LqjOrNfVQxeN9nu1EoyLgqArRlgKfjyEclM=;
	b=L4tNXUwxyfgtMPA5uceNqJMrDyEMmO0Z+bR7x8gWdIinJlQ+tqTEfefsHzqPRrq+B6
	y0+5NwMdFVx3lOM0hBLCXF+AbUX9/pn01eTrwo/LA/u2eQx+m4xKlPy5wpm3aMKwOqeg
	CMEkgXl7tlwDmmOS+FMLBToXlS8UieBBbvfwc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LG4RQ/0UUXGPNd5+/60NtXmdd36QHtXXvy1ltf+IqoANNPpeHWv8kXPRBxG3F8sUIP
	G/2G4YD2b7I6oJOsPhvXKXWMLTD3iN6A7ZexclEPE1eViuRRJXzoPBMPckdTsXXxrKNL
	62dFXcFexkTi0wrFMvPCK96R5UiECVn4GHLVw=
Received: by 10.90.72.2 with SMTP id u2mr1673647aga.4.1292346686063; Tue, 14
	Dec 2010 09:11:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 14 Dec 2010 09:11:05 -0800 (PST)
In-Reply-To: <4D07A19D.8090602@mentor.com>
References: <4D065431.6080304@dell.com>
	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
	<4D079B88.9010503@dell.com> <4D07A19D.8090602@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Dec 2010 09:11:05 -0800
Message-ID: <AANLkTinBqEGcOWys5+C3y8bGo0AMEiiOa8QTfgTxOgQ-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Tue, 14 Dec 2010 17:13:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2010 at 8:55 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 12/14/2010 09:30 AM, Ryan D Phillips wrote:
>>
>> On 12/13/2010 2:00 PM, Khem Raj wrote:
>>>
>>> On Mon, Dec 13, 2010 at 9:13 AM, Ryan D Phillips
>>> <ryan_d_phillips@dell.com> wrote:
>>>>
>>>> SVN over HTTP is a more reliable transport for developers behind
>>>> restrictive
>>>> proxies.
>>>>
>>>
>>> and how much slower/faster is it when compared to svn protocol ?
>>>
>>
>> The speed depends on which subversion client backend someone is using.
>> HTTP will be slower than using the svn native protocol, but the serf
>> subversion backend will perform parallel fetches.
>>
>> I would like to see this patch get into the OE tree to make the tree
>> more robust to proxies. Currently, this is the only customization I need
>> for the projects I work on.
>
> Note that if you use a mirror site with the SVN checkout archive in it, y=
ou
> won't try and do the fetch at all. =C2=A0This may or may not be applicabl=
e to
> your case. =C2=A0For your case I think what we really want is a way to gl=
obally
> toggle the svn protocol argument.

yes that would be something more useful. I guess we could add it to
all SCM fetching recipes.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


