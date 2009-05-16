Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M5KZQ-00064u-Ry
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 16:09:00 +0200
Received: by fxm20 with SMTP id 20so2423211fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2009 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IOqQlrAmxjG5LpsqrNk1wQnBQsSdL/btSu1YBtAjIw8=;
	b=UItcs+C5BdDPg8vIunu19RF1Nag8BsVmE1g5paGl1CqtPPxVLdhTYE6Ta5z+Qq8mBJ
	OWg1ZlN8es4Qn2U4FQhj7niwzkP0Pf7tj4Uwq2IYKacbmQKZYed8iRhHVlbLrLxzad+J
	rVNKLrvPcafpKILXkAIPflVdfj8b3bTvNs+os=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RmuLGlDlIl69r7g+rwI8KlPrSSDrjYQ0N6qdvuDzd/AmDtUEQB0CqVK2KYZu7nINIK
	PgLZzfUp7QKg8GDQB1fc05GCIylTsUX8ID70QaEW6KCjAeMAGoPYRD+G4pU+u4vmB5Bc
	jHbVYddA7hioMkqkxsG+L7R6kdfVr8nxc42Mo=
MIME-Version: 1.0
Received: by 10.103.169.18 with SMTP id w18mr2964272muo.101.1242482515567; 
	Sat, 16 May 2009 07:01:55 -0700 (PDT)
In-Reply-To: <gumflk$t6s$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<gulv2v$l9r$1@ger.gmane.org> <gumflk$t6s$1@ger.gmane.org>
Date: Sat, 16 May 2009 17:01:55 +0300
Message-ID: <fce2a370905160701x2174189fq6073c53cc59331d5@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: what not to do in a recipe (was: Kernel modules)
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
X-List-Received-Date: Sat, 16 May 2009 14:09:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2009 at 4:38 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
> Koen Kooi wrote:
>>
>> And it can't be said enough:
>>
>> NEVER use rdepends to drag in kernelmodules, use rrecommends instead
>
> Thank you for pointing this out. =C2=A0I was unaware of it and thought it=
 would
> be a good idea to document such common mistakes in the wiki.
>
> http://wiki.openembedded.net/index.php/Common_mistakes_in_a_recipe
>
> Please add any other FMM (frequently made mistake). =C2=A0To keep the lis=
t
> readable, let's focus on mistakes that lead to serious problems.

Maybe some code snippets will be good - for every mistake.

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


