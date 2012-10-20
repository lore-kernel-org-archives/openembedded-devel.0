Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXiv-0000Vx-I8
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 14:00:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so894954pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=qIXjhlBISEgFGvC8+fFY6O44EKCykEilu7PCjK41MOU=;
	b=ntOtLTr8w0nPx4YNkelaLjGyAGKgbbiPhYHiZcndbTF1x6mhfxx6XkpulTKScJ8G9O
	+FsKGx8jj/rPIQ2tBXeCe0MsmIeXazuvCX9rcjZBqK2/EwxDjn7qwe2SYFOu8rgov1pt
	1lrCycSLke3fvZ3XxJkWisn1gALMh0q10Qsy1y6qajghovF1zlZaybca2Y3ScrqPqBqD
	dA/HFgVCDBdi7/JaTRSvDEkvGOG7fmDt+UKgEGC75I9jZnWjg9Gtx7XXwPwsL1Odv4h9
	+V2YzPY6aZJyb4rdINu+5E1lbMK7DBx4H7qIMmAxnOoPXdkBdVCdMemGRIgdOFanb8pr
	Q9Ug==
MIME-Version: 1.0
Received: by 10.66.78.195 with SMTP id d3mr12064882pax.17.1350733610943; Sat,
	20 Oct 2012 04:46:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:46:50 -0700 (PDT)
In-Reply-To: <1350679091-5909-3-git-send-email-morgan.little@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
	<1350679091-5909-3-git-send-email-morgan.little@windriver.com>
Date: Sat, 20 Oct 2012 08:46:50 -0300
X-Google-Sender-Auth: R6yLjae2RPjf3Mtr2rGo44N_u7k
Message-ID: <CAP9ODKqJHYfQ6WBvqdQZWKzc1w0VV=PegyP2trTRVjmAdQ4DKQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-networking][PATCH 2/3] ntp: Uprev from 4.2.6p3 to 4.2.6p5
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
X-List-Received-Date: Sat, 20 Oct 2012 12:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 5:38 PM, Morgan Little
<morgan.little@windriver.com> wrote:
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> @@ -0,0 +1,47 @@
> +require ntp.inc
> +
> +PR = "r0"

Don't use PR for r0.

Noticed it when checking patch 3/3.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


