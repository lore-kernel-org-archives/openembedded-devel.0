Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1ROcgS-0003Us-Ra
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 23:01:21 +0100
Received: by ggnq4 with SMTP id q4so171214ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Nzhs1FOFGbNlD6RSy764uuvu/sfGtZ33RnKsoYR7ByI=;
	b=mtTM3xvojZFULE/0SekwRzZHGMtmHWPFZlygrBvdvHAxkdVxHhT40Y7KNwdm/quc+5
	hkaJ8vwqGm1RGrpcM7uJwJLJEaaS4hjwFEvaFhvdcn8fZLWuQunldQ1q/zEfr19Xwtwj
	PXipiMj2npWyP9JecZDQGzam7bNP6KZAyHD1Q=
MIME-Version: 1.0
Received: by 10.229.52.143 with SMTP id i15mr1498685qcg.188.1320962103337;
	Thu, 10 Nov 2011 13:55:03 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 10 Nov 2011 13:55:03 -0800 (PST)
In-Reply-To: <4EBC39EB.2060004@kernelconcepts.de>
References: <4EBC2FEF.5020405@kernelconcepts.de> <j9hc2l$b8u$3@dough.gmane.org>
	<4EBC39EB.2060004@kernelconcepts.de>
Date: Thu, 10 Nov 2011 14:55:03 -0700
Message-ID: <CA+M6bXmuTYrJ=_ALera0NnhrQyqZD+nUH64kv2g1z9eQfsptqg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Clean up omap3.inc
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
X-List-Received-Date: Thu, 10 Nov 2011 22:01:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 10, 2011 at 1:54 PM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> Hi Koen,
>
> Am 10.11.2011 21:27, schrieb Koen Kooi:
>> Wrong. You can do the following in your machine.conf:
>>
>> require omap3.inc
>>
>> EXTRA_IMAGEDEPENDS = "whatever"
>
> this is a workaround for a bad misconception. EXTRA_IMAGEDEPENDS could have been
> appended everywhere and this intrusive override might break quite a lot.
>
>> In OE classic, no. In meta-ti the cleanup is already underway.
>
> I do not care bout meta-ti, its is broken in OE classic.
>
>
> Removing this hardcoded dependency would not break anything. Only the board
> maintainers who want to get it built automatically would have to add it.

But, that's most of them today.

-- 
Tom


