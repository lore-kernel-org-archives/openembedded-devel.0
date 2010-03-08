Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nod5p-0006K8-Js
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 14:34:02 +0100
Received: by fxm20 with SMTP id 20so5986361fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Mar 2010 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zAKK9ulbCqLjMCXyPrVd/B9MVzcyeqxGEDctkJDzaHE=;
	b=cVbhNzDS5UYIEdUO3Iu8HDjHRNfPEO0bBWloac9Lor82DFVReEuZSxUKy54kFyXvSJ
	1AMojR2Y7gcxZkiphKnVJ61B0gQjbc3lEuhMlcXU84Xe1zrB9vGWR8X3B1pN2Kufz0mb
	CGYXAZbF4oeQwOV0j+QcDFVsuCv3mcAtGsYzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JtN2Q4nMZd+67lol2g9o35e4cucig7kD4gelzCh+lNAX1lcxxl+FVn4xJ/Nc8I8QQu
	4qfb7d6/DpvFcYwsnViSNOYadQykZkQNESpIVhhPXR/8RagEv0Ss4ytjMBCtk8JnSpeg
	hnfbLDt6j3MqzrDpO+vZnfzbFaq4omyxe+ZVw=
MIME-Version: 1.0
Received: by 10.223.94.200 with SMTP id a8mr1339744fan.86.1268055061561; Mon, 
	08 Mar 2010 05:31:01 -0800 (PST)
In-Reply-To: <141020e31003020158v13adec5erae7d6cd6f9ee7fa5@mail.gmail.com>
References: <E1Ne4Jc-0005sN-7y@melo.openembedded.org>
	<141020e31002090250k2b14f4a4w35b2322952665a46@mail.gmail.com>
	<141020e31003020158v13adec5erae7d6cd6f9ee7fa5@mail.gmail.com>
Date: Mon, 8 Mar 2010 14:31:01 +0100
Message-ID: <141020e31003080531g3f3d86a9uf2cddbed81710ad1@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : efl: bump SRCREV for comp fixes
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
X-List-Received-Date: Mon, 08 Mar 2010 13:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 2, 2010 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> So what would be OE way to handle?
> 1) enable Ecore_data to build etk/epsilon ok (for a while before
> something else broke it again)
> 2) move etk/epsilon + depending apps to obsolete dir (list of apps
> from previous e-mail + check if they really still depends on it or
> it's just DEPENDS relict).
>
> I prefer 2) and if there is somebody who really needs etk/epsilon then
> he probably wants also older EFL_SRCREV for his obsolete app.
>
> Regards,
>
>> What's right way to handle that in OE?
>> Is it worth maintaining epsilon alive in oe.dev and asking upstream to
>> include patches for epsilon or can we move epsilon + apps depending on
>> it to obsoleted?

Nobody replied, but seems like enlightenment devs already decided for us :).

Both deprecated modules removed completely

Ecore_data
http://trac.enlightenment.org/e/changeset/46994
Ecore_txt
http://trac.enlightenment.org/e/changeset/46985

a) So will ve move unbuildable version to obsolete dir.
b) Move it with last working SRCREV included in it (and expect any
user who needs it to set the same old SRCREV to build compatible
ecore_svn.bb).
c) Delete them and whoever needs it, can checkout older tree with them
and right revisions.

Regards,


