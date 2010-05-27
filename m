Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHe9Z-00073y-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 16:33:46 +0200
Received: by qyk33 with SMTP id 33so49171qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=0a6W4cTgN1wBapY76OIkP8CFxgo1GzosGlZdy76UrC8=;
	b=gztqwEIvW8r3PmDX1jUQ3FS3ZP1+L+KCAjYPw1PhWMlOEH83ZefI9NRZuJZnEHoIov
	3II/egzODjsuPqeGvb27jogblhSjZlb2ZfH2/9quvUE5xualr1K9eelC8pyLwjhBCV1H
	Ph84ceYkpCJyCVR/1B9DZLipGqRjCslHQyXCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=AvI+EHGVlTWry2ALA5Es85SkiWYbY7qLoidJRSAQ+haSoVqa/XTs9J1mFHeW3V6E1X
	ibSAPG0zQHDKQqUvjCYvdB3t3+p+r7LLIQwGDIKr/IEuqPB7ZpvRPTiaFat822fYXnNd
	X3qX7encdMTBtMTj2qIe3aH2lvIQHmwYrczmE=
Received: by 10.224.126.194 with SMTP id d2mr5899973qas.265.1274970575557; 
	Thu, 27 May 2010 07:29:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Thu, 27 May 2010 07:29:04 -0700 (PDT)
In-Reply-To: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 May 2010 07:29:04 -0700
X-Google-Sender-Auth: YcL7tcLwE8SXWYx3dSEaeD9jfK8
Message-ID: <AANLkTim9kB_DPbT5GotgpbwfaUyGqUeL53DPsL826N60@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/3] base.bbclass: added oe_param_bool() method
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
X-List-Received-Date: Thu, 27 May 2010 14:33:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 27, 2010 at 5:41 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> This new function works like dict's get() method but converts the
> returned value to a boolean.
>
> It is to be used to interpret e.g. 'apply=yes' parameters in SRC_URI.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

This certainly looks useful, but utility functions like that were moved from
base.bbclass into utils.bbclass, and many of those in turn were moved into
the lib/oe/ python package :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

