Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMlD6-0008Sx-P3
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 19:06:33 +0200
Received: by pvc30 with SMTP id 30so77713pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=jhNHdlMO6B4rIGy0h7zqwPWjzrmUAljencxSMeXOcxQ=;
	b=ieXxzWNu5XNYFpKnV1lH/b9AB+9qjwSygbUoKYFcESC4FyPRTVIaXWCl2dwsf+86ho
	CjKp1N4sHYt7wlNeyYWFcBK99gdcXLU3RpwrWIdqyiOarNuuPnEsFOyYouGXeRWiRTID
	doOxuXERQJ8XTfcN6YLUhL6L2ZTqOwAOqV1ew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Q5a1MvlLhEbebwHm2coVUj9qC8heudHV6D4+zt55aYDAwIi4JHi335R5GEaxsn1S/J
	6t5nEXKzhx7ftm9HFnkZDpOP1XTXLo763brvAsE61LpxYezKQ9XYX6uR+0mLUKGTJuaF
	of8JaRXcywyLBPrVe+s4ka8tlRVX2bHWVX5ak=
Received: by 10.142.151.29 with SMTP id y29mr320802wfd.261.1276189328861; Thu, 
	10 Jun 2010 10:02:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Thu, 10 Jun 2010 10:01:48 -0700 (PDT)
In-Reply-To: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
References: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jun 2010 10:01:48 -0700
X-Google-Sender-Auth: QVfYB0aD3Z949NvpNyZ2QhONXFU
Message-ID: <AANLkTikMfI8XuI2BgABlPkjUmQ5H-FTe0NbnDorDMQrj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] lib/oe/patch.py: Dont import patches but symlink them instead
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
X-List-Received-Date: Thu, 10 Jun 2010 17:06:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 9, 2010 at 5:36 PM, Khem Raj <raj.khem@gmail.com> wrote:

> * This patch removes the usage of quilt import <patch>
>  instead it creasted a symlink to the patch in the patches
>  directory and synthesizes the series file which otherwise
>  would be done automatically by quilt import.
>
> * This should help a bit in reducing build time as it avoids
>  copying of the patch and also other things that quilt import
>  would otherwise do.
>
> * Tested by doing minimal-image on qemuarm.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

