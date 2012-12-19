Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlKXQ-0001qK-0U
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 15:22:25 +0100
Received: by mail-oa0-f45.google.com with SMTP id i18so2071561oag.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 06:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=d4ArXwY2MsX9w1uonFisYfOiSLWjcu3BeNkVY2eD60c=;
	b=xJ1szQ763jUpEQYAGkGbisQMkbHvg6RMRt8X+r5WcIgITIaz8ELqXfQZDX9kwnqGBS
	sXUC0cKuhdzIN7IdFZvcL0p5YuiyxNQMQewB7tvLpCUn09bENz4eSmNQ+xvhHnweMk+/
	kBSitl01iL5BDnbG/LqjcBzUq7i7pCURzcEHuzbdUJUzTzqOtrZ9Bwt4NVbn5K2ROgmg
	RRd/xKf/qX/b4Ovzh0EeqOWwHDwnSLWMFXocGq6RD15P7jLXDIvvOX6C/Umv/v96WCbw
	VmLtWBkp83tkjTogtPwStNvrh8R4y/uIA+rqV0LtzrOrf2yq55d0vkxxtHY1692J2+VW
	PhEw==
MIME-Version: 1.0
Received: by 10.60.10.230 with SMTP id l6mr4898474oeb.94.1355926060325; Wed,
	19 Dec 2012 06:07:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Wed, 19 Dec 2012 06:07:40 -0800 (PST)
In-Reply-To: <20121219134033.GD3525@jama.palm1.palmone.com>
References: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
	<20121219134033.GD3525@jama.palm1.palmone.com>
Date: Wed, 19 Dec 2012 12:07:40 -0200
X-Google-Sender-Auth: ZqdfxhaTIrMsjINc7hhFI3tDJqs
Message-ID: <CAP9ODKoSQrBs2iu+dqdCe03Xju=NfB=Xqy0ddN+r3GesZSkvVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] openmotif: Update SRC_URI and add libxft in depends
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
X-List-Received-Date: Wed, 19 Dec 2012 14:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 19, 2012 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Dec 18, 2012 at 07:15:56PM -0200, Otavio Salvador wrote:
>> The file couldn't be found in the official repository and it seems
>> unmaintained as it had processing errors when trying to register to be
>> able to download the last release. Researching in the web a mirror has
>> been found and than we're using now this mirror so fetch works again.
>>
>> During build test, from a clean tmp directory we found that libxft is
>> a hard dependency so we add it to depends list.
>
> Does not apply on master, because openmotif was removed:
> commit 14b68506078a4133e743491d35245775a58a1317
> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date:   Wed Nov 14 12:31:18 2012 +0100
>
>     openmotif: remove due to lack of libxp in repository
>
> Can you rebase on master and resubmit if still needed?

Yes I can but wouldn't be better to just revert the removal commit and
apply it? If you want I can prepare it in my tree.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


