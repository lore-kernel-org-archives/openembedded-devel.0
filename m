Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P7ld3-0006jU-TD
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 11:03:38 +0200
Received: by iwn2 with SMTP id 2so962666iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XYL8meJTJYSXhKLWckh9d2pBl8u5jYcmx+6tKZgevY0=;
	b=lol0CBd35FuOPLxseu9wwWe6Z9HLJP2GWWjmh7SDMVe66zJdGn3aUMi3lBN7gD/JjC
	szn6NUSo7IfqUFxCEHUkw8Y7pOOYtrLdi6AcErpJMhfv0wHSvhEQVn1QVhOwTIb7rc6y
	R/uYXiSo9KBQITS6L8knYENiZun3e5vas/b3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OyRZRp2QlsnlauiBao0rFlzDr4GrXEHmrVv4g5UETN7QlaqAyAWkFTUKNCA60vUvq0
	FYVcH2sQrcYTEvQ1WRu1IBd+uN72gu9rcJR24eukTIhEgv/tgeOnMnMYPA4SuNmi46Hh
	2BZbrB21wNEa5MCtMTdGuLPaK5dLn4hcdqH54=
MIME-Version: 1.0
Received: by 10.231.169.149 with SMTP id z21mr3016958iby.11.1287392583679;
	Mon, 18 Oct 2010 02:03:03 -0700 (PDT)
Received: by 10.231.162.68 with HTTP; Mon, 18 Oct 2010 02:03:03 -0700 (PDT)
In-Reply-To: <AANLkTimBs3B9i4hWe4TR-YPVrz9tjWXNqoWDoVWEfuZy@mail.gmail.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
	<AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
	<AANLkTimJLCis3ZhSs0Bqj=aY6hX3pXhPLJAj55uX8tdQ@mail.gmail.com>
	<AANLkTimBs3B9i4hWe4TR-YPVrz9tjWXNqoWDoVWEfuZy@mail.gmail.com>
Date: Mon, 18 Oct 2010 19:33:03 +1030
Message-ID: <AANLkTin6c2UaSjGf3yOcvDwVWjSi5nN+jv3ODSODVqYB@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 09:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 18 October 2010 18:13, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/18 Graham Gower <graham.gower@gmail.com>:
>>>> On Fri, Oct 8, 2010 at 6:34 AM, Michael Smith <msmith@cbnco.com> wrote=
:
>>>>
>>>>> Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
>>>>> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.
>>
>> I expect this problem could be fixed by adding an extra line, e.g.
>> os.system('cp -pPR %s/.??* %s/' % (dest, dvar))
>>
>> -Graham
>
> Do you mean as an addition to the copytree, or as an addition to the old =
code?

I meant as an addition if/when the commit is reverted.


> Seems adding an additional os.system kind-a beats using the
> shutil.copytree as we then still have the os.system to do the cp
> I guess the best way forward is to revert the patch and extend the
> os.system call with your patter.
> E.g. something like:
> - =A0 =A0 =A0 os.system('cp -pPR %s/* %s/' % (dest, dvar))
> + =A0 =A0 =A0 os.system('cp -pPR %s/* %s/.??* %s/' % (dest, dest, dvar))
>
> cp may have mutliple sources if the output is a dir.

Beautiful. I would give such a thing my ack.

-Graham


