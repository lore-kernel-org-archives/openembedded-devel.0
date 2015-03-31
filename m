Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B8327736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 00:45:18 +0000 (UTC)
Received: by iedm5 with SMTP id m5so3891965ied.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tdpPVVX3nNHLYRgBscn+iiQS44htyv2BK9FNZASwE/I=;
	b=DHVbzXwfACndFjcBxQAyEpDTj1+H9d3wa+hZKluFKfGGQoms6WwtfE8IQ853HbY0+t
	e/oAWowj7NZm4UvvQ1seB7IJCj5r3fWaUfCzUeLc6zKcFGyJu7NuoOsb3djpVzQN29F9
	UDK4lTnM+ckUak/tSy6drXDVZFY1M7y5yTXKvNUBnCgBt7z0fjAWlUZwwTKToh/hjosO
	LQuu3IzMKYASkVUkRaK0c9irOFOItY3hchn3aQnB13vMd6EfuPA9gOPRwZhN5540rXUs
	bOm4+Y6CcwiXIFFtvxvXnX7Uw3mhrmWNoAk45j24tzYi54xrSQchE1I+A9CUxmV7MQBW
	mGUw==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr565812igj.11.1427762719036; Mon,
	30 Mar 2015 17:45:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 17:45:18 -0700 (PDT)
In-Reply-To: <20150330202507.GA22676@mail.itconsulting-heinold.de>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150330202507.GA22676@mail.itconsulting-heinold.de>
Date: Mon, 30 Mar 2015 21:45:18 -0300
X-Google-Sender-Auth: cNysgLBEBKZq5R6ek_0Si55Gr8Q
Message-ID: <CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
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
X-List-Received-Date: Tue, 31 Mar 2015 00:45:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 5:25 PM, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> if I remember correctly, than the bdwgc inside cacao differs from upstream.

I didn't compare them but assuming this works fine I am fine with this
change. It reduces build time and also fixes a conflicting binary
installation.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

