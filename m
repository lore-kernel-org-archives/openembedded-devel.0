Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id E1A777F7C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 14:15:46 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id d5so23509119ljl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 06:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=pSi5XDohncQgciTrHKt7ftb1ObvOiTMVJqsn7lFZbNU=;
	b=m9rGGDYXiq7ev0h8bK8ll5UNKSZsm8DHO/B94HcR1c5EjVradGMNnAzg5SUVW5LNHR
	fN9QyvxUd269QDiTPFMqP/r2k6S4LSEvhvC/+r9PMKPj2r1RQHT7NfNUVb/OPngWTFMz
	uPoh87lAEMmXALE5/L95MJfoshfX5QJdrx2TGPiQOrWUoXYLkQFDB4IL+jGsouaUwOio
	YAMlsneb/eOuOM+Q/lO/9keWxXvXooltgikosle7Ar/dwxuRqPTbtjHgCQClPJp0HqDB
	u0lGS6c5Jv+PFfHLNnulk6/ml3bqykFhORi1IXXJ59DnVlkxJfKDmHcHlFWsu4WR88HM
	Z5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=pSi5XDohncQgciTrHKt7ftb1ObvOiTMVJqsn7lFZbNU=;
	b=JvhsZEas6UPr1SuHryrAT6tfU56XDtCg3ZAZ+JslmWucBciEDZf1qfWGKyVSWz9TeA
	kwRTKZ5HEyctfeRB+IxbM+Z+NnFJVZHu4RYWWi+15S91qYT8ZIyqRKzp+88GwEyznHzL
	hBsp5OvIz+Kwlbws7kr+G3NPxLYbDhf1s3v3NdCTVJT3kwqdJ3L/sDqUNigLcE+ktj4j
	TA9op9inc0o4oDBTynVlqq7kdc2Gr1N6K+epgZTE9oRaJUtgisAeZXT0iMtdzbTy3zkY
	JUBr6FuYnlPdOqRjmvsITB5kyKs+m6e1jZdwpFTNf5RBNinTOmYC4AX/arUbcDBcN2+u
	nLeA==
X-Gm-Message-State: APjAAAVeycH1NlKt/xyyot1CVbn7GBXu4v5+a3RGSTB7FkK0B5umW/R9
	5/xMZek93Da+CHtCmfGES5vHnx6nmGdb8IxpswQ2Fw==
X-Google-Smtp-Source: APXvYqzF9k+LIPadY6v9WZ21sXr3eUi2QxpMvvow2nHhLG6hKokWR+u8IKK9tKxK7gt3WBfTbm9jIADAG/LKLdUaFnI=
X-Received: by 2002:a2e:575c:: with SMTP id r28mr4040481ljd.245.1574172946903; 
	Tue, 19 Nov 2019 06:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20191119121609.19869-1-nick83ola@gmail.com>
	<1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
	<CABPh3UORbPCPd55aGFBO2WwfN0gGdaZHZk2Ei1jPu+PqUyV-UA@mail.gmail.com>
	<CABPh3UMNoSXmW1FFtvM_j=w1L5Pq7==qg-jfgCAAKyPcsasGVg@mail.gmail.com>
	<0ce7b7c9-2965-1587-0530-acbb9f57fe92@intel.com>
In-Reply-To: <0ce7b7c9-2965-1587-0530-acbb9f57fe92@intel.com>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 19 Nov 2019 14:15:35 +0000
Message-ID: <CABPh3UNr0YaMyuuthCWQWrohnJm=XsEnGBMqYxB5MHg4JbW-PA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 14:15:47 -0000
Content-Type: text/plain; charset="UTF-8"

Forwarded

---------- Forwarded message ---------
From: Ross Burton <ross.burton@intel.com>
Date: Tue, 19 Nov 2019 at 13:46
Subject: Re: [oe] [meta-python][PATCH] python3-importlib-metadata: fix
class-target overriding default dependencies
To: nick83ola <nick83ola@gmail.com>


On 19/11/2019 13:35, nick83ola wrote:
> Hi Ross,
>
> no the patch is right
>
> If I do:
> bitbake python3-importlib-metadata-native
>
> Loading cache: 100%
>
|##########################################################################################################################################################################################################|

> Time: 0:00:01
> Loaded 4359 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'python3-misc-native' (but
> virtual:native:/yocto/meta-openembedded/recipes-devtools/python/
python3-importlib-metadata_0.23.bb
> <http://python3-importlib-metadata_0.23.bb> RDEPENDS on or otherwise
> requires it)
> NOTE: Runtime target 'python3-misc-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-misc-native']
> ERROR: Required build target 'python3-importlib-metadata-native' has no
> buildable providers.
> Missing or unbuildable dependency chain was:
> ['python3-importlib-metadata-native', 'python3-misc-native']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit
code.
>
> There's a way to provide ${PYTHON_PN}-misc-native?

Looks like a bug in python3.bb, the block of code starting '# First set
RPROVIDES for -native case' should add python3-misc-native explicitly as
that package isn't in the manifest.

A better fix would be to remove the misc package from the recipe itself
and define it entirely in the manifest file so it is no longer 'special'.

Ross

