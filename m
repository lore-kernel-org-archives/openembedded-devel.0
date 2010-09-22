Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyMcL-0006hI-OK
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 12:32:02 +0200
Received: by iwn2 with SMTP id 2so414254iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XC2DrBb4XCzQptg1OGsyvTQKpgaHNYivv+KrBRwTzMU=;
	b=q6YS08HmHTHuF1CfpnN2MN1+Ho20/K8BStfn0LUEZfl0qiv58z0EUNrDC7iaI3hqqN
	tQXf4yhUnAXhXYC+TnYP1/ifrEMH8wsj6lHsAPG/lVVwlH7sQGmoouM7ol1VAoVTbGtJ
	LTOp6qvHUMDvsE87E95dux02024gKHj15Fv38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YmPQ1JiH1UbftDWZvEBFBKEmddo8owqqgbyoHtk/lNNGx3ELSJ2jqfakAoYGZyDhys
	AjfEG75JHSVeKsmrjxgt33lk2fnIuOFxzZOF2oRjvW/I+mv/02+DmICFueqKKs7KRmqL
	Hr6sWlM9R3juWGvo4daGaye0nGTqf1XOi7a1Q=
MIME-Version: 1.0
Received: by 10.231.146.141 with SMTP id h13mr13892113ibv.1.1285151516808;
	Wed, 22 Sep 2010 03:31:56 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Wed, 22 Sep 2010 03:31:55 -0700 (PDT)
In-Reply-To: <i7ccna$640$1@dough.gmane.org>
References: <4C995127.2020207@gmail.com>
	<i7ccna$640$1@dough.gmane.org>
Date: Wed, 22 Sep 2010 20:01:55 +0930
Message-ID: <AANLkTikGQJGDFT+UNpkFVR-yuPYHMxqWutt0pbQVjMUU@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-numpy: Mark as COMPATIBLE_HOST="arm.*".
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
X-List-Received-Date: Wed, 22 Sep 2010 10:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 September 2010 17:24, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-09-10 02:43, Graham Gower wrote:
>
>> +COMPATIBLE_HOST = "arm.*"
>
> Could you please explain what makes numpy only work on ARM?

SRC_URI contains a reference to a file which lives in an "arm" subdir.

I withdraw this patch, in favour of adding a subdir for my arch (mipsel).


