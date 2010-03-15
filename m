Received: from mail-yw0-f175.google.com ([209.85.211.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrAsB-0005wf-Og
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:02:25 +0100
Received: by ywh5 with SMTP id 5so276479ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=6/PzpIkHnJVLTTpP2ZXvc48fOe0naACQiPJLy+uybxU=;
	b=A7xbh0G61dafs/xUvMMFlAcHE1xubztJXrEfm65heTLHIQu/Rjf91dCShU8PTzw6kM
	9Lx0ryjZKcvfteyLClsvmAuVf0es2fr4o7c1s2D8ZjGMcbOFA8HBWBHL/fswTenRxkmF
	Xn/GVOLH1sZ6mj1Jcb5gILckaKA4YJmPxKxas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e4hGlmMTJNx0MCW42pIm2uE3BQPlAsQTAQI9PO5VFfHfl1Xb0afpn0v8hzz9C7O0Mi
	ocgeND2RxHC727FFJPRr6JhRwEv/a7/eU6Z7dXOEF0ZgisX3PihvQ0CQTybt956OOSM5
	zzWW01S1hiDDybyhnokFdnyXLGkZxqMvGmHvw=
MIME-Version: 1.0
Received: by 10.101.105.38 with SMTP id h38mr845936anm.22.1268661561257; Mon, 
	15 Mar 2010 06:59:21 -0700 (PDT)
In-Reply-To: <20100315114313.GB2425@xora-desktop.xora.org.uk>
References: <ac9c93b11003141453n7df620c7gca609efe00e0e6f@mail.gmail.com>
	<hnl05u$1r0$1@dough.gmane.org>
	<ac9c93b11003150431k384114e6i11cab70a9d377da9@mail.gmail.com>
	<20100315114313.GB2425@xora-desktop.xora.org.uk>
Date: Mon, 15 Mar 2010 14:59:21 +0100
Message-ID: <ac9c93b11003150659g3bb78a4dk4feec888b80c97f5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Re; [PATCH 7/8] autoconf: add 2.65
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
X-List-Received-Date: Mon, 15 Mar 2010 14:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Graeme Gregory <dp@xora.org.uk>:
> On Mon, Mar 15, 2010 at 12:31:10PM +0100, Frans Meulenbroeks wrote:
>> And any help related to getting autoconf up to 2.65 is appreciated.
>> I'm not that much an autoconf wiz.
>>
> There was no wizardry needed to get 2.65 working, I have a build
> currently running to test the new version.

Oops.
Actually I misworded things. I noticed some recipes not working any
more with 2.65 and would like some help to fix this.
The most troublesome I had was libpcap. That one generated a configure
file that had syntax errors.
The other one I ran into was php-native where configure was stuck in
an endless loop, with yes eating up 100% CPU time.

Frans


