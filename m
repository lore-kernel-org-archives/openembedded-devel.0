Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 533636FCE6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 01:47:52 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id q200so1603727ykb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 18:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=OwrO1y5jRWzfVtuQ6S1uQCkgn3WzzQsKX7W7GmZ2R2w=;
	b=DP/nrS7SvhcxNvfs0shccZ4A4pm6oMXB0ZaL6NaARILAV+T7lQwEYLqSmQoqoxkOId
	yBO/lHyAPe2/4eaHEWQ9H6RaRZbA8+lypoXao83gkfZnsZAH91bUpd1/Ww+jVCOqiduH
	zLJTX5kSGuQorj0zwwXjyBDzIBVDSSHP2apZ33CjaPZ0c83zlocqMHRPU91bSBOQQUEW
	LLjzaDBRPLiERFvxl5tFDKgUOj6RYByGMVae00YWz3t00SDS/pqYoNP9VSDW7p3T81em
	umPOwSk14BdFqQ304DsxMZ4b4oMVlZXx4gyjDe+ZhyDnLVQzyCELVGZ2wYueZGdcD5D0
	tgHA==
MIME-Version: 1.0
X-Received: by 10.236.160.67 with SMTP id t43mr21590675yhk.11.1402624073410;
	Thu, 12 Jun 2014 18:47:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 12 Jun 2014 18:47:53 -0700 (PDT)
In-Reply-To: <1402601947-20352-1-git-send-email-Martin.Jansa@gmail.com>
References: <1402601947-20352-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 12 Jun 2014 22:47:53 -0300
X-Google-Sender-Auth: 473-cZaZ1O5ubEzSuOFplnwPPxs
Message-ID: <CAP9ODKrYUswW5mVrcnu0EygzVR-hk1wzfHkNP6_G=OhF=kUx5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwayland: respect OE_QMAKE_PATH_QT_HEADERS and use QT_VERSION variable
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
X-List-Received-Date: Fri, 13 Jun 2014 01:47:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 12, 2014 at 4:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * QT_VERSION allows to use 5.3.1 e.g. when overriding SRCREV
> * ${includedir}/${QT_DIR_NAME} is the default value of OE_QMAKE_PATH_QT_HEADERS, but
>   when it's changed by user we should respect it here
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

