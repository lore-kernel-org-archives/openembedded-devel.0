Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ORCKx-0003Vl-SC
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 00:53:02 +0200
Received: by gxk19 with SMTP id 19so2512622gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=dDCD53dg3mwuVm0vXUBn9ool6DMFhjDGgBJIatyJ6qE=;
	b=MpldrgNBYrNvCN7ChtDkDXr6AwEwG84q2DYdHVOKVR36qxJH7VFWX9va3jKXLSbBvp
	EHEvwxAKbnGr3BUSUk3ug4j5g/MFZ5HcYlK2Tbm4+IFm/hHYJQLHyArtzfeG8WQBhytB
	yTXFJfXkAIoX2uS5aDqvJ2QJcjNESkcgHGiMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=DgORhn14VUURIBuCBd7mxEPiXKrfOeXZKScAF4+vt8lcM72Jqk/4/+JdDZ3GU6Fz1y
	uqTTGmpIfRPU5k/4XUhs4CymdFAFrx4wAnV3JEEuTxsR2GezAbil+vb9AML7x4twFZ7g
	Is1B56fFHn9H6BBVWvtzdrxhQ+0e17Y6KyTnI=
Received: by 10.229.181.143 with SMTP id by15mr3671706qcb.248.1277246903238; 
	Tue, 22 Jun 2010 15:48:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Tue, 22 Jun 2010 15:48:03 -0700 (PDT)
In-Reply-To: <4C213A4F.9070705@mentor.com>
References: <4C213A4F.9070705@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 22 Jun 2010 15:48:03 -0700
X-Google-Sender-Auth: eSNCLSz4iaxJ5v4Fr9rumma-tMY
Message-ID: <AANLkTikNaGcPjYH6Awat-ZgoMOFRzSM41MX2tOv-STMz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH, RFC] Link with $ORIGIN, mangle only when that's too 	hard, get it all
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
X-List-Received-Date: Tue, 22 Jun 2010 22:53:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 22, 2010 at 3:33 PM, Tom Rini <tom_rini@mentor.com> wrote:

> The following changes relocatable.bbclass to an always for native (and
> disabled for cross) to an opt-in for hard to get right recipes.
>
> With this, cross / native things like with $ORIGIN directly, for the common
> case.  We do this as an in addition to so that programs that run before
> install still work fine.  In addition doing this makes sure that the initial
> RPATH will be long enough, even in the cross case, that we can patch in a
> correct $ORIGIN[1].
>
> Advantages? Less tasks, one less must have host utility (*cough*3rd party
> yum repos*cough*).  Having an exists but not right second known part of
> RPATH ensures cross recipes are now chrpath/patchelf patchable and gets us
> one step closer to pstaging being relocatable (will have to run some tests
> to look at the last corner cases).  Disadvantages? One "ugly" escape
> sequence in bitbake.conf.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>


Looks like a definite improvement to me.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

