Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OoqCH-00026U-D5
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 06:05:46 +0200
Received: by wwb31 with SMTP id 31so2450668wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 21:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=E2ctvfZ946wzrifzHWD7z2g3RVMqcv+14ucZ3pFe7zw=;
	b=B+H0PcoBdJVxrAku5rEZRrQleD/aC/y3eEtpNVGw9rv0l6ncX73gYRtQeonyJwGoVd
	dSxc1DbQv0d+7x78UxMkT2er4gN4J0T+ER5oVtqsXNAfwFePpuj1Hw8Q49H4UUPBh16/
	dfM5oxKQX+megaYfa008DE2KgzTjdST36vPI4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=JRr8pY3Nh+cYNw/tTCwXDQuLoJ6utm6dLdjgTKM3UPHMCtM9Jcncjyc6qjAu/1YYaN
	gn4YANHaSItBKMfHjqAPGnT/tXdLOpiWL2Pp3fvfz+apaehSURQocgNYY5Vm0k/gnmJE
	oH8tFIwlVeA3pskSZjXT9d9lOcjrDOi6gvvwQ=
Received: by 10.216.51.212 with SMTP id b62mr238415wec.97.1282881858186; Thu,
	26 Aug 2010 21:04:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Thu, 26 Aug 2010 21:03:58 -0700 (PDT)
In-Reply-To: <1278706889-319-1-git-send-email-raj.khem@gmail.com>
References: <1278706889-319-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Aug 2010 21:03:58 -0700
X-Google-Sender-Auth: 7zhoi4NrcnjWMN6QW9dp9Xdr4FM
Message-ID: <AANLkTimcy2cCSmA8juYj+ErrSwppyetANzG0kW+L28ji@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] quilt: Add option QUILT_NO_RM_SYMLINKS so follow symlinks with quilt refresh
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
X-List-Received-Date: Fri, 27 Aug 2010 04:05:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 9, 2010 at 1:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

> ++          if [ "$QUILT_NO_RM_SYMLINKS" != "yes" ]
>


I'd suggest:
          if [ -L "$filename" -a "$QUILT_NO_RM_SYMLINKS" != "yes" ]
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

