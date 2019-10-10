Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3676C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46plDF6RnGz2Y;
	Thu, 10 Oct 2019 10:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570697454;
	bh=iZlRrLjJcLW0NuZNsafUYkULZ4WR6cyHmVKX2JpRfOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1+r3a4cqEpeGtFS4LXWWBmmmAn/aYZ5w6XfbSx7VEyDqUwOtLBFC4Xy9t9ZWk8kT
	P8d2pZ/+sRGu0jIzwzkfccvh8ibEjl1ycBzX64puBkq+Wv4hQsiGOlaWOdFmcJfZDj
	pvy2COZxyh3yd/A81RF+iC26ozGnKC7X2PZVVM8K32PaDlxIRczE9auSO1AbHxXho+
	sLxxOedvjBuwr4xEsUyc0lI3l6TpW1Ho+6Cev5Yq6eTSUB65cPUMRz5jzQwppFEGNV
	bM9jM2UkMSZ2eVg/5XjXGlCFJdxyntRMcgPYqmUTwXuDF8T2zJnleLT1ffBwOwPqox
	WhBL7JsCoMfCGlECQVp03sCRMGOy7/xjeHORXcbMol/Nho7dkMejPvXisGMwnlvh7G
	OhRkbWZqO4d7Rh0PT9rEgX+c2V264nAiEYOoq+MQSfbXy8jBG2Vk2FHpBNv5Hvdzpj
	AITFLk5Mkg7YzqilXwyUt994vSAPSJ6Gw9HDr6gOwO7B0QXptI+j0voSb6Z1ef2Gxe
	RtFy+RDb73ifTWKsgMpU5cuE/ZD8XBY9StnRKY/PsegdN0qEVMybrE6983prwmkyl1
	RnRwFSpo11hkZvvnqKvwC3aUPHuBPBtfPrjN45PA+RPM2TEF6G/aa5u8DuJxH0kwj2
	tznCj///eAuAGywRxw7n+zVc=
Date: Thu, 10 Oct 2019 11:50:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191010085051.GA8610@localhost>
References: <20191009074207.18686-1-bunk@stusta.de>
	<712d85ff-bf08-fbf8-e3e9-b599adef6305@gmail.com>
MIME-Version: 1.0
In-Reply-To: <712d85ff-bf08-fbf8-e3e9-b599adef6305@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][warrior][PATCH] xmlrpc-c: Remove the RDEPENDS on perl
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
X-List-Received-Date: Thu, 10 Oct 2019 08:50:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 09, 2019 at 11:13:00AM -0700, akuster808 wrote:
> On 10/9/19 12:42 AM, Adrian Bunk wrote:
> > The tools that use perl are no longer built.
> 
> What error are you seeing that this fixes in warrior?

It needlessly pulls in perl.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


