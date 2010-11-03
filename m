Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PDnCS-0000PD-Cy
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:57:06 +0100
Received: by wya21 with SMTP id 21so1223741wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 16:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=gPEwfKTJY8cSYxmBEMs7sj0z4bt+p1+3pKZK52BBmuI=;
	b=FWSCwkTorJk3F/gEAY2oeud2+5jwpnwGLYCuc8mK/6oR4HK3u5afuTXpPOaF4Si16o
	PIKqaD8YQfoDCNGfuhRF33pnlf9YEVUxJEgXrrNVrFhopAiKpAUPEEmCcvgI7iAn50ES
	BqDUb8hZk5UmqrOq6+2m6TwNT26on73dLaRTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Litdp44qhOMyt6yI57zJMgfvz+3/LjA9oW/OZCKWtyA06acerorn3+b9FewdgUG3QL
	b6ygSvVyh0Q42EJ3TZx2q1YV70C69il7B7tZ+mkX5gsMFDUrEAWXAZtFI030pIkdX+8M
	GY4wQ7bmAnc2gsyWT0eVi3ee/jl+0dW3FmyX0=
Received: by 10.216.26.138 with SMTP id c10mr1182316wea.23.1288828572986; Wed,
	03 Nov 2010 16:56:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 3 Nov 2010 16:55:52 -0700 (PDT)
In-Reply-To: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 3 Nov 2010 16:55:52 -0700
X-Google-Sender-Auth: -yCAUlffX0ipe3feEFUuvukhCEc
Message-ID: <AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Wed, 03 Nov 2010 23:57:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Currently we report wrong revision when we build from branches not based
> on master because we only fetch the HEAD value which is remote master
> This patch makes it to report the HEAD of whatever branch one has
> checked out.
>

This doesn't make sense.  The HEAD ref always points to the current checked
out commit or branch, it is *not* specific to master.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

