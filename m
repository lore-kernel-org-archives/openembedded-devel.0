Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 684C86FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 16:01:39 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l9so25298005wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rebyKVJOri3+sbh+GycPCOPWuQpnHG6c2eCqvrn+Iqg=;
	b=eDPs1h+X3XRFKncb5rdVVdKAJQG2+pxCjbC9h+xGx5E6DVxv0GS9n5/NTha7xzSGL5
	HNVrhibCv7jtck2YBaz+XlvTjA4fD1OPfs+nbeyiOZtXwGV2iC1GMckLlxxXz77VVOuQ
	pE+FY2E0FnHcIXmkccsKhh51vFACz93oboO3LryqH1KwqdWW0WF5swt2GVFlXKnsvnp2
	WZhUJxvCfiWP3WOY5h3LpF/zDZK7AJNAV8GsEGFb04Vxo2qEo3GVyYAvl+3b6EopDp9M
	ym0wZdaGm1IBm0b+aWoKLmU1PbCFY9NGt+TlRA4pwg4xmpTVOb6xkcRrjqNl0Keeeu+r
	GEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rebyKVJOri3+sbh+GycPCOPWuQpnHG6c2eCqvrn+Iqg=;
	b=HTTNQHn3yv2sxb2+gLTfYNfqK0C1t39oEfBNFtwjS60LRUYYIaWjclCrN4sVBGZ40G
	zlr/2OPVYwFPhIZOSzUIis/0aoT0tsqdUwZiM+GBa8z7//UVdYQGM3SypsOHCYdiELKA
	fW43adlpJIRyME74L10ytuYrUia3+Xkxkp6vaK5MovqkekPRBONZv1rI2XPM1uXqhWD/
	oB2lB7SWCy261z6SUsaDMfq0rPpYFO4Mj8qyP6aOSp9FERXcEYmVy08FJGzvLdsWYsR3
	PL1T3418bJZkyKWCw2LY6xsuUrseGK/aomdwwK7zSsqhxAGuTd8pH8xBqIcZwjz6dKQs
	4SDg==
X-Gm-Message-State: AODbwcA5vARBUvavjwppmm11SiTxR21wNDFR+aeEnVjMRdMM+Lk1w0H3
	Np+RnRe3XcLw67mGWOZlAoeygh6ExA==
X-Received: by 10.80.169.193 with SMTP id n59mr1376394edc.127.1494518500793;
	Thu, 11 May 2017 09:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Thu, 11 May 2017 09:01:10 -0700 (PDT)
In-Reply-To: <1494491430-22799-1-git-send-email-pascal.bach@siemens.com>
References: <1494491430-22799-1-git-send-email-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 May 2017 09:01:10 -0700
Message-ID: <CAMKF1spARN8qNTBUXu0EiQj=mkG-HRtXwCr8yWrJNnmMoHqH3Q@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: update to 3.3.0
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
X-List-Received-Date: Thu, 11 May 2017 16:01:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 11, 2017 at 1:30 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> -inherit autotools
> +inherit autotools-brokensep

this is backwards, can we see what broke out of tree build ?

