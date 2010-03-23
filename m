Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nu6Cw-0007bJ-Mo
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:40:01 +0100
Received: by qw-out-1920.google.com with SMTP id 4so590101qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=eL4YdNNMcySkZRzzyD4AKF/44tqo62SqU90p8+K5wDU=;
	b=AJwh3ZIqEuxwIwLMnFfLCW08f5f/borpre0/Ucf9eDPlMBKIpudI4POAsTq+NpAdHK
	X3guRDFxW7fqmTbBhq8t+0P31wZyQpGOg6+IqkQHd3cKGLVniNCLd3ZwC+Y7Dn04KcSp
	kNSUdcezL1J9rYTY6paZGuHaG64p6n/QBElLI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gKlwlueDOPRGGKmHZSVKLdlvg7VQS16R8PIh5RSt6GyLDwgMS9lW/3jr/bRoZdNjOs
	NKgQLp1krVEdfeSYzEV9X1xXL/A86Mn6MrThkXHDygC7Jr7sv2GjXbw2iTrUAkxBhyfD
	jNN0HNnhB1wuXYBcItpK22i2BvQgfwK9kztlg=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.222.8 with SMTP id ie8mr788340qcb.16.1269358607264; Tue, 
	23 Mar 2010 08:36:47 -0700 (PDT)
In-Reply-To: <201003231050.56580.holger+oe@freyther.de>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com> 
	<ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com> 
	<201003231050.56580.holger+oe@freyther.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 08:36:27 -0700
X-Google-Sender-Auth: f970cb1671ded149
Message-ID: <b6ebd0a51003230836l60042d60m4d31c53a6e29e8db@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 15:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 2:50 AM, Holger Hans Peter Freyther <
holger+oe@freyther.de <holger%2Boe@freyther.de>> wrote:

> On Tuesday 23 March 2010 10:32:59 Frans Meulenbroeks wrote:
> > Chris, while this is a nice idea it conflicts with having checksums in
> > the recipe, as that makes the recipes unique.
> > Unless of course there is (or we create) a way to have multiple
> > checksums in a recipe and pick the one that is for the version we are
> > building.
>
>
> There is a way or could be a way. For the name= we can use a variable in
> the
> name (e.g. PV) but have a written out variant for the SRC_URI.
>


Good idea, didn't think about using the version as the name or part of it,
that could alleviate the need for the anonymous python snippet I'm using at
the moment.  (Aside: it would be nice if you could set a flag on an override
variable (FOO_arm) and have that flag be pulled over to the main variable
(FOO) at override collapse time, but BitBake does not do it today).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

