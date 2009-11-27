Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NE4IY-0005uM-HW
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 18:08:01 +0100
Received: by fxm8 with SMTP id 8so1554531fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=4/SA+sOwHdRXX4jZehBVxIrT1VCXoAPmXJ2PfCGmWKk=;
	b=ltqGW/KqnTSq2dFomqFmxQtczzGkRgnAUN4xVOpATLVjnQcsEt5KsKy2VLKF8lz8Jk
	zcT+NqnnzP4UMwBp0I1tP06DA8VsjvKwYnoqsb9L/bRbJR/8QkHWTUIiB2dG4bVGpLm+
	b6ZeHIZKgTdu0iLl3D2pK1wYPp3uWvSstdR+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=Ex8kFZwKa8283fx9ACPG53nuw/Mcn2T2CQTI3uw+BYQC3iyZVyoVyzwTHexVLHo3AM
	ocxQ16mcT2i+ByMckktg6+sEC6FZvxUDWTn3cAD4pt35eq4VCG3FQQ5QZ0fM9747Sbdh
	qgt1eVi5q8PJyZnuy3WgXK5rSRjDnpe1c9GZ0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.215 with SMTP id u23mr116544hbu.28.1259341587049; Fri, 
	27 Nov 2009 09:06:27 -0800 (PST)
In-Reply-To: <ae9c9a1c0911270825u37d60de9h260d9507b3d44eab@mail.gmail.com>
References: <ae9c9a1c0911261845m6a81efcblf372b4409fcc1185@mail.gmail.com>
	<be7a9f3d0911270248r3d2e75ffibe3cc71248d61a9e@mail.gmail.com>
	<ae9c9a1c0911270825u37d60de9h260d9507b3d44eab@mail.gmail.com>
Date: Fri, 27 Nov 2009 15:06:26 -0200
X-Google-Sender-Auth: 5793215da5ba36ad
Message-ID: <be7a9f3d0911270906lc65be18vd9f42786068ecb9b@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mamona: classes and configs for fist review
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
X-List-Received-Date: Fri, 27 Nov 2009 17:08:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 27, 2009 at 2:25 PM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> On Fri, Nov 27, 2009 at 7:48 AM, Otavio Salvador
>> The changes looks good to me at least. One thing that I'd interesting
>> to know is how are you using the PRODUCT setting and what use cases
>> you've been solving with it.
>
> Cool, thanks for reviewing it.

No problem; you're welcome.

> The PRODUCT override came with the need of using Mamona with a common
> machine but for different purposes. Instead of maintaining different
> trees, we decided to create the concept of a product and define there
> the preferred version and providers for different packages.
>
> With this we could work with both "products" at the same tree, just
> using the overrides at the product file to define the best behavior
> for that machine.

I see.

> One single example we had was regarding the legal check phase of a
> product, that we knew that some version of some packages was already
> approved, when at the same moment newer versions weren't (so with
> another product that we just started we could use the newer version,
> but for the older one we had keep the same old version, because was
> close to be finished).
>
>> The only cosmetic thing that you might change is to reorder the patch
>> that introduces PRODUCT in bitbake.conf and the distro change to allow
>> for easier understanding of where it come from.
>
> Ok, will change that. Will also change the commit message to explain
> that the idea came from mamona.

Well but it looks like that to it properly work you need to use one
$TMPDIR for each "product" otherwise if this product has a patch (or
requires one) and the package is already built it won't get it.

Am I missing anything?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


