Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id DD6F06116C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:10:14 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so4396171qaq.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8Gh74sXQ/cGQ/dVgR0xFT0cbR+7zqpha5t9hZEz25k4=;
	b=tOuos4wmc77nVGQh8maisZJv3jvMImzjAr/MznWK2BcVLaFYr5b4wnsbopAVR8zRnP
	003vyiNYznu8DUydqDE9zWAglGbb4QFk++C+hMtjZDd4gkrZisy4N+gyvo+KsLeNczqj
	8H49ZLfbBggq/U8k7SlCgCrK7Qwobl2IHvS6yNftQ5LDbu29++UaV0WW88MUIyNHWVcg
	64FRbdNC4e+iUiz2oTmgkJG4FWdFGAMeEYDNdLmINfpn4hcERG9UdwS3yBdacoweNghD
	Ixh2QyKSKsLNySR1TA0/VtYcED59VQmeQ5nSPHA1f4YTUvv23y2/59sM+ytEyc01KILz
	yOMw==
X-Received: by 10.140.21.85 with SMTP id 79mr19257953qgk.69.1411647015821;
	Thu, 25 Sep 2014 05:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Thu, 25 Sep 2014 05:09:55 -0700 (PDT)
In-Reply-To: <CADJ8CoP_ODn_sjTOS6PhTMU5527GymiDXJ+0bAw3SSYQCMui4w@mail.gmail.com>
References: <CADJ8CoP_ODn_sjTOS6PhTMU5527GymiDXJ+0bAw3SSYQCMui4w@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 25 Sep 2014 09:09:55 -0300
Message-ID: <CAMCfZKGKWManTPVUPpMOF3UQKUnhBzPir9i0mmG4czr6Fsbf3A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How to configure Qt5 for Beaglebone Black
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Sep 2014 12:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Amey,

On Wed, Sep 24, 2014 at 1:45 PM, Amey Patil <amey.patil@sjsu.edu> wrote:

> Hi all,
>
> Searched a lot online.
> Didn't find any working source for configuring Qt5 for Beaglebone Black.
> Can you help me with same.
>
> Thanks in advance.
>

Basically you have to add meta-qt5 layer on your build setup.
If you want to use hardware graphics acceleration you have to use meta-ti
instead of meta-yocto-bsp and configure qt-base to use gles2.

You can test qt5 installation with cinematicexperience application.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

