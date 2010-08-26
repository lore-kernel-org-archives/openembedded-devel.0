Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OoXYm-000501-Nu
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 10:11:45 +0200
Received: by qwi4 with SMTP id 4so9135qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sVyYKNx6jOp8AYbSVi/DSaLDZGsAQoFjz4aLxvIGZO0=;
	b=IX6vc0lfkC9XualH7hLKOkfNh0YdBmb2jYhDopgZosLt84VtX48Ausdjp+ZCFgoJ3I
	2+VbQByN9YmLm61hUWHeKCQqsa+CSMJ4H4in9gktp4lR0zMCvt4LtFdSjtWYKSzOOFZq
	Jw586trlV2K3rVy2BMqNeRDHIHmXL24lByGlg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rJYkv1VtWZh3SYSSUEL/DR60JzVCxxU/ENYtTwnp3vj/gAMAN6lEk4WC32ZBG3MfzZ
	zhCiR/4sKWHTghiN9+BqJKWJJZDAen/fZLq7EOQ3nD423mkKtT4UCz6MXwwEmq6BPhDg
	Zk52BvmBuo/sUc9V8rwupRkZ1ezsfFpYg7xxc=
MIME-Version: 1.0
Received: by 10.229.71.69 with SMTP id g5mr5719636qcj.176.1282810273826; Thu,
	26 Aug 2010 01:11:13 -0700 (PDT)
Received: by 10.229.23.1 with HTTP; Thu, 26 Aug 2010 01:11:13 -0700 (PDT)
In-Reply-To: <AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
Date: Thu, 26 Aug 2010 10:11:13 +0200
Message-ID: <AANLkTimSYhZOhkdjo19HhRg98A7LNQ9dw81Rs6VJJf-q@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 26 Aug 2010 08:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 25, 2010 at 11:11 PM, Chris Larson <clarson@kergoth.com> wrote:

> Something like this should work:
> DEPENDS += "${@['', 'foo']['${BPN}' == '${PN}']}"

What is the run-time cost of this, compared to an overrides based approach?

/Esben


