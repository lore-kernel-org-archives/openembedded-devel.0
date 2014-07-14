Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id EBD2B703E0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:30:47 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so556819qgf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 05:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lThahe6VW2kWn2iL0NsXVa+5sD69Y5PIysVqxxvYg4Y=;
	b=OxW1eSPlcpySA6fJle09OzYG7/vT4V5EEZM0GmyTnjyApISmNyMW4tvNcm9vWEFA6u
	OGh6o+nQkT0u+73sVrB9OfWCyyZxAePgaxLTDZ4jwU+exkDYHOwQggR4K57kQTN0/B/G
	JeTUR1YZt9LCbI6dWB6tXCFPHcb71aWmeuXUF/N6+EI1g+1x5hteoJlazRVD5JdceAFr
	NiizdZm7Kycq2UOsFyYDKFyTO8qjfjQxOR2OVilS8jxdrhf+NJDIuUlHwKMmZFCy8pVA
	J9ywawRB7ZxCKQ9BvtC1sQPddM13FA0//MV/L9zjTmLHdtQ/d99FS1yi4q0nKq5cXc2i
	q5eQ==
X-Gm-Message-State: ALoCoQlE0mcl8L3Z9AzUMBv8tCQAu5BorP6lSwi5A0tLSPlGiWw0Oo9Av2/Q95W/iwjXHZwAYiAY
X-Received: by 10.140.91.164 with SMTP id z33mr22769654qgd.65.1405341048733;
	Mon, 14 Jul 2014 05:30:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 05:30:28 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407140804360.29952@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140804360.29952@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 13:30:28 +0100
Message-ID: <CAJTo0LapfkxVsasW=Mt6HTVqBuDk=bE=faeW9BCzVHOF3A-9zA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
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
X-List-Received-Date: Mon, 14 Jul 2014 12:30:52 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 13:20, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> but, as far as i can tell, that is the only class that requires a
> package name hook, and it simply defines its own implementation -- it
> does nothing with package.bbclass and makes no reference to the
> exported function package_package_name_hook(). so am i just
> misunderstanding something? what was the point of defining and
> exporting that function in package.bbclass if no other class takes
> advantage of it?

So there needs to be an empty implementation and EXPORT_FUNCTION for
package_package_name_hook so that you don't get "cannot find function
package_name_hook" when you don't have the debian.bbclass enabled.

In cleaning that up I proposed removing the EXPORT_FUNCTION entirely
for the hook, but Richard recalled there being something out there
that did use the ability to chain up into debian.bbclass's
implementation, so I kept it.

Ross

