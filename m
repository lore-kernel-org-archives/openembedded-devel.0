Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKO3W-0007Vg-Ju
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 05:31:07 +0100
Received: by wwb34 with SMTP id 34so318470wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 20:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VL9Hxdy2HwcDBKMDbxtIGI/dOQW0GB8brUKaN5SWCs0=;
	b=HEu5XF2FBxM0AsII1gI4VQLAyK8r0z5mwZ7PXO4Dgz7fsMgEOR8qVW97IFSoJUYaT1
	jSK/4peozXzWTXgzKf8Yub9NXqG/+UZnEhDB0pVwgpv1DNfsR2WNzLqWOLZx/8RlPx9C
	QuM0iNo5yyv9MFfUGGKv9j/H0xJO8sxMyFk/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kvThtqIBpRPCMn05dvROTWROz18uAygHbHF1LwV61rA2BmBs+HELgMvDtYL6Q5+uy/
	9KAWWeeb/g4wD28SJcHUNNUt1ECrYgijWqy6zsvU83LwmPQrd1GbvW0QykxLuRXl4ULq
	uYFUdh/9kyv1vfIol6+45H3l0kk6mTD+vSeBA=
MIME-Version: 1.0
Received: by 10.227.148.17 with SMTP id n17mr5222196wbv.223.1290400195132;
	Sun, 21 Nov 2010 20:29:55 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Sun, 21 Nov 2010 20:29:55 -0800 (PST)
In-Reply-To: <AANLkTi=QmXbVK2j4NBs6hV1q3OAjxrAE9R4Q5LCG+_Hx@mail.gmail.com>
References: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
	<1290248944-13342-2-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTi=QmXbVK2j4NBs6hV1q3OAjxrAE9R4Q5LCG+_Hx@mail.gmail.com>
Date: Mon, 22 Nov 2010 14:59:55 +1030
Message-ID: <AANLkTik6jKz4_632W=fHzeTGs0O1H47iY+KeEUJeiFyX@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] eglibc-package: move eglibc-dev to the end of PACKAGES var
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
X-List-Received-Date: Mon, 22 Nov 2010 04:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 November 2010 18:19, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Nov 20, 2010 at 2:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> * currently it picks too much stuff to eglibc-dev package
>> * update FILES_eglibc-extra-nss to include only .so files
>
> Looks ok.
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Fixes micro/micro-image for me.

Tested-by: Graham Gower <graham.gower@gmail.com>


