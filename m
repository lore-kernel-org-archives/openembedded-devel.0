Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OIK4L-0008Gp-HK
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 13:19:28 +0200
Received: by mail-gw0-f47.google.com with SMTP id 15so1605453gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 May 2010 04:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=FFhzhW8HJyTOFmoaKHQ9lyA5hHSApJZ+BcgC2Qpj2Gg=;
	b=GTPrXlx5ucaVLzgjWcJNSaRPL26217kWIAlAnjocghBtax3Kedz1Gb4/KuFxTUb4b5
	jtYNslin03N2NAhkFZ+vbSXhdkJIxkDg9SGMLll8n4FRsZ4u47jO/ci69xDYqExZLq+Q
	m3B79bq9Q5qRbJat42x7fGSW4f5uRdZ3uwYF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pchWTadbr1QYNu9EzDozr3SHN070cvxfl9JlEScpsewqet6DJIbm7SREwKcPhcOi7t
	AAA8jMjnNoyC7c+iDiUW2NGN41TFXA4LqZyNH0HHVeXEI6R8q9KdTLhmNoqF7vyCjIwp
	kP+UUyVN3icGb8x3jRn/uTh6tYyZUUzuebQ/g=
MIME-Version: 1.0
Received: by 10.101.3.14 with SMTP id f14mr1883708ani.38.1275131700827; Sat, 
	29 May 2010 04:15:00 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Sat, 29 May 2010 04:15:00 -0700 (PDT)
In-Reply-To: <htqn9k$gvu$1@dough.gmane.org>
References: <htqn9k$gvu$1@dough.gmane.org>
Date: Sat, 29 May 2010 13:15:00 +0200
Message-ID: <AANLkTinixtnuaFRhM9y4ACoa1s8hbDC4EBu5XlFffuXj@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Faking sign offs is bad
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
X-List-Received-Date: Sat, 29 May 2010 11:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Apart from that, the commit is bogus, it just adds a
> 'udev/udev-151/udev-compat-static.patch' file in ${S} (of all places!)
> instead of actually patching the udev init file.

The hack must be temporarly.
I though tit's more clean if we overwrite the file than diffing and patching it.
Perhaps I was wrong.

Andrea


