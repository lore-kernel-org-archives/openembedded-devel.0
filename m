Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id A43916EE32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 19:11:32 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id w8so1244571qac.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4AVk2jnMWs8f4tfjsAvy2USE3GpeJbuxqR6cz69LkQk=;
	b=XFnkMv6l/aNvfX+GE4L4daepTNIg9hHF5TupPSNHccCY+CO8RHOmxOB5uPaZAFeavt
	PnA2IN/dfjUSEjr+YFt1AapSEKiKOOB5QvH52+UQSn21bdlSC8kazh6pBMzjKS5YHyya
	28u1m3V12tXrdp0Iwz+44JxDH17QS9szh1HIjKbXvBB0rgBbU2EoRzQHQf3Karu3pE90
	FGI7lS1l6vbGQu2Fr8NhYQIoFmr78IS8Ztof6gdQMeW3jG1m5dfyAgEu5xRj248MMaie
	WWUyfwZpjDYQy3nr5VTLOFqk0l23Jle7HaHYED9iBg/Vk8H5nexNAFokle4pzr9fjEco
	rS6g==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr5492622yhc.47.1392837093283;
	Wed, 19 Feb 2014 11:11:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Wed, 19 Feb 2014 11:11:32 -0800 (PST)
In-Reply-To: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 19 Feb 2014 16:11:32 -0300
X-Google-Sender-Auth: _olwMNMsdu2MvTapSFSfsJ9IGfs
Message-ID: <CAP9ODKo96otJprbv_3OboT4WpiKUdXJdyKdkt6ppJK3aC+kzDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Wed, 19 Feb 2014 19:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 19, 2014 at 12:22 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> When looking for Qt5 components and files we ought to use the Qt5
> specific path. In case the distribution wants to have a flat tree it
> can set QT_DIR_NAME and it will still works as expected.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> I have built two image and the SDK from scratch using this with no
> issues. Could someone also give this a try?

Today I rebuilt 5.2.1 image and SDK in two build machines (one Debian
Sid and another Debian 7.4 based) and both succeed.

Did someone try this one?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

