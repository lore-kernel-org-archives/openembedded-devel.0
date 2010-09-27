Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P0ISE-00041p-3M
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 20:29:35 +0200
Received: by wwb18 with SMTP id 18so2670031wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=CUetqXKTEBN9gqlaGyIba1pPaa/gKHWlBfbPAIXFvZg=;
	b=IL09Oba/xSoUYfpiiRV8i4YCGPesHatFrk/8c9Xr5amPKdOgz59LSP0oLiK69DlI9B
	1tYXCc4N1Na03IP9QVo/ura5Bq3pK972rQsbO6pLMniYSwIVDuaWSB/d/lczNNSYyAxY
	NiMkj0AHzm8QVZol+p8/5dOfoa4HEjPMlw1WE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Kw4Er5d+UOXafEe/ddv84H7nAAQkhmmyq4vAoJyMUIKMYaiJMDn0hfG45CZBv24gOl
	e9ZPNhizXUUjnIoysMV+7nOUCZ/oURNl8Is+4T7N5DWJfmThTsayxMoXqrqH/XtdMNsd
	FnkwoNNX2cuIwcVTptHCnvoWdhuxbeHCBRV5c=
Received: by 10.216.23.206 with SMTP id v56mr13252525wev.67.1285612163539;
	Mon, 27 Sep 2010 11:29:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Mon, 27 Sep 2010 11:29:02 -0700 (PDT)
In-Reply-To: <1285611664-30291-1-git-send-email-denis@denix.org>
References: <1285611664-30291-1-git-send-email-denis@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 27 Sep 2010 11:29:02 -0700
X-Google-Sender-Auth: 3c-TkksEhD511WKw3c-_RZFzJuY
Message-ID: <AANLkTikV+om_BWBw9k7+KN-2fd0J6MgNCM5wead=h4bn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] base.bbclass: not use bb.fetch.urldata in do_unpack() for traversing SRC_URIs
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
X-List-Received-Date: Mon, 27 Sep 2010 18:29:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 27, 2010 at 11:21 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> bb.fetch.urldata contains cached SRC_URIs, but in case SRC_URI is altered
> by
> amend.inc or machine override, the original SRC_URI is not removed from the
> cache, leading to calling do_unpack() multiple times on original and
> modified
> versions of the file. Don't rely on bb.fetch.urldata and traverse SRC_URIs
> directly.
>
> Some background and details:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/36703
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

