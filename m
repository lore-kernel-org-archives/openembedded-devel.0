Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id CA73260043
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:07:16 +0000 (UTC)
Received: by iofh134 with SMTP id h134so27941810iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=yKob46vrCCryS4SUUJN4EdXrdNXRedAJT2kfhCEcSzg=;
	b=ZcAFq5hG1xURTdn02CyQa80UQZNO4TGqLR4qgEvy18g1Jttysk9/y0fvel36W7GY6g
	qi1gJLlkclysJcGSLTh/DM8qzE5Vvk2OUnvKtoWdWtRwcQdzUYgpcsg3l9Sv8+cQBtC8
	vuynvUI7XGc96eqaZLjtqjxC9fCMoBtZw7rGUp8qtX8mPNOcK/3+KLL9TYjr1ksMeyTN
	a08xN1rWgcA0VgJPo1NQJdA2STJn7KBAudhnF0T2j8NOZk6Cjl9ToC3l2ZdBV11vIkj1
	Pxo6ybwHMJsp9KjPoYeUDFRn4vS66Wtpw54RUf9po1/LW9KmPeA+92+YGzC67vNZATUu
	fW5w==
X-Gm-Message-State: ALoCoQl4dHEEF5c2xi92CRUfnY1l3VKr1ATghB+QFKG9SAQCCettdIdFGeVXwc3hDH6mcKc6Gs8d
X-Received: by 10.107.17.68 with SMTP id z65mr42337707ioi.97.1441213636403;
	Wed, 02 Sep 2015 10:07:16 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id f1sm9787247ioe.6.2015.09.02.10.07.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 10:07:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so27761772ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:07:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.14.145 with SMTP id 139mr33245137ioo.37.1441213635321;
	Wed, 02 Sep 2015 10:07:15 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 10:07:15 -0700 (PDT)
In-Reply-To: <aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
Date: Wed, 2 Sep 2015 14:07:15 -0300
Message-ID: <CAP9ODKoUVXp5MuOiTTiYQfkWzWjU=wf7dKVpNnBJW2KNudZZyA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 05/11] qt5: disable debian auto renaming
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
X-List-Received-Date: Wed, 02 Sep 2015 17:07:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 8:43 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> Some of the Qt modules have multiple libs, which prevents debian auto
> renaming to work correctly. Instead of only having some modules renamed,
> disable renaming for all Qt module packages, so that all they all are
> named as ${PN}.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>

I think you could rework this to use a python function to set it for
all the packages and ease long term maintenance.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

