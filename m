Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OodPy-0000VH-Hk
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 16:27:04 +0200
Received: by wyg36 with SMTP id 36so1734777wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=4nz2woWcJIzMbceQMALxfonBALw50RDn4IsTKa6eyPY=;
	b=L9jG1Ghiu1gN73HguzYRjIMEeW+pKO9VGusNBkAZUIO61icXcfkDmi/ILKZBhFhch5
	kle/G1oShCorq/qMP+RXU8y7DLkeDwNTUcvmlOVSLruJbNARvJiZ7gTscV5T6YklAfmg
	jSPEwcwnXC9X7TCJpWlY3/nMDEPJVfgSRw0pE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=qEUR/Tg/bGEcaybHvxYxvdKC4PWs+GrBGCc8NRt9gcNuzF8n8EBQHPuud4RKiyLWTv
	puCZnBZ4VLvCy3Tnp0t/iqo1b1ec3ox8g/zqKT4Aw+spcS11cP5LfKYQTSkhgo5XeXWk
	DYqadbPqGI7LzOPuSFOfPnEUguGo+rsGmznSk=
Received: by 10.227.157.67 with SMTP id a3mr2453940wbx.212.1282832794347; Thu,
	26 Aug 2010 07:26:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Thu, 26 Aug 2010 07:26:14 -0700 (PDT)
In-Reply-To: <AANLkTimSYhZOhkdjo19HhRg98A7LNQ9dw81Rs6VJJf-q@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTimSYhZOhkdjo19HhRg98A7LNQ9dw81Rs6VJJf-q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Aug 2010 07:26:14 -0700
X-Google-Sender-Auth: Kk_D-fRhYqFnUOlekr55l34u4FI
Message-ID: <AANLkTinchXrwTMdB7kiob0kaQ_xavGwwnS=dyYQuErHh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Thu, 26 Aug 2010 14:27:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 26, 2010 at 1:11 AM, Esben Haabendal
<esbenhaabendal@gmail.com>wrote:

> On Wed, Aug 25, 2010 at 11:11 PM, Chris Larson <clarson@kergoth.com>
> wrote:
>
> > Something like this should work:
> > DEPENDS += "${@['', 'foo']['${BPN}' == '${PN}']}"
>
> What is the run-time cost of this, compared to an overrides based approach?


In order to *implement* the override, you'd end up having to do this
comparison, or something similar, in an anonymous python function or a
snippet like this in overrides, so I wouldn't worry much about the
particular implementation :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

